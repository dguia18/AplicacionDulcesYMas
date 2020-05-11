using Application.Base;
using Application.Request;
using Domain;
using System.Collections.Generic;

namespace Application.Services
{
    public class ProductoRequest
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
        public Emboltorio Emboltorio { get; set; }
        List<FabricacionRequest> FabricacionesRequest = new List<FabricacionRequest>();

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
        public ProductoRequest(string nombreProducto, double cantidadProducto,
            double costoUnitarioProducto, UnidadDeMedida unidadDeMedidaProducto,
            double porcentajeDeUtilidadProducto,Contestura contestura)
        {
            NombreProducto = nombreProducto;
            CantidadProducto = cantidadProducto;
            CostoUnitarioProducto = costoUnitarioProducto;
            UnidadDeMedidaProducto = unidadDeMedidaProducto;
            PorcentajeDeUtilidadProducto = porcentajeDeUtilidadProducto;
            Contestura = contestura;
        }
        public ProductoRequest(string nombreProducto, double cantidadProducto,
            double costoUnitarioProducto, UnidadDeMedida unidadDeMedidaProducto,
            double porcentajeDeUtilidadProducto, Emboltorio emboltorio)
        {
            NombreProducto = nombreProducto;
            CantidadProducto = cantidadProducto;
            CostoUnitarioProducto = costoUnitarioProducto;
            UnidadDeMedidaProducto = unidadDeMedidaProducto;
            PorcentajeDeUtilidadProducto = porcentajeDeUtilidadProducto;
            Emboltorio = emboltorio;
        }
        public ProductoRequest()
        {

        }
        public ProductoRequest Map(Producto producto)
        {
            Contestura = producto.Contestura;
            Emboltorio = producto.Emboltorio;
            NombreProducto = producto.Nombre;
            CantidadProducto = producto.Cantidad;
            CostoUnitarioProducto = producto.CostoUnitario;
            UnidadDeMedidaProducto = producto.UnidadDeMedida;
            PorcentajeDeUtilidadProducto = producto.PorcentajeDeUtilidad;
            if (producto.Fabricaciones != null)
            {
                producto.Fabricaciones.ForEach((fabricacion) =>
                {                 
                    this.FabricacionesRequest.Add(new FabricacionRequest().Map(fabricacion));
                });

            }
            return this;
        }
    }
    public class ProductoResponse : BaseEntityResponse
    {
        public string Mensaje { get; set; }
        public object Datos { get; set; }
    }
}
