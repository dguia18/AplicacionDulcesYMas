using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using Domain.Base;
using Domain.Contracts;

namespace Domain.Entities.EntitiesProducto
{
	public abstract class Producto : Entity<int>, IProductoParaVender,
		IProductoParaFabricar, IBuilderProducto
	{
		public string Nombre { get; set; }
		[Column(TypeName = "decimal(7,2)")]
		public decimal Cantidad { get; protected set; }
		private decimal _costo;
		[Column(TypeName = "decimal(7,2)")]
		public virtual decimal CostoUnitario { get => _costo; set => _costo = Math.Round(value, 2); }
		public UnidadDeMedida UnidadDeMedida { get; set; }
		[Column(TypeName = "decimal(7,2)")]
		public decimal PorcentajeDeUtilidad { get; set; } = 30;
		[Column(TypeName = "decimal(7,2)")]
		public decimal PrecioSugeridoDeVenta { get => Math.Round(CostoUnitario / (1 - PorcentajeDeUtilidad / 100),2); }
		public Especificacion Especificacion { get; protected set; }
		public Tipo Tipo { get; protected set; } 
		public Producto Envoltorio { get; set; }
		public ProductoSubCategoria SubCategoria { get; set; }
		public List<Fabricacion> Fabricaciones { get; set; }
		public List<CompraDetalle> DetallesCompra { get; set; }
		public DateTime FechaCreacion { get; set; } = DateTime.Now;
		public int SubCategoriaId { get; set; }
		public List<ProductoParaVenderDetalle>
			ProductoParaVenderDetalles
		{ get; set; }
		protected Producto()
		{

		}
		public virtual void AgregarFabricacion(Fabricacion fabricacion)
		{

		}
		public virtual void AgregarDetalle(ProductoParaVenderDetalle productoParaVenderDetalle)
		{

		}
		public void SetSubCategoria(ProductoSubCategoria subCategoria)
		{
			this.SubCategoria = subCategoria;
			this.SubCategoriaId = subCategoria.Id;
		}
		public void SetEnvoltorio(Producto envoltorio)
		{
			this.Envoltorio = envoltorio;
		} 
		public void AgregarDetalleCompra(CompraDetalle detalle)
		{
			this.DetallesCompra.Add(detalle);
		}
		public List<string> PuedeDescontarCantidad(decimal cantidad)
		{
			var errores = new List<string>();
			if ((this.Cantidad - cantidad) < 0)
			{
				errores.Add($"El producto {this.Nombre} No puede descontar cantidades, unidades escasas");
			}
			return errores;
		}
		public bool DescontarCantidad(decimal cantidad)
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
		public Producto SetCostoUnitario(decimal costo)
		{
			this.CostoUnitario = costo;
			return this;
		}
		public Producto SetCantidad(decimal cantidad)
		{
			this.Cantidad = cantidad;
			return this;
		}
		public Producto SetNombre(string nombre)
		{
			this.Nombre = nombre;
			return this;
		}
		public Producto SetUnidadDeMedida(UnidadDeMedida unidadDeMedida)
		{
			this.UnidadDeMedida = unidadDeMedida;
			return this;
		}
		public Producto SetPorcentajeDeUtilidad(decimal porcentajeDeUtilidad)
		{
			this.PorcentajeDeUtilidad = porcentajeDeUtilidad;
			return this;
		}
		public Producto SetTipo(Tipo tipo)
		{
			this.Tipo = tipo;
			return this;
		}
		public void AdicionarCantidad(decimal cantidad)
		{
			this.AplicarCantidad(cantidad);
			this.ActualizarCosto();
		}
		protected abstract void AplicarCantidad(decimal cantidad);
		protected abstract void ActualizarCosto();
		public override string ToString()
		{
			return string.Format("\nNombre: {0}" +
				"\nCosto: {1}" +
				"\nCantidad: {2} {3}", this.Nombre, this.CostoUnitario,
				this.Cantidad, this.UnidadDeMedida);
		}

		public Producto SetEspecificacion(Especificacion especificacion)
		{
			this.Especificacion = especificacion;
			return this;
		}
	}
	public enum Especificacion
	{
		MateriaPrima,
		Duro,
		Suave,
		TieneEnvoltorio,
		NoTieneEnvoltorio
	}
	public enum Tipo
	{
		MateriaPrima,
		ParaFabricar,
		ParaVender
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
