using Microsoft.AspNetCore.Mvc.Rendering;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Security.Cryptography;
using System.Text;

namespace avFramworktalents.core
{
    public class Common
    {
        public static IEnumerable<SelectListItem> GetSelectListItems(List<KeyValuePair<string, string>> elements)
        {
            return elements.Select(e => new SelectListItem { Text = e.Value, Value = e.Key });
        }

        // Converts an enum to a list, using the description text rather than the name for the display
        public static List<KeyValuePair<string, string>> ConvertEnumToList(Type theEnumType)
        {
            List<KeyValuePair<string, string>> theList = new List<KeyValuePair<string, string>>();
            string[] names = Enum.GetNames(theEnumType);
            int i = 0;
            foreach (string value in names)
            {
                FieldInfo fi = theEnumType.GetField(value);
                object[] descriptionAttrs = fi.GetCustomAttributes(typeof(DescriptionAttribute), false);
                string key;

                // Make sure we have a description
                if (descriptionAttrs.Length > 0)
                {
                    DescriptionAttribute description = (DescriptionAttribute)descriptionAttrs[0];
                    key = description.Description;
                }
                else
                    key = names[i];

                // Add our item to our list
                KeyValuePair<string, string> item = new KeyValuePair<string, string>(value, key);
                theList.Add(item);
                i++;
            }

            return theList;

        }

        public static string GetFolderNameByTodaysDate()
        {
            return DateTime.Now.ToString("d");
        }

        public static string EncodeFile(string fileName)
        {
            return Convert.ToBase64String(File.ReadAllBytes(fileName));
        }

        public static string GetUniqueKey(int maxSize)
        {
            var chars = new char[62];
            chars =
                "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890!@#$%^&*()".ToCharArray();
            var data = new byte[1];
            using (var crypto = new RNGCryptoServiceProvider())
            {
                crypto.GetNonZeroBytes(data);
                data = new byte[maxSize];
                crypto.GetNonZeroBytes(data);
            }
            var result = new StringBuilder(maxSize);
            foreach (byte b in data)
            {
                result.Append(chars[b % (chars.Length)]);
            }
            return result.ToString();
        }

        public static int GetNumberOfRoundsByEventBackStageCompletionDate(DateTime backStageCompletionDate)
        {
            double diff = (DateTime.Now - backStageCompletionDate).TotalHours / 24;
            if (diff < 0)
            {
                return 0;
            }
            if (diff > 0.5 && diff <= 13.5)
            {
                return 1;
            }
            if (diff > 14 && diff <= 20.5)
            {
                return 2;
            }
            if (diff > 21 && diff <= 27.5)
            {
                return 3;
            }
            if (diff > 28 && diff <= 34.5)
            {
                return 4;
            }
            if (diff > 35 && diff <= 41.5)
            {
                return 5;
            }
            return 6;
        }

        public static int GetNumberOfRoundsByGroupEventStartDate(DateTime groupEventStartDate, bool isEventStarted)
        {
            double diff = (DateTime.Now - groupEventStartDate).TotalHours / 24;
            if (isEventStarted)
            {
                if (diff < 6.5)
                {
                    return 0;
                }
                if (diff > 7 && diff <= 13.5)
                {
                    return 1;
                }
                if (diff > 14)
                {
                    return 2;
                }
                return 0;
            }
            return 0;
        }
    }
}
