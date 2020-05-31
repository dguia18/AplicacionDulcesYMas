using Domain.Entities.EntitiesProducto;
using Domain.Factory.AbstractFactory;
using System;

namespace Domain.Factory.ConcreteFactories
{
    public class ProductoParaFabricarFactory : IProductoFactory
    {
        public Producto CrearProducto(Especificacion especificacion)
        {
            switch (especificacion)
            {                
                case Especificacion.Duro:
                     return new ProductoParaFabricarDuro();
                case Especificacion.Suave:
                    return new ProductoParaFabricarSuave();                
                default:
                    throw new
                InvalidOperationException($"La especificación {especificacion.ToString()} no es para fabricar");
            }           
        }
    }
}
