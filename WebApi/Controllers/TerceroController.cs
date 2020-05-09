using Application.Request;
using Application.Services;
using Domain.Contracts;
using Infrastructure;
using Microsoft.AspNetCore.Mvc;

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
            var response = new CrearTercero(this._unitOfWork).SaveTercero(request);
            return Ok(response);
        }
        [HttpPost("usuario")]
        public ActionResult PostUsuario(TerceroUsuarioRequest request)
        {
            var response = new CrearUsuario(this._unitOfWork).SaveUsuario(request);
            return Ok(response);
        }
        // PUT: api/Tercero/5
     
    }
}
