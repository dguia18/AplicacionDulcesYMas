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
            this.FabricacionDetalles = new List<FabricacionDetalle>();
        }
        public Fabricacion(TerceroEmpleado terceroEmpleado)
        {
            this.TerceroEmpleado = terceroEmpleado;
            this.FabricacionDetalles = new List<FabricacionDetalle>();
        }
        public void AgregarDetalle(FabricacionDetalle detalle)
        {
            this.FabricacionDetalles.Add(detalle);
            this.Costo += detalle.Cantidad * detalle.MateriaPrima.CostoUnitario;
        }        
        public void SetEmpleado(TerceroEmpleado terceroEmpleado)
        {
            this.TerceroEmpleado = terceroEmpleado;
        }
        private void ActualizarCosto()
        {
             this.Costo = FabricacionDetalles.
                Sum(fabricacionDetalle => fabricacionDetalle.Cantidad*fabricacionDetalle.Costo);                            
        }
        public void SetCantidad(double cantidadProducida)
        {
            this.Cantidad = cantidadProducida;
        }
    }
}
