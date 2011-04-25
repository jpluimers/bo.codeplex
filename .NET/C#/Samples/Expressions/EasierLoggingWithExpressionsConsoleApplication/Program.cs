using System;

using System.Linq.Expressions; // logging

namespace EasierLoggingWithExpressionsConsoleApplication
{
    class Program
    {
        static void Main(string[] args)
        {
                try
                {
                    Log(() => Answer);
                    Log(() => Earth);
                    int a = 1;
                    int b = 0;
                    //Log(() => a + b); // for this expression, you cannot get a name
                    int c = a / b;
                }
                catch (Exception ex)
                {
                    Log(() => ex);
                }
                Console.Write("Press <Enter>");
                Console.ReadLine();
        }

        static string Answer = "42";
        static string Earth = "Harmless";

        public static void Log<T>(Expression<Func<T>> expression)
        {
            if (expression != null)
            {
                try
                {
                    string key = GetFullName(expression);
                    Func<T> function = expression.Compile();
                    object expressionValue = function();

                    Console.WriteLine(String.Format("{0}: {1}", key, expressionValue));
                }
                catch (Exception exception)
                {
                    Console.WriteLine(exception.ToString());
                }
            }
        }

        public static string GetFullName<T>(Expression<Func<T>> expression)
        {
            var member = expression.Body as MemberExpression;
            if (member != null)
                return member.ToString();
            else
                throw NewInvalidExpressionArgumentException<T>(expression);
        }

        // http://blogs.msdn.com/b/csharpfaq/archive/2010/01/06/getting-information-about-objects-types-and-members-with-expression-trees.aspx
        public static string GetName<T>(Expression<Func<T>> expression)
        {
            var member = expression.Body as MemberExpression;

            // If the method gets a lambda expression 
            // that is not a member access,
            // for example, () => x + y, an exception is thrown.
            if (member != null)
                return member.Member.Name;
            else
                throw NewInvalidExpressionArgumentException(expression);
        }

        private static ArgumentException NewInvalidExpressionArgumentException<T>(Expression<Func<T>> expression)
        {
            return new ArgumentException(String.Format("'{0}' is not a valid expression for this method", expression), GetName(() => expression));
        }
    }
}

