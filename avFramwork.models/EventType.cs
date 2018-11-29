using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;
using avFramworktalents.Core;

namespace avFramworktalents.models
{
   public class EventType : BaseModel
    {
        [Required(ErrorMessage = RequiredMessages.RequiredFieldMessage)]
        public string Name { get; set; }

        [Required(ErrorMessage = RequiredMessages.RequiredFieldMessage)]
        public string Description { get; set; }

        public DateTime Created { get; set; }

        public bool Active { get; set; }

        public bool IsDeleted { get; set; }    
    }
}
