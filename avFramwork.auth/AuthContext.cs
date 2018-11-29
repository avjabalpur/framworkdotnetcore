using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Authentication;
using System.Web;
using avFramworktalents.Core;
using avFramworktalents.data;
using avFramworktalents.extensions;
using avFramworktalents.models;

namespace avFramworktalents.auth
{


    /// <summary>
    /// Provides information about the authentication and authorization of a 
    /// user interacting with the application.
    /// </summary>
    public class AuthContext : IAuthContext
    {

        private avFramworkDbContext dbContext { get; }
        const string sessionKey = "AuthUsers";
        private AuthUser user;
        private readonly IHttpContextAccessor _httpContextAccessor;
        private ISession _session => _httpContextAccessor.HttpContext.Session;


        public AuthContext(avFramworkDbContext dbContext, IHttpContextAccessor httpContextAccessor)
        {
            this.dbContext = dbContext;
            _httpContextAccessor = httpContextAccessor;
        }

        public bool IsAuthenticated
        {
            get;
            set;
        }

       public AuthUser User
        {
            get
            {
               return _session.GetObjectFromJson<AuthUser>(sessionKey);
            }
        }

       public string Authenticate(string userName, string password)
        {
            var user = dbContext.Users.FirstOrDefault(x => x.UserName == userName || x.Email == userName);

            if (user == null)
                throw new InvalidCredentialException("The user for " + userName + " was incorrect.");

            try
            {
                if (avFramworkEncryption.VerifyHash(password, user.EncrptPassword))
                {
                    IsAuthenticated = true;
                    var sessionToken = avFramworkEncryption.ComputeHash(string.Concat(userName, ":", "avFramwork"), null);
                    dbContext.UserSessions.Add(new UserSessions
                    {
                        SessionId = Guid.NewGuid(),
                        SessionToken = sessionToken,
                        Created = DateTime.Now.ToAppDateTime(),
                        Expires = DateTime.Now.AddMinutes(30).ToAppDateTime(),
                        Flag = 1,
                        Locked = false,
                        UserName = user.UserName,
                        Timeout = 30
                    });

                    
                    dbContext.SaveChanges();

                    //var userRoles = dbContext.UserRoles.Where(x => x.UserId == user.Id);
                    //if (userRoles != null)
                    //{
                    //    user = new AuthUser(sessionToken, userRoles.ToList());
                    //}
                    //else {
                        var authUser = new AuthUser(sessionToken, user, null);
                   // }
                    
                    _session.SetObjectAsJson(sessionKey, authUser);
                    return sessionToken;
                }
                else
                {
                    throw new InvalidCredentialException("The password for " + userName + " was incorrect.");
                }
            }
            catch (Exception)
            {

                throw new InvalidCredentialException("The password for " + userName + " was incorrect.");
            }
           
            
        }

        public string LogOut(string userName)
        {
            throw new NotImplementedException();
        }
    }
}