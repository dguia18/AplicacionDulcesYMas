using Application.Request;
using Domain.Contracts;
using Domain.Entities.EntitiesProducto;
using Domain.Services;
using System;
using System.Linq;
using Domain.Factory.AbstractFactory;

namespace Application.Services.ProductoServices
{
    public class ProductoCrearService : ProductoService
    {
        public ProductoCrearService(IUnitOfWork unitOfWork) : base(unitOfWork)
        {
        }

        public override Response Crear(ProductoRequest request)
        {

            var errores = ProductoPuedeCrear.PuedeCrearProducto
                (request.CantidadProducto,
                request.CostoUnitarioProducto,request.PorcentajeDeUtilidadProducto);

            if (errores.Any())
                return new Response { Mensaje = String.Join(", ", errores) };

            ProductoSubCategoria subCategoria = BuscarSubCategoriaConId(request.IdSubCategoria);

            if (subCategoria == null)
            {
                return new Response
                {
                    Mensaje = "La subcategoria no fué encontrada"
                };
            }

            Producto producto = this._unitOfWork.ProductoRepository.
                FindFirstOrDefault(t => t.Nombre == request.NombreProducto);            

            if (producto != null)
                return new Response { Mensaje = "El producto ya existe" };
			try
			{
				producto = new CrearProductoFactory(request.Tipo).
                CrearProducto(request.Especificacion);
			}
			catch (InvalidOperationException e)
			{
                return new Response { Mensaje = e.Message };
			}
            
            
            producto.SetNombre(request.NombreProducto).SetCantidad(request.CantidadProducto).
                SetCostoUnitario(request.CostoUnitarioProducto).
                SetPorcentajeDeUtilidad(request.PorcentajeDeUtilidadProducto).
                SetUnidadDeMedida(request.UnidadDeMedidaProducto);
            

            this._unitOfWork.ProductoRepository.Add(producto);
            this._unitOfWork.Commit();
            return new Response
            {
                Mensaje = "Producto registrado con éxito",
                Data = new ProductoRequest().Map(producto)
            };
        }

    }
}
