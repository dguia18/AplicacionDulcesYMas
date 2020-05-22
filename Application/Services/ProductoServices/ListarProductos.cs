using Application.Request;
using Domain.Contracts;
using Domain.Entities.EntitiesProducto;
using System.Collections.Generic;
using System.Linq;

namespace Application.Services.ProductoServices
{
    public class ListarProductos

    {
        protected readonly IUnitOfWork _unitOfWork;
        public ListarProductos(IUnitOfWork unitOfWork)
        {
            this._unitOfWork = unitOfWork;
        }
        protected List<ProductoRequest> ConvertirProductoARequest(List<Producto> productos)
        {
            List<ProductoRequest> request = new List<ProductoRequest>();
            productos.ForEach(x => request.Add(new ProductoRequest().Map(x)));
            return request;
        }

        public Response GetAllProductos()
        {
            Response productoResponse = new Response();
            productoResponse.Data = ConvertirProductoARequest(
                this._unitOfWork.ProductoRepository.GetAll().ToList());
            return productoResponse;
        }
        public Response BuscarProducto(int id)
        {
            Producto producto = this._unitOfWork.ProductoRepository.
                FindFirstOrDefault(producto => producto.Id == id);
            if (producto == null)
            {
                return new Response { Mensaje = $"El producto con Id {id}, no fue encontrado" };
            }
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
                Data = new ProductoRequest().Map(producto)
            };
        }
    }
}
