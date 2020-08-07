
using Domain.Base;
using Domain.Entities.Tercero;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;

namespace Domain.Entities
{
    public class Devolucion : Entity<int>
    {
        public TerceroCliente Cliente { get; set; }
        public TerceroUsuario Usuario { get; set; }
        [Column(TypeName = "decimal(7,2)")]
        public decimal Total { get; set; }
        public List<DevolucionDetalle> DevolucionDetalles { get; set; }

    }   
}
