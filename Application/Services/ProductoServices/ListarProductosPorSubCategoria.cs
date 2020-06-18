using System.Collections.Generic;
using System.Linq;
using Application.Request;
using Domain.Contracts;
using Domain.Entities.EntitiesProducto;
namespace Application.Services.ProductoServices
{
	public class ListarProductosPorSubCategoria
	{
		private readonly IUnitOfWork _unitOfWork;
		private readonly ListarProductos listarProductos;
		public ListarProductosPorSubCategoria(IUnitOfWork unitOfWork)
		{
			this._unitOfWork = unitOfWork;
			this.listarProductos = new ListarProductos();
		}
		public List<ProductoRequest> Get(int idSubCategoria)
		{
			var productos = this._unitOfWork.ProductoRepository
				.FindBy(x => x.SubCategoriaId == idSubCategoria).ToList();
			return this.listarProductos.ConvertirProductosARequest(productos);
		}
	}
}