using Domain.Entities.EntitiesProducto;
using Domain.Factory.AbstractFactory;
using System;

namespace Domain.Creational.FactoryMethod
{
    public class ProductoParaFabricarFactory : IProductoFactory
    {
        public Producto CrearProducto(Especificacion especificacion)
        {
            return especificacion switch
            {
                Especificacion.Duro => new ProductoParaFabricarDuro(),
                Especificacion.Suave => new ProductoParaFabricarSuave(),
                _ => throw new
                InvalidOperationException("No es de tipo para Fabricar"),
            };
        }
    }
}
