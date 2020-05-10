using Domain.Base;
using System;
using System.Collections.Generic;
using System.Linq;

namespace Domain
{
    public abstract class Producto : Entity<int>
    {
        public string Nombre { get; set; }
        public double Cantidad { get; protected set; }
        private double _costo;
        public virtual double CostoUnitario { get => _costo; set => _costo = Math.Round(value, 2); }
        public UnidadDeMedida UnidadDeMedida { get; set; }
        public double PorcentajeDeUtilidad { get; set; } = 0;

        public double PrecioDeVenta { get => CostoUnitario / (1 - PorcentajeDeUtilidad / 100); }
        public Contestura Contestura { get; protected set; } = Contestura.NoAplica;
        public Emboltorio Emboltorio { get; protected set; } = Emboltorio.NoAplica;
        protected Producto(string nombre, double cantidad, double costoUnitario,
            UnidadDeMedida unidadDeMedida, double porcentajeDeutilidad)
        {
            this.Cantidad = cantidad;
            this.Nombre = nombre;
            this.CostoUnitario = costoUnitario;
            this.UnidadDeMedida = unidadDeMedida;
            this.PorcentajeDeUtilidad = porcentajeDeutilidad;
        }
        protected Producto(string nombre, double cantidad,
            double costoUnitario, UnidadDeMedida unidad)
        {
            this.Nombre = nombre;
            this.Cantidad = cantidad;
            this.CostoUnitario = costoUnitario;
            this.UnidadDeMedida = unidad;
        }
        protected Producto(string nombre, double cantidad,
            double costoUnitario)
        {
            this.Nombre = nombre;
            this.Cantidad = cantidad;
            this.CostoUnitario = costoUnitario;
        }
        protected Producto(string nombre)
        {
            this.Nombre = nombre;
        }
        protected Producto()
        {

        }        
        public List<string> PuedeDescontarCantidad(double cantidad)
        {
            var errores = new List<string>();
            if ((this.Cantidad - cantidad) <= 0)
            {
                errores.Add("No puede descontar, unidades escasas");
            }
            return errores;
        }
        public bool DescontarCantidad(double cantidad)
        {
            if (PuedeDescontarCantidad(cantidad).Any())
                throw new InvalidOperationException("No puede descontar unidades");
            this.Cantidad -= cantidad;
            return true;
        }
        public void SetCantidad(double cantidad)
        {
            this.Cantidad = cantidad;
        }
        protected abstract void ActualizarCosto();
        public void AdicionarCantidad(double cantidad)
        {
            this.AplicarCantidad(cantidad);
            this.ActualizarCosto();
        }
        protected abstract void AplicarCantidad(double cantidadProducida);
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
        NoAplica,
        Duro,
        Suave
    }
    public enum Emboltorio
    {
        NoAplica,
        NoTieneEmboltorio,
        TieneEmboltorio
    }
    public enum UnidadDeMedida
    {
        Unidades,
        Kilos,
        Libras,
        Litros,
        Onzas
    }
}
