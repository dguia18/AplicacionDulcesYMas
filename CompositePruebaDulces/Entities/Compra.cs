
using Domain.Base;
using Domain.Entities.Tercero;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;

namespace Domain.Entities
{
	public class Compra : Entity<int>
	{
		[Column(TypeName ="decimal(7,2)")]
		public decimal Total { get; set; }
		public TerceroProveedor Proveedor { get; set; }
		public TerceroUsuario Usuario { get; set; }
		public List<CompraDetalle> DetallesCompra { get; set; }
		public DateTime Fecha { get; set; }
		public Compra()
		{
			this.Fecha = DateTime.Now;
			this.DetallesCompra = new List<CompraDetalle>();
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
			public TerceroProveedor Proveedor { get; private set; }
			public TerceroUsuario Usuario { get; private set; }
			public CompraBuilder(TerceroProveedor provedor, TerceroUsuario usuario)
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