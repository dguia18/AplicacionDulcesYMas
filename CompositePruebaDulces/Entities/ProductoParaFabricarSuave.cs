
namespace Domain
{
    public class ProductoParaFabricarSuave : ProductoParaFabricar
    {

        public ProductoParaFabricarSuave(string nombre) : base(nombre)
        {
            this.UnidadDeMedida = UnidadDeMedida.Litros;
        }

        public ProductoParaFabricarSuave(string nombre, double cantidad,
            double costoUnitario) : base(nombre, cantidad, costoUnitario)
        {
            this.UnidadDeMedida = UnidadDeMedida.Litros;
        }

        protected override void AplicarCantidad(double cantidadProducida)
        {
            this.Cantidad += cantidadProducida;
            this.GetLastFabricacion().SetCantidad(cantidadProducida);
        }       
    }
}
