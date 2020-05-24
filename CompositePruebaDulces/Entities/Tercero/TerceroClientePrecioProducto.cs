﻿using Domain.Base;
using Domain.Entities.EntitiesProducto;
using System;

namespace Domain.Entities.Tercero
{
    public class TerceroClientePrecioProducto : Entity<int>
    {
        public int ClienteId { get; private set; }
        public int ProductoId { get; private set; }
        public TerceroCliente Cliente { get; private set; }
        public Producto Producto { get; private set; }
        public double Precio { get; private set; }
        public TerceroClientePrecioProducto()
        {

        }
        public TerceroClientePrecioProducto(TerceroCliente cliente, Producto producto, double precio)
        {
            this.Cliente = cliente;
            this.Producto = producto;
            this.ClienteId = cliente.Id;
            this.ProductoId = producto.Id;
            this.Precio = precio;
        }

        public TerceroClientePrecioProducto(TerceroClientePrecioProductoBuilder terceroClientePrecioProductoBuilder)
        {
        }

        public class TerceroClientePrecioProductoBuilder
        {
            public int ClienteId { get; private set; }
            public int ProductoId { get; private set; }
            public TerceroCliente Cliente { get; private set; }
            public Producto Producto { get; private set; }
            public double Precio { get; private set; }
            public TerceroClientePrecioProductoBuilder(TerceroCliente cliente,
                Producto producto)
            {
                this.Producto = producto;
                this.Cliente = cliente;
                this.ProductoId = producto.Id;
                this.ClienteId = cliente.Id;
            }
            public TerceroClientePrecioProductoBuilder SetPrecio(double precio)
            {
                this.Precio = precio;
                return this;
            }
            private void ValidarPrecioNoMenorAlPermitido()
            {
                if (this.Producto.Tipo != Tipo.ParaVender)
                {
                    throw new InvalidOperationException($"El producto " +
                        $"{Producto.Nombre} no se puede vender");
                }
                if (this.Precio < Producto.PrecioSugeridoDeVenta)
                {
                    throw new InvalidOperationException("El precio del " +
                        $"producto {Producto.Nombre} no puede ser menor al" +
                        $" precio sugerido de {Producto.PrecioSugeridoDeVenta}");
                }

            }
            public TerceroClientePrecioProducto Build()
            {
                ValidarPrecioNoMenorAlPermitido();
                TerceroClientePrecioProducto precioProducto = new
                    TerceroClientePrecioProducto(this);
                return precioProducto;
            }
        }
    }
}
