using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Threading.Tasks;

namespace CanaryRolloutApp
{
    public static class ContainerHelper
    {
        public static string GetBackgroundColor()
        {
            // return "darkslateblue";
            return "#884EA0";
        }


        #region Other stuffs
        public static string ToHex(this int value)
        {
            return String.Format("0x{0:X}", value);
        }
        public static int FromHex(string value)
        {
            // strip the leading 0x
            if (value.StartsWith("0x", StringComparison.OrdinalIgnoreCase))
            {
                value = value.Substring(2);
            }
            return Int32.Parse(value, NumberStyles.HexNumber);
        }
        private static String IntToHexString(int n, int len)
        {
            char[] ch = new char[len--];
            for (int i = len; i >= 0; i--)
            {
                ch[len - i] = ByteToHexChar((byte)((uint)(n >> 4 * i) & 15));
            }
            return new String(ch);
        }

        /// <summary>
        /// Convert a byte to a hexidecimal char
        /// </summary>
        /// <param name="b"></param>
        /// <returns></returns>
        private static char ByteToHexChar(byte b)
        {
            if (b < 0 || b > 15)
                throw new Exception("IntToHexChar: input out of range for Hex value");
            return b < 10 ? (char)(b + 48) : (char)(b + 55);
        }

        /// <summary>
        /// Convert a hexidecimal string to an base 10 integer
        /// </summary>
        /// <param name="str"></param>
        /// <returns></returns>
        private static int HexStringToInt(String str)
        {
            int value = 0;
            for (int i = 0; i < str.Length; i++)
            {
                value += HexCharToInt(str[i]) << ((str.Length - 1 - i) * 4);
            }
            return value;
        }

        /// <summary>
        /// Convert a hex char to it an integer.
        /// </summary>
        /// <param name="ch"></param>
        /// <returns></returns>
        private static int HexCharToInt(char ch)
        {
            if (ch < 48 || (ch > 57 && ch < 65) || ch > 70)
                throw new Exception("HexCharToInt: input out of range for Hex value");
            return (ch < 58) ? ch - 48 : ch - 55;
        }
        public static string GetImageName()
        {
            return "CONTAINER_IMAGE_NAME";
        }

        public static string GetImageVersion()
        {
            return "CONTAINER_IMAGE_VERSION";
        }
        #endregion
    }
}
