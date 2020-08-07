
using Domain.Base;
using System;
using System.Collections.Generic;

namespace Domain.Entities.Tercero
{
    public class TerceroCliente : Entity<int>
    {
        public Tercero Tercero { get; set; }
        public List<TerceroClientePrecioProducto> ListaDePrecios { get; set; }
        public DateTime FechaCreacion { get; set; }
        public TerceroCliente(TerceroClienteBuilder terceroClienteBuilder)
        {
            this.Tercero = terceroClienteBuilder.Tercero;
            this.FechaCreacion = DateTime.Now;
            this.ListaDePrecios = new List<TerceroClientePrecioProducto>();
        }
        public TerceroCliente()
        {
            this.FechaCreacion = DateTime.Now;
            this.ListaDePrecios = new List<TerceroClientePrecioProducto>();
        }
        public void AddPrecio(TerceroClientePrecioProducto precio)
        {
            ListaDePrecios.Add(precio);
        }
        public decimal GetPrecioProducto(int id)
        {
            var precio = this.ListaDePrecios.
                Find((precio) => precio.ProductoId == id);
            
            return precio == null ? 0 : precio.Precio;
        }
        public class TerceroClienteBuilder
        {
            public Tercero Tercero { get; private set; }
            public List<TerceroClientePrecioProducto> ListaDePrecios { get; private set; }
            public TerceroClienteBuilder(Tercero tercero)
            {
                this.Tercero = tercero;
            }
            public TerceroClienteBuilder SetPrecios(List<TerceroClientePrecioProducto> precios)
            {
                this.ListaDePrecios = precios;
                return this;
            }
            public TerceroCliente Build()
            {
                TerceroCliente cliente = new TerceroCliente(this);
                return cliente;
            }
        }
    }
}
