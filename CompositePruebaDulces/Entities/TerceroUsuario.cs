using Domain.Base;
using System;
using System.Collections.Generic;
using System.Text;

namespace Domain.Entities
{
    public class TerceroUsuario : Entity<int>
    {
        public Tercero Tercero { get; set; }
        public string Usuario { get; set; }
        public string Password { get; set; }
        public string Roles { get; set; }
        public TerceroUsuario(Tercero tercero)
        {
            this.Tercero = tercero;
        }
        public TerceroUsuario()
        {

        }
    }
}
