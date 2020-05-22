
using Domain.Entities.EntitiesProducto;

namespace Domain.Factory.AbstractFactory
{
    public interface IProductoFactory
    {
        Producto CrearProducto(Especificacion especificacion);
    }    
}
