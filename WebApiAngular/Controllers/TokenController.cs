using System;
using Application.Request;
using Application.Services;
using Application.Services.TercerosServices.UsuarioServices;
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
		public TokenController(
			ITokenProvider tokenProvider, IUnitOfWork unitOfWork)
		{
			_tokenProvider = tokenProvider;
			_unitOfWork = unitOfWork;
		}

		[HttpPost]
		public IActionResult Post(TerceroUsuarioRequest usuarioRequest)
		{
			var user = new TerceroUsuarioValidarService(this._unitOfWork).
				ValidarTerceroUsuario(usuarioRequest);
			if (user == null)
			{
				return Unauthorized("El usuario y la contraseña " +
					"no fueron reconocidos");
			}
			return Ok(new JsonWebToken
			{
				AccessToken = _tokenProvider.CreateToken(user, DateTime.UtcNow.AddHours(8)),
				ExpiresIn = 480
			});
		}
	}
}
