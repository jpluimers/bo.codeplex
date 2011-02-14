// http://www.koders.com/c/fid48BA31C1DD231039FB20F72E6FCB17339E5C565A.aspx?s=%22Bob%22
using System;

namespace bo.System
{
    public static class ByteHelper
    {
        public const byte BitsPerByte = 8;
        public const byte BitsPerUInt16 = BitsPerByte * sizeof(UInt16);
        public const byte BitsPerUInt32 = BitsPerByte * sizeof(UInt32);

        public const byte ByteWithHighBitSet = 0x80;
        public const byte ByteWithLowBitSet = 0x01;
        public const UInt16 UInt16WithHighBitSet = 0x8000;
        public const UInt16 UInt16WithLowBitSet = 0x0001;
        public const UInt32 UInt32WithHighBitSet = 0x80000000;
        public const UInt32 UInt32WithLowBitSet = 0x00000001;

        // count leading ones (least significant ones)
        public static readonly byte[] CLO_Table = new byte[byte.MaxValue + 1]
        { 0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0, 4, // 0..15
          0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0, 5, // 16..31
          0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0, 4, // 32..47
          0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0, 6, // 48..63
          0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0, 4, // 64..79
          0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0, 5, // 80..95
          0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0, 4, // 96..111
          0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0, 7, // 112..127
          0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0, 4, // 128..143
          0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0, 5, // 144..159
          0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0, 4, // 160..175
          0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0, 6, // 176..191
          0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0, 4, // 192..207
          0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0, 5, // 208..223
          0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0, 4, // 224..239
          0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0, 8} // 240..255
          ;

        // count leading zeros (least significant zeros)
        public static readonly byte[] CLZ_Table = new byte[byte.MaxValue + 1]
        { 8, 0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0, // 0..15
          4, 0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0, // 16..31
          5, 0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0, // 32..47
          4, 0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0, // 48..63
          6, 0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0, // 64..79
          4, 0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0, // 80..95
          5, 0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0, // 96..111
          4, 0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0, // 112..127
          7, 0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0, // 128..143
          4, 0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0, // 144..159
          5, 0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0, // 160..175
          4, 0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0, // 176..191
          6, 0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0, // 192..207
          4, 0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0, // 208..223
          5, 0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0, // 224..239
          4, 0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0} // 240..255
          ;

        // count trailing ones (most significant ones)
        public static readonly byte[] CTO_Table = new byte[byte.MaxValue + 1]
        { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, // 0..15
          0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, // 16..31
          0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, // 32..47
          0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, // 48..63
          0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, // 64..79
          0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, // 80..95
          0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, // 96..111
          0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, // 112..127
          1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, // 128..143
          1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, // 144..159
          1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, // 160..175
          1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, // 176..191
          2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, // 192..207
          2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, // 208..223
          3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, // 224..239
          4, 4, 4, 4, 4, 4, 4, 4, 5, 5, 5, 5, 6, 6, 7, 8} // 240..255
          ;

        // count trailing zeros (most significant zeros)
        public static readonly byte[] CTZ_Table = new byte[byte.MaxValue + 1]
        { 8, 7, 6, 6, 5, 5, 5, 5, 4, 4, 4, 4, 4, 4, 4, 4, // 0..15
          3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, // 16..31
          2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, // 32..47
          2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, // 48..63
          1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, // 64..79
          1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, // 80..95
          1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, // 96..111
          1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, // 112..127
          0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, // 128..143
          0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, // 144..159
          0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, // 160..175
          0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, // 176..191
          0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, // 192..207
          0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, // 208..223
          0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, // 224..239
          0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0} // 240..255
          ;

        public static UInt32 LeadingOnes(byte count)
        {
            UInt32 result = UInt32.MinValue;
            for (int i = 0; i < count; i++)
            {
                result = (result << 1) | UInt32WithLowBitSet;
            }
            return result;
        }

        public static UInt32 LeadingZeroes(byte count)
        {
            UInt32 result = UInt32.MaxValue;
            for (int i = 0; i < count; i++)
            {
                result = (result << 1);
            }
            return result;
        }

        public static UInt32 TrailingOnes(byte count)
        {
            UInt32 result = UInt32.MinValue;
            for (int i = 0; i < count; i++)
            {
                result = (result >> 1) | UInt32WithHighBitSet;
            }
            return result;
        }

        public static UInt32 TrailingZeroes(byte count)
        {
            UInt32 result = UInt32.MaxValue;
            for (int i = 0; i < count; i++)
            {
                result = (result >> 1);
            }
            return result;
        }

        #region CLO

        public static byte CLO(this byte value)
        {
            return CLO_Table[value];
        }

        public static byte CLO(this UInt16 value)
        {
            byte[] bytes = BitConverter.GetBytes(value);
            byte result = bytes[0].CLO();
            if (result == BitsPerByte)
                result += bytes[1].CLO();
            return result;
        }

        public static byte CLO(this UInt32 value)
        {
            byte[] bytes = BitConverter.GetBytes(value);
            byte result = bytes[0].CLO();
            if (result == BitsPerByte)
            {
                result += bytes[1].CLO();
                if (result == 2 * BitsPerByte)
                {
                    result += bytes[1].CLO();
                    if (result == 3 * BitsPerByte)
                        result += bytes[1].CLO();
                }
            }
            return result;
        }

        #endregion

        #region CLO_Loop

        public static byte CLO_Loop(this byte value)
        {
            byte result = 0;
            while (value != 0)
            {
                if ((value & 1) == 0)
                    return result;
                result++;
                value = (byte)(value >> 1);
            }
            return result;
        }

