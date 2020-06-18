using System.Collections.Generic;
using System.Linq;
using Application.Request;
using Application.Services.ProductoServices.CategoriaServices;
using Domain.Contracts;
using Domain.Entities.EntitiesProducto;

namespace Application.Services.ProductoServices
{
	public class ListarProductos

	{
		protected readonly IUnitOfWork _unitOfWork;
		public ListarProductos(IUnitOfWork unitOfWork)
		{
			this._unitOfWork = unitOfWork;
		}
		public ListarProductos()
		{

		}
		public List<ProductoRequest> ConvertirProductosARequest(List<Producto> productos)
		{
			List<ProductoRequest> request = new List<ProductoRequest>();
			productos.ForEach(x => request.Add(new ProductoRequest().Map(x)));
			return request;
		}

		public Response GetAllProductos()
		{
			Response productoResponse = new Response();
			productoResponse.Data = ConvertirProductosARequest(
				this._unitOfWork.ProductoRepository.GetAll().ToList());
			return productoResponse;
		}
		public Response BuscarProducto(int id)
		{
			Producto producto = this._unitOfWork.ProductoRepository.
			FindBy(producto => producto.Id == id,
			includeProperties: "SubCategoria")
			.FirstOrDefault();

			if (producto == null)
			{
				return new Response { Mensaje = $"El producto con Id {id}, no fue encontrado" };
			}
			ProductoSubCategoria subCategoria = new ListarSubCategoriasService(this._unitOfWork)
				.BuscarSubCategoriaConId(producto.SubCategoriaId);
			subCategoria.Productos = null;
			producto.SubCategoria = subCategoria;

			return new Response
			{
				Data = new ProductoRequest().Map(producto)
			};
		}
		public Response BuscarFabricaionesDeProducto(int id)
		{
			Producto producto = this._unitOfWork.ProductoRepository.
			FindBy(producto => producto.Id == id,
				includeProperties: "Fabricaciones.TerceroEmpleado.Tercero").
			FirstOrDefault();
			if (producto == null)
			{
				return new Response { Mensaje = $"El producto con Id {id}, no fue encontrado" };
			}

			if (producto.Especificacion == Especificacion.MateriaPrima)
			{
				return new Response
				{
					Mensaje = $"El producto {producto.Nombre} no tiene " +
						$"fabricaiones porque no se puede fabricar"
				};
			}
			return new Response
			{
				Data = new ProductoRequest().Map(producto).Fabricaciones
			};
		}
	}
}