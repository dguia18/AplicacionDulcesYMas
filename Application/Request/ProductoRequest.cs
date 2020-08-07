﻿using Application.Base;
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
        public decimal CantidadProducto { get; set; }
        public decimal CostoUnitarioProducto { get; set; }
        public UnidadDeMedida UnidadDeMedidaProducto
        {
            get;
            set;
        }
        public decimal PorcentajeDeUtilidadProducto { get; set; }
        public Especificacion Especificacion { get; set; }
        public Tipo Tipo { get; set; }
        public List<FabricacionRequest> Fabricaciones { get; set; }
        public DateTime FechaCreacion { get; set; }
        public int IdSubCategoria { get; set; }
        public ProductoSubCategoriaRequest SubCategoriaProducto { get; set; }
        public ProductoRequest Emboltorio { get; set; }
        public int IdEmboltorio { get; set; }
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
            this.IdSubCategoria = productoRequestBuilder.IdSubCategoria;
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
            this.IdSubCategoria = producto.SubCategoriaId;
            if(producto.SubCategoria != null)
                this.SubCategoriaProducto = new ProductoSubCategoriaRequest()
                    .Map(producto.SubCategoria);

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
            public decimal CantidadProducto { get; private set; }
            public decimal CostoUnitarioProducto { get; private set; }
            public UnidadDeMedida UnidadDeMedidaProducto
            {
                get;
                private set;
            }
            public decimal PorcentajeDeUtilidadProducto { get; private set; }
            public Especificacion Especificacion { get; private set; }
            public Tipo Tipo { get; private set; }
            public DateTime FechaCreacion { get; private set; }
            public int IdSubCategoria { get; private set; }
            public ProductoRequestBuilder(int id, string nombre)
            {
                this.NombreProducto = nombre.ToUpper();
                this.Id = id;
            }

            public ProductoRequestBuilder SetCantidad(decimal cantidad)
            {
                this.CantidadProducto = cantidad;
                return this;
            }
            public ProductoRequestBuilder SetCostoUnitario(decimal costo)
            {
                this.CostoUnitarioProducto = costo;
                return this;
            }
            public ProductoRequestBuilder SetUnidadDeMedida(UnidadDeMedida medida)
            {
                this.UnidadDeMedidaProducto = medida;
                return this;
            }
            public ProductoRequestBuilder SetPorcentajeDeUtilidad(decimal porcentajeDeUtilidad)
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
            public ProductoRequestBuilder SetSubCategoria(int subcategoria)
            {
                this.IdSubCategoria = subcategoria;
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
