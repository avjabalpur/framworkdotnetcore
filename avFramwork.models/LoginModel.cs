using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;
using avFramworktalents.Core;

namespace avFramworktalents.models
{
   public class LoginModel : BaseModel
    {
        [Required(ErrorMessage = RequiredMessages.RequiredFieldMessage)]
        public string UserName { get; set; }

        [Required(ErrorMessage = RequiredMessages.RequiredFieldMessage)]
        public string Password { get; set; }

        public bool Success { get; set; }

        public string Token { get; set; }
    }
}
