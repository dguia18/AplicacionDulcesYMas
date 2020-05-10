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
            double costoUnitario, UnidadDeMedida unidadDeMedida,
            double porcentajeDeutilidad = 0) : 
            base(nombre, cantidad, costoUnitario, unidadDeMedida, porcentajeDeutilidad)
        {
        }

        protected ProductoParaFabricar(string nombre, double cantidad, double costoUnitario) : base(nombre, cantidad, costoUnitario)
        {
        }

        protected ProductoParaFabricar()
        {
        }

        public void AgregarFabricacion(Fabricacion fabricacion)
        {            
            Fabricaciones.Add(fabricacion);            
        }
        protected Fabricacion GetLastFabricacion()
        {
            return this.Fabricaciones.Last();
        }        
        public void AdicionarCantidad(double cantidadProducida)
        {            
            this.AplicarCantidad(cantidadProducida);            
            this.ActualizarCosto();
        }
        protected abstract void AplicarCantidad(double cantidadProducida);        
        protected override void ActualizarCosto()
        {
            var ultimaFabricacion = this.GetLastFabricacion();
            if (this.CostoUnitario != 0)
            {
            this.CostoUnitario =
                (this.CostoUnitario + 
                ultimaFabricacion.Costo/ultimaFabricacion.Cantidad) / 2;
            }
            else
            {
                this.CostoUnitario = ultimaFabricacion.Costo / ultimaFabricacion.Cantidad;
            }
        }        
    }
}
