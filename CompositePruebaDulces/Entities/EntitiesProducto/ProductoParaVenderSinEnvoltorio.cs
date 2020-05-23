using System.Collections.Generic;
using System.Linq;
using Domain.Contracts;
namespace Domain.Entities.EntitiesProducto
{
    public class ProductoParaVenderSinEnvoltorio : ProductoParaVender,IBuilderProducto<ProductoParaVenderSinEnvoltorio>
    {
        private double _cantidadProducida;
        public ProductoParaVenderSinEnvoltorio()
        {
            this.DetallesCompra = new List<CompraDetalle>();
            this.SetEspecificacion(Especificacion.TieneEnvoltorio);
            this.SetTipo(Tipo.ParaVender);
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
		        public ProductoParaVenderSinEnvoltorio SetCostoUnitario(double costo)
        {
            this.CostoUnitario = costo;
            return this;
        }

        public ProductoParaVenderSinEnvoltorio SetCantidad(double cantidad)
        {
            this.Cantidad = cantidad;
            return this;
        }

        public ProductoParaVenderSinEnvoltorio SetNombre(string nombre)
        {
            this.Nombre = nombre;
            return this;
        }

        public ProductoParaVenderSinEnvoltorio SetUnidadDeMedida(UnidadDeMedida unidadDeMedida)
        {
            this.UnidadDeMedida = unidadDeMedida;
            return this;
        }

        public ProductoParaVenderSinEnvoltorio SetPorcentajeDeUtilidad(double porcentajeDeUtilidad)
        {
            this.PorcentajeDeUtilidad = porcentajeDeUtilidad;
            return this;
        }

        public ProductoParaVenderSinEnvoltorio SetEspecificacion(Especificacion especificacion)
        {
            this.Especificacion = especificacion;
            return this;
        }

        public ProductoParaVenderSinEnvoltorio SetTipo(Tipo tipo)
        {
            this.Tipo = tipo;
            return this;
        }
    }
}
