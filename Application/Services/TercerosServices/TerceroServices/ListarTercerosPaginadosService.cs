
using Application.Request;
using Domain.Contracts;
using Domain.Entities.Tercero;
using System.Collections.Generic;
using System.Linq;

namespace Application.Services.TercerosServices.TerceroServices
{
    public class ListarTercerosPaginadosService
    {
        private readonly IUnitOfWork _unitOfWork;
        public ListarTercerosPaginadosService(IUnitOfWork unitOfWork)
        {
            this._unitOfWork = unitOfWork;
        }
        public Response Get(PaginationRequest request)
        {
            var allProducts = this._unitOfWork.TerceroRepository.GetAll();

            List<Tercero> terceros = allProducts
                .Where(tercero => tercero.RazonSocial.Contains(request.TermSearch))
                .Skip(request.Page - 1)
                .Take(request.Rows).ToList();

            return new Response
            {
                Data = ConvertirTercerosARequest(terceros)
            };
        }
        private List<TerceroRequest> ConvertirTercerosARequest(List<Tercero> terceros)
        {
            List<TerceroRequest> request = new List<TerceroRequest>();
            terceros.ForEach(x => request.Add(new TerceroRequest().Map(x)));
            return request;
        }
    }
}
