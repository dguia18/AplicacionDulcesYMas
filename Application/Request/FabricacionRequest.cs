using Domain;
using System;
using System.Collections.Generic;
using System.Text;

namespace Application.Request
{
    public class FabricacionRequest
    {
        public string NitEmpleado { get; set; }
        public string NombreProductoParaFabricar { get; set; }
        public double Cantidad { get; set; }
        public double Costo { get; set; }
        public Contestura Contestura { get; set; }
        public List<FabricacionDetalleRequest> FabricacionDetallesRequest { get; set; }
    }
}
