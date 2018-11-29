using System;
using System.Collections.Generic;
using System.Text;

namespace avFramworktalents.extensions
{
  public static  class AppExtension
    {
        public static DateTime ToAppDateTime(this DateTime dateTime) {
            return dateTime.ToUniversalTime();
        }
    }
}
