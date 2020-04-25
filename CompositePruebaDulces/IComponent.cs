using System;
using System.Collections.Generic;

namespace Domain
{
    public interface IComponent
    {
        void Preparar();
        double GetCosto();
        void Agregar(IComponent component);
        void Eliminar(IComponent component);
        void Consultar();
    }
}
