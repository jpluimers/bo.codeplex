using System;
using System.Threading;

using bo.Extensions.DelegateExtensions;

namespace bo.Threading
{
    /// <summary>
    /// parameterloze delegate voor om calls van de ene thread naar de andere te kunenn forwarden
    /// </summary>
    public delegate void MethodDelegate();

    // WPF threading model (Dispatcher, Invoke, etc): http://msdn2.microsoft.com/en-us/library/ms741870.aspx
    // note that in ASP.NET this only works as long as your ASP.NET worker thread lives, which is often unpredictable; better use AJAX there.

    /* SynchronizationContext is onafhankelijk van WinForms, WPF en ASP.NET:
     * http://dharmashukla.com/2006/07/19/scheduling-wf-programs-under-the-clr-synchronizationcontext/
     * http://andyclymer.blogspot.com/2006/10/synchronizationcontext-assists.html
     * http://shevaspace.spaces.live.com/blog/cns!FD9A0F1F8DD06954!546.entry
     * http://shevaspace.spaces.live.com/blog/cns!FD9A0F1F8DD06954!547.entry
     * http://www.codeproject.com/cs/threads/SyncContextTutorial.asp?print=true
     * http://msdn2.microsoft.com/en-us/library/ms741870.aspx
     */
    /// <summary>
    /// AsyncDelegator delegeert events naar de SynchronizationContext die tijdens constructie aanwezig was.
    /// Voor WinForms/WPF is dat dus de UI thread.
    /// Voor ASP.NET de thread die de request afhandelt.
    /// 
    /// Voorbeeld van gebruik:
    ///     Initialisatie:
    ///             delegator = new AsyncDelegator();
    ///             progressEventHandler += new ProgressEventHandler(updateTextBox1);
    ///             progressEventHandler += new ProgressEventHandler(updateTextBox2);
    ///     Gebruik:
    ///             delegator.FireAsyncEvent(progressEventHandler,
    ///                 backgroundWorker1, new ProgressEventArgs(progress));
    /// </summary>
    public class AsyncDelegator
    {
        private static SynchronizationContext _uiContext = null;

        public static void DebugLog(string value)
        {
            // http://stackoverflow.com/questions/4429254/how-to-make-debugview-work-under-net-4
            // Works with internal debugger (pane "Output") using F5, or with DebugView using Ctrl-F5
            // Note the .NET 4 " HR Propagated"  bug when using DebugView (http://social.msdn.microsoft.com/Forums/en/vsdebug/thread/3954ba35-5dd0-4194-b172-8619bf293e4b)
            System.Diagnostics.Debug.WriteLine(value);
        }

        public static void InitializeUIContext()
        {
            _uiContext = SynchronizationContext.Current;
        }

        private SynchronizationContext creationSynchronizationContext;
        private Thread creationThread;

        public AsyncDelegator()
        {
            this.swallowExceptionsInEvents = false;
            initialize();
        }

        public AsyncDelegator(bool swallowExceptionsInEvents)
        {
            this.swallowExceptionsInEvents = swallowExceptionsInEvents;
            initialize();
        }

        private void initialize()
        {
            this.creationSynchronizationContext = SynchronizationContext.Current;
            this.creationThread = Thread.CurrentThread;

            if (creationSynchronizationContext == null)
                creationSynchronizationContext = _uiContext;

            if (null == this.creationSynchronizationContext)
                DebugLog("AsyncDelegator.initialize: warning; unexpected 'null == this.creationSynchronizationContext'");
            else
                DebugLog(string.Format("AsyncDelegator.initialize: on thread {0}", creationThread.ManagedThreadId));

        }

        private bool swallowExceptionsInEvents;
        public bool SwallowExceptionsInEvents
        {
            get { return swallowExceptionsInEvents; }
        }

        // Post is asynchronous, but can cause heavy load. 
        // Creating a new thread is even worse, so take the contention risk.
        private bool useSendWithExtraThread = false;
        public bool UseSendWithExtraThread
        {
            get { return useSendWithExtraThread; }
        }


        public object FireAsyncEvent(Delegate eventHandler, object sender, EventArgs e)
        {
            if (null == eventHandler)
                return null;

            //            DebugLog("start AsyncDelegator.FireAsyncEvent");            
            return fireAsyncEvent(eventHandler, new object[] { sender, e });
        }

        // jpl: mag geen System.Delegate zijn, want dan krijg je vage foutmeldingen
        // omdat een cast van delegate naar System.Delegate niet mag.
        // je moet dus expliciet aangeven wat voor delegate er wordt verwacht
        public object FireAsyncMethod(MethodDelegate methodDelegate)
        {
            if (null == methodDelegate)
                return null;

            //            DebugLog("start AsyncDelegator.FireAsyncMethod(Delegate)");            
            return fireAsyncEvent(methodDelegate, null);
        }

        public object FireAsyncMethod(Delegate methodDelegate, params object[] args)
        {
            if (null == methodDelegate)
                return null;

