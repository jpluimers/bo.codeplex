using System;
using System.Reflection;
namespace bo.Generic
{
    /// <summary>
    /// Adapted from John Skeet: http://www.yoda.arachsys.com/csharp/singleton.html
    /// </summary>
    public class Singleton<T> where T : class
    //, new() // this would require a public constructor, invalidating the concept of Singleton
    {

        Singleton()
        {
            // prevent other classes from instantiating us
        }

        public static T Instance
        {
            [System.Diagnostics.DebuggerStepThrough]
            get
            {
                return Nested.instance;
            }
        }

        class Nested
        {
            // Explicit static constructor to tell C# compiler
            // not to mark type as beforefieldinit
            static Nested()
            {
                //instance = new T(); // this would always require a public parameterless constructor, but that violates the concept of Singleton

                // so instead, we use reflection to call a constructor:

                // see http://www.wwwcoder.com/Weblogs/tabid/283/EntryID/829/Default.aspx
                // see http://www.u2u.be/Res/Downloads/Slides/OOP.NET%20intensive%2014a.pdf
                BindingFlags nonPublicConstructorsBindingFlags = BindingFlags.NonPublic | BindingFlags.Instance | BindingFlags.CreateInstance;
                BindingFlags publicConstructorsBindingFlags = BindingFlags.Public | BindingFlags.Instance | BindingFlags.CreateInstance;

                Type TType = typeof(T);
                bool hasNonPublicParameterLessConstructor = hasConstructors(TType, nonPublicConstructorsBindingFlags);

                BindingFlags bindingFlags = hasNonPublicParameterLessConstructor ?
                    nonPublicConstructorsBindingFlags
                :
                    publicConstructorsBindingFlags;

                object newinstance = TType.InvokeMember(TType.Name, bindingFlags, null, null, null);
                instance = (T)newinstance;
            }

            private static bool hasConstructors(Type TType, BindingFlags publicConstructorsBindingFlags)
            {
                ConstructorInfo[] publicConstructors = TType.GetConstructors(publicConstructorsBindingFlags);
                foreach (ConstructorInfo publicConstructor in publicConstructors)
                {
                    ParameterInfo[] publicConstructorParameters = publicConstructor.GetParameters();
                    if (publicConstructorParameters.Length == 0)
                    {
                        return true;
                    }
                }
                return false;
            }

            internal static readonly T instance;
        }
    }
}