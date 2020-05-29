
using Domain.Entities.EntitiesProducto;
using Domain.Factory.ConcreteFactories;
using System;

namespace Domain.Factory.AbstractFactory
{
    public interface IProductoFactory
    {
        Producto CrearProducto(Especificacion especificacion);
    }
    public class CrearProductoFactory : IProductoFactory
    {
        private readonly IProductoFactory FactoriaConcreta;
        public Producto CrearProducto(Especificacion especificacion)
        {
            return FactoriaConcreta.CrearProducto(especificacion);
        }
        public CrearProductoFactory(Tipo tipo)
        {
            FactoriaConcreta = tipo switch
            {
                Tipo.MateriaPrima => new ProductoSinEspecificacionFactory(),
                Tipo.ParaFabricar => new ProductoParaFabricarFactory(),
                Tipo.ParaVender => new ProductoParaVenderFactory(),
                _ => throw new InvalidOperationException("El tipo de producto es incorrecto"),
            };
        }
    }
}
