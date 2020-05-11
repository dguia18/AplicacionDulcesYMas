using System.Collections.Generic;
using System.Linq;

namespace Domain
{
    public class ProductoParaVenderSinEmboltorio : ProductoParaVender
    {
        public ProductoParaVenderSinEmboltorio()
        {

        }

        public ProductoParaVenderSinEmboltorio(string nombre) : base(nombre)
        {
        }

        public ProductoParaVenderSinEmboltorio(string nombre, double cantidad,
            double costoUnitario, UnidadDeMedida unidad) : 
            base(nombre, cantidad, costoUnitario, unidad)
        {
            this.Emboltorio = Emboltorio.NoTieneEmboltorio;
        }        

        protected override void ActualizarCosto()
        {
            this.CostoUnitario = ProductoParaVenderDetalles.
                Sum(producto => producto.Costo);
        }
        public override void AgregarDetalle(ProductoParaVenderDetalle productoParaVenderDetalle)
        {
            this.ProductoParaVenderDetalles.Add(productoParaVenderDetalle);
        }
        protected override void AplicarCantidad(double cantidadProducida)
        {
            int verificador = 0;
            while (cantidadProducida > 0)
            {

                foreach (var item in this.ProductoParaVenderDetalles)
                {
                    if (item.PuedeDescontarUnidades().Any())
                    {
                        break;
                    }
                    else
                    {
                        verificador++;
                    }
                }
                if (verificador == this.ProductoParaVenderDetalles.Count)
                {
                    this.ProductoParaVenderDetalles.ForEach(t => t.DescontarUnidades());
                    cantidadProducida--;
                    this.Cantidad++;
                }
                else
                {
                    cantidadProducida = -1;
                }
                verificador = 0;
            }
        }
    }
}
