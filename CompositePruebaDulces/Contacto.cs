using Domain.Base;
using System;
using System.Collections.Generic;
using System.Text;

namespace Domain
{
    public class Contacto : Entity<int>
    {
        public string Direccion { get; set; }
        public string NumeroCelular { get; set; }
    }
}
