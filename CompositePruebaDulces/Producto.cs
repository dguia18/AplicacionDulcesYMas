using Domain.Base;
using System;
using System.Collections.Generic;
using System.Text;

namespace Domain
{
    public abstract class Producto : Entity<int>
    {
        public string Nombre { get; set; }
        public double Cantidad { get; set; }
        private double _costo;
        public double CostoUnitario { get => _costo; set => _costo = Math.Round(value,2); }
        public string UnidadDeMedida { get; set; }
        public Contestura Contestura { get; set; }
        public override string ToString()
        {
            return string.Format("\nNombre: {0}" +
                "\nCosto: {1}" +
                "\nCantidad: {2} {3}", this.Nombre, this.CostoUnitario,
                this.Cantidad, this.UnidadDeMedida);
        }
    }
    public enum Contestura
    {
        Duro,
        Suave
    }
}
