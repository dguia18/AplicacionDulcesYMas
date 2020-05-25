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

		[HttpPost ("MateriaPrima")]
		public ActionResult<Response> Post (ProductoRequest productoRequest) {
			Response response = new ProductoMateriaPrimaCrear (_unitOfWork).
			Crear (productoRequest);
			return Ok (response);
		}

		[HttpGet ("MateriaPrima")]
		public ActionResult<Response> GetMateriasPrima () {
			return new ListarProductosPorTipo (this._unitOfWork).
			EstablecerTipo (Tipo.MateriaPrima).Filtrar ();
		}

		[HttpGet ("{Id}")]
		public ActionResult<Response> GetProducto (int Id) {
			Response response = new ListarProductos (_unitOfWork).
			BuscarProducto (Id);
			return Ok (response);
		}

		[HttpPost ("ProductoParaFabricar")]
		public ActionResult<Response> PostProductoParaFabricar (ProductoRequest productoRequest) {
			Response response = new ProductoParaFabricarCrearService (_unitOfWork).
			Crear (productoRequest);
			return Ok (response);
		}

		[HttpGet ("ProductoParaFabricar")]
		public ActionResult<Response> GetProductosParaFabricar () {
			return new ListarProductosPorTipo(this._unitOfWork).
			EstablecerTipo(Tipo.ParaFabricar).Filtrar();
		}

		[HttpPost ("ProductoParaFabricar/Fabricacion")]
		public ActionResult<Response> PostFabricar (FabricacionRequest fabricacionRequest) {
			Response response = new FabricacionCrearService (_unitOfWork).
			IniciarFabricacion (fabricacionRequest);
			return Ok (response);
		}
		[HttpGet("ProductoParaFabricar/{id}/Fabricacion")]
		public Response GetFabricaciones(int id)
		{
			Response response = new ListarProductos(this._unitOfWork).BuscarFabricaionesDeProducto(id);
			return response;
		}
		[HttpPost ("ProductoParaVender")]
		public ActionResult<Response> PostProductoParaVender (ProductoRequest productoRequest) {
			Response response = new ProductoParaVenderCrearService (_unitOfWork).
			Crear (productoRequest);
			return Ok (response);
		}

		[HttpGet("ProductoParaVender")]
		public ActionResult<Response> GetProductosParaVender()
		{
			return new ListarProductosPorTipo(this._unitOfWork).
			EstablecerTipo(Tipo.ParaVender).Filtrar();
		}


		[HttpGet]
		public ActionResult<Response> GetAll () {
			return new ListarProductos (this._unitOfWork).GetAllProductos ();
		}

	}
}