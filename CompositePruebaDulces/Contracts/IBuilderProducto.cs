using Domain.Entities.EntitiesProducto;

namespace Domain.Contracts
{
    public interface IBuilderProducto<out T> where T : Producto
    {
		public T SetCostoUnitario(double costo);
		public T SetCantidad(double cantidad);
		public T SetNombre(string nombre);
		public T SetUnidadDeMedida(UnidadDeMedida unidadDeMedida);
		public T SetPorcentajeDeUtilidad(double porcentajeDeUtilidad);
		public T SetEspecificacion(Especificacion especificacion);		
		public T SetTipo(Tipo tipo);
	}
}
