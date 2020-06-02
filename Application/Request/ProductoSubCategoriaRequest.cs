using Application.Base;
using Domain.Entities.EntitiesProducto;
using System;
using System.Collections.Generic;

namespace Application.Request
{
    public class ProductoSubCategoriaRequest : Request<int>
    {
        private string _nombreSubCategoria;
        public string NombreSubCategoria { 
            get=>_nombreSubCategoria; 
            set => _nombreSubCategoria = value.ToUpper(); 
        }
        public int IdCategoria { get; set; }
        public ProductoCategoriaRequest Categoria { get; set; }
        public List<ProductoRequest> Productos { get; set; }
        public ProductoSubCategoriaRequest()
        {
            this.Productos = new List<ProductoRequest>();
        }

        public ProductoSubCategoriaRequest(ProductoSubCategoriaRequestBuilder productoSubCategoriaRequestBuilder)
        {
            this.Id = productoSubCategoriaRequestBuilder.Id;
            this.NombreSubCategoria = productoSubCategoriaRequestBuilder.NombreSubCategoria;
            this.IdCategoria = productoSubCategoriaRequestBuilder.IdCategoria;
            this.Productos = new List<ProductoRequest>();
        }

        public ProductoSubCategoriaRequest Map(ProductoSubCategoria subCategoria)
        {
            this.Id = subCategoria.Id;
            this.NombreSubCategoria = subCategoria.Nombre;
            // if (subCategoria.Productos != null)
            // {
            //     subCategoria.Productos.ForEach(producto => this.Productos
            //     .Add(new ProductoRequest().Map(producto)));
            // }
            return this;
        }
        public class ProductoSubCategoriaRequestBuilder
        {
            public int Id { get; private set; }
            public string NombreSubCategoria
            {
                private set ;get;
            }
            public int IdCategoria { get; private set; }
            public ProductoSubCategoriaRequestBuilder(string nombre)
            {
                this.NombreSubCategoria = nombre;
            }
            public ProductoSubCategoriaRequestBuilder SetId(int id)
            {
                this.Id = id;
                return this;
            }
            public ProductoSubCategoriaRequestBuilder SetIdCategoria(int idCategoria)
            {
                this.IdCategoria = idCategoria;
                return this;
            }
            public ProductoSubCategoriaRequest Build()
            {
                ProductoSubCategoriaRequest subCategoriaRequest = new ProductoSubCategoriaRequest(this);
                return subCategoriaRequest;
            }
        }
    }
}