using Domain.Base;
using Domain.Entities.EntitiesProducto;
using System;

namespace Domain.Entities
{
    public class VentaDetalle : BaseEntity
    {
        public int VentaId { get; private set; }
        public int ProductoId { get; private set; }
        public Venta Venta { get; private set; }
        public Producto Producto { get; private set; }
        public double Cantidad { get; private set; }
        public double Costo { get; private set; }
        public double Valor { get; private set; }
        public double Total { get; private set; }
        public double Utilidad { get; private set; }
        public VentaDetalle()
        {

        }

        public VentaDetalle(VentaDetalleBuilder ventaDetalleBuilder)
        {
            ProductoId = ventaDetalleBuilder.ProductoId;
            Producto = ventaDetalleBuilder.Producto;
            Venta = ventaDetalleBuilder.Venta;
            VentaId = ventaDetalleBuilder.VentaId;
            Cantidad = ventaDetalleBuilder.Cantidad;
            Valor = ventaDetalleBuilder.Valor;
            Costo = ventaDetalleBuilder.Costo;
            Total = Valor * Cantidad;
            Utilidad = Total - Costo * Cantidad;
        }

        public class VentaDetalleBuilder
        {
            public int VentaId { get; private set; }
            public int ProductoId { get; private set; }
            public Venta Venta { get; private set; }
            public Producto Producto { get; private set; }
            public double Cantidad { get; private set; }
            public double Costo { get; private set; }
            public double Valor { get; private set; }
            public double Utilidad { get; private set; }
            public VentaDetalleBuilder(Venta venta, Producto producto)
            {
                Venta = venta;
                Producto = producto;
                VentaId = venta.Id;
                ProductoId = producto.Id;
                Costo = producto.CostoUnitario;
            }
            public VentaDetalleBuilder SetPrecio(double precio)
            {
                Valor = precio;
                return this;
            }
            public VentaDetalleBuilder SetCantidad(double cantidad)
            {
                Cantidad = cantidad;
                return this;
            }
            private void ValidarValorNoMenorAlPermitido()
            {
                double precio = Venta.Cliente.GetPrecioProducto(ProductoId);
                if (Valor < precio)
                {
                    throw new InvalidOperationException($"El precio del " +
                        $"producto {Producto.Nombre} es muy bajo, por lo menos" +
                        $"debe ser de {precio}");
                }
            }
            public VentaDetalle Build()
            {
                ValidarValorNoMenorAlPermitido();
                VentaDetalle detalle = new VentaDetalle(this);
                return detalle;
            }
        }
    }
}