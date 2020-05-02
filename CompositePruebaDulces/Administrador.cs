using Domain.Base;
using System;
using System.Collections.Generic;
using System.Text;

namespace Domain
{
    public class Administrador : Entity<int>
    {
        public Tercero Tercero { get; set; }
        public List<Producto> Productos { get; set; }
        public Administrador(Tercero tercero)
        {
            this.Tercero = tercero;
            this.Productos = new List<Producto>();
        }        
    }
}
