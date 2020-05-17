using Domain;
using Domain.Entities.Tercero;
using System;
using System.Collections.Generic;
using System.Text;

namespace Application.Request
{
    public class TerceroEmpleadoRequest
    {
		private string _nitTercero;
		public TerceroRequest TerceroRequest { get; set; }
		public string NitTercero
		{
			get { return _nitTercero.ToUpper(); }
			set { _nitTercero = value; }
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
			this.NitTercero = empleado.Tercero.Nit;
			TerceroRequest = new TerceroRequest().Map(empleado.Tercero);
			return this;
		}
	}

	
}
