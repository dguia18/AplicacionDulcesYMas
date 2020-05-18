using System.Collections.Generic;
using System.Linq;

namespace Domain.Entities.EntitiesProducto
{
    public class ProductoParaVenderSinEnvoltorio : ProductoParaVender
    {
        private double _cantidadProducida;
        public ProductoParaVenderSinEnvoltorio()
        {

        }

        public ProductoParaVenderSinEnvoltorio(string nombre) : base(nombre)
        {
        }

        public ProductoParaVenderSinEnvoltorio(string nombre, double cantidad,
            double costoUnitario, UnidadDeMedida unidad) : 
            base(nombre, cantidad, costoUnitario, unidad)
        {
            this.Envoltorio = Envoltorio.NoTieneEnvoltorio;
        }        

        protected override void ActualizarCosto()
        {
            this.CostoUnitario = (this.Cantidad * this.CostoUnitario + ProductoParaVenderDetalles.
                Sum(producto => producto.Costo)*_cantidadProducida)/(this.Cantidad+this._cantidadProducida) ;

            this.Cantidad += this._cantidadProducida;
        }
        public override void AgregarDetalle(ProductoParaVenderDetalle productoParaVenderDetalle)
        {
            this.ProductoParaVenderDetalles.Add(productoParaVenderDetalle);
        }
        protected override void AplicarCantidad(double cantidad)
        {
            int verificador = 0;
            while (cantidad > 0)
            {
                verificador = ValidarQueTodosLosProductoPuedanDescontarCantidad(verificador);
                cantidad = DescontarUnidades(cantidad, verificador);
                verificador = 0;
            }
        }

        private double DescontarUnidades(double cantidad, int verificador)
        {
            if (verificador == this.ProductoParaVenderDetalles.Count)
            {
                this.ProductoParaVenderDetalles.ForEach(t => t.DescontarUnidades());
                cantidad--;
                _cantidadProducida++;
            }
            else
            {
                cantidad = -1;
            }

            return cantidad;
        }

        private int ValidarQueTodosLosProductoPuedanDescontarCantidad(int verificador)
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
