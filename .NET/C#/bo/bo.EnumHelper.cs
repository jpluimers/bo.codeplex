using System;

namespace bo
{

    public static class EnumHelper
    {

        #region .NET 1.0: methods and types: ToInt64

        public static Int64 ToInt64(IConvertible value)
        {
            // we could use Convert.ToInt64() here, but Convert has no overloads that are specific to IConvertible
            Int64 result = value.ToInt64(null);
            return result;
        }

        public static void ToInt64(IConvertible left, IConvertible right, out Int64 leftInt64, out Int64 rightInt64)
        {
            leftInt64 = ToInt64(left);
            rightInt64 = ToInt64(right);
        }

        #endregion

        #region .NET 1.0: methods and types: EnumToInt64

        public static Int64 EnumToInt64(Enum value)
        {
            IConvertible iConvertibleValue = (IConvertible)value;
            Int64 int64Value = ToInt64(iConvertibleValue);
            return int64Value;
        }

        public static void EnumToInt64(Enum left, Enum right, out Int64 leftInt64, out Int64 rightInt64)
        {
            leftInt64 = EnumToInt64(left);
            rightInt64 = EnumToInt64(right);
        }

        #endregion

        #region .NET 1.0: methods and types: InSet, IsEmptySet

        public static bool InSet(Enum value, Enum flags)
        {
            Int64 valueInt64 = ToInt64(value);
            Int64 intersectionInt64 = EnumIntersect(value, flags);

            bool result = valueInt64 == intersectionInt64;

            return result;
        }

        public static bool IsEmptySet(Enum value)
        {
            Int64 valueInt64 = ToInt64(value);

            bool result = valueInt64 == 0;

            return result;
        }

        #endregion

        #region .NET 1.0: methods and types: IConvertibleComplement, IConvertibleIntersect, IConvertibleUnion, EnumComplement, EnumIntersect, EnumUnion with Int64 result

        public static Int64 IConvertibleComplement(IConvertible left, IConvertible right)
        {
            Int64 leftInt64 = ToInt64(left);
            Int64 rightInt64 = ToInt64(right);

            Int64 result = leftInt64 & (~rightInt64);
            return result;
        }

        public static Int64 IConvertibleIntersect(IConvertible left, IConvertible right)
        {
            Int64 leftInt64 = ToInt64(left);
            Int64 rightInt64 = ToInt64(right);

            Int64 result = leftInt64 & rightInt64;
            return result;
        }

        public static Int64 IConvertibleUnion(IConvertible left, IConvertible right)
        {
            Int64 leftInt64 = ToInt64(left);
            Int64 rightInt64 = ToInt64(right);

            Int64 result = leftInt64 | rightInt64;
            return result;
        }

        public static Int64 EnumComplement(Enum left, Enum right)
        {
            Int64 result = IConvertibleComplement(left, right);
            return result;
        }

        public static Int64 EnumIntersect(Enum left, Enum right)
        {
            Int64 result = IConvertibleIntersect(left, right);
            return result;
        }

        public static Int64 EnumUnion(Enum left, Enum right)
        {
            Int64 result = IConvertibleUnion(left, right);
            return result;
        }

        #endregion

    }

}
