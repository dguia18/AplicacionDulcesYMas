using Domain.Base;
using Domain.Entities.EntitiesProducto;
using System.ComponentModel.DataAnnotations.Schema;

namespace Domain.Entities
{
    public class DevolucionDetalle :Entity<int>
    {
        public Devolucion Devolucion { get; set; }
        public Producto Producto { get; set; }
        public int DevolucionId { get; set; }
        public int ProductoId { get; set; }
        [Column(TypeName = "decimal(7,2)")]
        public decimal Cantidad { get; set; }
    }
}