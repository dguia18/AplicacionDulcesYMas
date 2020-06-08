using Application.Request;
using Application.Services.ProductoServices.CategoriaServices;
using Domain.Contracts;
using Microsoft.AspNetCore.Mvc;

namespace WebApiAngular.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CategoriaController : ControllerBase
    {
        private readonly IUnitOfWork _unitOfWork;
        public CategoriaController(IUnitOfWork unitOfWork)
        {
            this._unitOfWork = unitOfWork;
        }
        [HttpPost]
        public ActionResult<Response> PostCategoria(ProductoCategoriaRequest request)
        {
            Response response = new ProductoCategoriaCrearService(this._unitOfWork).Crear(request);
            return Ok(response);
        }
        [HttpGet("")]
        public IActionResult GetCategorias()
        {
            Response response = new ListarCategoriasService(this._unitOfWork)
                .GetCategorias();
            if (response.Data == null)
            {
                return NotFound(response.Mensaje);
            }
            else
                return Ok(response);
        }
        [HttpPost("subCategoria")]
        public ActionResult<Response> AgregarSubCategoria(ProductoSubCategoriaRequest request)
        {
            Response response = new ProductoCategoriaAgregarSubCategoriaService(this._unitOfWork).
                Agregar(request);
            return Ok(response);
        }
        [HttpGet("subCategoria")]
        public ActionResult<Response> GetSubCategorias()
        {
            Response response = new ListarSubCategoriasService(this._unitOfWork).
                GetSubCategorias();
            return Ok(response);
        }
    }
}