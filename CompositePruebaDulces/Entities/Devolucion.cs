
using Domain.Base;
using Domain.Entities.Tercero;
using System.Collections.Generic;

namespace Domain.Entities
{
    public class Devolucion : Entity<int>
    {
        public TerceroCliente Cliente { get; set; }
        public TerceroUsuario Usuario { get; set; }
        public double Total { get; set; }
        public List<DevolucionDetalle> DevolucionDetalles { get; set; }

    }   
}
