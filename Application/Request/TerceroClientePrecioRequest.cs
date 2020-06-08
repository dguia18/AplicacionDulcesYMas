using Domain.Entities.Tercero;

namespace Application.Request {
	public class TerceroClientePrecioRequest {
		public int ProductoId { get; set; }
		private string _nombreProducto;
		public string NombreProducto { get => _nombreProducto; set => _nombreProducto = value.ToUpper (); }
		public double Precio { get; set; }
		public TerceroClientePrecioRequest (TerceroClientePrecioRequestBuilder builder) {
			this.ProductoId = builder.ProductoId;
			this.NombreProducto = "" + builder.NombreProducto;
			this.Precio = builder.Precio;
		}

		public TerceroClientePrecioRequest () { }

		public TerceroClientePrecioRequest Map (TerceroClientePrecioProducto precio) {
			this.ProductoId = precio.ProductoId;
			this.NombreProducto = precio.Producto.Nombre;
			this.Precio = precio.Precio;
			return this;
		}
		public TerceroClientePrecioProducto UnMap () {
			return null;
		}
		public class TerceroClientePrecioRequestBuilder {
			public int ProductoId { get; private set; }
			public string NombreProducto { get; private set; }
			public double Precio { get; private set; }
			public TerceroClientePrecioRequestBuilder (int idProducto, double precio) {
				this.Precio = precio;
				this.ProductoId = idProducto;
			}
			public TerceroClientePrecioRequestBuilder SetNombreProducto (string nombreProducto) {
				this.NombreProducto = nombreProducto;
				return this;
			}
			public TerceroClientePrecioRequest Build () {
				TerceroClientePrecioRequest precioRequest = new TerceroClientePrecioRequest (this);
				return precioRequest;
			}
		}
	}
}