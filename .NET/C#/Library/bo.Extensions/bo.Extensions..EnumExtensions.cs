using System;
using System.Collections.Generic;

namespace bo.Extensions.EnumExtensions
{
    public static class EnumExtensions
    {

        #region .NET 3.5: extension methods: In, typesafe In, IsEmpty and typesafe IsEmpty

        public static bool In(this Enum value, Enum flags)
        {
            bool result = bo.EnumHelper.InSet(value, flags);
            return result;
        }

        public static bool In<T>(this T value, T flags)
            where T : struct, IComparable, IFormattable, IConvertible
        {
            bool result = InSet(value, flags);
            return result;
        }

        public static bool IsEmpty(this Enum value)
        {
            bool result = bo.EnumHelper.IsEmptySet(value);
            return result;
        }

        public static bool IsEmpty<T>(this T value)
            where T : struct, IComparable, IFormattable, IConvertible
        {
            bool result = IsEmptySet(value);
            return result;
        }

        #endregion

        #region .NET 3.5: extension methods: typesafe Complement, Insersect, Union

        // If you have your project in .NET 2.0 or .NET 3.0 mode, then you get this error message: 
        // Error	1	Cannot define a new extension method because the compiler required type 'System.Runtime.CompilerServices.ExtensionAttribute' cannot be found. Are you missing a reference to System.Core.dll?	C:\develop\bo-library\C#\bo\bo.EnumHelper.cs	135	37	bo

        public static T Complement<T>(this T left, T right)
            where T : struct, IComparable, IFormattable, IConvertible
        {
            T result = bo.Generic.EnumHelper.EnumComplement(left, right);
            return result;
        }

        public static T Intersect<T>(this T left, T right)
            where T : struct, IComparable, IFormattable, IConvertible
        {
            T result = bo.Generic.EnumHelper.EnumIntersect(left, right);
            return result;
        }

        public static T Union<T>(this T left, T right)
            where T : struct, IComparable, IFormattable, IConvertible
        {
            T result = bo.Generic.EnumHelper.EnumUnion(left, right);
            return result;
        }

        #endregion

        #region .NET 3.5: generic extension method: typesafe InSet, typesafe IsEmptySet

        public static bool InSet<T>(this T value, T flags)
            where T : struct, IComparable, IFormattable, IConvertible
        {
            Int64 valueInt64 = bo.EnumHelper.ToInt64(value);
            Int64 intersection = bo.EnumHelper.IConvertibleIntersect(value, flags);

            bool result = (valueInt64 == intersection);

            return result;
        }

        public static bool IsEmptySet<T>(this T value)
            where T : struct, IComparable, IFormattable, IConvertible
        {
            Int64 valueInt64 = bo.EnumHelper.ToInt64(value);

            bool result = (valueInt64 == 0);

            return result;
        }

        #endregion

        #region .NET 3.5: extension methods: All, ToString

        public static T All<T>(this T value)
            where T : struct, IComparable, IFormattable, IConvertible
        {
            T result = bo.Generic.EnumHelper.All<T>();
            return result;
        }

        public static T[] ToArray<T>(this T value)
            where T : struct, IComparable, IFormattable, IConvertible
        {
            T[] result = bo.Generic.EnumHelper.ToArray<T>();
            return result;
        }

        public static List<T> ToList<T>(this T value)
            where T : struct, IComparable, IFormattable, IConvertible
        {
            List<T> result = bo.Generic.EnumHelper.ToList<T>();
            return result;
        }

        public static string Tostring<T>(this T value)
            where T : struct, IComparable, IFormattable, IConvertible
        {
            string result = bo.Generic.EnumHelper.ToString<T>();
            return result;
        }

        #endregion

    }

}
