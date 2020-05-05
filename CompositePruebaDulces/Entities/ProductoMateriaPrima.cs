using Domain.Base;
using System;
using System.Collections.Generic;
using System.Text;

namespace Domain
{
    public class ProductoMateriaPrima : Producto
    {
        public IEnumerable<FabricacionDetalle> FabricacionDetalles { get; set; }              

        public ProductoMateriaPrima(string nombre, double cantidad,
            double costoUnitario, string unidad) : 
            base(nombre, cantidad, costoUnitario, unidad)
        {
        }
        public ProductoMateriaPrima()
        {

        }

        protected override void ActualizarCosto()
        {            
        }
    }
}
