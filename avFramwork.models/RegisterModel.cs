using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;
using avFramworktalents.Core;

namespace avFramworktalents.models
{
   public class RegisterModel : Users
    {

        [Required(ErrorMessage = RequiredMessages.RequiredFieldMessage)]
        [RegularExpression(RegexValidation.PasswordValidate, ErrorMessage = RequiredMessages.PasswordInvalidFieldMessage)]
        [StringLength(255, ErrorMessage = "Must be between 5 and 255 characters", MinimumLength = 5)]
        public string Password { get; set; }

        [Required(ErrorMessage = RequiredMessages.RequiredFieldMessage)]
        [Compare("Password", ErrorMessage = RequiredMessages.ConfirmPasswordNotSame)]
        public string ConfirmPassword { get; set; }

       // [Range(typeof(bool), "true", "true", ErrorMessage = RequiredMessages.RequiredFieldMessage)]
        public bool TermsConditionAccepted { get; set; }

        public bool Success { get; set; }
    }
}
