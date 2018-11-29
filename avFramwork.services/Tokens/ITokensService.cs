using System;
using System.Collections.Generic;
using System.Text;
using avFramworktalents.models;

namespace avFramworktalents.services
{
    public interface ITokensService
    {
        IList<Token> GetTokens();
        Token GetToken(int id);
        bool SaveToken(Token eventType);
        bool DeleteToken(int id);
        IList<GrantedTokens> GetGrantedTokens();
        IList<GrantedTokens> GetGrantedTokensByUserId(long userId);
        string GrantToken(RequestPayment request);
        string GrantTokenByAdmin(long userId, bool sendMail = false);
        bool CheckIsTokenValid(string tokenCode, int tokenType);

        IList<MaskingType> GetMaskingType();
    }
}
