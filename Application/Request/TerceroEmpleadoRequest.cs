using Application.Base;
using Domain;
using Domain.Entities.Tercero;
using System;
using System.Collections.Generic;
using System.Text;

namespace Application.Request
{
    public class TerceroEmpleadoRequest : Request<int>
    {
		private string _nitTercero;
		public TerceroRequest TerceroRequest { get; set; }
		public DateTime FechaCreacion { get; set; }
		public string NitTercero
		{
			get;set;
		}

		public TerceroEmpleadoRequest(string nitTercero)
		{
			NitTercero = nitTercero;
		}

		public TerceroEmpleadoRequest()
		{
		}

		public TerceroEmpleadoRequest Map(TerceroEmpleado empleado)
		{
			this.Id = empleado.Id;
			this.NitTercero = empleado.Tercero.Nit;
			FechaCreacion = empleado.FechaCreacion;
			TerceroRequest = new TerceroRequest().Map(empleado.Tercero);
			return this;
		}
	}

	
}
