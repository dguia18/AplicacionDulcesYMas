using Domain;
using System;
using System.Collections.Generic;
using System.Text;

namespace Application.Request
{
    public class TerceroRequest
    {
        public string NitTercero { get; set; }
        public string RazonSocialTercero { get; set; }
        public List<Contacto> ContactosTercero { get; set; }
    }
    
}
