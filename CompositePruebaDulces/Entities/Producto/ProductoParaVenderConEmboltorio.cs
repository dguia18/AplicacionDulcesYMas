using System.Collections.Generic;
using System.Linq;

namespace Domain
{
    public class ProductoParaVenderConEnvoltorio : ProductoParaVender
    {
        private double cantidadTemp;
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
            this.CostoUnitario = (this.CostoUnitario *this.Cantidad + ProductoParaVenderDetalles.
                Sum(producto => producto.Costo)*cantidadTemp
                + EnvoltorioProducto.CostoUnitario*cantidadTemp)/(this.Cantidad + cantidadTemp);

            this.Cantidad += this.cantidadTemp;
        }
        
        protected override void AplicarCantidad(double cantidad)
        {
            int verificador = 0;
            while (cantidad > 0)
            {
                if (this.EnvoltorioProducto.PuedeDescontarCantidad(1).Any())
                {
                    break;
                }
                verificador = ValidarQueTodosPuedanDescontarCantidad(verificador);
                cantidad = DescontarUnidades(cantidad, verificador);
                verificador = 0;
            }
        }

        private double DescontarUnidades(double cantidad, int verificador)
        {
            if (verificador == this.ProductoParaVenderDetalles.Count)
            {
                this.ProductoParaVenderDetalles.ForEach(t => t.DescontarUnidades());
                this.EnvoltorioProducto.DescontarCantidad(1);
                cantidad--;
                cantidadTemp++;
            }
            else
            {
                cantidad = -1;
            }

            return cantidad;
        }

        private int ValidarQueTodosPuedanDescontarCantidad(int verificador)
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

            return verificador;
        }
    }
}
