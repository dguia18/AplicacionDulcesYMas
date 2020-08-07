using Domain.Entities.EntitiesProducto;
using System.ComponentModel.DataAnnotations.Schema;

namespace Domain.Entities
{
    public class FabricacionDetalle
    {
        public Fabricacion Fabricacion { get; private set; }
        public Producto MateriaPrima { get; private set; }
        public int FabricacionId { get; set; }
        public int MateriaPrimaId { get; set; }
        [Column(TypeName = "decimal(7,2)")]
        public decimal Cantidad { get; private set; }
        [Column(TypeName = "decimal(7,2)")]
        public decimal Costo { get; private set; }
        public FabricacionDetalle(Fabricacion fabricacion,
            Producto materiaPrima)
        {
            this.FabricacionId = fabricacion.Id;
            this.MateriaPrimaId = materiaPrima.Id;
            this.Fabricacion = fabricacion;
            this.MateriaPrima = materiaPrima;
            this.Costo = materiaPrima.CostoUnitario;
        }
        public FabricacionDetalle(Fabricacion fabricacion,
            Producto materiaPrima, decimal cantidad)
        {
            this.FabricacionId = fabricacion.Id;
            this.MateriaPrimaId = materiaPrima.Id;
            this.Fabricacion = fabricacion;
            this.MateriaPrima = materiaPrima;
            this.Cantidad = cantidad;
            this.Costo = materiaPrima.CostoUnitario;
        }
        public FabricacionDetalle()
        {
        }
        public FabricacionDetalle SetCantidad(decimal cantidad)
        {
            this.Cantidad = cantidad;
            return this;
        }        
    }
}
