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
        public CompraDetalleRequest Map(CompraDetalle detalle)
        {
            this.Valor = detalle.Valor;
            this.Cantidad = detalle.Cantidad;
            this.Producto = detalle.Producto.Nombre;
            return this;
        }
    }
}