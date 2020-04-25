using System;
using System.Collections.Generic;
using System.Text;

namespace Domain
{
    public abstract class  Leaf : IComponent
    {
        public void Agregar(IComponent component)
        {
            Console.WriteLine("No puede agregar hoja");
        }

        public void Consultar()
        {
            Console.WriteLine(this.ToString());
        }

        public void Eliminar(IComponent component)
        {
            Console.WriteLine("No puede eliminar hoja");
        }

        public virtual double GetCosto()
        {
            return 0;
        }

        public virtual void Preparar()
        {
            throw new NotImplementedException();
        }
    }
}
