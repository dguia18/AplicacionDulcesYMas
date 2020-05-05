using System;
using System.Collections.Generic;
using System.Text;

namespace Domain.Entities
{
    public class TerceroEmpleado : TerceroEmpleadoBase
    {
        public TerceroEmpleado()
        {
        }

        public TerceroEmpleado(TerceroBase tercero) : base(tercero)
        {
        }
    }
}
