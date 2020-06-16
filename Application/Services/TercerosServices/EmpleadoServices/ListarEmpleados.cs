using System.Collections.Generic;
using System.Linq;
using Application.Request;
using Domain.Contracts;
using Domain.Entities.Tercero;
namespace Application.Services.TercerosServices.EmpleadoServices
{
	public class ListarEmpleados
	{
		private readonly IUnitOfWork _unitOfWork;
		public ListarEmpleados(IUnitOfWork unitOfWork)
		{
			this._unitOfWork = unitOfWork;
		}
		public ListarEmpleados()
		{

		}
		public Response Get()
		{
			var empleados = this._unitOfWork.TerceroEmpleadoRepository
				.FindBy(includeProperties: "Tercero").ToList();

			if (!empleados.Any())
			{
				return new Response { Mensaje = "No hay empleados para mostrar" };
			}
			return new Response { Data = ConvertirTercerosEmpleadosARequest(empleados) };
		}
		public List<TerceroEmpleadoRequest> ConvertirTercerosEmpleadosARequest(List<TerceroEmpleado> terceros)
		{
			List<TerceroEmpleadoRequest> request = new List<TerceroEmpleadoRequest>();
			terceros.ForEach(x => request.Add(new TerceroEmpleadoRequest().Map(x)));
			return request;
		}
	}
}