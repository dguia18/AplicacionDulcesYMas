using Application.Request;
using Domain.Contracts;
using Domain.Entities.EntitiesProducto;
using System.Collections.Generic;
using System.Linq;

namespace Application.Services.ProductoServices
{
	public class ListarProductosPorCategoria : ListarProductos
	{
		private readonly IUnitOfWork unitOfWork;

		public ListarProductosPorCategoria(IUnitOfWork unitOfWork)
		{
			this.unitOfWork = unitOfWork;
		}

		public List<ProductoRequest> Get(int id)
		{
			var categorias = this.unitOfWork.CategoriaRepository
				.FindBy(x => x.Id == id, includeProperties: "SubCategorias.Productos").ToList()
				.FirstOrDefault();

			var productos = new List<Producto>();
			categorias.SubCategorias.ForEach(sub => sub.Productos.ForEach(prod => productos.Add(prod)));

			return ConvertirProductosARequest(productos);
		}
	}
}
