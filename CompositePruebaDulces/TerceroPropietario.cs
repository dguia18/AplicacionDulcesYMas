using Domain.Base;
using System;
using System.Collections.Generic;
using System.Text;

namespace Domain
{
    public class TerceroPropietario : Entity<int>
    {
        public Tercero Tercero { get; set; }
        public List<Producto> Productos { get; set; }
        public TerceroPropietario(Tercero tercero)
        {
            this.Tercero = tercero;
            this.Productos = new List<Producto>();
        }        
    }
}
