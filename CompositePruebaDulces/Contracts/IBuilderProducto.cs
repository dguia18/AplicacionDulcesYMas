using Domain.Entities.EntitiesProducto;
using System;
using System.Collections.Generic;
using System.Text;

namespace Domain.Contracts
{
    public interface IBuilderProducto<T> where T : Producto
    {
		public T SetCostoUnitario(double costo);
		public T SetCantidad(double cantidad);
		public T SetNombre(string nombre);
		public T SetUnidadDeMedida(UnidadDeMedida unidadDeMedida);
		public T SetPorcentajeDeUtilidad(double porcentajeDeUtilidad);
		public T SetEspecificaion(Especificacion especificacion);
		public T SetTipo(Tipo tipo);
	}
}
