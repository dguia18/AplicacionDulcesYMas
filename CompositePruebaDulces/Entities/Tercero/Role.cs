
using Domain.Base;

namespace Domain.Entities.Tercero
{
    public class Role : Entity<int>
    {
        public string Nombre { get; set; }
        public override string ToString()
        {
            return Nombre ;
        }
    }
}
