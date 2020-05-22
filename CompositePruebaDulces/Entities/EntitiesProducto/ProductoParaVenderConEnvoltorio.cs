using System.Collections.Generic;
using System.Linq;
using Domain.Contracts;
namespace Domain.Entities.EntitiesProducto
{
    public class ProductoParaVenderConEnvoltorio : ProductoParaVender, IBuilderProducto<ProductoParaVenderConEnvoltorio>
    {
        private double cantidadProducida;
        public ProductoParaVenderConEnvoltorio(string nombre, double cantidad,
            double costoUnitario, UnidadDeMedida unidad) :
            base(nombre, cantidad, costoUnitario, unidad)
        {
            this.Tipo = Tipo.ParaVender;
            this.Especificacion = Especificacion.TieneEnvoltorio;
            this.ProductoParaVenderDetalles = new List<ProductoParaVenderDetalle>();
        }

        public ProductoParaVenderConEnvoltorio(string nombre,
            Producto productoMateriaPrima) : base(nombre)
        {
            this.EnvoltorioProducto = productoMateriaPrima;
            this.Tipo = Tipo.ParaVender;
            this.Especificacion = Especificacion.TieneEnvoltorio;
            this.ProductoParaVenderDetalles = new List<ProductoParaVenderDetalle>();
        }

        public ProductoParaVenderConEnvoltorio()
        {
            this.ProductoParaVenderDetalles = new List<ProductoParaVenderDetalle>();
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
                + EnvoltorioProducto.CostoUnitario*cantidadProducida)/(this.Cantidad + cantidadProducida);

            this.Cantidad += this.cantidadProducida;
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

                this.EnvoltorioProducto.DescontarCantidad(1);
                cantidad--;
                cantidadProducida++;
            }
            else
            {
                cantidad = -1;
            }

            return cantidad;
        }
        ProductoParaVenderConEnvoltorio IBuilderProducto<ProductoParaVenderConEnvoltorio>.SetCostoUnitario(double costo)
        {
            this.CostoUnitario = costo;
            return this;
        }

        ProductoParaVenderConEnvoltorio IBuilderProducto<ProductoParaVenderConEnvoltorio>.SetCantidad(double cantidad)
        {
            this.Cantidad = cantidad;
            return this;
        }

        ProductoParaVenderConEnvoltorio IBuilderProducto<ProductoParaVenderConEnvoltorio>.SetNombre(string nombre)
        {
            this.Nombre = nombre;
            return this;
        }

        ProductoParaVenderConEnvoltorio IBuilderProducto<ProductoParaVenderConEnvoltorio>.SetUnidadDeMedida(UnidadDeMedida unidadDeMedida)
        {
            this.UnidadDeMedida = unidadDeMedida;
            return this;
        }

        ProductoParaVenderConEnvoltorio IBuilderProducto<ProductoParaVenderConEnvoltorio>.SetPorcentajeDeUtilidad(double porcentajeDeUtilidad)
        {
            this.PorcentajeDeUtilidad = porcentajeDeUtilidad;
            return this;
        }

        ProductoParaVenderConEnvoltorio IBuilderProducto<ProductoParaVenderConEnvoltorio>.SetEspecificaion(Especificacion especificacion)
        {
            this.Especificacion = especificacion;
            return this;
        }

        ProductoParaVenderConEnvoltorio IBuilderProducto<ProductoParaVenderConEnvoltorio>.SetTipo(Tipo tipo)
        {
            this.Tipo = tipo;
            return this;
        }
        
    }
}
