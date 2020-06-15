using System;
using System.Collections.Generic;
using Application.Base;
using Domain.Entities;

namespace Application.Request
{
	public class CompraRequest : Request<int>
	{
		public string NitProveedor { get; set; }
		public TerceroProveedorRequest Proveedor { get; set; }
		public int UsuarioId { get; set; }
		public double Total { get; set; }
		public DateTime Fecha { get; set; }
		public List<CompraDetalleRequest> Detalles { get; set; }
		public CompraRequest()
		{
			Detalles = new List<CompraDetalleRequest>();
		}

		public CompraRequest(CompraRequestBuilder builder)
		{
			this.UsuarioId = builder.UsuarioId;
			this.NitProveedor = builder.NitProvedor;
			this.Fecha = builder.Fecha;
			this.Detalles = builder.Detalles;
		}

		public CompraRequest Map(Compra compra)
		{
			this.Id = compra.Id;
			if (compra.Proveedor != null)
			{
				this.NitProveedor = compra.Proveedor.Tercero.Nit;

			}
			if (compra.Usuario != null)
			{
				this.UsuarioId = compra.Usuario.Id;

			}
			this.Total = compra.Total;
			this.Fecha = compra.Fecha;
			compra.DetallesCompra.ForEach((detalle) =>
			{
				this.Detalles.Add(new CompraDetalleRequest().Map(detalle));
			});
			return this;
		}
		public class CompraRequestBuilder
		{
			public string NitProvedor { get; private set; }
			public int UsuarioId { get; private set; }
			public DateTime Fecha { get; private set; }
			public List<CompraDetalleRequest> Detalles { get; private set; }
			public CompraRequestBuilder(string nitProvedor, int usuarioId)
			{
				this.NitProvedor = nitProvedor;
				this.UsuarioId = usuarioId;
				this.Fecha = DateTime.Now;
			}
			public CompraRequestBuilder SetDetalles(List<CompraDetalleRequest> compraDetalles)
			{
				this.Detalles = compraDetalles;
				return this;
			}
			public CompraRequest Build()
			{
				CompraRequest compra = new CompraRequest(this);
				return compra;
			}
		}
	}
}