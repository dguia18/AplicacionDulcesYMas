using System;
using System.Collections.Generic;
using System.Text;

namespace Domain.Entities
{
    public static class FabricacionCrear
    {
        public static Fabricacion IniciarFabricacion(TerceroEmpleado terceroEmpleado)
        {
            return new Fabricacion(terceroEmpleado);
        }
    }
}
