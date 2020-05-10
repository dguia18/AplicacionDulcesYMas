using System.Collections.Generic;

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
        }

        protected override void AplicarCantidad(double cantidadProducida)
        {
            throw new System.NotImplementedException();
        }
    }
}
