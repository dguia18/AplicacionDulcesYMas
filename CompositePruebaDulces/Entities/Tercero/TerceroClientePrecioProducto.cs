using Domain.Base;
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
        public double Costo { get; private set; }
        public TerceroClientePrecioProducto()
        {

        }
        public TerceroClientePrecioProducto(TerceroCliente cliente, Producto producto)
        {
            this.Cliente = cliente;
            this.Producto = producto;
            this.ProductoId = producto.Id;
            this.ClienteId = cliente.Id;
        }
        public TerceroClientePrecioProducto(TerceroClientePrecioProductoBuilder terceroClientePrecioProductoBuilder)
        {
            this.Cliente = terceroClientePrecioProductoBuilder.Cliente;
            this.Producto = terceroClientePrecioProductoBuilder.Producto;
            this.ProductoId = terceroClientePrecioProductoBuilder.ProductoId;
            this.ClienteId = terceroClientePrecioProductoBuilder.ClienteId;
            this.Precio = terceroClientePrecioProductoBuilder.Precio;
            this.Costo = terceroClientePrecioProductoBuilder.Producto.CostoUnitario;
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
