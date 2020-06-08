
using Application.Request;
using Domain.Contracts;
using Domain.Entities.Tercero;

namespace Application.Services.TercerosServices.ClienteServices
{
    public class ActualizarTerceroClienteService
    {
        private readonly IUnitOfWork _unitOfWork;
        public ActualizarTerceroClienteService(IUnitOfWork unitOfWork)
        {
            this._unitOfWork = unitOfWork;
        }
        
    }
}
