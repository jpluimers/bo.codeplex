using System;
using System.Collections.Generic;

// In, Union and Intersect are partially based on http://blogs.oosterkamp.nl/blogs/thomas/archive/2008/10/02/sets-in-c.aspx
//
// Note the strange construct "where T : struct, IComparable, IFormattable, IConvertible".
// Actually, you would like to use "where T: Enum" or "where T: enum", but the compiler does not allow that.
// Any enum type is a struct, and implements IComparable, IFormattable and IConvertible.
// So the complex where construct above is the closest thing to get to "where T: Enum"

namespace bo.Generic
{
    public class EnumHelper
    {

        #region .NET 2.0: generics: ToEnum

        private static T ToEnum<T>(Int64 resultInt64)
            where T : struct, IComparable, IFormattable, IConvertible
        {
            object resultObject = Enum.ToObject(typeof(T), resultInt64);
            T result = (T)resultObject;
            return result;
        }

        #endregion

        #region .NET 2.0: generics: ToArray, ToList, All, EnumToArray, EnumToList

        public static T[] ToArray<T>()
            where T : struct, IComparable, IFormattable, IConvertible
        {
            Array values = Enum.GetValues(typeof(T));
            T[] result = (T[])values;
            return result;
        }

        public static List<T> ToList<T>()
            where T : struct, IComparable, IFormattable, IConvertible
        {
            List<T> result = new List<T>(ToArray<T>());
            return result;
        }

        public static T All<T>()
            where T : struct, IComparable, IFormattable, IConvertible
        {
            T[] values = ToArray<T>();
            Int64 resultInt64 = 0;

            foreach (T value in values)
            {
                Int64 valueInt64 = bo.EnumHelper.ToInt64(value);
                resultInt64 = resultInt64 | valueInt64;
            }

            T result = ToEnum<T>(resultInt64);
            return result;
        }

        // some people find EnumToArray better readable than ToArray.
        public static T[] EnumToArray<T>()
            where T : struct, IComparable, IFormattable, IConvertible
        {
            return ToArray<T>();
        }

        // some people find EnumToList better readable than ToList.
        public static List<T> EnumToList<T>()
            where T : struct, IComparable, IFormattable, IConvertible
        {
            return ToList<T>();
        }

        #endregion

        #region .NET 2.0: generics: ToString

        public static string ToString<T>()
            where T : struct, IComparable, IFormattable, IConvertible
        {
            T all = All<T>();
            string result = all.ToString(null);
            return result;
        }

        #endregion

        #region .NET 2.0: generics: typesafe EnumComplement, EnumIntersect, EnumUnion

        public static T EnumComplement<T>(T left, T right)
            where T : struct, IComparable, IFormattable, IConvertible
        {
            Int64 resultInt64 = bo.EnumHelper.IConvertibleComplement(left, right);
            return ToEnum<T>(resultInt64);
        }

        public static T EnumIntersect<T>(T left, T right)
            where T : struct, IComparable, IFormattable, IConvertible
        {
            Int64 resultInt64 = bo.EnumHelper.IConvertibleIntersect(left, right);
            return ToEnum<T>(resultInt64);
        }

        public static T EnumUnion<T>(T left, T right)
            where T : struct, IComparable, IFormattable, IConvertible
        {
            Int64 resultInt64 = bo.EnumHelper.IConvertibleUnion(left, right);
            return ToEnum<T>(resultInt64);
        }

        #endregion

    }
}