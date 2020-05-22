using Domain.Entities.EntitiesProducto;
using Domain.Factory.AbstractFactory;
using System;
using System.Collections.Generic;
using System.Text;

namespace Domain.Creational.FactoryMethod
{
    public class ProductoParaVenderFactory : IProductoFactory
    {
        public Producto CrearProducto(Especificacion especificacion)
        {
            return especificacion switch
            {
                Especificacion.TieneEnvoltorio => new ProductoParaVenderConEnvoltorio(),
                Especificacion.NoTieneEnvoltorio => new ProductoParaVenderSinEnvoltorio(),
                _ => throw new
                    InvalidOperationException("No es de tipo para Vender"),
            };
        }
    }
}
