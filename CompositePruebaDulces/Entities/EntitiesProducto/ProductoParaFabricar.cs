using Domain.Entities;
using System.Collections.Generic;
using System.Linq;

namespace Domain.Entities.EntitiesProducto
{
    public abstract class ProductoParaFabricar : Producto
    {
        public List<ProductoParaVenderDetalle> ProductoParaVenderDetalles { get; set; }                
    }
}
