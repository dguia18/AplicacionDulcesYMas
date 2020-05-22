



using Domain.Contracts;
using System.Linq;

namespace Domain.Entities.EntitiesProducto
{
    public class ProductoParaFabricarSuave : ProductoParaFabricar, IBuilderProducto<ProductoParaFabricarSuave>
    {
        public ProductoParaFabricarSuave()
        {
            this.SetEspecificaion(Especificacion.Suave);
            this.SetTipo(Tipo.ParaFabricar);
        }

        public ProductoParaFabricarSuave(string nombre) : base(nombre)
        {
            this.UnidadDeMedida = UnidadDeMedida.Litros;
            this.Especificacion = Especificacion.Suave;
            this.Tipo = Tipo.ParaFabricar;
        }

        public ProductoParaFabricarSuave(string nombre, double cantidad,
            double costoUnitario) : base(nombre, cantidad, costoUnitario)
        {
            this.UnidadDeMedida = UnidadDeMedida.Litros;
            this.Especificacion = Especificacion.Suave;
            this.Tipo = Tipo.ParaFabricar;
        }
        protected override void AplicarCantidad(double cantidad)
        {
            this.GetLastFabricacion().SetCantidad(cantidad);
        }
        protected Fabricacion GetLastFabricacion()
        {
            return this.Fabricaciones.Last();
        }
        public override void AgregarDetalle(ProductoParaVenderDetalle productoParaVenderDetalle)
        {
            this.ProductoParaVenderDetalles.Add(productoParaVenderDetalle);
        }
        protected override void ActualizarCosto()
        {
            var ultimaFabricacion = this.GetLastFabricacion();
            this.CostoUnitario = (this.CostoUnitario * this.Cantidad +
                ultimaFabricacion.Costo) / (this.Cantidad + ultimaFabricacion.Cantidad);

            this.Cantidad += ultimaFabricacion.Cantidad;
        }
        public override void AgregarFabricacion(Fabricacion fabricacion)
        {
            Fabricaciones.Add(fabricacion);
        }
        ProductoParaFabricarSuave IBuilderProducto<ProductoParaFabricarSuave>.SetCostoUnitario(double costo)
        {
            this.CostoUnitario = costo;
            return this;
        }

        ProductoParaFabricarSuave IBuilderProducto<ProductoParaFabricarSuave>.SetCantidad(double cantidad)
        {
            this.Cantidad = cantidad;
            return this;
        }

        ProductoParaFabricarSuave IBuilderProducto<ProductoParaFabricarSuave>.SetNombre(string nombre)
        {
            this.Nombre = nombre;
            return this;
        }

        ProductoParaFabricarSuave IBuilderProducto<ProductoParaFabricarSuave>.SetUnidadDeMedida(UnidadDeMedida unidadDeMedida)
        {
            this.UnidadDeMedida = unidadDeMedida;
            return this;
        }

        ProductoParaFabricarSuave IBuilderProducto<ProductoParaFabricarSuave>.SetPorcentajeDeUtilidad(double porcentajeDeUtilidad)
        {
            this.PorcentajeDeUtilidad = porcentajeDeUtilidad;
            return this;
        }

        ProductoParaFabricarSuave IBuilderProducto<ProductoParaFabricarSuave>.SetEspecificaion(Especificacion especificacion)
        {
            this.Especificacion = especificacion;
            return this;
        }

        ProductoParaFabricarSuave IBuilderProducto<ProductoParaFabricarSuave>.SetTipo(Tipo tipo)
        {
            this.Tipo = tipo;
            return this;
        }
    }
}
