using Application.Base;
using Application.Request;
using Application.Services;
using Domain;
using Domain.Contracts;
using Domain.Entities;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;

namespace Application
{
    public abstract class ProductoService
    {
        protected IUnitOfWork _unitOfWork;
        protected ProductoService(IUnitOfWork unitOfWork)
        {
            this._unitOfWork = unitOfWork;
        }  
        
    }
    public class CrearProductoMateriaPrima : ProductoService
    {        
        public CrearProductoMateriaPrima(IUnitOfWork unitOfWork):base(unitOfWork)
        {            
        }        

        public Response CrearProducto(ProductoRequest productoRequest)
        {
            Producto producto = this._unitOfWork.ProductoRepository.
                FindFirstOrDefault(t => t.Nombre == productoRequest.NombreProducto);

            if(producto != null)         
                return new Response { Mensaje = "El producto ya existe" };
            
            var errores = ProductoPuedeCrear.PuedeCrearProducto
                (productoRequest.CantidadProducto,
                productoRequest.CostoUnitarioProducto);

            if (errores.Any())
                return new Response { Mensaje = String.Join(", ", errores) };

            producto = new ProductoMateriaPrima(productoRequest.NombreProducto,
                productoRequest.CantidadProducto, productoRequest.CostoUnitarioProducto,
                productoRequest.UnidadDeMedidaProducto);

            this._unitOfWork.ProductoRepository.Add(producto);
            this._unitOfWork.Commit();
            return new Response { 
                Mensaje = "Producto registrado con exito",
                Data = new ProductoRequest().Map(producto)
            };
        }
        
    }
    public class ListarProductos : ProductoService
    {
        public ListarProductos(IUnitOfWork unitOfWork) : base(unitOfWork)
        {
        }
        public Response GetProductos()
        {
            List<ProductoRequest> productoRequests = new List<ProductoRequest>();
            this._unitOfWork.ProductoRepository.
                FindBy().
                ToList().
                ForEach(x =>
                {
                    productoRequests.Add(new ProductoRequest().Map(x));
                });
            Response productoResponse = new Response();
            productoResponse.Data = productoRequests;
            return productoResponse;
        }
    }
}
