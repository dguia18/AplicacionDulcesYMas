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
		public Producto(string nombre,double precio)
		{
			this._nombre = nombre;
			this._precio = precio;
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
