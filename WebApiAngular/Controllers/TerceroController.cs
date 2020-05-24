using Application.Request;
using Application.Services;
using Application.Services.TercerosServices.EmpleadoServices;
using Application.Services.TercerosServices.ProveedorServices;
using Application.Services.TercerosServices.TerceroServices;
using Application.Services.TercerosServices.UsuarioServices;
using Domain.Contracts;
using Infrastructure;
using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;

namespace WebApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class TerceroController : ControllerBase
    {
        private readonly IUnitOfWork _unitOfWork;
        private readonly DulcesYmasContext _context;
        public TerceroController(DulcesYmasContext context, IUnitOfWork unitOfWork)
        {
            _context = context;
            _unitOfWork = unitOfWork;
        }
        // GET: api/Tercero
      
        [HttpPost("")]
        public ActionResult Post(TerceroRequest request)
        {
            var response = new TerceroCrearService(this._unitOfWork).CrearTercero(request);
            return Ok(response);
        }
        [HttpPost("usuario")]
        public ActionResult PostUsuario(TerceroUsuarioRequest request)
        {
            var response = new TerceroUsuarioCrearService(this._unitOfWork).Crear(request);
            return Ok(response);
        }
        [HttpPost("empleado")]
        public ActionResult PostEmpleado(TerceroEmpleadoRequest request)
        {
            var response = new TerceroEmpleadoCrearService(this._unitOfWork).Crear(request);
            return Ok(response);
        }
        [HttpGet("empleado/{id}")]
        public ActionResult GetEmpleado(int id)
        {
            var response = new TerceroEmpleadoBuscarService(this._unitOfWork).BuscarEmpleado(id);
            return Ok(response);
        }
        [HttpPost("provedor")]
        public ActionResult PostProvedor(TerceroProvedorRequest request)
        {
            var response = new TerceroProveedorCrearService(this._unitOfWork).Crear(request);
            return Ok(response);
        }
        [HttpGet("")]
        public IEnumerable<TerceroRequest> GetTerceros()
        {
            return new TerceroGetAllService(this._unitOfWork).GetTerceros();
        }
    }
}
