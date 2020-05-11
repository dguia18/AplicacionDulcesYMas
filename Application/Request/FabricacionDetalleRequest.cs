
using Domain;

namespace Application.Request
{
    public class FabricacionDetalleRequest
    {
        private string _nombreMateriaPrima;
        public string NombreMateriaPrima 
        {
            get => _nombreMateriaPrima;
            set => _nombreMateriaPrima = value.ToUpper();
        }
        public double CantidadMateriaPrima { get; set; }

        public FabricacionDetalleRequest(string nombreMateriaPrima,
            double cantidadMateriaPrima)
        {
            NombreMateriaPrima = nombreMateriaPrima;
            CantidadMateriaPrima = cantidadMateriaPrima;
        }
        public FabricacionDetalleRequest()
        {

        }

        public FabricacionDetalleRequest Map(FabricacionDetalle detalle)
        {
            CantidadMateriaPrima = detalle.Cantidad;
            NombreMateriaPrima = detalle.MateriaPrima.Nombre;
            return this;
        }
    }
}
