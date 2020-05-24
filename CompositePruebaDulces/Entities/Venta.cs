using Domain.Base;
using Domain.Entities.Tercero;
using System;
using System.Collections.Generic;

namespace Domain.Entities
{
    public class Venta : Entity<int>
    {
        public TerceroUsuario Usuario { get; private set; }
        public TerceroCliente Cliente { get; private set; }
        public double Total { get; private set; }
        public double Descuento { get; private set; }
        public DateTime Fecha { get; private set; }
        public List<VentaDetalle> VentaDetalles { get; private set; }
        public Venta()
        {
            this.VentaDetalles = new List<VentaDetalle>();
            this.Fecha = DateTime.Now;
        }             

        public Venta(VentaBuilder ventaBuilder)
        {
            this.Usuario = ventaBuilder.Usuario;
            this.Cliente = ventaBuilder.Cliente;
            this.Descuento = ventaBuilder.Descuento;
            this.VentaDetalles = new List<VentaDetalle>();
            this.Fecha = DateTime.Now;
        }

        public void AgregarDetalle(VentaDetalle detalle)
        {
            this.VentaDetalles.Add(detalle);
            Total += detalle.Total;
        }
        public class VentaBuilder
        {
            public TerceroUsuario Usuario { get; private set; }
            public TerceroCliente Cliente { get; private set; }
            public double Descuento { get; private set; }
            public VentaBuilder(TerceroUsuario usuario, TerceroCliente cliente)
            {
                this.Usuario = usuario;
                this.Cliente = cliente;
            }
            public VentaBuilder SetDescuento(double descuento)
            {
                this.Descuento = descuento;
                return this;
            }
            public Venta Build()
            {
                Venta venta = new Venta(this);
                return venta;
            }
        }
    }
}
