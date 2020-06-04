
using Application.Request;
using Domain.Contracts;
using Domain.Entities.Tercero;
using System.Collections.Generic;
using System.Linq;

namespace Application.Services.TercerosServices.EmpleadoServices
{
    public class ListarEmpleadosPaginadosService
    {
        private readonly IUnitOfWork _unitOfWork;
        public ListarEmpleadosPaginadosService(IUnitOfWork unitOfWork)
        {
            this._unitOfWork = unitOfWork;
        }
        public Response Get(PaginationRequest request)
        {
            var allProducts = this._unitOfWork.TerceroEmpleadoRepository
                .FindBy(includeProperties:"Tercero");

            List<TerceroEmpleado> terceros = allProducts
                .Where(tercero => tercero.Tercero.RazonSocial.Contains(request.TermSearch))
                .Skip(request.Page - 1)
                .Take(request.Rows).ToList();

            return new Response
            {
                Data = ConvertirTercerosARequest(terceros)
            };
        }
        private List<TerceroEmpleadoRequest> ConvertirTercerosARequest(List<TerceroEmpleado> terceros)
        {
            List<TerceroEmpleadoRequest> request = new List<TerceroEmpleadoRequest>();
            terceros.ForEach(x => request.Add(new TerceroEmpleadoRequest().Map(x)));
            return request;
        }
    }
}
