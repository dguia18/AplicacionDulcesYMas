using System;
using System.Collections.Generic;
using System.Text;

namespace Domain
{
    public class Producto : Composite
    {
		private string _nombre;

		public string Nombre
		{
			get { return _nombre; }
			set { _nombre = value; }
		}
		private double _precio;

		public double Precio
		{
			get { return _precio; }
			set { _precio = value; }
		}
		private double _cantidad;

		public double Cantidad
		{
			get { return _cantidad; }
			set { _cantidad = value; }
		}
		private double _costoUnitario;

		public double CostoUnitaro
		{
			get { return this.GetCosto()/_cantidad; }
			private set { _costoUnitario = value; }
		}
		private double _costoHechura;

		public double CostoHechura
		{
			get { return _costoHechura; }
			set { _costoHechura = value; }
		}
		public override double GetCosto()
		{
			return base.GetCosto() + this._costoHechura;
		}
		public Producto(string nombre)
		{
			this._nombre = nombre;
		}
		public override void Preparar()
		{
			Console.WriteLine("Se preparo el producto con las siguientes propiedades:" +
				""+this.ToString());
		}
		public override string ToString()
		{
			return String.Format("\nNombre: {0}" +
				"\nPrecio: {1}", this._nombre, this._precio);
		}
	}
}
