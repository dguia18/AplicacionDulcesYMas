using Domain.Entities.EntitiesProducto;

namespace Domain.Entities
{
    public class DevolucionDetalle
    {
        public Devolucion Devolucion { get; set; }
        public Producto Producto { get; set; }
        public double Cantidad { get; set; }
    }
}