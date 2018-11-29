using System;
using System.Collections.Generic;
using System.Text;

namespace avFramworktalents.Core
{
    public static class RegexValidation
    {
        public const string NameValidation = @"^$|^([A-Za-z,.' -]{1,50}$)";
        public const string EmailValidate = @"^(([^<>()\[\]\\.,;:\s@']+(\.[^<>() \[\]\\.,;:\s@']+)*)|('.+'))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$";
        public const string AddressValidate = @"^[a-zA-Z0-9\s, #\/'-]*$";
        public const string CityValidate = @"^[A-z '-]+$";
        public const string NumberValidate = @"^[0-9]*$";
        public const string AlphaNumericOnly = @"^[A-Za-z0-9]+$";
        public const string PasswordValidate = @"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[~!@#$&^*()\\-`.+,/\']?)[A-Za-z\d$@$!%*#?&]{8,}$";
        public const string DateValidate = @"^(0?[1-9]|1[0-2])\/(0?[1-9]|1\d|2\d|3[01])\/(19|20)\d{2}$";
        public const string PhoneValidate = @"+[1-9]{1}[0-9]{3,14}$";
        public const string ZipValidate = @"^[0-9]{5}$";
        public const string UserNameValidate = @"^[a-zA-Z0-9\s, @.#\/'-]*$";
    }

}
