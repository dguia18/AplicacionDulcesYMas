
using Application.Request;
using Domain.Contracts;
using Domain.Entities.Tercero;

namespace Application.Services.TercerosServices.UsuarioServices
{
    public class RoleCrearService
    {
        private readonly IUnitOfWork _unitOfWork;
        public RoleCrearService(IUnitOfWork unitOfWork)
        {
            this._unitOfWork = unitOfWork;
        }
        public Response Crear(RoleRequest request)
        {
            Role role = this._unitOfWork.RoleRepository.
                FindFirstOrDefault(role => role.Nombre == request.Nombre);

            if (role != null)
            {
                return new Response { Mensaje = "El role ya se encuentra registrado" };
            }
            role = new Role();
            role.Nombre = request.Nombre;
            this._unitOfWork.RoleRepository.Add(role);
            this._unitOfWork.Commit();

            return new Response { Mensaje = "El Role se ha registrado con éxito" };
        }
    }
}
