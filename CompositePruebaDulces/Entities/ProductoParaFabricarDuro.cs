
namespace Domain
{
    public class ProductoParaFabricarDuro : ProductoParaFabricar
    {
        public ProductoParaFabricarDuro(string nombre) : base(nombre)
        {
            this.Contestura = Contestura.Duro;
        }

        protected override void AplicarCantidad(double cantidadProducida)
        {
            this.Cantidad += cantidadProducida * 60;
            this.GetLastFabricacion().SetCantidad(cantidadProducida * 60);
        }        
    }
}
