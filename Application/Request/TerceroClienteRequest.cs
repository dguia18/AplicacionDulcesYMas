
using Application.Base;
using Domain.Entities.Tercero;
using System;
using System.Collections.Generic;

namespace Application.Request
{
    public class TerceroClienteRequest : Request<int>
    {
		public TerceroRequest TerceroRequest { get; set; }
		public DateTime FechaCreacion { get; set; }
		public string NitTercero { get; set; }
		public List<TerceroClientePrecioRequest> Precios { get; set; }

		public TerceroClienteRequest(string nitTercero)
		{
			NitTercero = nitTercero;
			this.Precios = new List<TerceroClientePrecioRequest>();
		}
		public TerceroClienteRequest()
		{
			this.Precios = new List<TerceroClientePrecioRequest>();
		}
		public TerceroClienteRequest Map(TerceroCliente cliente)
		{
			this.Id = cliente.Id;
			this.NitTercero = cliente.Tercero.Nit;
			this.FechaCreacion = cliente.FechaCreacion;
			if (cliente.ListaDePrecios != null)
			{
				cliente.ListaDePrecios.ForEach((precio) =>
				{
					this.Precios.Add(new TerceroClientePrecioRequest().Map(precio));
				});
			}
			this.TerceroRequest = new TerceroRequest().Map(cliente.Tercero);
			return this;
		}
	}
}
