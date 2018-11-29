using System;
using System.ComponentModel.DataAnnotations;
using avFramworktalents.Core;

namespace avFramworktalents.models
{
   public class RequestPayment : BaseModel
    {
        [Required(ErrorMessage = RequiredMessages.RequiredFieldMessage)]
        public int RequestedTokenRecordId { get; set; }

        [Required(ErrorMessage = RequiredMessages.RequiredFieldMessage)]
        [RegularExpression(RegexValidation.UserNameValidate, ErrorMessage = RequiredMessages.InvalidFieldMessage)]
        public string NameOnCard { get; set; }

        [Required(ErrorMessage = RequiredMessages.RequiredFieldMessage)]
        [RegularExpression(RegexValidation.NumberValidate, ErrorMessage = RequiredMessages.InvalidFieldMessage)]
        public string CardNumber { get; set; }

        [Required(ErrorMessage = RequiredMessages.RequiredFieldMessage)]
        [RegularExpression(RegexValidation.NumberValidate, ErrorMessage = RequiredMessages.InvalidFieldMessage)]
        public string CardexpMonth { get; set; }

        [Required(ErrorMessage = RequiredMessages.RequiredFieldMessage)]
        [RegularExpression(RegexValidation.NumberValidate, ErrorMessage = RequiredMessages.InvalidFieldMessage)]
        public string Year { get; set; }

        public string UserId { get; set; }

        [Required(ErrorMessage = RequiredMessages.RequiredFieldMessage)]
        [RegularExpression(RegexValidation.NumberValidate, ErrorMessage = RequiredMessages.InvalidFieldMessage)]

        public string Amount { get; set; }
        public string Token { get; set; }
        public int TokenId { get; set; }
    }
}
