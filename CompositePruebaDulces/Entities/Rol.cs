
using Domain.Base;

namespace Domain.Entities
{
    public class Rol : Entity<int>
    {
        public string Nombre { get; set; }
        public override string ToString()
        {
            return Nombre+"\n" ;
        }
    }
}
