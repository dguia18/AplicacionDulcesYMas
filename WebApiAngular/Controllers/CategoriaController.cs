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
        public ActionResult<Response> CrearCategoria(ProductoCategoriaRequest request)
        {
            Response response = new ProductoCategoriaCrearService(this._unitOfWork).Crear(request);
            return Ok(response);
        }
        [HttpPost("subCategoria")]
        public ActionResult<Response> AgregarSubCategoria(ProductoSubCategoriaRequest request)
        {
            Response response = new ProductoCategoriaAgregarSubCategoriaService(this._unitOfWork).
                Agregar(request);
            return Ok(response);
        }
    }
}