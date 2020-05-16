using Domain.Entities;
using System.Collections.Generic;
using System.Linq;

namespace Domain
{
    public abstract class ProductoParaFabricar : Producto
    {
        public List<ProductoParaVenderDetalle> ProductoParaVenderDetalles { get; set; }        
        protected ProductoParaFabricar(string nombre) : base(nombre)
        {
            this.Fabricaciones = new List<Fabricacion>();
        }

        protected ProductoParaFabricar(string nombre, double cantidad,
            double costoUnitario, UnidadDeMedida unidadDeMedida,
            double porcentajeDeutilidad = 0) :
            base(nombre, cantidad, costoUnitario, unidadDeMedida, porcentajeDeutilidad)
        {
        }

        protected ProductoParaFabricar(string nombre, double cantidad, double costoUnitario) : base(nombre, cantidad, costoUnitario)
        {
        }

        protected ProductoParaFabricar()
        {
        }

        
    }
}
