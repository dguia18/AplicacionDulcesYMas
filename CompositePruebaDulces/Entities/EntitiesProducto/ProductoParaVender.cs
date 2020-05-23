using System.Collections.Generic;

namespace Domain.Entities.EntitiesProducto
{
    public abstract class ProductoParaVender : Producto
    {
        public List<ProductoParaVenderDetalle>
            ProductoParaVenderDetalles { get; set; }        
    }
}
