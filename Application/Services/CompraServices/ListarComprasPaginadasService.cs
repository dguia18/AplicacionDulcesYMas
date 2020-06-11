using System.Collections.Generic;
using System.Linq;
using Application.Request;
using Domain.Contracts;
using Domain.Entities;

namespace Application.Services.CompraServices
{
	public class ListarComprasPaginadasService : ListarComprasService
	{
		private readonly IUnitOfWork _unitOfWork;
		public ListarComprasPaginadasService(IUnitOfWork unitOfWork) : base(unitOfWork)
		{
			this._unitOfWork = unitOfWork;
		}
		public List<CompraRequest> GetPaginados(PaginationRequest request)
		{
			var allCompras = this._unitOfWork.CompraRepository.GetAll();

			List<Compra> compras = allCompras
				.Skip(request.Page - 1)
				.Take(request.Rows).ToList();

			return ConvertirComprasARequest(compras);
		}
	}
}