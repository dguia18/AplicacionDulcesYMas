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
        public double Costo { get => FabricacionDetalles.
                GroupBy(fabricacion=> fabricacion.FabricacionId).
                Select(x=> x.
                Sum(a => a.Costo*a.Cantidad)).
                FirstOrDefault(); }
        public Fabricacion(TerceroEmpleado terceroEmpleado)
        {
            this.TerceroEmpleado = terceroEmpleado;
            this.FabricacionDetalles = new List<FabricacionDetalle>();
        }
        public void SetFabricacionDetalles(IEnumerable<ProductoMateriaPrima> materiaPrimas)
        {
            materiaPrimas.ToList().ForEach(
                materiaPrima => FabricacionDetalles.
                Add(new FabricacionDetalle(fabricacion: this, materiaPrima: materiaPrima)));            
        }

    }
}
