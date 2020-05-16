using Domain.Base;
using System;
using System.Collections.Generic;
using System.Text;

namespace Domain.Entities
{
    public class ProductoSubCategoria : Entity<int>
    {
        public string Nombre { get; set; }
        public List<ProductoSubCategoria> SubCategorias { get; set; }

    }
}
