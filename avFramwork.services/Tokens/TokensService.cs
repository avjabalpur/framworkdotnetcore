using System;
using System.Collections.Generic;
using System.Linq;
using avFramworktalents.core;
using avFramworktalents.Core;
using avFramworktalents.data;
using avFramworktalents.extensions;
using avFramworktalents.models;

namespace avFramworktalents.services
{
    public class TokensService : ITokensService
    {
        private avFramworkDbContext dbContext { get; }
        public TokensService(avFramworkDbContext dbContext)
        {
            this.dbContext = dbContext;
        }

        public IList<MaskingType> GetMaskingType() {
            return dbContext.MaskingType.ToList();
        }

        public IList<Token> GetTokens()
        {
           return dbContext.Token.Where(e => e.IsDeleted == false).ToList();
        }

        public Token GetToken(int id)
        {
            return dbContext.Token.FirstOrDefault(e => e.IsDeleted == false && e.Id == id);
        }

        public bool SaveToken(Token token)
        {
            if (token.Id != 0)
            {
                var currentEvent = dbContext.Token.FirstOrDefault(e => e.Id == token.Id);
                currentEvent.Name = token.Name;
                currentEvent.Description = token.Description;
                currentEvent.IsActive = token.IsActive;

                currentEvent.NoOfUploadsAllowed = token.NoOfUploadsAllowed;
                currentEvent.Amount = token.Amount;
                currentEvent.ExpireDurationInDays = token.ExpireDurationInDays;
            }
            else
            {
                dbContext.Token.Add(new Token
                {
                    Name = token.Name,
                    Description = token.Description,
                    IsActive = token.IsActive,
                    NoOfUploadsAllowed = token.NoOfUploadsAllowed,
                    Amount = token.Amount,
                    ExpireDurationInDays = token.ExpireDurationInDays,
                });
            }
           return dbContext.SaveChanges() > 0;
        }

        public bool DeleteToken(int id)
        {
            var eventType = dbContext.Token.FirstOrDefault(e => e.Id == id);
            eventType.IsDeleted = true;
            return dbContext.SaveChanges() > 0;
        }

        public IList<GrantedTokens> GetGrantedTokens()
        {
            // showing 20 at the movement
            var tokens = dbContext.GrantedTokens.Where(e => e.IsDeleted == false)
                .OrderByDescending(e => e.CreatedOn).Take(20);
            foreach (var token in tokens)
            {
                token.UserName = dbContext.Users.FirstOrDefault(x => x.Id == token.UserId).UserName;
            }

            return tokens.ToList();
        }

        public IList<GrantedTokens> GetGrantedTokensByUserId(long userId)
        {
            var tokens = dbContext.GrantedTokens.Where(e =>e.UserId == userId && e.IsDeleted == false)
                .OrderByDescending(e => e.CreatedOn);
            return tokens.ToList();
        }

        public string GrantToken(RequestPayment request)
        {
            long grantedTokenId;
            const string chargeid = "Granted By Admin";
            var token = GetToken(request.TokenId);
            var generatedToken = "UST-" + Common.GetUniqueKey(10);
            if (token != null)
            {
                var tokenExpiresOn = DateTime.Now.AddDays(token.ExpireDurationInDays).ToAppDateTime();
                dbContext.PaymentTransaction.Add(new PaymentTransaction
                {
                    Amount = token.Amount,
                    IsActive = true,
                    IsDeleted = false,
                    TokenId = token.Id,
                    TransactionDate = DateTime.Now.ToAppDateTime(),
                    TransactionNumber = chargeid,
                    UserId = Convert.ToInt64(request.UserId),
                });

                dbContext.Managetoken.Add(new Managetoken
                {
                    CreateDate = DateTime.Now.ToAppDateTime(),
                    IsActive = true,
                    TokenId = token.Id,
                    UserId = Convert.ToInt64(request.UserId),
                    UniqueTokenId = generatedToken,
                    WillExpireOn = tokenExpiresOn,
                    RemainingUploadCount = token.NoOfUploadsAllowed,
                });
                dbContext.SaveChanges();

            }
            return generatedToken;
        }

        public string GrantTokenByAdmin(long userId, bool sendMail = false)
        {
            var user = dbContext.Users.FirstOrDefault(x => x.Id == userId && x.IsActive == true);
            if (user !=null)
            {
                var token = "UST-" + Common.GetUniqueKey(10);
                dbContext.GrantedTokens.Add(new GrantedTokens
                {
                    UserId = user.Id,
                    CreatedOn = DateTime.Now.ToAppDateTime(),
                    IsActive = true,
                    IsDeleted = false,
                    UniqueToken = token,
                });
                dbContext.SaveChanges();
                if (sendMail == true)
                {
                    // Have to send the mail to the user email id
                }
                return token;
            }
            return null;
            
        }


        public bool CheckIsTokenValid(string tokenCode, int tokenType)
        {
                if (tokenType == Convert.ToInt32(TokenUploadType.TokenCode))
                {
                    var token = dbContext.GrantedTokens.FirstOrDefault(t => t.UniqueToken == tokenCode.Trim() && t.IsActive);
                    if (token != null && token.CreatedOn.AddDays(7) >= DateTime.Now)
                    {
                        return true;
                    }
                    return false;
                }
                else
                {
                    var token = dbContext.Managetoken.FirstOrDefault(t => t.UniqueTokenId == tokenCode);
                    if (token != null && token.WillExpireOn >= DateTime.Now && token.RemainingUploadCount > 0)
                    {
                        return true;
                    }
                    return false;
                }
        }
    }
}
