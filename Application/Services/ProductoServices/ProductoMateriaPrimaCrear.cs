using Application.Request;
using Domain.Contracts;
using Domain.Entities.Producto;
using System;
using System.Linq;

namespace Application.Services.ProductoServices
{
    public class ProductoMateriaPrimaCrear : ProductoService
    {
        public ProductoMateriaPrimaCrear(IUnitOfWork unitOfWork) : base(unitOfWork)
        {
        }

        public override Response CrearProducto(ProductoRequest request)
        {

            var errores = ProductoPuedeCrear.PuedeCrearProducto
                (request.CantidadProducto,
                request.CostoUnitarioProducto);

            if (errores.Any())
                return new Response { Mensaje = String.Join(", ", errores) };

            Producto producto = this._unitOfWork.ProductoRepository.
                FindFirstOrDefault(t => t.Nombre == request.NombreProducto);

            if (producto != null)
                return new Response { Mensaje = "El producto ya existe" };

            producto = new ProductoMateriaPrima(request.NombreProducto,
                request.CantidadProducto, request.CostoUnitarioProducto,
                request.UnidadDeMedidaProducto);

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
