using Domain.Base;
using System;
using System.Collections.Generic;
using System.Text;

namespace Domain
{
    public abstract class TerceroPropietarioBase : Entity<int>
    {
        public TerceroBase Tercero { get; set; }
        public List<Producto> Productos { get; set; }
        protected TerceroPropietarioBase(TerceroBase tercero)
        {
            this.Tercero = tercero;
            this.Productos = new List<Producto>();
        }
        protected TerceroPropietarioBase()
        {

        }
    }
}
