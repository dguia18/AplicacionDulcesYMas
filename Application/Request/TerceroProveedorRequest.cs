using System;
using Application.Base;
using Domain.Entities.Tercero;

namespace Application.Request
{
	public class TerceroProveedorRequest : Request<int>
	{
		public TerceroRequest Tercero { get; set; }
		public string NitTercero { get; set; }
		public DateTime FechaCreacion { get; set; }
		public TerceroProveedorRequest(TerceroRequest tercero)
		{
			this.Tercero = tercero;
			this.NitTercero = tercero.NitTercero;
		}
		public TerceroProveedorRequest()
		{

		}

		internal TerceroProveedorRequest Map(TerceroProveedor provedor)
		{
			this.Id = provedor.Id;
			this.FechaCreacion = provedor.FechaCreacion;
			this.NitTercero = provedor.Tercero.Nit;
			this.Tercero = new TerceroRequest().Map(provedor.Tercero);
			return this;
		}
	}
}