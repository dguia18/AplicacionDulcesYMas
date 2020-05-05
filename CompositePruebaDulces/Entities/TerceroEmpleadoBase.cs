using Domain.Base;
using System.Collections.Generic;

namespace Domain
{
    public abstract class TerceroEmpleadoBase : Entity<int>
    {
        public TerceroBase Tercero { get; set; }
        public List<Fabricacion> Fabricaciones { get; set; }
        protected TerceroEmpleadoBase(TerceroBase tercero)
        {
            this.Tercero = tercero;
            this.Fabricaciones = new List<Fabricacion>();
        }
        protected TerceroEmpleadoBase()
        {

        }
    }
}
