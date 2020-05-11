
using System.Collections.Generic;
using System.Linq;

namespace Domain
{
    public class ProductoParaFabricarDuro : ProductoParaFabricar
    {
        public ProductoParaFabricarDuro()
        {
            
        }

        public ProductoParaFabricarDuro(string nombre) : base(nombre)
        {
            this.UnidadDeMedida = UnidadDeMedida.Unidades;
            this.Contestura = Contestura.Duro;
        }

        public ProductoParaFabricarDuro(string nombre, double cantidad,
            double costoUnitario) : base(nombre, cantidad, costoUnitario)
        {
            this.UnidadDeMedida = UnidadDeMedida.Unidades;
            this.Contestura = Contestura.Duro;
        }

        protected override void AplicarCantidad(double cantidad)
        {
            this.Cantidad += cantidad * 60;
            this.GetLastFabricacion().SetCantidad(cantidad * 60);
        }
        
        protected Fabricacion GetLastFabricacion()
        {
            return this.Fabricaciones.Last();
        }
        public override void AgregarFabricacion(Fabricacion fabricacion)
        {
            this.Fabricaciones.Add(fabricacion);
        }
        protected override void ActualizarCosto()
        {
            var ultimaFabricacion = this.GetLastFabricacion();
            if (this.CostoUnitario != 0)
            {
                this.CostoUnitario =
                    (this.CostoUnitario +
                    ultimaFabricacion.Costo / ultimaFabricacion.Cantidad) / 2;
            }
            else
            {
                this.CostoUnitario = ultimaFabricacion.Costo / ultimaFabricacion.Cantidad;
            }
        }
    }
}
