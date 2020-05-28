using Application.Base;
using Domain.Entities.EntitiesProducto;
using System;
using System.Collections.Generic;

namespace Application.Request
{
    public class ProductoCategoriaRequest : Request<int>
    {
        private string _nombreCategoria;
        public string NombreCategoria { get=> _nombreCategoria; set => _nombreCategoria = value.ToUpper(); }
        public List<ProductoSubCategoriaRequest> SubCategorias { get; set; }
        public ProductoCategoriaRequest(ProductoCategoriaRequestBuilder productoCategoriaRequestBuilder)
        {
            this.SubCategorias = new List<ProductoSubCategoriaRequest>();
            this.NombreCategoria = productoCategoriaRequestBuilder.Nombre;
            this.Id = productoCategoriaRequestBuilder.Id;
        }
        public ProductoCategoriaRequest()
        {
            this.SubCategorias = new List<ProductoSubCategoriaRequest>();
        }
        public ProductoCategoriaRequest Map(ProductoCategoria categoria)
        {
            this.Id = categoria.Id;
            this.NombreCategoria = categoria.Nombre;
            if (categoria.SubCategorias != null)
            {
                categoria.SubCategorias.ForEach(categoria => this.SubCategorias
                .Add(new ProductoSubCategoriaRequest().Map(categoria)));
            }
            return this;
        }

        public class ProductoCategoriaRequestBuilder
        {
            public int Id { get; private set; }
            public string Nombre { get; private set; }
            public ProductoCategoriaRequestBuilder(string nombre)
            {
                this.Nombre = nombre;
            }
            public ProductoCategoriaRequestBuilder SetId(int id)
            {
                this.Id = id;
                return this;
            }
            public ProductoCategoriaRequest Build()
            {
                ProductoCategoriaRequest categoriaRequest = new ProductoCategoriaRequest(this);
                return categoriaRequest;
            }
        }
    }
}
