
namespace Domain
{
    public class FabricacionDetalle
    {
        public Fabricacion Fabricacion { get; private set; }
        public Producto MateriaPrima { get; private set; }
        public int FabricacionId { get; set; }
        public int MateriaPrimaId { get; set; }
        public double Cantidad { get; private set; }
        public double Costo { get; private set; }
        public FabricacionDetalle(Fabricacion fabricacion,
            Producto materiaPrima)
        {
            this.FabricacionId = fabricacion.Id;
            this.MateriaPrimaId = materiaPrima.Id;
            this.Fabricacion = fabricacion;
            this.MateriaPrima = materiaPrima;
            this.Cantidad = materiaPrima.Cantidad;
            this.Costo = materiaPrima.CostoUnitario;
        }
        public FabricacionDetalle()
        {
        }
    }
}
