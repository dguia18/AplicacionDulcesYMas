
using Application.Request;
using Domain.Contracts;
using Domain.Entities.EntitiesProducto;
using System.Collections.Generic;
using System.Linq;

namespace Application.Services.ProductoServices
{
	public class ListarProductosPaginados
	{
		private readonly IUnitOfWork _unitOfWork;
		public ListarProductosPaginados(IUnitOfWork unitOfWork)
		{
			this._unitOfWork = unitOfWork;
		}
		public Response GetProductos(int page, int rows, string termSearch = "")
		{
			var allProducts = this._unitOfWork.ProductoRepository.GetAll();

			List<Producto> productos = allProducts
				.Where(Producto => Producto.Nombre.Contains(termSearch))
				.Skip(page - 1)
				.Take(rows).ToList();

			return new Response
			{
				Data = new ListarProductos().ConvertirProductosARequest(productos)
			};
		}

	}
}
