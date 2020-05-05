using Domain.Base;
using System.Collections.Generic;
using System.Linq;

namespace Domain
{
    public class Fabricacion : Entity<int>
    {
        public TerceroEmpleado TerceroEmpleado { get; private set; }
        public List<FabricacionDetalle> FabricacionDetalles { get; private set; }
        public double Cantidad { get; set; }
        public double Costo { get; private set; }
        public Fabricacion()
        {

        }
        public Fabricacion(TerceroEmpleado terceroEmpleado,
            List<ProductoMateriaPrima> productoMateriaPrimas)
        {
            this.TerceroEmpleado = terceroEmpleado;
            SetFabricacionDetalles(productoMateriaPrimas);
        }
        public void SetFabricacionDetalles(IEnumerable<ProductoMateriaPrima> materiaPrimas)
        {
            materiaPrimas.ToList().ForEach(
                materiaPrima => FabricacionDetalles.
                Add(new FabricacionDetalle(fabricacion: this, materiaPrima: materiaPrima)));
            CalcularCosto();
        }
        public void SetEmpleado(TerceroEmpleado terceroEmpleado)
        {
            this.TerceroEmpleado = terceroEmpleado;
        }
        private void CalcularCosto()
        {
             this.Costo = FabricacionDetalles.
                Sum(fabricacionDetalle => fabricacionDetalle.Cantidad*fabricacionDetalle.Costo);                
            
        }

    }
}
