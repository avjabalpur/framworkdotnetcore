using System;
using System.Collections.Generic;
using System.Text;
using avFramworktalents.models;

namespace avFramworktalents.services
{
   public interface IAccountService
    {
        IList<Users> GetUsers();
        Users GetUser(int userId);
        Users GetUserByUserName(string email);
        bool RegisterUser(RegisterModel user);
        void UpdateUser(Users user);
        bool DeleteUser(int userId);
        bool ForgotPassword(string userName);
        bool ChangePassword(string userName);

        IList<GrantedTokens> GetUserTokens(int userId);
    }
}
