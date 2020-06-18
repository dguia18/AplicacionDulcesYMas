using Application.Request;
using Application.Services;
using Application.Services.CompraServices;
using Domain.Contracts;
using Infrastructure.Base;
using Microsoft.AspNetCore.Mvc;

namespace WebApiAngular.Controllers
{
	[Route("api/[controller]")]
	[ApiController]
	public class CompraController : ControllerBase
	{
		private readonly IUnitOfWork _unitOfWork;
		public CompraController(IUnitOfWork unitOfWork)
		{
			this._unitOfWork = unitOfWork;
		}

		[HttpPost("")]
		public ActionResult<Response> HacerCompra(CompraRequest request)
		{
			Response response = new CompraService(_unitOfWork).HacerCompraService(request);
			if (response.Data == null)
			{
				return BadRequest(response.Mensaje);
			}
			return Ok(response);
		}

		[HttpPost("getPaginados")]
		public IActionResult GetPaginados(PaginationRequest request)
		{
			var response = new ListarComprasPaginadasService(this._unitOfWork)
				.GetPaginados(request);
			if (response.Count == 0)
				return NotFound("No se encontraron compras por el momento");
			return Ok(response);
		}
	}
}