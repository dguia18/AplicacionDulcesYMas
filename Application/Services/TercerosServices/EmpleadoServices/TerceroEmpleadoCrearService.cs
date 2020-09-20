using System.Linq;
using System.Runtime.CompilerServices;
using Application.Request;
using Domain.Contracts;
using Domain.Entities.Tercero;

namespace Application.Services.TercerosServices.EmpleadoServices {
	public class TerceroEmpleadoCrearService {
		protected readonly IUnitOfWork _unitOfWork;
		public TerceroEmpleadoCrearService (IUnitOfWork unitOfWork) {
			this._unitOfWork = unitOfWork;
		}
		public Response Crear (TerceroEmpleadoRequest request) {
			TerceroEmpleado empleado = this._unitOfWork.TerceroEmpleadoRepository.
			FindBy (empleado => empleado.Tercero.Nit == request.NitTercero,
				includeProperties: "Tercero").FirstOrDefault ();
			if (empleado != null) {
				return new Response {
					Mensaje = $"No se pudo registrar el empleado porque ya esta en el sistema"
				};
			}

			Tercero tercero = this._unitOfWork.TerceroRepository.
			FindFirstOrDefault (tercero => tercero.Nit == request.NitTercero);
			if (tercero == null) {
				tercero = request.Tercero.UnMap ();
			}

			empleado = new TerceroEmpleado (tercero);
			this._unitOfWork.TerceroEmpleadoRepository.Add (empleado);
			this._unitOfWork.Commit ();
			return new Response {
				Mensaje = "Empleado registrado con éxito",
					Data = new TerceroEmpleadoRequest ().Map (empleado)
			};
		}
	}
}