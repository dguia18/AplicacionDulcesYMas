using Application.Base;
using Domain.Entities;
using System;
using System.Collections.Generic;

namespace Application.Request
{
    public class CompraRequest : Request<int>
    {
        public string NitProvedor { get; set; }
        public string Usuario { get; set; }
        public double Total { get; set; }
        public DateTime Fecha { get; set; }
        public List<CompraDetalleRequest> Detalles { get; set; }
        public CompraRequest()
        {
            Detalles = new List<CompraDetalleRequest>();
        }

        public CompraRequest(CompraRequestBuilder builder)
        {
            this.Usuario = builder.Usuario.ToLower();
            this.NitProvedor = builder.NitProvedor;
            this.Fecha = builder.Fecha;
            this.Detalles = builder.Detalles;
        }

        public CompraRequest Map(Compra compra)
        {
            this.Id = compra.Id;
            this.NitProvedor = compra.Proveedor.Tercero.Nit;
            this.Usuario = compra.Usuario.Usuario;
            this.Total = compra.Total;
            compra.DetallesCompra.ForEach((detalle) =>
            {
                this.Detalles.Add(new CompraDetalleRequest().Map(detalle));
            });
            return this;
        }
        public class CompraRequestBuilder
        {
            public string NitProvedor { get; private set; }
            public string Usuario { get; private set; }
            public DateTime Fecha { get; private set; }
            public List<CompraDetalleRequest> Detalles { get; private set; }
            public CompraRequestBuilder(string nitProvedor,string usuario)
            {
                this.NitProvedor = nitProvedor;
                this.Usuario = usuario;
                this.Fecha = DateTime.Now;
            }
            public CompraRequestBuilder SetDetalles(List<CompraDetalleRequest> compraDetalles)
            {
                this.Detalles = compraDetalles;
                return this;
            }
            public CompraRequest Build()
            {
                CompraRequest compra= new CompraRequest(this);
                return compra;
            }
        }
    }
}
