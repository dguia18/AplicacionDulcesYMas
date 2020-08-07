﻿using Domain.Base;
using Domain.Entities.EntitiesProducto;
using System;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;

namespace Domain.Entities
{
    public class VentaDetalle : BaseEntity
    {
        public int VentaId { get; private set; }
        public int ProductoId { get; private set; }
        public Venta Venta { get; private set; }
        public Producto Producto { get; private set; }
        [Column(TypeName = "decimal(7,2)")]
        public decimal Cantidad { get; private set; }
        [Column(TypeName = "decimal(7,2)")]
        public decimal PrecioUnitario { get; private set; }
        [Column(TypeName = "decimal(7,2)")]
        public decimal CostoUnitario { get; private set; }
        public decimal ValorTotal { get => PrecioUnitario * Cantidad; }
        public decimal CostoTotal { get => CostoUnitario * Cantidad; }
        public decimal Utilidad { get => ValorTotal - CostoTotal; }
        private VentaDetalle()
        {

        }

        public VentaDetalle(VentaDetalleBuilder ventaDetalleBuilder)
        {
            ProductoId = ventaDetalleBuilder.ProductoId;
            Producto = ventaDetalleBuilder.Producto;
            Venta = ventaDetalleBuilder.Venta;
            VentaId = ventaDetalleBuilder.VentaId;
            Cantidad = ventaDetalleBuilder.Cantidad;
            PrecioUnitario = ventaDetalleBuilder.ValorUnitario;
            CostoUnitario = ventaDetalleBuilder.CostoUnitario;
        }

        public class VentaDetalleBuilder
        {
            public int VentaId { get; private set; }
            public int ProductoId { get; private set; }
            public Venta Venta { get; private set; }
            public Producto Producto { get; private set; }
            public decimal Cantidad { get; private set; }
            public decimal CostoUnitario { get; private set; }
            public decimal ValorUnitario { get; private set; }
            public VentaDetalleBuilder(Venta venta, Producto producto)
            {
                Venta = venta;
                Producto = producto;
                VentaId = venta.Id;
                ProductoId = producto.Id;
                CostoUnitario = producto.CostoUnitario;
            }
            public VentaDetalleBuilder SetValor(decimal precio)
            {
                ValorUnitario = precio;
                return this;
            }
            public VentaDetalleBuilder SetCantidad(decimal cantidad)
            {
                Cantidad = cantidad;
                return this;
            }
            private void ValidarQueElProductoTengaExistencias()
            {
                if (Producto.PuedeDescontarCantidad(this.Cantidad).Any())
                {
                    throw new InvalidOperationException($"El producto {Producto.Nombre} no " +
                        $"tiene existencias suficientes, solo tiene {Producto.Cantidad} " +
                        $"{Producto.UnidadDeMedida.ToString()}");
                }
            }
            private void ValidarValorNoMenorAlPermitido()
            {
                decimal precio = Venta.Cliente.GetPrecioProducto(ProductoId);
                if (precio == 0)
                {
                    precio = Producto.PrecioSugeridoDeVenta;
                }
                if (ValorUnitario < precio)
                {
                    throw new InvalidOperationException($"El precio del " +
                        $"producto {Producto.Nombre} es muy bajo, por lo menos" +
                        $"debe ser de {precio}");
                }                
            }
            private void ValidarQueElProductoSeaParaVender()
            {
                if (Producto.Tipo != Tipo.ParaVender)
                {
                    throw new InvalidOperationException($"El producto {Producto.Nombre} " +
                        $"no se puede vender, es solo para {Producto.Tipo.ToString()}");
                }
            }
            public VentaDetalle Build()
            {
                ValidarQueElProductoSeaParaVender();
                ValidarValorNoMenorAlPermitido();
                ValidarQueElProductoTengaExistencias();
                VentaDetalle detalle = new VentaDetalle(this);
                return detalle;
            }
        }
    }
}