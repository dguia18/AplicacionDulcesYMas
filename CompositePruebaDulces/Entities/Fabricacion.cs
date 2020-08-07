using Domain.Base;
using Domain.Entities.Tercero;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;

namespace Domain.Entities
{
    public class Fabricacion : Entity<int>
    {
        public TerceroEmpleado TerceroEmpleado { get; private set; }
        public List<FabricacionDetalle> FabricacionDetalles { get; private set; }
        [Column(TypeName = "decimal(7,2)")]
        public decimal Cantidad { get; set; }
        [Column(TypeName = "decimal(7,2)")]
        public decimal Costo { get; private set; }
        public DateTime FechaCreacion { get; set; } = DateTime.Now;
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
        public void SetCantidad(decimal cantidadProducida)
        {
            this.Cantidad = cantidadProducida;
        }

        public void DescontarCantidadesEnMateriasPrimas()
        {
            this.FabricacionDetalles.ForEach(detalle =>
            {
                detalle.MateriaPrima.DescontarCantidad(detalle.Cantidad);
            });
        }
    }
}
