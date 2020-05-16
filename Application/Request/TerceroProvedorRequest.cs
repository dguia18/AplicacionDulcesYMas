using Domain.Entities.Tercero;
using System;
using System.Collections.Generic;
using System.Text;

namespace Application.Request
{
    public class TerceroProvedorRequest
    {
        public TerceroRequest Tercero { get; set; }
        public string NitTercero { get; set; }

        public TerceroProvedorRequest(TerceroRequest tercero)
        {
            this.Tercero = tercero;
        }
        public TerceroProvedorRequest()
        {

        }

        internal TerceroProvedorRequest Map(TerceroProvedor provedor)
        {
            this.Tercero = new TerceroRequest().Map(provedor.Tercero);
            return this;
        }
    }
}
