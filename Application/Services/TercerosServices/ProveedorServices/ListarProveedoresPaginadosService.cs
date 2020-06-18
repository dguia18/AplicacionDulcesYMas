using System.Collections.Generic;
using System.Linq;
using Application.Request;
using Domain.Contracts;
using Domain.Entities.Tercero;

namespace Application.Services.TercerosServices.ProveedorServices
{
	public class ListarProveedoresPaginadosService
	{
		private readonly IUnitOfWork _unitOfWork;
		private readonly ListarProveedores _listar;
		public ListarProveedoresPaginadosService(IUnitOfWork unitOfWork)
		{
			this._unitOfWork = unitOfWork;
			this._listar = new ListarProveedores();
		}
		public Response GetPaginados(PaginationRequest request)
		{
			var allProducts = this._unitOfWork.TerceroProvedorRepository
				.FindBy(includeProperties: "Tercero");

			List<TerceroProveedor> terceros = allProducts
				.Where(tercero => tercero.Tercero.RazonSocial.Contains(request.TermSearch))
				.Skip(request.Page - 1)
				.Take(request.Rows).ToList();

			return new Response
			{
				Data = this._listar.ConvertirProveedoresARequest(terceros)
			};
		}

	}
}