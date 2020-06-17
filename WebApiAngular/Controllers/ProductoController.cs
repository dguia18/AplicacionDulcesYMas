using System.Threading.Tasks;
using Application.Request;
using Application.Services;
using Application.Services.ProductoServices;
using Domain.Contracts;
using Domain.Entities.EntitiesProducto;
using Infrastructure;
using Microsoft.AspNetCore.Mvc;

namespace WebApi.Controllers
{
	[Route("api/[controller]")]
	[ApiController]
	public class ProductoController : ControllerBase
	{

		private readonly IUnitOfWork _unitOfWork;
		private readonly DulcesYmasContext _context;

		public ProductoController(DulcesYmasContext context, IUnitOfWork unitOfWork)
		{
			_context = context;
			_unitOfWork = unitOfWork;
		}

		[HttpPost("")]
		public IActionResult Post(ProductoRequest productoRequest)
		{

			Response response = new ProductoCrearService(_unitOfWork).
			Crear(productoRequest);
			if (response.Data == null)
			{
				return BadRequest(response.Mensaje);
			}
			return Ok(response);
		}

		[HttpGet("tipo/{tipo}")]
		public IActionResult GetProductosPorTipo(Tipo tipo)
		{
			Response response = new ListarProductosPorTipo(this._unitOfWork).
			EstablecerTipo(tipo).Filtrar();
			if (response.Data == null)
				return NotFound(response.Mensaje);
			return Ok(response);
		}

		[HttpGet("categoria/{id:int}")]
		public IActionResult GetProductosPorCategoria(int id)
		{
			var response = new ListarProductosPorCategoria(this._unitOfWork).
			Get(id);
			if (response.Count == 0)
				return NotFound("No se encontraron productos para mostrar");
			return Ok(response);
		}

		[HttpGet("subcategoria/{id:int}")]
		public IActionResult GetProductosPorSubCategoria(int id)
		{
			var response = new ListarProductosPorSubCategoria(this._unitOfWork).
			Get(id);
			if (response.Count == 0)
				return NotFound("No se encontraron productos para mostrar");
			return Ok(response);
		}



		[HttpGet("{Id:int}")]
		public IActionResult GetProducto(int Id)
		{
			Response response = new ListarProductos(_unitOfWork).
			BuscarProducto(Id);
			if (response.Data == null)
			{
				return NotFound(response.Mensaje);
			}
			return Ok(response);
		}

		[HttpPost("ProductoParaFabricar/Fabricacion")]
		public ActionResult<Response> PostFabricar(FabricacionRequest fabricacionRequest)
		{
			Response response = new FabricacionCrearService(_unitOfWork).
			IniciarFabricacion(fabricacionRequest);
			return Ok(response);
		}

		[HttpGet("ProductoParaFabricar/{id}/fabricaciones")]
		public Response GetFabricaciones(int id)
		{
			Response response = new ListarProductos(this._unitOfWork).BuscarFabricaionesDeProducto(id);
			return response;
		}

		[HttpPost("GetPaginados")]
		public ActionResult<Response> GetProductosPaginados(PaginationRequest request)
		{
			return new ListarProductosPaginados(this._unitOfWork)
				.GetProductos(request.Page, request.Rows, request.TermSearch);
		}

		[HttpGet]
		public ActionResult<Response> GetAll()
		{
			return new ListarProductos(this._unitOfWork).GetAllProductos();
		}

	}
}