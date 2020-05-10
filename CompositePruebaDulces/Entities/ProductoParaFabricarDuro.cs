
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

        protected override void AplicarCantidad(double cantidadProducida)
        {
            this.Cantidad += cantidadProducida * 60;
            this.GetLastFabricacion().SetCantidad(cantidadProducida * 60);
        }        
    }
}
