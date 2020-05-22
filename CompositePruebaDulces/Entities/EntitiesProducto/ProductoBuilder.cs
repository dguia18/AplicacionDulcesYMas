using System;
using System.Collections.Generic;
using System.Text;

namespace Domain.Entities.EntitiesProducto
{
    public class ProductoBuilder<T> where T : ProductoBuilder<T>
    {
		private T _producto;
		public string Nombre { get; set; }
		public double Cantidad { get; protected set; }
		private double _costo;
		public virtual double CostoUnitario { get => _costo; set => _costo = Math.Round(value, 2); }
		public UnidadDeMedida UnidadDeMedida { get; set; }
		public double PorcentajeDeUtilidad { get; set; } = 0;

		public double PrecioDeVenta { get => CostoUnitario / (1 - PorcentajeDeUtilidad / 100); }
		public Especificacion Especificacion { get; protected set; } = Especificacion.MateriaPrima;
		public Tipo Tipo { get; protected set; } = Tipo.MateriaPrima;
		public ProductoSubCategoria SubCategoria { get; set; }
		public List<Fabricacion> Fabricaciones { get; set; }
		public List<CompraDetalle> DetallesCompra { get; set; }
		public DateTime FechaCreacion { get; set; } = DateTime.Now;
		//public T SetCostoUnitario(double costo)
		//{
		//	this.CostoUnitario = costo;
		//	return this;
		//}
		//public Producto SetCantidad(double cantidad)
		//{
		//	this.Cantidad = cantidad;
		//	return this;
		//}
		//public Producto SetNombre(string nombre)
		//{
		//	this.Nombre = nombre;
		//	return this;
		//}
		//public Producto SetUnidadDeMedida(UnidadDeMedida unidadDeMedida)
		//{
		//	this.UnidadDeMedida = unidadDeMedida;
		//	return this;
		//}
		//public Producto SetPorcentajeDeUtilidad(double porcentajeDeUtilidad)
		//{
		//	this.PorcentajeDeUtilidad = porcentajeDeUtilidad;
		//	return this;
		//}
		//public Producto SetEspecificaion(Especificacion especificacion)
		//{
		//	this.Especificacion = especificacion;
		//	return this;
		//}
		//public Producto SetTipo(Tipo tipo)
		//{
		//	this.Tipo = tipo;
		//	return this;
		//}
	}
}
