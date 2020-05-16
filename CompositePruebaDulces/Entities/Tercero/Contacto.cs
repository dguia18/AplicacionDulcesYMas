using Domain.Base;

namespace Domain.Entities.Tercero
{
    public class Contacto : Entity<int>
    {
        public string Direccion { get; set; }
        public string NumeroCelular { get; set; }
    }
}
