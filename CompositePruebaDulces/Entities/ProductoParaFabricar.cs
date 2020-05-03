using System;
using System.Collections.Generic;
using System.Linq;

namespace Domain
{
    public abstract class ProductoParaFabricar : Producto
    {
        public List<Fabricacion> Fabricaciones { get; private set; }
        public List<ProductoParaVenderDetalle> ProductoParaVenderDetalles { get; set; }
        protected ProductoParaFabricar(string nombre)
        {
            this.Nombre = nombre;
            this.Fabricaciones = new List<Fabricacion>();
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
