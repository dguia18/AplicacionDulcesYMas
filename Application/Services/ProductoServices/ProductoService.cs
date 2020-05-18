using Application.Request;
using Domain.Contracts;
using Domain.Entities.Producto;
using Domain.Repositories;
using System.Collections.Generic;
using System.Text;

namespace Application.Services.ProductoServices
{
    public abstract class ProductoService
    {
        protected IUnitOfWork _unitOfWork;
        protected ProductoService(IUnitOfWork unitOfWork)
        {
            this._unitOfWork = unitOfWork;
        }
        protected IEnumerable<Producto> GetProductos()
        {
            return _unitOfWork.ProductoRepository.FindBy();
        }
        protected ProductoRequest Map(Producto producto)
        {
            ProductoRequest request = new ProductoRequest();
            return request.Map(producto);
        }
        public abstract Response CrearProducto(ProductoRequest request);
    }
}
