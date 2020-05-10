using System.Collections.Generic;
using System.Linq;

namespace Domain
{
    public class ProductoParaVenderConEmboltorio : ProductoParaVender
    {
        public ProductoParaVenderConEmboltorio(string nombre, double cantidad,
            double costoUnitario, UnidadDeMedida unidad) :
            base(nombre, cantidad, costoUnitario, unidad)
        {
            this.Emboltorio = Emboltorio.TieneEmboltorio;
        }

        public ProductoParaVenderConEmboltorio(string nombre,
            Producto productoMateriaPrima) : base(nombre)
        {
            this.EmboltorioProducto = productoMateriaPrima;
            this.Emboltorio = Emboltorio.TieneEmboltorio;
        }

        public ProductoParaVenderConEmboltorio()
        {
        }
    
        protected override void ActualizarCosto()
        {
            this.CostoUnitario = ProductoParaVenderDetalles.
                Sum(producto => producto.Costo)
                + EmboltorioProducto.CostoUnitario;
        }

        protected override void AplicarCantidad(double cantidadProducida)
        {
            int verificador = 0;
            while (cantidadProducida > 0)
            {
                if (this.EmboltorioProducto.PuedeDescontarCantidad(1).Any())
                {
                    break;
                }
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
                    this.EmboltorioProducto.DescontarCantidad(1);
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
