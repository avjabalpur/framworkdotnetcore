using System;
using System.Collections.Generic;
using System.Linq;
using avFramworktalents.Core;
using avFramworktalents.data;
using avFramworktalents.extensions;
using avFramworktalents.models;

namespace avFramworktalents.services
{
    public class UserService : IUserService
    {
        private avFramworkDbContext dbContext { get; }
        public UserService(avFramworkDbContext dbContext)
        {
            this.dbContext = dbContext;
        }

        
        public bool DeleteEventType(int id)
        {
            var eventType = dbContext.EventType.FirstOrDefault(e => e.Id == id);
            eventType.IsDeleted = true;
            return dbContext.SaveChanges() > 0;
        }

        public IList<Users> GetUsers()
        {
            return dbContext.Users.Where(e => e.IsDeleted == false).ToList();
        }

        public Users GetUser(int id)
        {
            return dbContext.Users.FirstOrDefault(e => e.IsDeleted == false && e.Id == id);
        }

        public bool SaveUser(Users user)
        {
            //if (user.Id != 0)
            //{
            //    var currentuser = dbContext.EventType.FirstOrDefault(e => e.Id == user.Id);
            //    currentuser.Name = user.Name;
            //    currentuser.Description = user.Description;
            //    currentuser.Active = user.Active;
            //}
            //else
            //{
            //    dbContext.EventType.Add(new Users
            //    {
            //        Name = eventType.Name,
            //        Description = eventType.Description,
            //        Active = eventType.Active,
            //        Created = DateTime.Now.ToAppDateTime()
            //    });
            //}
            //return dbContext.SaveChanges() > 0;
            return true;

        }

        public bool DeleteUser(int id)
        {
            throw new NotImplementedException();
        }
    }
}
