using Domain.Entities.Tercero;
using Microsoft.IdentityModel.Tokens;
using System;

namespace WebApi.Authentication
{
    public interface ITokenProvider
    {
        string CreateToke(TerceroUsuario user, DateTime expiry);
        TokenValidationParameters GetValidationParameters();

    }
}
