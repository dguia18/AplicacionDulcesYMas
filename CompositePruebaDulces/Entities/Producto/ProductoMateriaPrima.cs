using System.Collections.Generic;
using System.Linq;

namespace Domain
{
    public class ProductoMateriaPrima : Producto
    {
        public List<FabricacionDetalle> FabricacionDetalles { get; set; }              

        public ProductoMateriaPrima(string nombre, double cantidad,
            double costoUnitario, UnidadDeMedida unidad) : 
            base(nombre, cantidad, costoUnitario, unidad)
        {
            FabricacionDetalles = new List<FabricacionDetalle>();

        }
        public ProductoMateriaPrima()
        {
            FabricacionDetalles = new List<FabricacionDetalle>();
        }		

		protected override void ActualizarCosto()
        {
            var ultimaCompra = this.DetallesCompra.Last();
            if (this.CostoUnitario != 0)
                this.CostoUnitario = (this.CostoUnitario + ultimaCompra.Valor / ultimaCompra.Cantidad) / 2;
            else
                this.CostoUnitario = ultimaCompra.Valor / ultimaCompra.Cantidad;
        }

        protected override void AplicarCantidad(double cantidad)
        {
            this.Cantidad += cantidad;
        }
    }
}
