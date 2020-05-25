using Domain.Base;
using Domain.Entities.EntitiesProducto;

namespace Domain.Entities
{
    public class DevolucionDetalle :Entity<int>
    {
        public Devolucion Devolucion { get; set; }
        public Producto Producto { get; set; }
        public int DevolucionId { get; set; }
        public int ProductoId { get; set; }
        public double Cantidad { get; set; }
    }
}