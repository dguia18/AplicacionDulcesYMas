using Application.Base;
using Domain.Entities;

namespace Application.Request
{
    public class CompraDetalleRequest
    {
        public double Valor { get; set; }
        public double Cantidad { get; set; }
        public string Producto { get; set; }

        public CompraDetalleRequest()
        {

        }

        public CompraDetalleRequest(CompraDetalleRequestBuilder compraDetalleRequestBuilder)
        {
            this.Cantidad = compraDetalleRequestBuilder.Cantidad;
            this.Valor = compraDetalleRequestBuilder.Valor;
            this.Producto = compraDetalleRequestBuilder.Producto.ToUpper();
        }

        public CompraDetalleRequest Map(CompraDetalle detalle)
        {
            this.Valor = detalle.Valor;
            this.Cantidad = detalle.Cantidad;
            this.Producto = detalle.Producto.Nombre;
            return this;
        }
        public class CompraDetalleRequestBuilder
        {
            public double Valor { get; private set; }
            public double Cantidad { get; private set; }
            public string Producto { get; private set; }
            public CompraDetalleRequestBuilder(string producto)
            {
                this.Producto = producto;
            }
            public CompraDetalleRequestBuilder SetValor(double valor)
            {
                this.Valor = valor;
                return this;
            }
            public CompraDetalleRequestBuilder SetCantidad(double cantidad)
            {
                this.Cantidad = cantidad;
                return this;
            }
            public CompraDetalleRequest Build()
            {
                CompraDetalleRequest compraDetalle = new CompraDetalleRequest(this);
                return compraDetalle;
            }
        }
    }
}