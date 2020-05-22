using Application;
using Application.Request;
using Application.Services;
using Application.Services.ProductoServices;
using Domain;
using Domain.Contracts;
using Domain.Entities.EntitiesProducto;
using Infrastructure;
using Microsoft.AspNetCore.Authorization;
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
        [Authorize]
        [HttpPost("MateriaPrima")]
        public ActionResult<Response> Post(ProductoRequest productoRequest)
        {
            Response response = new ProductoMateriaPrimaCrear(_unitOfWork).
                CrearProducto(productoRequest);
            return Ok(response);
        }
        [HttpGet]
        public ActionResult<Response> GetAll()
        {
            return new ListarProductos(this._unitOfWork).GetAllProductos();
        }
        [HttpGet("MateriaPrima")]
        public ActionResult<Response> GetMateriaPrima()
        {
            return new ListarProductosPorTipo(this._unitOfWork).
                EstablecerTipo(Tipo.MateriaPrima).Filtrar();
        }
    }
}
