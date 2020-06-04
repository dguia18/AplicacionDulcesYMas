
using Application.Request;
using Application.Services.TercerosServices.Contracts;
using Domain.Contracts;
using Domain.Entities.Tercero;
using System.Collections.Generic;
using System.Linq;

namespace Application.Services.TercerosServices.ClienteServices
{
    public class ListarClientesPaginadosService : IGetPaginados
    {
        private readonly IUnitOfWork _unitOfWork;
        public ListarClientesPaginadosService(IUnitOfWork unitOfWork)
        {
            this._unitOfWork = unitOfWork;
        }
        public Response GetPaginados(PaginationRequest request)
        {
            var allProducts = this._unitOfWork.TerceroClienteRepository
                            .FindBy(includeProperties: "Tercero");

            List<TerceroCliente> terceros = allProducts
                .Where(tercero => tercero.Tercero.RazonSocial.Contains(request.TermSearch))
                .Skip(request.Page - 1)
                .Take(request.Rows).ToList();

            return new Response
            {
                Data = ConvertirProveedoresARequest(terceros)
            };
        }
        private List<TerceroClienteRequest> ConvertirProveedoresARequest(List<TerceroCliente> terceros)
        {
            List<TerceroClienteRequest> request = new List<TerceroClienteRequest>();
            terceros.ForEach(x => request.Add(new TerceroClienteRequest().Map(x)));
            return request;
        }
    }
}
