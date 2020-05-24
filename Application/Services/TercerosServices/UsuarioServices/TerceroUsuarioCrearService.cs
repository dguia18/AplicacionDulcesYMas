
using Application.Request;
using Domain.Contracts;
using Domain.Entities.Tercero;

namespace Application.Services.TercerosServices.UsuarioServices
{
    public class TerceroUsuarioCrearService 

    {
        private readonly IUnitOfWork _unitOfWork;
        public TerceroUsuarioCrearService(IUnitOfWork unitOfWork)
        {
            this._unitOfWork = unitOfWork;
        }
        public Response Crear(TerceroUsuarioRequest request)
        {
            Tercero tercero = this._unitOfWork.TerceroRepository.
                FindFirstOrDefault(tercero => tercero.Nit == request.NitTercero);
            if (tercero == null)
            {
                return new Response { Mensaje = $"El nit {request.NitTercero} no se encuentra registrado" };
            }
            var usuario = new TerceroUsuarioValidarService(this._unitOfWork).ValidarTerceroUsuario(request);
            if (usuario != null)
            {
                return new Response { Mensaje = "Usuario ya se encuentra registrado" };
            }
            TerceroUsuario terceroUsuario = new TerceroUsuario(tercero);
            terceroUsuario.Password = request.PasswordTercero;
            terceroUsuario.Usuario = request.UsuarioTercero;
            this._unitOfWork.TerceroUsuarioRepository.Add(terceroUsuario);
            this._unitOfWork.Commit();
            return new Response
            {
                Mensaje = "Usuario registrado con éxito",
                Data = request.Map(terceroUsuario)
            };

        }
    }
}
