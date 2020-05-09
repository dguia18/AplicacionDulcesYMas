using System.Collections.Generic;
using Domain.Base;

namespace Domain
{
    public class Tercero : Entity<int>
    {
        public string Nit { get; set; }
        public string RazonSocial { get; set; }
        public List<Contacto> Contactos { get; set; }
        public Tercero(string nit, string razonSocial)
        {
            this.Nit = nit;
            this.RazonSocial = razonSocial;
            Contactos = new List<Contacto>();            
        }
        public Tercero()
        {
            this.Contactos = new List<Contacto>();
        }
    }
}
