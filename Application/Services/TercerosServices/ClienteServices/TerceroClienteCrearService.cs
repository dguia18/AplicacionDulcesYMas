
using Application.Request;
using Domain.Contracts;
using Domain.Entities.EntitiesProducto;
using Domain.Entities.Tercero;
using System;
using System.Collections.Generic;
using System.Linq;

namespace Application.Services.TercerosServices.ClienteServices
{
    public class TerceroClienteCrearService
    {
        private readonly IUnitOfWork _unitOfWork;
        public TerceroClienteCrearService(IUnitOfWork unitOfWork)
        {
            this._unitOfWork = unitOfWork;
        }
        public Response Crear(TerceroClienteRequest request)
        {
            Tercero tercero = this._unitOfWork.TerceroRepository.
                FindFirstOrDefault(tercero => tercero.Nit == request.NitTercero);
            if (tercero == null)
            {
                return new Response
                {
                    Mensaje = $"La identificación {request.NitTercero}," +
                    $" no se encuentra registrada hasta el momento"
                };
            }
            TerceroCliente cliente = this._unitOfWork.TerceroClienteRepository.
                FindBy(cliente => cliente.Tercero.Nit == request.NitTercero,
                includeProperties: "Tercero").FirstOrDefault();
            if (cliente != null)
            {
                return new Response
                {
                    Mensaje = $"No se pudo registrar el cliente porque ya esta en el sistema"
                };
            }
            List<Producto> productos = this._unitOfWork.ProductoRepository.GetAll().ToList();
            List<Producto> productosEncontrados = productos.
                Where(producto => request.Precios.Select(p => p.ProductoId).Contains(producto.Id)).
                ToList();

            if (productosEncontrados.Count != request.Precios.Count)
            {
                var productosNoEncontrados = request.Precios.Where(precio => !productosEncontrados.
                Select(p => p.Id).Contains(precio.ProductoId)).
                Select(p => $"{p.NombreProducto} con Id {p.ProductoId}").ToList();
                return new Response
                {
                    Mensaje = "Los siguientes productos no fueron encontrados en el sistema\n" +
                    string.Join("\n",
                    productosNoEncontrados)
                };
            }

            cliente = new TerceroCliente.TerceroClienteBuilder(tercero).Build();
            try
            {
                IEnumerator<Producto> enumerator = productosEncontrados.GetEnumerator();
                request.Precios.ForEach((precio) => 
                {
                    enumerator.MoveNext();
                    
                    TerceroClientePrecioProducto precioProducto = new TerceroClientePrecioProducto.
                    TerceroClientePrecioProductoBuilder(cliente, enumerator.Current).
                    SetPrecio(precio.Precio).Build();

                    cliente.AddPrecio(precioProducto);
                });
            }
            catch (InvalidOperationException e)
            {
                return new Response { Mensaje = e.Message };
            }

            this._unitOfWork.TerceroClienteRepository.Add(cliente);
            this._unitOfWork.Commit();
            return new Response
            {
                Mensaje = "Cliente registrado con éxito",
                Data = new TerceroClienteRequest().Map(cliente)
            };
        }
    }
}
