using System.Collections.Generic;
using System.Linq;
using Application.Request;
using Domain.Contracts;
using Domain.Entities;

namespace Application.Services.CompraServices
{
	public class ListarComprasPaginadasService
	{
		private readonly IUnitOfWork _unitOfWork;
		private readonly ListarComprasService comprasService;
		public ListarComprasPaginadasService(IUnitOfWork unitOfWork)
		{
			this._unitOfWork = unitOfWork;
			this.comprasService = new ListarComprasService();
		}
		public List<CompraRequest> GetPaginados(PaginationRequest request)
		{
			var allCompras = this._unitOfWork.CompraRepository.GetAll();

			List<Compra> compras = allCompras
				.Skip(request.Page - 1)
				.Take(request.Rows).ToList();

			return this.comprasService.ConvertirComprasARequest(compras);
		}
	}
}