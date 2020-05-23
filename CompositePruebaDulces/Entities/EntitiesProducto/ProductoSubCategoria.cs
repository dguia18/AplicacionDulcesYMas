using Domain.Base;
using System.Collections.Generic;

namespace Domain.Entities.EntitiesProducto
{
    public class ProductoSubCategoria : Entity<int>
    {
        public string Nombre { get; set; }
        public List<ProductoSubCategoria> SubCategorias { get; set; }

    }
}
