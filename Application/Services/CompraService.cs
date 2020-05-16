using Application.Request;
using Domain.Contracts;
using Domain.Entities;
using System;
using System.Collections.Generic;
using System.Text;

namespace Application.Services
{
    public class CompraService
    {
        private readonly IUnitOfWork _unitOfWork;
        public CompraService(IUnitOfWork unitOfWork)
        {
            this._unitOfWork = unitOfWork;
        }
        //public Response CrearCompraService(CompraRequest request)
        //{
        //    TerceroProvedor proveedor = this._unitOfWork. 
        //}
    }
}
