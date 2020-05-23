using Application.Request;
using Domain.Contracts;
using Domain.Entities;
using Domain.Entities.EntitiesProducto;
using Domain.Entities.Tercero;
using System.Collections.Generic;
using System.Linq;

namespace Application.Services
{
    public class CompraService
    {
        private readonly IUnitOfWork _unitOfWork;
        public CompraService(IUnitOfWork unitOfWork)
        {
            this._unitOfWork = unitOfWork;
        }
        public Response HacerCompraService(CompraRequest request)
        {
            TerceroProveedor proveedor = this._unitOfWork.TerceroProvedorRepository.
                FindBy(provedor => provedor.Tercero.Nit == request.NitProvedor,
                includeProperties: "Tercero").FirstOrDefault();

            if (proveedor == null)
            {
                return new Response
                {
                    Mensaje = $"El provedor con identificación {request.NitProvedor}" +
                    $" no fue encontrado en el sistema, agréguelo antes"
                };
            }
            TerceroUsuario usuario = this._unitOfWork.TerceroUsuarioRepository.
                FindFirstOrDefault(usuario => usuario.Usuario == request.Usuario);
                
            
            if (usuario == null)
            {
                return new Response
                {
                    Mensaje = $"El usuario {request.Usuario}" +
                    $" no fue encontrado en el sistema, agréguelo antes"
                };
            }
            var errores = PuedeRegistrarDetalles(request.Detalles);
            if (errores.Any())
            {
                return new Response
                {
                    Mensaje = string.Join(", ", errores)
                };
            }
            Compra compra = new Compra.CompraBuilder(proveedor, usuario).Build();
            request.Detalles.ForEach((detalle) =>
            {
                Producto producto = this._unitOfWork.ProductoRepository.
                FindBy(producto => producto.Nombre == detalle.Producto,
                includeProperties: "DetallesCompra.Compra").FirstOrDefault();

                CompraDetalle compraDetalle = new CompraDetalle.CompraDetalleBuilder(producto, compra).
                    SetCantidad(detalle.Cantidad).SetCostoUnitario(detalle.Valor).Build();

                compra.AddDetalle(compraDetalle);
                producto.AddCompraDetalle(compraDetalle);
            });

            this._unitOfWork.CompraRepository.Add(compra);
            this._unitOfWork.Commit();
            return new Response
            {
                Mensaje = "Compra registrada con éxito",
                Data = new CompraRequest().Map(compra)
            };
        }
        private IReadOnlyList<string> PuedeRegistrarDetalles(List<CompraDetalleRequest> detalles)
        {
            List<string> errores = new List<string>();
            detalles.ForEach((detalle) => 
            {
                Producto producto = this._unitOfWork.ProductoRepository.
                FindFirstOrDefault(producto => producto.Nombre == detalle.Producto);
                if (producto == null)
                    errores.Add($"El producto {detalle.Producto} no existe");
                if (detalle.Cantidad <= 0)
                    errores.Add($"La cantidad de {detalle.Producto} es invalida");
                if (detalle.Valor <=0)
                    errores.Add($"El valor de {detalle.Producto} es invalida");
            });
            return errores;
        }        
    }
}
