using Application.Base;
using Domain.Entities.Tercero;

namespace Application.Request
{
    public class TerceroProvedorRequest : Request<int>
    {
        public TerceroRequest Tercero { get; set; }
        public string NitTercero { get; set; }

        public TerceroProvedorRequest(TerceroRequest tercero)
        {
            this.Tercero = tercero;
            this.NitTercero = tercero.NitTercero;
        }
        public TerceroProvedorRequest()
        {

        }

        internal TerceroProvedorRequest Map(TerceroProvedor provedor)
        {
            this.Id = provedor.Id;
            this.Tercero = new TerceroRequest().Map(provedor.Tercero);
            return this;
        }
    }
}
