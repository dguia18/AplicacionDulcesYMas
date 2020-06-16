using System.Collections.Generic;
using System.Linq;
using Application.Request;
using Domain.Contracts;
using Domain.Entities.Tercero;

namespace Application.Services.TercerosServices.EmpleadoServices
{
	public class ListarEmpleadosPaginadosService
	{
		private readonly IUnitOfWork _unitOfWork;
		private ListarEmpleados listarEmpleados;
		public ListarEmpleadosPaginadosService(IUnitOfWork unitOfWork)
		{
			this._unitOfWork = unitOfWork;
			this.listarEmpleados = new ListarEmpleados();
		}
		public Response Get(PaginationRequest request)
		{
			var allProducts = this._unitOfWork.TerceroEmpleadoRepository
				.FindBy(includeProperties: "Tercero");

			List<TerceroEmpleado> terceros = allProducts
				.Where(tercero => tercero.Tercero.RazonSocial.Contains(request.TermSearch))
				.Skip(request.Page - 1)
				.Take(request.Rows).ToList();

			return new Response
			{
				Data = this.listarEmpleados.ConvertirTercerosEmpleadosARequest(terceros)
			};
		}
	}
}