
using Application.Request;
using Domain.Contracts;

namespace Application.Services.TercerosServices.ClienteServices
{
    public class TerceroClienteCrearService
    {
        private readonly IUnitOfWork _unitOfWork;
        public TerceroClienteCrearService(IUnitOfWork unitOfWork)
        {
            this._unitOfWork = unitOfWork;
        }
        public Response Crear()
    }
}
