using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;

namespace avFramworktalents.models
{
   public class BaseModel
    {
		public long Id { get; set; }

        [NotMapped]
        public string ValidationMessage { get; set; }

        [NotMapped]
        public string DeveloperMessage { get; set; }

        [NotMapped]
        public string MessageType { get; set; }
        
    }
}
