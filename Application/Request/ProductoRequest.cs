using Application.Base;
using Domain.Entities.EntitiesProducto;
using System;
using System.Collections.Generic;

namespace Application.Request
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
        public Especificacion Especificacion { get; set; }
        public Tipo Tipo { get; set; }
        public List<FabricacionRequest> Fabricaciones { get; set; }
        public DateTime FechaCreacion { get; set; }
        public string SubCategoria { get; set; }

        public ProductoRequest()
        {
            Fabricaciones = new List<FabricacionRequest>();
        }

        public ProductoRequest(ProductoRequestBuilder productoRequestBuilder)
        {
            this.Id = productoRequestBuilder.Id;
            this.CantidadProducto = productoRequestBuilder.CantidadProducto;
            this.Especificacion = productoRequestBuilder.Especificacion;
            this.Tipo = productoRequestBuilder.Tipo;
            this.CostoUnitarioProducto = productoRequestBuilder.CostoUnitarioProducto;
            this.FechaCreacion = productoRequestBuilder.FechaCreacion;
            this.NombreProducto = productoRequestBuilder.NombreProducto;
            this.PorcentajeDeUtilidadProducto = productoRequestBuilder.PorcentajeDeUtilidadProducto;
            this.SubCategoria = productoRequestBuilder.SubCategoria;
            Fabricaciones = new List<FabricacionRequest>();
        }

        public ProductoRequest Map(Producto producto)
        {
            this.Id = producto.Id;
            Especificacion = producto.Especificacion;
            Tipo = producto.Tipo;
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
                    this.Fabricaciones.Add(new FabricacionRequest()
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
            public Especificacion Especificacion { get; private set; }
            public Tipo Tipo { get; private set; }
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
            public ProductoRequestBuilder SetEspecificacion(Especificacion especificacion)
            {
                this.Especificacion = especificacion;
                return this;
            }
            public ProductoRequestBuilder SetTipo(Tipo tipo)
            {
                this.Tipo = tipo;
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
