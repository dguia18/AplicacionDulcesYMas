using System.Collections.Generic;
using System.Linq;

namespace Domain
{
    public class ProductoParaVenderConEnvoltorio : ProductoParaVender
    {
        public ProductoParaVenderConEnvoltorio(string nombre, double cantidad,
            double costoUnitario, UnidadDeMedida unidad) :
            base(nombre, cantidad, costoUnitario, unidad)
        {
            this.Envoltorio = Envoltorio.TieneEnvoltorio;
            this.ProductoParaVenderDetalles = new List<ProductoParaVenderDetalle>();
        }

        public ProductoParaVenderConEnvoltorio(string nombre,
            Producto productoMateriaPrima) : base(nombre)
        {
            this.EnvoltorioProducto = productoMateriaPrima;
            this.Envoltorio = Envoltorio.TieneEnvoltorio;
            this.ProductoParaVenderDetalles = new List<ProductoParaVenderDetalle>();
        }

        public ProductoParaVenderConEnvoltorio()
        {
            this.ProductoParaVenderDetalles = new List<ProductoParaVenderDetalle>();
        }
        public override void AgregarDetalle(ProductoParaVenderDetalle productoParaVenderDetalle)
        {
            this.ProductoParaVenderDetalles.Add(productoParaVenderDetalle);
        }
        protected override void ActualizarCosto()
        {
            this.CostoUnitario = ProductoParaVenderDetalles.
                Sum(producto => producto.Costo)
                + EnvoltorioProducto.CostoUnitario;
        }
        
        protected override void AplicarCantidad(double cantidadProducida)
        {
            int verificador = 0;
            while (cantidadProducida > 0)
            {
                if (this.EnvoltorioProducto.PuedeDescontarCantidad(1).Any())
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
                    this.EnvoltorioProducto.DescontarCantidad(1);
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
