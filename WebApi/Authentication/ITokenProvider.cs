using Domain.Entities;
using Microsoft.IdentityModel.Tokens;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace WebApi.Authentication
{
    public interface ITokenProvider
    {
        string CreateToke(TerceroUsuario user, DateTime expiry);
        TokenValidationParameters GetValidationParameters();

    }
}
