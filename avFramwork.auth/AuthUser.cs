using System;
using System.Collections.Generic;
using System.Text;
using avFramworktalents.models;

namespace avFramworktalents.auth
{
   public class AuthUser
    {
        public string AuthToken { get; }
        public List<UserRole> UserRole { get; }
        public Users User { get; }

        public AuthUser(string token, Users user, List<UserRole> Roles)
        {
            this.AuthToken = AuthToken;
            this.UserRole = Roles;
            this.User = user;
        }

    }
}
