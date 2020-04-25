using System;
using System.Collections.Generic;
using System.Text;

namespace Domain
{
    public class MateriaPrima : Leaf
    {
        public string Nombre { get; set; }
        public double CostoUnitario { get ; set; }
        public double Cantidad { get; set; }
        public string UnidadDeMedida { get; set; }

        public MateriaPrima(string nombre, double costo, double cantidad, string unidadDeMedida)
        {
            this.Nombre = nombre;
            this.CostoUnitario = costo;
            this.Cantidad = cantidad;
            this.UnidadDeMedida = unidadDeMedida;
        }
        public override void Preparar(double cantidad)
        {
            this.Cantidad -= cantidad;
            Console.WriteLine("Se preparo la materia prima con las siguientes propiedades:" +
                " " + this.ToString());
        }
        public override double GetCosto()
        {
            return this.CostoUnitario * Cantidad;
        }
        public override string ToString()
        {
            return string.Format("\nNombre: {0}" +
                "\nCosto: {1}" +
                "\nCantidad: {2} {3}", this.Nombre, this.CostoUnitario, this.Cantidad, this.UnidadDeMedida);
        }

    }
}
