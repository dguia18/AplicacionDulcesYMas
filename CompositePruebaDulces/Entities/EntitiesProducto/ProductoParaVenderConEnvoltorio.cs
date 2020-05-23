using System.Collections.Generic;
using System.Linq;
using Domain.Contracts;
namespace Domain.Entities.EntitiesProducto
{
    public class ProductoParaVenderConEnvoltorio : ProductoParaVender, IBuilderProducto<ProductoParaVenderConEnvoltorio>
    {
        private double cantidadProducida;        
        public ProductoParaVenderConEnvoltorio()
        {
            this.ProductoParaVenderDetalles = new List<ProductoParaVenderDetalle>();
            this.DetallesCompra = new List<CompraDetalle>();
            this.Especificacion = Especificacion.TieneEnvoltorio;
            this.Tipo = Tipo.ParaVender;
        }
        public override void AgregarDetalle(ProductoParaVenderDetalle productoParaVenderDetalle)
        {
            this.ProductoParaVenderDetalles.Add(productoParaVenderDetalle);
        }
        protected override void ActualizarCosto()
        {
            this.CostoUnitario = (this.CostoUnitario *this.Cantidad + ProductoParaVenderDetalles.
                Sum(producto => producto.Costo)*cantidadProducida
                + Envoltorio.CostoUnitario*cantidadProducida)/(this.Cantidad + cantidadProducida);

            this.Cantidad += this.cantidadProducida;
        }
        
        protected override void AplicarCantidad(double cantidad)
        {
            int verificador = 0;
            while (cantidad > 0)
            {
                if (this.Envoltorio.PuedeDescontarCantidad(1).Any())
                {
                    break;
                }
                verificador = ValidarQueTodosPuedanDescontarCantidad(verificador);
                cantidad = DescontarUnidades(cantidad, verificador);
                verificador = 0;
            }
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
        private double DescontarUnidades(double cantidad, int verificador)
        {
            if (verificador == this.ProductoParaVenderDetalles.Count)
            {
                this.ProductoParaVenderDetalles.
                    ForEach(t => t.DescontarUnidades());

                this.Envoltorio.DescontarCantidad(1);
                cantidad--;
                cantidadProducida++;
            }
            else
            {
                cantidad = -1;
            }

            return cantidad;
        }
        public ProductoParaVenderConEnvoltorio SetCostoUnitario(double costo)
        {
            this.CostoUnitario = costo;
            return this;
        }

        public ProductoParaVenderConEnvoltorio SetCantidad(double cantidad)
        {
            this.Cantidad = cantidad;
            return this;
        }

        public ProductoParaVenderConEnvoltorio SetNombre(string nombre)
        {
            this.Nombre = nombre;
            return this;
        }

        public ProductoParaVenderConEnvoltorio SetUnidadDeMedida(UnidadDeMedida unidadDeMedida)
        {
            this.UnidadDeMedida = unidadDeMedida;
            return this;
        }

        public ProductoParaVenderConEnvoltorio SetPorcentajeDeUtilidad(double porcentajeDeUtilidad)
        {
            this.PorcentajeDeUtilidad = porcentajeDeUtilidad;
            return this;
        }

        public ProductoParaVenderConEnvoltorio SetEspecificacion(Especificacion especificacion)
        {
            this.Especificacion = especificacion;
            return this;
        }

        public ProductoParaVenderConEnvoltorio SetTipo(Tipo tipo)
        {
            this.Tipo = tipo;
            return this;
        }
        
    }
}
