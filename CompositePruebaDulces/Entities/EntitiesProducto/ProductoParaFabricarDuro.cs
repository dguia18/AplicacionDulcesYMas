
using Domain.Contracts;
using System.Collections.Generic;
using System.Linq;

namespace Domain.Entities.EntitiesProducto
{
    public class ProductoParaFabricarDuro : ProductoParaFabricar, IBuilderProductoParaFabricarDuro
    {
        public ProductoParaFabricarDuro()
        {
            this.SetEspecificacion(Especificacion.Duro);
            this.SetTipo(Tipo.ParaFabricar);
            this.Fabricaciones = new List<Fabricacion>();
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
        public ProductoParaFabricarDuro SetCostoUnitario(double costo)
        {
            this.CostoUnitario = costo;
            return this;
        }

        public ProductoParaFabricarDuro SetCantidad(double cantidad)
        {
            this.Cantidad = cantidad;
            return this;
        }

        public ProductoParaFabricarDuro SetNombre(string nombre)
        {
            this.Nombre = nombre;
            return this;
        }

        public ProductoParaFabricarDuro SetUnidadDeMedida(UnidadDeMedida unidadDeMedida)
        {
            this.UnidadDeMedida = unidadDeMedida;
            return this;
        }

        public ProductoParaFabricarDuro SetPorcentajeDeUtilidad(double porcentajeDeUtilidad)
        {
            this.PorcentajeDeUtilidad = porcentajeDeUtilidad;
            return this;
        }

        public ProductoParaFabricarDuro SetEspecificacion(Especificacion especificacion)
        {
            this.Especificacion = especificacion;
            return this;
        }

        public ProductoParaFabricarDuro SetTipo(Tipo tipo)
        {
            this.Tipo = tipo;
            return this;
        }
    }
}
