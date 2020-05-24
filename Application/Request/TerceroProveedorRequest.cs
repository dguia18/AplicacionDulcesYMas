
using Application.Base;
using Domain.Entities.Tercero;
using System;
using System.Collections.Generic;

namespace Application.Request
{
    public class TerceroProveedorRequest : Request<int>
    {
        public string NitTercero { get; set; }
        public Tercero Tercero { get; set; }
        public List<PreciosRequest> ListaDePrecios { get; set; }
        public DateTime FechaCreacion { get; set; }
        
    }
}
