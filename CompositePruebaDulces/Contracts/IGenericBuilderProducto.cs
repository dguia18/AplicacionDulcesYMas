using Domain.Entities.EntitiesProducto;

namespace Domain.Contracts
{
    public interface IGenericBuilderProducto<out T> where T : Producto
    {
		public T SetCostoUnitario(decimal costo);
		public T SetCantidad(decimal cantidad);
		public T SetNombre(string nombre);
		public T SetUnidadDeMedida(UnidadDeMedida unidadDeMedida);
		public T SetPorcentajeDeUtilidad(decimal porcentajeDeUtilidad);
		public T SetEspecificacion(Especificacion especificacion);		
		public T SetTipo(Tipo tipo);
	}
}
