using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Application.Request;
using Application.Services;
using Domain.Contracts;
using Infrastructure.Base;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace WebApiAngular.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CompraController : ControllerBase
    {
        private readonly IUnitOfWork _unitOfWork;
        private readonly IDbContext _dbContext;
        public CompraController(IUnitOfWork unitOfWork, IDbContext dbContext)
        {
            this._dbContext = dbContext;
            this._unitOfWork = unitOfWork;
        }
        [HttpPost("")]
        public ActionResult<Response> HacerCompra(CompraRequest request)
        {
            Response response = new CompraService(_unitOfWork).HacerCompraService(request);
            return Ok(response);
        } 
    }
}