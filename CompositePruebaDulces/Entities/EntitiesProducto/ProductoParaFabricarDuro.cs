
using Domain.Contracts;
using System.Linq;

namespace Domain.Entities.EntitiesProducto
{
    public class ProductoParaFabricarDuro : ProductoParaFabricar, IBuilderProducto<ProductoParaFabricarDuro>
    {
        public ProductoParaFabricarDuro()
        {
            this.SetEspecificaion(Especificacion.Duro);
            this.SetTipo(Tipo.ParaFabricar);
        }

        public ProductoParaFabricarDuro(string nombre) : base(nombre)
        {
            this.UnidadDeMedida = UnidadDeMedida.Unidades;
            this.Especificacion = Especificacion.Duro;
            this.Tipo = Tipo.ParaFabricar;
        }

        public ProductoParaFabricarDuro(string nombre, double cantidad,
            double costoUnitario) : base(nombre, cantidad, costoUnitario)
        {
            this.UnidadDeMedida = UnidadDeMedida.Unidades;
            this.Especificacion = Especificacion.Duro;
            this.Tipo = Tipo.ParaFabricar;
        }

        protected override void AplicarCantidad(double cantidad)
        {
            this.GetLastFabricacion().SetCantidad(cantidad * 50);
        }

        protected Fabricacion GetLastFabricacion()
        {
            return this.Fabricaciones.Last();
        }
        public override void AgregarFabricacion(Fabricacion fabricacion)
        {
            this.Fabricaciones.Add(fabricacion);
        }
        protected override void ActualizarCosto()
        {
            var ultimaFabricacion = this.GetLastFabricacion();
            this.CostoUnitario = (this.CostoUnitario * this.Cantidad +
                ultimaFabricacion.Costo) / (this.Cantidad + ultimaFabricacion.Cantidad);

            this.Cantidad += ultimaFabricacion.Cantidad;
        }
        ProductoParaFabricarDuro IBuilderProducto<ProductoParaFabricarDuro>.SetCostoUnitario(double costo)
        {
            this.CostoUnitario = costo;
            return this;
        }

        ProductoParaFabricarDuro IBuilderProducto<ProductoParaFabricarDuro>.SetCantidad(double cantidad)
        {
            this.Cantidad = cantidad;
            return this;
        }

        ProductoParaFabricarDuro IBuilderProducto<ProductoParaFabricarDuro>.SetNombre(string nombre)
        {
            this.Nombre = nombre;
            return this;
        }

        ProductoParaFabricarDuro IBuilderProducto<ProductoParaFabricarDuro>.SetUnidadDeMedida(UnidadDeMedida unidadDeMedida)
        {
            this.UnidadDeMedida = unidadDeMedida;
            return this;
        }

        ProductoParaFabricarDuro IBuilderProducto<ProductoParaFabricarDuro>.SetPorcentajeDeUtilidad(double porcentajeDeUtilidad)
        {
            this.PorcentajeDeUtilidad = porcentajeDeUtilidad;
            return this;
        }

        ProductoParaFabricarDuro IBuilderProducto<ProductoParaFabricarDuro>.SetEspecificaion(Especificacion especificacion)
        {
            this.Especificacion = especificacion;
            return this;
        }

        ProductoParaFabricarDuro IBuilderProducto<ProductoParaFabricarDuro>.SetTipo(Tipo tipo)
        {
            this.Tipo = tipo;
            return this;
        }
    }
}
