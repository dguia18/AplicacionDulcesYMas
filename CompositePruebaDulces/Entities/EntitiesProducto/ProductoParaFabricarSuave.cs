



using Domain.Contracts;
using System.Collections.Generic;
using System.Linq;

namespace Domain.Entities.EntitiesProducto
{
    public class ProductoParaFabricarSuave : ProductoParaFabricar, IGenericBuilderProducto<ProductoParaFabricarSuave>
    {
        public ProductoParaFabricarSuave()
        {
            this.SetEspecificacion(Especificacion.Suave);
            this.SetTipo(Tipo.ParaFabricar);
            this.Fabricaciones = new List<Fabricacion>();
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
        public ProductoParaFabricarSuave SetCostoUnitario(double costo)
        {
            this.CostoUnitario = costo;
            return this;
        }

        public ProductoParaFabricarSuave SetCantidad(double cantidad)
        {
            this.Cantidad = cantidad;
            return this;
        }

        public ProductoParaFabricarSuave SetNombre(string nombre)
        {
            this.Nombre = nombre;
            return this;
        }

        public ProductoParaFabricarSuave SetUnidadDeMedida(UnidadDeMedida unidadDeMedida)
        {
            this.UnidadDeMedida = unidadDeMedida;
            return this;
        }

        public ProductoParaFabricarSuave SetPorcentajeDeUtilidad(double porcentajeDeUtilidad)
        {
            this.PorcentajeDeUtilidad = porcentajeDeUtilidad;
            return this;
        }

        public ProductoParaFabricarSuave SetEspecificacion(Especificacion especificacion)
        {
            this.Especificacion = especificacion;
            return this;
        }

        public ProductoParaFabricarSuave SetTipo(Tipo tipo)
        {
            this.Tipo = tipo;
            return this;
        }
    }
}
