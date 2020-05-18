
using Domain.Base;
using System;
using System.Collections.Generic;

namespace Domain.Entities.Tercero
{
    public class TerceroEmpleado : Entity<int>
    {
        public Tercero Tercero { get; set; }
        public List<Fabricacion> Fabricaciones { get; set; }
        public DateTime FechaCreacion { get; set; } = DateTime.Now;
        public TerceroEmpleado(Tercero tercero)
        {
            this.Tercero = tercero;
            this.Fabricaciones = new List<Fabricacion>();
        }
        public TerceroEmpleado()
        {

        }
    }
}
