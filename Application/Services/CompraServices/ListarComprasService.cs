
using Application.Request;
using Domain.Contracts;
using Domain.Entities;
using System.Collections.Generic;

namespace Application.Services.CompraServices
{
    public class ListarComprasService
    {
        private readonly IUnitOfWork _unitOfWork;
        public ListarComprasService(IUnitOfWork unitOfWork)
        {
            this._unitOfWork = unitOfWork;
        }
        public List<CompraRequest> ConvertirComprasARequest(List<Compra> compras)
        {
            var comprasRequest = new List<CompraRequest>();
            compras.ForEach(x => comprasRequest.Add(new CompraRequest().Map(x)));
            return comprasRequest;
        }   
    }
}
