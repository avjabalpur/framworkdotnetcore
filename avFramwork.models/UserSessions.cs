using System;
using System.Collections.Generic;
using System.Text;

namespace avFramworktalents.models
{
   public class UserSessions
    {
        public Guid SessionId { get; set; }
        public string SessionToken { get; set; }
        public string UserName { get; set; }
        public DateTime Created { get; set; }
        public DateTime Expires { get; set; }
        public int Timeout { get; set; }
        public int Flag { get; set; }
        public bool Locked { get; set; }
        public string Data { get; set; }
    }
}
