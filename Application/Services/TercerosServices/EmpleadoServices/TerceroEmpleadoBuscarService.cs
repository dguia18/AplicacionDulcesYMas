
using Application.Request;
using Domain.Contracts;
using Domain.Entities.Tercero;
using System.Linq;

namespace Application.Services.TercerosServices.EmpleadoServices
{
    public class TerceroEmpleadoBuscarService
    {
        private readonly IUnitOfWork unitOfWork;
        public TerceroEmpleadoBuscarService(IUnitOfWork unitOfWork)
        {
            this.unitOfWork = unitOfWork;
        }
        public Response BuscarEmpleado(int id)
        {
            TerceroEmpleado empleado = this.unitOfWork.TerceroEmpleadoRepository.
                FindBy(empleado => empleado.Id == id, includeProperties: "Tercero.Contactos")
				.FirstOrDefault();

            if (empleado == null)
            {
                return new Response
                {
                    Mensaje = "No se encontró al empleado"
                };
            }
            return new Response
            {
                Data = new TerceroEmpleadoRequest().Map(empleado)
            };
        }
    }
}
