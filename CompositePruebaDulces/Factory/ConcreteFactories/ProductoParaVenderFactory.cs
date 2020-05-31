using System;
using Domain.Entities.EntitiesProducto;
using Domain.Factory.AbstractFactory;

namespace Domain.Factory.ConcreteFactories {
	public class ProductoParaVenderFactory : IProductoFactory {
		public Producto CrearProducto (Especificacion especificacion) {
			switch (especificacion)
			{				
				case Especificacion.TieneEnvoltorio:
					return new ProductoParaVenderConEnvoltorio();
				case Especificacion.NoTieneEnvoltorio:
					return new ProductoParaVenderSinEnvoltorio();
				default:
					throw new
				InvalidOperationException($"La especificación " +
	$"{especificacion.ToString()} no es para vender");
			}			
		}
	}
}