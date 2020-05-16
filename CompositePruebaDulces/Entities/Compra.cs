
using Domain.Base;
using Domain.Entities.Tercero;
using System;
using System.Collections.Generic;

namespace Domain.Entities
{
	public class Compra : Entity<int>
	{		
		public double Total { get; set; }
		public TerceroProvedor Proveedor { get; set; }
		public TerceroUsuario Usuario { get; set; }
		public List<CompraDetalle> DetallesCompra { get; set; }
		public DateTime Fecha { get; set; }
		public Compra()
		{

		}
		public Compra(CompraBuilder compraBuilder)
		{
			this.Proveedor = compraBuilder.Proveedor;
			this.Usuario = compraBuilder.Usuario;
			this.Fecha = DateTime.Now;
			this.DetallesCompra = new List<CompraDetalle>();
		}
		public void AddDetalle(CompraDetalle detalle)
		{
			this.DetallesCompra.Add(detalle);
			this.Total += detalle.GetTotal();
		}
		public void AgregarCantidadesProductos()
		{
			this.DetallesCompra.ForEach((detalle) =>
			{
				detalle.Producto.AdicionarCantidad(detalle.Cantidad);
			});
		}
		public class CompraBuilder
		{
			public TerceroProvedor Proveedor { get; private set; }
			public TerceroUsuario Usuario { get; private set; }
			public CompraBuilder(TerceroProvedor provedor, TerceroUsuario usuario)
			{
				this.Proveedor = provedor;
				this.Usuario = usuario;
			}			
			public Compra Build()
			{
				Compra compra = new Compra(this);
				return compra;
			}
		}
	}
}