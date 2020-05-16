using System;
using System.Collections.Generic;
using System.Linq;
using Domain.Base;
using Domain.Entities;

namespace Domain
{
	public abstract class Producto : Entity<int>, IProductoParaVender, IProductoParaFabricar
	{
		public string Nombre { get; set; }
		public double Cantidad { get; protected set; }
		private double _costo;
		public virtual double CostoUnitario { get => _costo; set => _costo = Math.Round(value, 2); }
		public UnidadDeMedida UnidadDeMedida { get; set; }
		public double PorcentajeDeUtilidad { get; set; } = 0;

		public double PrecioDeVenta { get => CostoUnitario / (1 - PorcentajeDeUtilidad / 100); }
		public Contestura Contestura { get; protected set; } = Contestura.NoAplica;
		public Envoltorio Envoltorio { get; protected set; } = Envoltorio.NoAplica;
		public ProductoSubCategoria SubCategoria { get; set; }
		public List<Fabricacion> Fabricaciones { get; set; }
		public List<CompraDetalle> DetallesCompra { get; set; }
		protected Producto(string nombre, double cantidad, double costoUnitario,
			UnidadDeMedida unidadDeMedida, double porcentajeDeUtilidad)
		{
			this.Cantidad = cantidad;
			this.Nombre = nombre;
			this.CostoUnitario = costoUnitario;
			this.UnidadDeMedida = unidadDeMedida;
			this.PorcentajeDeUtilidad = porcentajeDeUtilidad;
		}
		protected Producto(string nombre, double cantidad,
			double costoUnitario, UnidadDeMedida unidad)
		{
			this.Nombre = nombre;
			this.Cantidad = cantidad;
			this.CostoUnitario = costoUnitario;
			this.UnidadDeMedida = unidad;
			this.DetallesCompra = new List<CompraDetalle>();
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
		public virtual void AgregarFabricacion(Fabricacion fabricacion)
		{

		}
		public virtual void AgregarDetalle(ProductoParaVenderDetalle productoParaVenderDetalle)
		{

		}
		public void AgregarDetalleCompra(CompraDetalle detalle)
		{
			this.DetallesCompra.Add(detalle);
		}
		public List<string> PuedeDescontarCantidad(double cantidad)
		{
			var errores = new List<string>();
			if ((this.Cantidad - cantidad) < 0)
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
		public void AddCompraDetalle(CompraDetalle detalle)
		{
			this.DetallesCompra.Add(detalle);
			this.AdicionarCantidad(detalle.Cantidad);
		}
		public void SetCantidad(double cantidad)
		{
			this.Cantidad = cantidad;
		}
		public void AdicionarCantidad(double cantidad)
		{
			this.AplicarCantidad(cantidad);
			this.ActualizarCosto();
		}
		protected abstract void AplicarCantidad(double cantidad);
		protected abstract void ActualizarCosto();
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
	public enum Envoltorio
	{
		NoAplica,
		NoTieneEnvoltorio,
		TieneEnvoltorio
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