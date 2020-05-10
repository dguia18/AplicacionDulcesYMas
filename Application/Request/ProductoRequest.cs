﻿using Application.Base;
using Domain;

namespace Application.Services
{
    public class ProductoRequest
    {
        private string _nombreProducto;
        public string NombreProducto 
        { 
            get => _nombreProducto;
            set => _nombreProducto =value.ToUpper(); 
        }
        public double CantidadProducto { get; set; }
        public virtual double CostoUnitarioProducto { get ; set ; }
        public UnidadDeMedida UnidadDeMedidaProducto 
        { 
            get ; 
            set ; 
        }
        public double PorcentajeDeUtilidadProducto { get; set; }
        public Contestura Contestura { get; protected set; } = Contestura.NoAplica;
        public Emboltorio Emboltorio { get; protected set; } = Emboltorio.NoAplica;

        public ProductoRequest(string nombreProducto, double cantidadProducto,
            double costoUnitarioProducto, UnidadDeMedida unidadDeMedidaProducto,
            double porcentajeDeUtilidadProducto)
        {
            NombreProducto = nombreProducto;
            CantidadProducto = cantidadProducto;
            CostoUnitarioProducto = costoUnitarioProducto;
            UnidadDeMedidaProducto = unidadDeMedidaProducto;
            PorcentajeDeUtilidadProducto = porcentajeDeUtilidadProducto;
        }
        public ProductoRequest()
        {

        }
        public ProductoRequest Map(Producto producto)
        {
            NombreProducto = producto.Nombre;
            CantidadProducto = producto.Cantidad;
            CostoUnitarioProducto = producto.CostoUnitario;
            UnidadDeMedidaProducto = producto.UnidadDeMedida;
            PorcentajeDeUtilidadProducto = producto.PorcentajeDeUtilidad;
            return this;
        }
    }
    public class ProductoResponse : BaseEntityResponse
    {
        public string Mensaje { get; set; }
        public object Datos { get; set; }
    }
}
