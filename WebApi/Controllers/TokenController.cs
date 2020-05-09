using System;
using Application.Request;
using Application.Services;
using Domain.Contracts;
using Infrastructure;
using Microsoft.AspNetCore.Mvc;
using WebApi.Authentication;

namespace WebApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class TokenController : ControllerBase
    {
        private readonly IUnitOfWork _unitOfWork;
        private readonly ITokenProvider _tokenProvider;
        private readonly DulcesYmasContext _context;
        public TokenController(DulcesYmasContext context,
            ITokenProvider tokenProvider, IUnitOfWork unitOfWork)
        {
            _context = context;
            _tokenProvider = tokenProvider;
            _unitOfWork = unitOfWork;
        }

        // POST: api/Token
        [HttpPost]
        public JsonWebToken Post(TerceroUsuarioRequest usuarioRequest)
        {
            var user = new ValidarUsuario(this._unitOfWork).
                ValidarTerceroUsuario(usuarioRequest);
            if (user==null)
            {
                throw new UnauthorizedAccessException();
            }
            return new JsonWebToken
            {
                AccessToken = _tokenProvider.CreateToke(user, DateTime.UtcNow.AddHours(8)),
                ExpiresIn = 480
            };
        }
    }
}
