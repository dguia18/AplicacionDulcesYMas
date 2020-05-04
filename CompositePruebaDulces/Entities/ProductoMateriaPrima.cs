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
            double costoUnitario, string unidadDeMedida,
            double porcentajeDeutilidad = 0) : 
            base(nombre, cantidad, costoUnitario, unidadDeMedida, porcentajeDeutilidad)
        {
        }

        public ProductoMateriaPrima(string nombre, double cantidad,
            double costoUnitario, string unidad) : 
            base(nombre, cantidad, costoUnitario, unidad)
        {
        }
    }
}
