using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace AnonymousMethodInLoopConsoleApplication
{
    class Program
    {

        static void LoopWithAnoymousMethod()
        {
            List<Action> methodList = new List<Action>();
            for (int i = 0; i < 5; i++)
            {
                methodList.Add(
                    delegate()
                    {
                        Console.WriteLine(i);
                    }
                    );
            }
            foreach (Action method in methodList)
            {
                method();
            }
        }

        static void LoopWithAnoymousLambda()
        {
            List<Action> methodList = new List<Action>();
            for (int i = 0; i < 5; i++)
            {
                methodList.Add(
                    () =>
                        Console.WriteLine(i)
                );
            }
            foreach (Action method in methodList)
            {
                method();
            }
        }

        static void Main(string[] args)
        {
            try
            {
                Console.WriteLine("LoopWithAnoymousMethod:");
                LoopWithAnoymousMethod();
                Console.WriteLine("LoopWithAnoymousLambda:");
                LoopWithAnoymousLambda();
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
            }
            Console.Write("Press <Enter>");
            Console.ReadLine();
        }
    }
}
