using System;
using System.Collections.Generic;
using System.Linq;
using avFramworktalents.Core;
using avFramworktalents.data;
using avFramworktalents.extensions;
using avFramworktalents.models;

namespace avFramworktalents.services
{
    public class AccountService : IAccountService
    {
        private avFramworkDbContext dbContext { get; }
        public AccountService(avFramworkDbContext dbContext)
        {
            this.dbContext = dbContext;
        }

        public bool ChangePassword(string userName)
        {
            throw new NotImplementedException();
        }

        public bool DeleteUser(int userId)
        {
            throw new NotImplementedException();
        }

        public bool ForgotPassword(string userName)
        {
            throw new NotImplementedException();
        }

        public Users GetUser(int userId)
        {
            throw new NotImplementedException();
        }

        public Users GetUserByUserName(string email)
        {
            throw new NotImplementedException();
        }

        public IList<Users> GetUsers()
        {
            throw new NotImplementedException();
        }

        public bool RegisterUser(RegisterModel user)
        {

            var existinguser = dbContext.Users.FirstOrDefault(x => x.UserName == user.UserName || x.Email == user.Email);

            if (existinguser != null)
                throw new Exception("The username or Email was already exits.");

            dbContext.Users.Add(new Users
            {
                FirstName = user.FirstName,
                LastName = user.LastName,
                UserName = user.UserName,
                Email = user.Email,
                EncrptPassword = avFramworkEncryption.ComputeHash(user.Password, null),
                IsActive = true,
                IsDeleted = false,
                CreatedDate = DateTime.Now.ToAppDateTime()
            });
            dbContext.SaveChanges();
            return true;
        }

        public void UpdateUser(Users user)
        {
            throw new NotImplementedException();
        }

        public IList<GrantedTokens> GetUserTokens(int userId)
        {
            return dbContext.GrantedTokens.Where(x => x.UserId == userId && x.IsActive).ToList();
        }
    }
}
