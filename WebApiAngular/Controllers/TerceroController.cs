using Application.Request;
using Application.Services;
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
            var response = new TerceroCrear(this._unitOfWork).CrearTercero(request);
            return Ok(response);
        }
        [HttpPost("usuario")]
        public ActionResult PostUsuario(TerceroUsuarioRequest request)
        {
            var response = new CrearUsuario(this._unitOfWork).SaveUsuario(request);
            return Ok(response);
        }
        [HttpPost("empleado")]
        public ActionResult PostEmpleado(TerceroEmpleadoRequest request)
        {
            var response = new TerceroEmpleadoCrear(this._unitOfWork).Crear(request);
            return Ok(response);
        }
        [HttpGet("empleado/{id}")]
        public ActionResult GetEmpleado(int id)
        {
            var response = new ListarTerceroEmpleado(this._unitOfWork).BuscarEmpleado(id);
            return Ok(response);
        }
        [HttpPost("provedor")]
        public ActionResult PostProvedor(TerceroProvedorRequest request)
        {
            var response = new TerceroProvedorService(this._unitOfWork).CrearTerceroProveedor(request);
            return Ok(response);
        }
        [HttpGet("")]
        public IEnumerable<TerceroRequest> GetTerceros()
        {
            return new BuscarTercero(this._unitOfWork).GetTerceros();
        }
    }
}
