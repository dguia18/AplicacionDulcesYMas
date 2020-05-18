using Application.Base;
using Domain;
using Domain.Entities;
using System;
using System.Collections.Generic;
using System.Text;

namespace Application.Request
{
    public class FabricacionRequest : Request<int>
    {
        public string NitEmpleado { get; set; }
        private string _nombreProductoParaFabricar;
        public string NombreProductoParaFabricar 
        {
            get => _nombreProductoParaFabricar.ToUpper(); 
            set => _nombreProductoParaFabricar = value; 
        }
        public double Cantidad { get; set; }
        public double Costo { get; set; }
        public Contestura Contestura { get; set; }
        public List<FabricacionDetalleRequest> FabricacionDetallesRequest { get; set; }
        public DateTime FechaCreacion { get; set; }

        public FabricacionRequest(string nitEmpleado, string nombreProductoParaFabricar,
            double cantidad, double costo, Contestura contestura,
            List<FabricacionDetalleRequest> fabricacionDetallesRequest)
        {
            NitEmpleado = nitEmpleado;
            NombreProductoParaFabricar = nombreProductoParaFabricar;
            Cantidad = cantidad;
            Costo = costo;
            Contestura = contestura;
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
            fabricacion.FabricacionDetalles.ForEach((detalle) =>
            {
                this.FabricacionDetallesRequest.
                Add(new FabricacionDetalleRequest().Map(detalle));
            });
            return this;
        }
        public FabricacionRequest SetNombre(string nombre)
        {
            this.NombreProductoParaFabricar = nombre;
            return this;
        }
    }
}
