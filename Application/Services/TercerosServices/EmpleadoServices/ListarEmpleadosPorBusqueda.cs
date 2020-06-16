using System.Collections.Generic;
using System.Linq;
using Application.Request;
using Domain.Contracts;
using Domain.Entities.Tercero;
namespace Application.Services.TercerosServices.EmpleadoServices
{
	public class ListarEmpleadosPorBusqueda
	{
		private readonly IUnitOfWork _unitOfWork;
		private ListarEmpleados _listarEmpleados;
		public ListarEmpleadosPorBusqueda(IUnitOfWork unitOfWork)
		{
			this._unitOfWork = unitOfWork;
			this._listarEmpleados = new ListarEmpleados();
		}
		public List<TerceroEmpleadoRequest> GetList(string search)
		{
			IQueryable<TerceroEmpleado> empleados = this._unitOfWork
			.TerceroEmpleadoRepository
				.FindBy(includeProperties: "Tercero");

			empleados = empleados.Where(x => x.Tercero.RazonSocial.Contains(search));
			return this._listarEmpleados
				.ConvertirTercerosEmpleadosARequest(empleados.ToList());
		}
	}
}