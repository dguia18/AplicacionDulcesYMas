using Application.Request;
using Domain.Contracts;
using Domain.Entities.Producto;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Application.Services.ProductoServices
{
    public class ProductoParaFabricarCrearService : ProductoService
    {
        public ProductoParaFabricarCrearService(IUnitOfWork unitOfWork) : base(unitOfWork)
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

            if (request.Contestura == Contestura.Duro)
            {
                producto = new ProductoParaFabricarDuro(request.NombreProducto,
                request.CantidadProducto, request.CostoUnitarioProducto);
            }
            else
            {
                producto = new ProductoParaFabricarSuave(request.NombreProducto,
                request.CantidadProducto, request.CostoUnitarioProducto);
            }

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
