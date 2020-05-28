using Domain.Base;
using System.Collections.Generic;

namespace Domain.Entities.EntitiesProducto
{
    public class ProductoSubCategoria : Entity<int>
    {
        public string Nombre { get; private set; }
        public List<ProductoSubCategoria> SubCategorias { get; private set; }
        public List<Producto> Productos { get; set; }
        public ProductoSubCategoria()
        {
            this.SubCategorias = new List<ProductoSubCategoria>();
            this.Productos = new List<Producto>();
        }

        public ProductoSubCategoria(ProductoSubCategoriaBuilder productoSubCategoriaBuilder)
        {
            this.Nombre = productoSubCategoriaBuilder.Nombre;
        }
        public void AgregarSubCategoria(ProductoSubCategoria subCategoria)
        {
            this.SubCategorias.Add(subCategoria);
        }
        public class ProductoSubCategoriaBuilder
        {
            public string Nombre { get; private set; }
            public ProductoSubCategoriaBuilder(string nombre)
            {
                this.Nombre = nombre;
            }
            public ProductoSubCategoria Build()
            {
                ProductoSubCategoria subCategoria = new ProductoSubCategoria(this);
                return subCategoria;
            }
        }
    }
}
