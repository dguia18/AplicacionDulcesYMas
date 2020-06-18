using System.Collections.Generic;
using System.Linq;
using Application.Request;
using Domain.Contracts;
using Domain.Entities.EntitiesProducto;

namespace Application.Services.ProductoServices
{
	public class ListarProductosPorCategoria
	{
		private readonly IUnitOfWork unitOfWork;
		private readonly ListarProductos listarProductos;

		public ListarProductosPorCategoria(IUnitOfWork unitOfWork)
		{
			this.unitOfWork = unitOfWork;
			this.listarProductos = new ListarProductos(this.unitOfWork);
		}

		public List<ProductoRequest> Get(int id)
		{
			var categorias = this.unitOfWork.CategoriaRepository
				.FindBy(x => x.Id == id, includeProperties: "SubCategorias.Productos")
				.FirstOrDefault();

			var productos = new List<Producto>();
			categorias.SubCategorias.ForEach(sub => sub.Productos.ForEach(prod => productos.Add(prod)));

			return listarProductos.ConvertirProductosARequest(productos);
		}
	}
}