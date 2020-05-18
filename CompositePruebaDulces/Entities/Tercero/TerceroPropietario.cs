using Domain.Base;
using System;
using System.Collections.Generic;

namespace Domain.Entities.Tercero
{
    public class TerceroPropietario : Entity<int>
    {
        public Tercero Tercero { get; set; }
        public List<Producto> Productos { get; set; }
        public DateTime FechaCreacion { get; set; } = DateTime.Now;
        public TerceroPropietario(Tercero tercero)
        {
            this.Tercero = tercero;
            this.Productos = new List<Producto>();
        }
        public TerceroPropietario()
        {

        }
    }
}
