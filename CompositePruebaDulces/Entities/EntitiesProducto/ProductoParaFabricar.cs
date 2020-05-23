using System.Collections.Generic;

namespace Domain.Entities.EntitiesProducto
{
    public abstract class ProductoParaFabricar : Producto
    {
        public List<ProductoParaVenderDetalle> ProductoParaVenderDetalles { get; set; }                
    }
}
