using Application.Base;
using Domain.Entities;
using Domain.Entities.EntitiesProducto;
using System;
using System.Collections.Generic;

namespace Application.Request
{
    public class FabricacionRequest : Request<int>
    {
        public string NitEmpleado { get; set; }
        public TerceroEmpleadoRequest TerceroEmpleado { get; set; }
        public int IdProducto { get; set; }        
        public double CantidadDeFabricacion { get; set; }
        public double CostoDeFabricacion { get; set; }
        public Especificacion Especificacion { get; set; }
        public List<FabricacionDetalleRequest> Detalles { get; set; }
        public DateTime FechaCreacion { get; set; }

        public FabricacionRequest(string nitEmpleado,int IdProducto,
            double cantidad, double costo, Especificacion especificacion,
            List<FabricacionDetalleRequest> fabricacionDetallesRequest)
        {
            this.IdProducto = IdProducto;
            NitEmpleado = nitEmpleado;
            CantidadDeFabricacion = cantidad;
            CostoDeFabricacion = costo;
            Especificacion = especificacion;
            Detalles = fabricacionDetallesRequest;
        }
        public FabricacionRequest()
        {
            this.Detalles = new List<FabricacionDetalleRequest>();
        }
        public FabricacionRequest Map(Fabricacion fabricacion)
        {
            this.Id = fabricacion.Id;
            NitEmpleado = fabricacion.TerceroEmpleado.Tercero.Nit;
            CantidadDeFabricacion = fabricacion.Cantidad;
            CostoDeFabricacion = fabricacion.Costo;            
            this.FechaCreacion = fabricacion.FechaCreacion;
            this.TerceroEmpleado = new TerceroEmpleadoRequest().Map(fabricacion.TerceroEmpleado);
            if (fabricacion.FabricacionDetalles != null)
            {
                fabricacion.FabricacionDetalles.ForEach((detalle) =>
                {
                    this.Detalles.
                    Add(new FabricacionDetalleRequest().Map(detalle));
                });
            }
            return this;
        }        
    }
}
