
using Application.Request;
using Domain.Contracts;
using Domain.Entities.Tercero;
using System.Collections.Generic;
using System.Linq;

namespace Application.Services.TercerosServices.ProveedorServices
{
    public class ListarProveedoresPaginadosService
    {
        private readonly IUnitOfWork _unitOfWork;
        public ListarProveedoresPaginadosService(IUnitOfWork unitOfWork)
        {
            this._unitOfWork = unitOfWork;
        }
        public Response GetPaginados(PaginationRequest request)
        {
            var allProducts = this._unitOfWork.TerceroProvedorRepository
                            .FindBy(includeProperties: "Tercero");

            List<TerceroProveedor> terceros = allProducts
                .Where(tercero => tercero.Tercero.RazonSocial.Contains(request.TermSearch))
                .Skip(request.Page - 1)
                .Take(request.Rows).ToList();

            return new Response
            {
                Data = ConvertirProveedoresARequest(terceros)
            };
        }
        private List<TerceroProveedorRequest> ConvertirProveedoresARequest(List<TerceroProveedor> terceros)
        {
            List<TerceroProveedorRequest> request = new List<TerceroProveedorRequest>();
            terceros.ForEach(x => request.Add(new TerceroProveedorRequest().Map(x)));
            return request;
        }
    }
}
