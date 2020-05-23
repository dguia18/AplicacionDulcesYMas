using Domain.Base;
using Domain.Entities.Tercero;

namespace Domain.Entities
{
    public class Venta : Entity<int>
    {
        public TerceroUsuario Usuario { get; set; }
        public TerceroCliente Cliente { get; set; }

    }
}
