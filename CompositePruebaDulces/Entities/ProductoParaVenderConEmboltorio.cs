using System.Collections.Generic;
using System.Linq;

namespace Domain
{
    public class ProductoParaVenderConEmboltorio : ProductoParaVender
    {       
        public ProductoParaVenderConEmboltorio(string nombre, double cantidad,
            double costoUnitario, string unidad) :
            base(nombre, cantidad, costoUnitario, unidad)
        {
        }

        public ProductoParaVenderConEmboltorio(string nombre,
            Producto productoMateriaPrima) : base(nombre)
        {
            this.EmboltorioProducto = productoMateriaPrima;
        }

        public ProductoParaVenderConEmboltorio()
        {
        }

        public override void Preparar(double cantidad)
        {
            int verificador = 0;
            while (cantidad > 0)
            {
                if(this.EmboltorioProducto.PuedeDescontarCantidad(1).Any())
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
                Sum(producto => producto.Costo)
                + EmboltorioProducto.CostoUnitario;
        }
    }
}
