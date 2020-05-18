using Application.Base;
using Application.Request;
using Domain;
using System;
using System.Collections.Generic;

namespace Application.Services
{
    public class ProductoRequest : Request<int>
    {
        private string _nombreProducto;
        public string NombreProducto
        {
            get => _nombreProducto;
            set => _nombreProducto = value.ToUpper();
        }
        public double CantidadProducto { get; set; }
        public double CostoUnitarioProducto { get; set; }
        public UnidadDeMedida UnidadDeMedidaProducto
        {
            get;
            set;
        }
        public double PorcentajeDeUtilidadProducto { get; set; }
        public Contestura Contestura { get; set; }
        public Envoltorio Envoltorio { get; set; }
        public List<FabricacionRequest> FabricacionesRequest { get; set; }
        public DateTime FechaCreacion { get; set; }
        public string SubCategoria { get; set; }

        public ProductoRequest()
        {
            FabricacionesRequest = new List<FabricacionRequest>();
        }

        public ProductoRequest(ProductoRequestBuilder productoRequestBuilder)
        {
            this.Id = productoRequestBuilder.Id;
            this.CantidadProducto = productoRequestBuilder.CantidadProducto;
            this.Contestura = productoRequestBuilder.Contestura;
            this.Envoltorio = productoRequestBuilder.Envoltorio;
            this.CostoUnitarioProducto = productoRequestBuilder.CostoUnitarioProducto;
            this.FechaCreacion = productoRequestBuilder.FechaCreacion;
            this.NombreProducto = productoRequestBuilder.NombreProducto;
            this.PorcentajeDeUtilidadProducto = productoRequestBuilder.PorcentajeDeUtilidadProducto;
            this.SubCategoria = productoRequestBuilder.SubCategoria;
            FabricacionesRequest = new List<FabricacionRequest>();
        }

        public ProductoRequest Map(Producto producto)
        {
            this.Id = producto.Id;
            Contestura = producto.Contestura;
            Envoltorio = producto.Envoltorio;
            NombreProducto = producto.Nombre;
            CantidadProducto = producto.Cantidad;
            CostoUnitarioProducto = producto.CostoUnitario;
            UnidadDeMedidaProducto = producto.UnidadDeMedida;
            PorcentajeDeUtilidadProducto = producto.PorcentajeDeUtilidad;
            FechaCreacion = producto.FechaCreacion;
            if (producto.Fabricaciones != null)
            {
                producto.Fabricaciones.ForEach((fabricacion) =>
                {
                    this.FabricacionesRequest.Add(new FabricacionRequest()
                        .Map(fabricacion));
                });

            }
            return this;
        }

        public class ProductoRequestBuilder
        {
            public int Id { get; private set; }
            public string NombreProducto
            {
                get;
                private set;
            }
            public double CantidadProducto { get; private set; }
            public double CostoUnitarioProducto { get; private set; }
            public UnidadDeMedida UnidadDeMedidaProducto
            {
                get;
                private set;
            }
            public double PorcentajeDeUtilidadProducto { get; private set; }
            public Contestura Contestura { get; private set; }
            public Envoltorio Envoltorio { get; private set; }
            public DateTime FechaCreacion { get; private set; }
            public string SubCategoria { get; private set; }
            public ProductoRequestBuilder(int id, string nombre)
            {
                this.NombreProducto = nombre.ToUpper();
                this.Id = id;
            }

            public ProductoRequestBuilder SetCantidad(double cantidad)
            {
                this.CantidadProducto = cantidad;
                return this;
            }
            public ProductoRequestBuilder SetCostoUnitario(double costo)
            {
                this.CostoUnitarioProducto = costo;
                return this;
            }
            public ProductoRequestBuilder SetUnidadDeMedida(UnidadDeMedida medida)
            {
                this.UnidadDeMedidaProducto = medida;
                return this;
            }
            public ProductoRequestBuilder SetPorcentajeDeUtilidad(double porcentajeDeUtilidad)
            {
                this.PorcentajeDeUtilidadProducto = porcentajeDeUtilidad;
                return this;
            }
            public ProductoRequestBuilder SetContestura(Contestura contestura)
            {
                this.Contestura = contestura;
                return this;
            }
            public ProductoRequestBuilder SetEnvoltorio(Envoltorio envoltorio)
            {
                this.Envoltorio = envoltorio;
                return this;
            }
            public ProductoRequestBuilder SetFechaCreacion(DateTime fechaCreacion)
            {
                this.FechaCreacion = fechaCreacion;
                return this;
            }
            public ProductoRequestBuilder SetSubCategoria(string subcategoria)
            {
                this.SubCategoria = subcategoria;
                return this;
            }
            public ProductoRequest Build()
            {
                ProductoRequest productoRequest = new ProductoRequest(this);
                return productoRequest;
            }
        }
    }
}
