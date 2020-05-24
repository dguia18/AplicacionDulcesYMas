
using Application.Request;
using Domain.Contracts;
using Domain.Entities.Tercero;
using System.Linq;

namespace Application.Services.TercerosServices.EmpleadoServices
{
    public class TerceroEmpleadoCrearService
    {
        protected readonly IUnitOfWork _unitOfWork;
        public TerceroEmpleadoCrearService(IUnitOfWork unitOfWork)
        {
            this._unitOfWork = unitOfWork;
        }
        public Response Crear(TerceroEmpleadoRequest request)
        {
            Tercero tercero = this._unitOfWork.TerceroRepository.
                FindFirstOrDefault(tercero => tercero.Nit == request.NitTercero);
            if (tercero == null)
            {
                return new Response
                {
                    Mensaje = $"La identificación {request.NitTercero}," +
                    $" no se encuentra registrada hasta el momento"
                };
            }
            TerceroEmpleado empleado = this._unitOfWork.TerceroEmpleadoRepository.
                FindBy(empleado => empleado.Tercero.Nit == request.NitTercero,
                includeProperties: "Tercero").FirstOrDefault();
            if (empleado != null)
            {
                return new Response
                {
                    Mensaje = $"No se pudo registrar el empleado porque ya esta en el sistema"
                };
            }
            empleado = new TerceroEmpleado(tercero);
            this._unitOfWork.TerceroEmpleadoRepository.Add(empleado);
            this._unitOfWork.Commit();
            return new Response
            {
                Mensaje = "Empleado registrado con éxito",
                Data = new TerceroEmpleadoRequest().Map(empleado)
            };
        }
    }
}
