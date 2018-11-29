using System;
using System.Collections.Generic;
using System.Text;
using avFramworktalents.models;

namespace avFramworktalents.services
{
   public interface IUserService
    {
        IList<Users> GetUsers();
        Users GetUser(int id);
        bool SaveUser(Users user);
        bool DeleteUser(int id);
    }
}
