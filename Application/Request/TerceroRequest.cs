using System;
using System.Collections.Generic;
using Application.Base;
using Domain.Entities.Tercero;

namespace Application.Request {
	public class TerceroRequest : Request<int> {
		public string NitTercero { get; set; }
		private string _razonSocial;
		public string RazonSocialTercero {
			get => _razonSocial;
			set => _razonSocial = value.ToUpper ();
		}
		public DateTime FechaCreacion { get; set; }
		public List<ContactoRequest> ContactosTercero { get; set; }
		public TerceroRequest () {
			this.ContactosTercero = new List<ContactoRequest> ();
		}

		public TerceroRequest (string nitTercero, string razonSocialTercero) {
			NitTercero = nitTercero;
			RazonSocialTercero = razonSocialTercero;
			ContactosTercero = new List<ContactoRequest> ();
		}

		public TerceroRequest Map (Tercero tercero) {
			this.Id = tercero.Id;
			FechaCreacion = tercero.FechaCreacion;
			NitTercero = tercero.Nit;
			RazonSocialTercero = tercero.RazonSocial;
			if (tercero.Contactos != null) {
				tercero.Contactos.ForEach ((contacto) => {
					ContactosTercero.Add (new ContactoRequest ().Map (contacto));
				});
			}
			return this;
		}
	}

	public class ContactoRequest : Request<int> {
		public string TerceroDireccion { get; set; }
		public string TerceroNumeroCelular { get; set; }
		public string TerceroEmail { get; set; }

		public ContactoRequest Map (Contacto contacto) {
			this.Id = contacto.Id;
			this.TerceroDireccion = contacto.Direccion;
			this.TerceroNumeroCelular = contacto.NumeroCelular;
			this.TerceroEmail = contacto.Email;
			return this;
		}
	}
}