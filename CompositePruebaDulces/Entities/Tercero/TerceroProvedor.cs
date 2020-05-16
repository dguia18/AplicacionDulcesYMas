using Domain;
using Domain.Base;

namespace Domain.Entities.Tercero
{
	public class TerceroProvedor : Entity<int>
	{
		public Tercero Tercero { get; set; }
		public TerceroProvedor(Tercero tercero)
		{
			this.Tercero = tercero;
		}
		public TerceroProvedor()
		{

		}
	}
}