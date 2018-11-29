using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using avFramworktalents.models;

namespace avFramworktalents.auth
{
    public interface IAuthContext
    {

        bool IsAuthenticated
        {
            get;
        }

        AuthUser User
        {
            get;
        }

        string Authenticate(string userName, string password);

        string LogOut(string userName);
    }
}
