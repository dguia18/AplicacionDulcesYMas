using Application.Base;
using Domain.Entities.Tercero;
using System;

namespace Application.Request
{
    public class TerceroProvedorRequest : Request<int>
    {
        public TerceroRequest Tercero { get; set; }
        public string NitTercero { get; set; }
        public DateTime FechaCreacion { get; set; }
        public TerceroProvedorRequest(TerceroRequest tercero)
        {
            this.Tercero = tercero;
            this.NitTercero = tercero.NitTercero;
        }
        public TerceroProvedorRequest()
        {

        }

        internal TerceroProvedorRequest Map(TerceroProveedor provedor)
        {
            this.Id = provedor.Id;
            this.FechaCreacion = FechaCreacion;
            this.Tercero = new TerceroRequest().Map(provedor.Tercero);
            return this;
        }
    }
}