        public static byte CLO_Loop(this UInt16 value)
        {
            byte result = 0;
            while (value != 0)
            {
                if ((value & 1) == 0)
                    return result;
                result++;
                value = (byte)(value >> 1);
            }
            return result;
        }

        public static byte CLO_Loop(this UInt32 value)
        {
            byte result = 0;
            while (value != 0)
            {
                if ((value & 1) == 0)
                    return result;
                result++;
                value = (byte)(value >> 1);
            }
            return result;
        }

        #endregion

        #region CLZ

        public static byte CLZ(this byte value)
        {
            //return CLZ_Table[value];
            return ((byte)(~value)).CLO(); // C# cannot do a bit-wise not on bytes, so you have to cast back from int
            //return ((byte)(value ^ 0xFF)).CLO(); // an xor with 0xFF also results in an int too.

        }

        public static byte CLZ(this UInt16 value)
        {
            return ((UInt16)(~value)).CLO(); // binary not returns an int, not an UInt16
        }

        public static byte CLZ(this UInt32 value)
        {
            return ((UInt32)(~value)).CLO(); // binary not returns an int, not an UInt32
        }

        #endregion

        public static byte CLZTable(this byte value)
        {
            return CLZ_Table[value];
        }

        #region CLZ_Loop

        public static byte CLZ_Loop(this byte value)
        {
            byte result = 0;
            for (int i = 0; i < BitsPerByte; i++)
            {
                if ((value & 1) != 0)
                    return result;
                result++;
                value = (byte)(value >> 1);
            }
            return result;
        }

        public static byte CLZ_Loop(this UInt16 value)
        {
            byte result = 0;
            for (int i = 0; i < BitsPerByte; i++)
            {
                if ((value & 1) != 0)
                    return result;
                result++;
                value = (byte)(value >> 1);
            }
            return result;
        }

        public static byte CLZ_Loop(this UInt32 value)
        {
            byte result = 0;
            for (int i = 0; i < BitsPerByte; i++)
            {
                if ((value & 1) != 0)
                    return result;
                result++;
                value = (byte)(value >> 1);
            }
            return result;
        }

        #endregion

        #region CTO

        public static byte CTO(this byte value)
        {
            return CTO_Table[value];
        }

        public static byte CTO(this UInt16 value)
        {
            byte[] bytes = BitConverter.GetBytes(value);
            byte result = bytes[0].CTO();
            if (result == BitsPerByte)
                result += bytes[1].CTO();
            return result;
        }

        public static byte CTO(this UInt32 value)
        {
            byte[] bytes = BitConverter.GetBytes(value);
            byte result = bytes[0].CTO();
            if (result == BitsPerByte)
            {
                result += bytes[1].CTO();
                if (result == 2 * BitsPerByte)
                {
                    result += bytes[1].CTO();
                    if (result == 3 * BitsPerByte)
                        result += bytes[1].CTO();
                }
            }
            return result;
        }

        #endregion

        #region CTO_Loop

        public static byte CTO_Loop(this byte value)
        {
            byte result = 0;
            while (value != 0)
            {
                if ((value & ByteWithHighBitSet) == 0)
                    return result;
                result++;
                value = (byte)(value << 1);
            }
            return result;
        }

        public static byte CTO_Loop(this UInt16 value)
        {
            byte result = 0;
            while (value != 0)
            {
                if ((value & UInt16WithHighBitSet) == 0)
                    return result;
                result++;
                value = (byte)(value << 1);
            }
            return result;
        }

        public static byte CTO_Loop(this UInt32 value)
        {
            byte result = 0;
            while (value != 0)
            {
                if ((value & UInt32WithHighBitSet) == 0)
                    return result;
                result++;
                value = (byte)(value << 1);
            }
            return result;
        }

        #endregion

        #region CTZ

        public static byte CTZ(this byte value)
        {
            //return CTZ_Table[value];
            return ((byte)(~value)).CTO(); // C# cannot do a bit-wise not on bytes, so you have to cast back from int
            //return ((byte)(value ^ 0xFF)).CTO(); // an xor with 0xFF also results in an int too.

        }

        public static byte CTZ(this UInt16 value)
        {
            return ((UInt16)(~value)).CTO(); // binary not returns an int, not an UInt16
        }

        public static byte CTZ(this UInt32 value)
        {
            return ((UInt32)(~value)).CTO(); // binary not returns an int, not an UInt32
        }

        #endregion

        public static byte CTZTable(this byte value)
        {
            return CTZ_Table[value];
        }

        #region CTZ_Loop

        public static byte CTZ_Loop(this byte value)
        {
            byte result = 0;
            for (int i = 0; i < BitsPerByte; i++)
            {
                if ((value & ByteWithHighBitSet) != 0)
                    return result;
                result++;
                value = (byte)(value << 1);
            }
            return result;
        }

        public static byte CTZ_Loop(this UInt16 value)
        {
            byte result = 0;
            for (int i = 0; i < BitsPerByte; i++)
            {
                if ((value & UInt16WithHighBitSet) != 0)
                    return result;
                result++;
                value = (byte)(value << 1);
            }
            return result;
        }

        public static byte CTZ_Loop(this UInt32 value)
        {
            byte result = 0;
            for (int i = 0; i < BitsPerByte; i++)
            {
                if ((value & UInt32WithHighBitSet) != 0)
                    return result;
                result++;
                value = (byte)(value << 1);
            }
            return result;
        }

        #endregion

    }
}
