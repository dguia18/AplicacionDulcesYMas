using Application.Base;
using Application.Request;
using Application.Services;
using Domain;
using Domain.Contracts;
using System;

namespace Application
{
    public abstract class ProductoService
    {
        protected IUnitOfWork _unitOfWork;
        protected ProductoService(IUnitOfWork unitOfWork)
        {
            this._unitOfWork = unitOfWork;
        }
        public abstract Response CrearProducto(ProductoRequest productoRequest);
    }
    public class CrearProductoMateriaPrima : ProductoService
    {        
        public CrearProductoMateriaPrima(IUnitOfWork unitOfWork):base(unitOfWork)
        {
            
        }        

        public override Response CrearProducto(ProductoRequest productoRequest)
        {
            Producto producto = this._unitOfWork.ProductoRepository.find
        }
    }
}
