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
        public int IdProducto { get; set; }        
        public double Cantidad { get; set; }
        public double Costo { get; set; }
        public Especificacion Especificacion { get; set; }
        public List<FabricacionDetalleRequest> FabricacionDetallesRequest { get; set; }
        public DateTime FechaCreacion { get; set; }

        public FabricacionRequest(string nitEmpleado,int IdProducto,
            double cantidad, double costo, Especificacion especificacion,
            List<FabricacionDetalleRequest> fabricacionDetallesRequest)
        {
            this.IdProducto = IdProducto;
            NitEmpleado = nitEmpleado;
            Cantidad = cantidad;
            Costo = costo;
            Especificacion = especificacion;
            FabricacionDetallesRequest = fabricacionDetallesRequest;
        }
        public FabricacionRequest()
        {
            this.FabricacionDetallesRequest = new List<FabricacionDetalleRequest>();
        }
        public FabricacionRequest Map(Fabricacion fabricacion)
        {
            this.Id = fabricacion.Id;
            NitEmpleado = fabricacion.TerceroEmpleado.Tercero.Nit;
            Cantidad = fabricacion.Cantidad;
            Costo = fabricacion.Costo;            
            this.FechaCreacion = fabricacion.FechaCreacion;
            if (fabricacion.FabricacionDetalles != null)
            {
                fabricacion.FabricacionDetalles.ForEach((detalle) =>
                {
                    this.FabricacionDetallesRequest.
                    Add(new FabricacionDetalleRequest().Map(detalle));
                });
            }
            return this;
        }        
    }
}
