using Domain.Base;
using Domain.Entities.EntitiesProducto;
using Domain.Entities.Tercero;
using System;
using System.Collections.Generic;
using System.Text;

namespace Domain.Entities.Tercero
{
    public class PrecioCliente : Entity<int>
    {
        public int ClienteId { get; set; }
        public int ProductoId { get; set; }
        public TerceroCliente Cliente { get; set; }
        public Producto Producto { get; set; }
        public double Precio { get; set; }
        public PrecioCliente()
        {

        }
        public PrecioCliente(TerceroCliente cliente, Producto producto, double precio)
        {
            this.Cliente = cliente;
            this.Producto = producto;
            this.ClienteId = cliente.Id;
            this.ProductoId = producto.Id;
            this.Precio = precio;
        }
    }
}
