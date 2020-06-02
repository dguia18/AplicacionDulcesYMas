using System.Threading.Tasks;
using Application.Request;
using Application.Services;
using Application.Services.ProductoServices;
using Domain.Contracts;
using Domain.Entities.EntitiesProducto;
using Infrastructure;
using Microsoft.AspNetCore.Mvc;

namespace WebApi.Controllers {
	[Route ("api/[controller]")]
	[ApiController]
	public class ProductoController : ControllerBase {

		private readonly IUnitOfWork _unitOfWork;
		private readonly DulcesYmasContext _context;

		public ProductoController (DulcesYmasContext context, IUnitOfWork unitOfWork) {
			_context = context;
			_unitOfWork = unitOfWork;
		}

		[HttpPost ("")]
		public IActionResult Post (ProductoRequest productoRequest) {

			Response response = new ProductoCrearService (_unitOfWork).
			Crear (productoRequest);
			if (response.Data == null) {
				return BadRequest (response.Mensaje);
			}
			return Ok (response);
		}

		[HttpGet ("tipo/{tipo}")]
		public ActionResult<Response> GetProductosPorTipo (Tipo tipo) {
			return new ListarProductosPorTipo (this._unitOfWork).
			EstablecerTipo (tipo).Filtrar ();
		}

		[HttpGet ("{Id:int}")]
		public IActionResult GetProducto (int Id) {
			Response response = new ListarProductos (_unitOfWork).
			BuscarProducto (Id);
			if (response.Data == null) {
				return NotFound (response.Mensaje);
			}
			return Ok (response);
		}

		[HttpPost ("ProductoParaFabricar/Fabricacion")]
		public ActionResult<Response> PostFabricar (FabricacionRequest fabricacionRequest) {
			Response response = new FabricacionCrearService (_unitOfWork).
			IniciarFabricacion (fabricacionRequest);
			return Ok (response);
		}

		[HttpGet ("ProductoParaFabricar/{id}/Fabricacion")]
		public Response GetFabricaciones (int id) {
			Response response = new ListarProductos (this._unitOfWork).BuscarFabricaionesDeProducto (id);
			return response;
		}

		[HttpGet ("GetPaginados/{page:int}/{rows:int}")]
		public ActionResult<Response> GetProductosPaginados (int page, int rows) {
			return new ListarProductosPaginados (this._unitOfWork).GetProductos (page, rows);
		}

		[HttpGet]
		public ActionResult<Response> GetAll () {
			return new ListarProductos (this._unitOfWork).GetAllProductos ();
		}

	}
}