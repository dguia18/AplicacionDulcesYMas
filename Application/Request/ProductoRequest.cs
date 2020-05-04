using Application.Base;

namespace Application.Services
{
    public class ProductoRequest
    {
        public string NombreProducto { get; set; }
        public double CantidadProducto { get; set; }
        public virtual double CostoUnitarioProducto { get ; set ; }
        public string UnidadDeMedidaProducto { get; set; }
        public double PorcentajeDeUtilidadProducto { get; set; }

        public double PrecioDeVentaProducto { get;}        
       
    }
    public class ProductoResponse : BaseEntityResponse
    {
        public string Nombre { get; set; }
    }
}
