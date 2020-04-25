using System;
using System.Collections.Generic;
using System.Text;

namespace Domain
{
    public abstract class Composite : IComponent
    {
        protected List<IComponent> leafs { get; set; } = new List<IComponent>();
        public void Agregar(IComponent component)
        {
            this.leafs.Add(component);
        }

        public void Consultar()
        {
            this.leafs.ForEach(leaf => leaf.Consultar());
        }

        public void Eliminar(IComponent component)
        {
            this.leafs.Remove(component);
        }

        public double GetCosto()
        {
            double costo=0;
            this.leafs.ForEach(leaf => costo += leaf.GetCosto());
            return costo;
        }

        public virtual void Preparar()
        {
            throw new NotImplementedException();
        }
    }
}
