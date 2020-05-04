using System;
using System.Collections.Generic;
using System.Linq;

namespace Domain
{
    public abstract class ProductoParaFabricar : Producto
    {
        public List<Fabricacion> Fabricaciones { get; private set; }
        public List<ProductoParaVenderDetalle> ProductoParaVenderDetalles { get; set; }
        protected ProductoParaFabricar(string nombre) : base(nombre)
        {
            this.Fabricaciones = new List<Fabricacion>();
        }

        protected ProductoParaFabricar(string nombre, double cantidad,
            double costoUnitario, string unidadDeMedida,
            double porcentajeDeutilidad = 0) : 
            base(nombre, cantidad, costoUnitario, unidadDeMedida, porcentajeDeutilidad)
        {
        }

        public void Preparar(TerceroEmpleado terceroEmpleado,
            List<ProductoMateriaPrima> materiasPrimas)
        {
            Fabricacion fabricacion = new Fabricacion(terceroEmpleado,materiasPrimas);
            Fabricaciones.Add(fabricacion);            
        }
        
        public abstract void AdicionarCantidad(double cantidadProducida);        
    }
}
