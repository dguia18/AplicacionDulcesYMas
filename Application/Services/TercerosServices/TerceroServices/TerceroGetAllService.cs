using Application.Request;
using Domain.Contracts;
using System.Collections.Generic;
using System.Linq;

namespace Application.Services.TercerosServices.TerceroServices
{
    public class TerceroGetAllService
    {
        protected readonly IUnitOfWork _unitOfWork;
        public TerceroGetAllService(IUnitOfWork unitOfWork)
        {
            this._unitOfWork = unitOfWork;
        }
        public IEnumerable<TerceroRequest> GetTerceros()
        {
            List<TerceroRequest> terceros = new List<TerceroRequest>();
            this._unitOfWork.TerceroRepository.GetAll().ToList().
               ForEach((tercero) =>
               {
                   terceros.Add(new TerceroRequest().Map(tercero));
               });
            return terceros;
        }
    }
}
