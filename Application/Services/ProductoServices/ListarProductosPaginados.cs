
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
        public Response GetProductos(int page, int rows)
        {
            List<Producto> productos = this._unitOfWork.ProductoRepository.GetAll()
                .Where(producto => this._unitOfWork.ProductoRepository.GetAll()
                .OrderBy(producto => producto.Id)
                .Select(producto => producto.Id)
                .Skip(page)
                .Take(rows)
                .Contains(producto.Id)).ToList();

            return new Response { Data = new ListarProductos().ConvertirProductosARequest(productos) };
        }
    }
}
