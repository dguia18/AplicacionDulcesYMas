

using Domain.Entities.EntitiesProducto;
using Domain.Factory.AbstractFactory;
using System;

namespace Domain.Factory.ConcreteFactories
{
    public class ProductoSinEspecificacionFactory : IProductoFactory
    {
        public Producto CrearProducto(Especificacion especificacion)
        {
            if (Especificacion.MateriaPrima == especificacion)
            {
                return new ProductoMateriaPrima();
            }
            throw new InvalidOperationException($"La especificación {especificacion.ToString()} " +
                $"no es para materias primas");
        }
    }
}
