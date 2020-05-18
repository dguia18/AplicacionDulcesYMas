using Domain;
using Domain.Base;
using System;

namespace Domain.Entities.Tercero
{
	public class TerceroProvedor : Entity<int>
	{
		public Tercero Tercero { get; set; }
		public DateTime FechaCreacion { get; set; } = DateTime.Now;
		public TerceroProvedor(Tercero tercero)
		{
			this.Tercero = tercero;
		}
		public TerceroProvedor()
		{

		}
	}
}