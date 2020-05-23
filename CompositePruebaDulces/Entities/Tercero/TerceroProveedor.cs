using Domain;
using Domain.Base;
using System;

namespace Domain.Entities.Tercero
{
	public class TerceroProveedor : Entity<int>
	{
		public Tercero Tercero { get; set; }
		public DateTime FechaCreacion { get; set; } = DateTime.Now;
		public TerceroProveedor(Tercero tercero)
		{
			this.Tercero = tercero;
		}
		public TerceroProveedor()
		{

		}
	}
}