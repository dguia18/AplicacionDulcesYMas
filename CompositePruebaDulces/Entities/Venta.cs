using Domain.Base;
using Domain.Entities.Tercero;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;

namespace Domain.Entities
{
    public class Venta : Entity<int>
    {
        public TerceroUsuario Usuario { get; private set; }
        public TerceroCliente Cliente { get; private set; }
        public List<VentaAbono> Abonos { get; private set; }
        [Column(TypeName = "decimal(7,2)")]
        public decimal Total { get; private set; }
        [Column(TypeName = "decimal(7,2)")]
        public decimal Pendiente { get; private set; }
        [Column(TypeName = "decimal(7,2)")]
        public decimal Pagado { get; private set; }
        [Column(TypeName = "decimal(7,2)")]
        public decimal Descuento { get; private set; }
        [Column(TypeName = "decimal(7,2)")]
        public decimal TotalReal { get; private set; }
        [Column(TypeName = "decimal(7,2)")]
        public decimal Utilidad { get; private set; }
        public decimal UtilidadReal { get => Utilidad - Descuento; }
        public Estado Estado { get; private set; } = Estado.Pendiente;
        public DateTime Fecha { get; private set; }
        public List<VentaDetalle> VentaDetalles { get; private set; }
        public List<Devolucion> Devoluciones { get; private set; }
        public Venta()
        {
            this.VentaDetalles = new List<VentaDetalle>();
            this.Devoluciones = new List<Devolucion>();
            this.Abonos = new List<VentaAbono>();
            this.Fecha = DateTime.Now;
        }

        public Venta(VentaBuilder ventaBuilder)
        {
            this.VentaDetalles = new List<VentaDetalle>();
            this.Devoluciones = new List<Devolucion>();
            this.Abonos = new List<VentaAbono>();
            this.Usuario = ventaBuilder.Usuario;
            this.Cliente = ventaBuilder.Cliente;
            this.Fecha = DateTime.Now;
        }
        public void SetDescuento(decimal descuento)
        {
            if (Utilidad * 0.66m < descuento)
            {
                throw new InvalidOperationException("El descuento es muy alto");
            }
            this.Descuento = descuento;
            this.TotalReal -= descuento;
            this.Pendiente -= descuento;
        }
        public void AgregarDetalle(VentaDetalle detalle)
        {
            this.VentaDetalles.Add(detalle);
            this.Total += detalle.ValorTotal;
            this.TotalReal += detalle.ValorTotal;
            this.Utilidad += detalle.Utilidad;
            this.Pendiente += detalle.ValorTotal;
        }
        public void AgregarAbono(VentaAbono abono)
        {
            this.Abonos.Add(abono);
            this.Pagado += abono.Valor;
            this.Pendiente -= abono.Valor;
            CambiarEstadoDeVenta();
        }
        private void CambiarEstadoDeVenta()
        {
            if (this.Pagado == this.TotalReal)
            {
                this.Estado = Estado.Pagado;
            }
        }

        public class VentaBuilder
        {
            public TerceroUsuario Usuario { get; private set; }
            public TerceroCliente Cliente { get; private set; }
            public VentaBuilder(TerceroUsuario usuario, TerceroCliente cliente)
            {
                this.Usuario = usuario;
                this.Cliente = cliente;
            }
            public Venta Build()
            {
                Venta venta = new Venta(this);
                return venta;
            }
        }
    }
    public enum Estado
    {
        Pendiente,
        Pagado,
        Anulado
    }
}
