
using Domain.Entities.EntitiesProducto;
using System.ComponentModel.DataAnnotations.Schema;

namespace Domain.Entities
{
    public class CompraDetalle
    {
        public int CompraId { get; set; }
        public int ProductoId { get; set; }
        public Producto Producto { get; set; }
        public Compra Compra { get; set; }
        [Column(TypeName = "decimal(7,2)")]
        public decimal Valor { get; set; }
        [Column(TypeName = "decimal(7,2)")]
        public decimal Cantidad { get; set; }
        public CompraDetalle(Producto producto, Compra compra)
        {
            this.CompraId = compra.Id;
            this.ProductoId = producto.Id;
            this.Producto = producto;
            this.Compra = compra;
        }

        public CompraDetalle(CompraDetalleBuilder compraDetalleBuilder)
        {
            this.Producto = compraDetalleBuilder.Producto;
            this.Compra = compraDetalleBuilder.Compra;
            this.Cantidad = compraDetalleBuilder.Cantidad;
            this.Valor = compraDetalleBuilder.Valor;
        }
        public CompraDetalle()
        {

        }
        public decimal GetTotal()
        {
            return this.Valor *this.Cantidad;
        }
        public class CompraDetalleBuilder
        {
            public Producto Producto { get; set; }
            public Compra Compra { get; set; }
            public decimal Valor { get; set; }
            public decimal Cantidad { get; set; }

            public CompraDetalleBuilder(Producto producto, Compra compra)
            {
                this.Compra = compra;
                this.Producto = producto;
            }
            public CompraDetalleBuilder SetCantidad(decimal cantidad)
            {
                this.Cantidad = cantidad;
                return this;
            }
            public CompraDetalleBuilder SetCostoUnitario(decimal costo)
            {
                this.Valor = costo;
                return this;
            }
            public CompraDetalle Build()
            {
                CompraDetalle compra = null;
                if (ValidarConstruccion())
                {
                    return new CompraDetalle(this); 
                }
                return compra;
            }

            private bool ValidarConstruccion()
            {
                return this.Cantidad > 0 && this.Valor > 0;
            }
        }
    }
}