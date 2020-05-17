
using Domain.Entities;
using System.Linq;

namespace Domain
{
    public class ProductoParaFabricarSuave : ProductoParaFabricar
    {
        public ProductoParaFabricarSuave()
        {
        }

        public ProductoParaFabricarSuave(string nombre) : base(nombre)
        {
            this.UnidadDeMedida = UnidadDeMedida.Litros;
        }

        public ProductoParaFabricarSuave(string nombre, double cantidad,
            double costoUnitario) : base(nombre, cantidad, costoUnitario)
        {
            this.UnidadDeMedida = UnidadDeMedida.Litros;
        }
        protected override void AplicarCantidad(double cantidad)
        {
            this.GetLastFabricacion().SetCantidad(cantidad);
        }
        protected Fabricacion GetLastFabricacion()
        {
            return this.Fabricaciones.Last();
        }
        public override void AgregarDetalle(ProductoParaVenderDetalle productoParaVenderDetalle)
        {
            this.ProductoParaVenderDetalles.Add(productoParaVenderDetalle);
        }
        protected override void ActualizarCosto()
        {
            var ultimaFabricacion = this.GetLastFabricacion();
            this.CostoUnitario = (this.CostoUnitario * this.Cantidad +
                ultimaFabricacion.Costo) / (this.Cantidad + ultimaFabricacion.Cantidad);

            this.Cantidad += ultimaFabricacion.Cantidad;
        }
        public override void AgregarFabricacion(Fabricacion fabricacion)
        {
            Fabricaciones.Add(fabricacion);
        }
    }
}