            //            DebugLog("start AsyncDelegator.FireAsyncMethod(Delegate, params)");            
            return fireAsyncEvent(methodDelegate, args);
        }

        private static object fireEventsNoThrow(Delegate eventDelegator, object[] args)
        {
            /// In stead of quiting at the first throw, we guarantee all delegate2 instances are called.
            /// http://msdn2.microsoft.com/en-us/library/system.delegate(VS.80).aspx
            /// If an invoked method throws an exception, the method stops executing, 
            /// the exception is passed back to the caller of the delegate, 
            /// and remaining methods in the invocation list are not invoked. 
            /// Catching the exception in the caller does not alter this behavior.
            /// 
            /// When the signature of the methods invoked by a delegate includes a return value, 
            /// the delegate returns the return value of the last element in the invocation list. 

            object result = null;
            if (eventDelegator != null)
            {
                foreach (Delegate delegate2 in eventDelegator.GetInvocationList())
                {
                    try
                    {
                        result = delegate2.DynamicInvoke(args);
                    }
                    catch (Exception ex)
                    {
                        DebugLog("AsyncDelegator exception swallowed");
                        DebugLog(ex.ToString());
                        // Swallow the exception intentionally, if there are multiple delegates
                        // you get the result from the last delegate that in fact succeeded
                    }
                }
            }
            return result;
        }

        private object fireAsyncEvent(Delegate eventHandler, object[] args)
        {
            Thread currentThread = Thread.CurrentThread;
            if (this.creationThread == currentThread)
            {
                // We are running in the same thread, so just directly fire the eventHandler.
                return delegateEvent(eventHandler, args);
            }
            else if (null == this.creationSynchronizationContext)
            {
                // No synchronizationcontext, so assume we can directly fire the eventHandler.
                return delegateEvent(eventHandler, args);
            }
            else if (this.creationSynchronizationContext.GetType() == typeof(SynchronizationContext))
            {
                // We are running in free threaded context, also directly fire the eventHandler.
                return delegateEvent(eventHandler, args);
            }
            else
            {
                // We are running in WindowsFormsSynchronizationContext or DispatcherSynchronizationContext,
                // so we should marshal the eventHandler back to the creation thread.
                // Note that we should use the blocking SynchronizationContext.Send operation to marshal the call,
                // because SynchronizationContext.Post will fail under heavy usage scenario.

                object result = null;

                if (UseSendWithExtraThread)
                {
                    //Start new thread to prevent deadlock 
                    System.Threading.ThreadStart dispatchDelegate = new ThreadStart(delegate
                    {
                        // Perform the Send in the new thread
                        DebugLog("dispatchDelegate thread");

                        this.creationSynchronizationContext.Send(
                            new SendOrPostCallback(delegate
                        {
                            // perform DynamicInvoke in the SynchronizationContext's target thread
                            result = delegateEvent(eventHandler, args);
                        }
                        ), null);
                    }
                    );

                    Thread asyncDispatchThread = new Thread(dispatchDelegate);
                    asyncDispatchThread.Start(); // the thread will get disposed automatically
                }
                else
                {
                    DebugLog(string.Format("AsyncDelegator.fireAsyncEvent: on thread {0}", currentThread.ManagedThreadId));
                    // Post is asynchronous, but can cause heavy load. 
                    // Creating a new thread is even worse, so take the contention risk.
                    this.creationSynchronizationContext.Post(
                        new SendOrPostCallback(delegate
                    {
                        DebugLog("eventDelegator.DynamicInvoke");
                        try
                        {
                            result = delegateEvent(eventHandler, args);
                        }
                        catch (Exception error)
                        {
                            DebugLog(error.ToString());
                        }
                    }), null);
                }

                return result;
            }
        }

        private object delegateEvent(Delegate eventHandler, object[] args)
        {
            string delegateSignature = DelegateExtensions.DelegateSignature(eventHandler);
            DebugLog(String.Format("SynchronizationContext's target thread; EventHandler={0}; args={1}", delegateSignature, args));
            if (SwallowExceptionsInEvents)
                return fireEventsNoThrow(eventHandler, args);
            else
            {
                /// http://msdn2.microsoft.com/en-us/library/system.delegate(VS.80).aspx
                /// If an invoked method throws an exception, the method stops executing, 
                /// the exception is passed back to the caller of the delegate, 
                /// and remaining methods in the invocation list are not invoked. 
                /// Catching the exception in the caller does not alter this behavior.
                try
                {
                    return eventHandler.DynamicInvoke(args);
                }
                catch (Exception ex)
                {
                    logException(eventHandler, ex);
                }
                return null;
            }
        }

        private static void logException(Delegate eventHandler, Exception ex)
        {
            string delegateSignature = DelegateExtensions.DelegateSignature(eventHandler);
            DebugLog("Dynamic Invoke Error in " + delegateSignature);
            DebugLog(ex.ToString());
        }

    }
}
