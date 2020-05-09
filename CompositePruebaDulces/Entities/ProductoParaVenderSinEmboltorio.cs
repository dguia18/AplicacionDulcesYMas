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
            double costoUnitario, string unidad) : 
            base(nombre, cantidad, costoUnitario, unidad)
        {
        }

        public override void Preparar(double cantidad)
        {
            int verificador = 0;
            while (cantidad > 0)
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
                    cantidad--;
                    this.Cantidad++;
                }
                else
                {
                    cantidad = -1;
                }
                verificador = 0;
            }
            this.ActualizarCosto();
        }

        protected override void ActualizarCosto()
        {
            this.CostoUnitario = ProductoParaVenderDetalles.
                Sum(producto => producto.Costo);
        }
    }
}
