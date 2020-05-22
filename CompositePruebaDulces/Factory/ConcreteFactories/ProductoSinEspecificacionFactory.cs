

using Domain.Entities.EntitiesProducto;
using Domain.Factory.AbstractFactory;

namespace Domain.Creational.FactoryMethod
{
    public class ProductoSinEspecificacionFactory : IProductoFactory
    {
        public Producto CrearProducto(Especificacion especificacion)
        {
            return new ProductoMateriaPrima();
        }
    }
}
