
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

            Role role = this._unitOfWork.RoleRepository.
                FindFirstOrDefault(role => role.Nombre == request.Role.Nombre);

            if (role == null)
            {
                return new Response
                {
                    Mensaje = $"El role {request.Role.Nombre} que le desea" +
                    $"asignar al usuario no esta disponible"
                };
            }

            TerceroUsuario terceroUsuario = new TerceroUsuario.TerceroUsuarioBuilder(tercero).
                SetPassword(request.PasswordTercero).SetUsuario(request.UsuarioTercero).
                SetRol(role).Build();

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
