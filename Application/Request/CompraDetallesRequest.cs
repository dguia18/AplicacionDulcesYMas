using Domain.Entities;

namespace Application.Request
{
	public class CompraDetalleRequest
	{
		public double Valor { get; set; }
		public double Cantidad { get; set; }
		public int ProductoId { get; set; }
		public CompraDetalleRequest()
		{

		}

		public CompraDetalleRequest(CompraDetalleRequestBuilder compraDetalleRequestBuilder)
		{
			this.Cantidad = compraDetalleRequestBuilder.Cantidad;
			this.Valor = compraDetalleRequestBuilder.Valor;
			this.ProductoId = compraDetalleRequestBuilder.ProductoId;
		}

		public CompraDetalleRequest Map(CompraDetalle detalle)
		{
			this.Valor = detalle.Valor;
			this.Cantidad = detalle.Cantidad;
			this.ProductoId = detalle.Producto.Id;
			return this;
		}
		public class CompraDetalleRequestBuilder
		{
			public double Valor { get; private set; }
			public double Cantidad { get; private set; }
			public int ProductoId { get; private set; }
			public CompraDetalleRequestBuilder(int producto)
			{
				this.ProductoId = producto;
			}
			public CompraDetalleRequestBuilder SetValor(double valor)
			{
				this.Valor = valor;
				return this;
			}
			public CompraDetalleRequestBuilder SetCantidad(double cantidad)
			{
				this.Cantidad = cantidad;
				return this;
			}
			public CompraDetalleRequest Build()
			{
				CompraDetalleRequest compraDetalle = new CompraDetalleRequest(this);
				return compraDetalle;
			}
		}
	}
}