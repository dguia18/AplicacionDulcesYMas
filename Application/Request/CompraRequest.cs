using System;
using System.Collections.Generic;
using System.Text;

namespace Application.Request
{
    public class CompraRequest
    {
        public string NitTercero { get; set; }
        public string Usuario { get; set; }
        public DateTime Fecha { get; set; }
        public List<CompraDetallesRequest> Detalles { get; set; }

    }
}
