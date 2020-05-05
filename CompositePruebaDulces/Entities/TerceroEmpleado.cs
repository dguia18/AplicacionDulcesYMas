using Domain.Base;
using System;
using System.Collections.Generic;
using System.Text;

namespace Domain
{
    public class TerceroEmpleado : Entity<int>
    {
        public Tercero Tercero { get; set; }
        public TerceroEmpleado(Tercero tercero)
        {
            this.Tercero = tercero;
        }
        public TerceroEmpleado()
        {

        }
    }
}
