
using Domain.Entities;

namespace Application.Request
{
    public class FabricacionDetalleRequest
    {
        public int IdMateriaPrima { get; set; }
        private string _nombreMateriaPrima;
        public string NombreMateriaPrima 
        {
            get => _nombreMateriaPrima;
            set => _nombreMateriaPrima = value.ToUpper();
        }
        public decimal CantidadMateriaPrima { get; set; }

        public FabricacionDetalleRequest(string nombreMateriaPrima,
            decimal cantidadMateriaPrima)
        {
            NombreMateriaPrima = nombreMateriaPrima;
            CantidadMateriaPrima = cantidadMateriaPrima;
        }
        public FabricacionDetalleRequest()
        {

        }

        public FabricacionDetalleRequest(FabricacionDetalleRequestBuilder builder)
        {
            this.NombreMateriaPrima = builder.NombreMateriaPrima;
            this.IdMateriaPrima = builder.IdMateriaPrima;
            this.CantidadMateriaPrima = builder.CantidadMateriaPrima;
        }

        public FabricacionDetalleRequest Map(FabricacionDetalle detalle)
        {
            this.IdMateriaPrima = detalle.MateriaPrimaId;
            CantidadMateriaPrima = detalle.Cantidad;
            NombreMateriaPrima = detalle.MateriaPrima.Nombre;
            return this;
        }
        public class FabricacionDetalleRequestBuilder
        {
            public int IdMateriaPrima { get; set; }
            private string _nombreMateriaPrima;
            public string NombreMateriaPrima
            {
                get => _nombreMateriaPrima;
                set => _nombreMateriaPrima = value.ToUpper();
            }
            public decimal CantidadMateriaPrima { get; set; }
            public FabricacionDetalleRequestBuilder(int id, decimal cantidad)
            {
                this.IdMateriaPrima = id;
                this.CantidadMateriaPrima = cantidad;
            }
            public FabricacionDetalleRequestBuilder SetNombre(string nombre)
            {
                this.NombreMateriaPrima = nombre;
                return this;
            }
            public FabricacionDetalleRequest Build()
            {
                FabricacionDetalleRequest fabricacionDetalle = new FabricacionDetalleRequest(this);
                return fabricacionDetalle;
            }
        }
    }
}
