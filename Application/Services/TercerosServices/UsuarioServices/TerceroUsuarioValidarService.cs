
using Application.Request;
using Domain.Contracts;
using Domain.Entities.Tercero;
using System.Linq;

namespace Application.Services.TercerosServices.UsuarioServices
{
    public class TerceroUsuarioValidarService 
    {
        private readonly IUnitOfWork _unitOfWork;
        public TerceroUsuarioValidarService(IUnitOfWork unitOfWork)
        {
            this._unitOfWork = unitOfWork;
        }

        public TerceroUsuario ValidarTerceroUsuario(TerceroUsuarioRequest request)
        {
            return this._unitOfWork.TerceroUsuarioRepository.
                FindBy(usuario => request.UsuarioTercero == usuario.Usuario &&
                usuario.Password == request.PasswordTercero, includeProperties: "Tercero").FirstOrDefault();
        }
    }
}
