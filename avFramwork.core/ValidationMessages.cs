using System;
using System.Collections.Generic;
using System.Text;

namespace avFramworktalents.Core
{
    public static class RequiredMessages
    {
        public const string InvalidFieldMessage = "INVALID";
        public const string RequiredFieldMessage = "REQUIRED";
        public const string MaxLenghtMessage = "{0} can't be more than {1} charactor.";
        public const string MinLenghtMessage = "{0} should be more than {1} charactor.";
        public const string UniqueMessage = "{0} should be unique.";
        public const string PasswordInvalidFieldMessage = "Password requirements not met";
        public const string ConfirmPasswordNotSame = "Password and Confirm Passwords don\'t match";
        public const string TemporaryAndNewPasswordNot = "Temporary password and new password can not be same";
        public const string PasswordNotContainUserName = "Your password may not contain segments of your username";
    }
}
