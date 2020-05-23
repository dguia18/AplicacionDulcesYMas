using System.Collections.Generic;
using System.Linq;

namespace Domain.Entities.EntitiesProducto
{
    public class ProductoMateriaPrima : Producto
    {
        public List<FabricacionDetalle> FabricacionDetalles { get; set; }                      
        public ProductoMateriaPrima()
        {
            FabricacionDetalles = new List<FabricacionDetalle>();
            this.DetallesCompra = new List<CompraDetalle>();
            this.SetTipo(Tipo.MateriaPrima);
            this.SetEspecificacion(Especificacion.MateriaPrima);
        }		

		protected override void ActualizarCosto()
        {
            var ultimaCompra = this.DetallesCompra.Last();            
            this.CostoUnitario = (this.CostoUnitario*this.Cantidad + 
                ultimaCompra.Valor*ultimaCompra.Cantidad) / (this.Cantidad+ultimaCompra.Cantidad);

            this.Cantidad += ultimaCompra.Cantidad;
        }

        protected override void AplicarCantidad(double cantidad)
        {
            //No implemented
        }

        public ProductoMateriaPrima SetCostoUnitario(double costo)
        {
            this.CostoUnitario = costo;
            return this;
        }

        public ProductoMateriaPrima SetCantidad(double cantidad)
        {
            this.Cantidad = cantidad;
            return this;
        }

        public ProductoMateriaPrima SetNombre(string nombre)
        {
            this.Nombre = nombre;
            return this;
        }

        public ProductoMateriaPrima
            SetUnidadDeMedida(UnidadDeMedida unidadDeMedida)
        {
            this.UnidadDeMedida = unidadDeMedida;
            return this;
        }

        public ProductoMateriaPrima
            SetPorcentajeDeUtilidad(double porcentajeDeUtilidad)
        {
            this.PorcentajeDeUtilidad = porcentajeDeUtilidad;
            return this;
        }

        public ProductoMateriaPrima
            SetEspecificacion(Especificacion especificacion)
        {
            this.Especificacion = especificacion;
            return this;
        }

        public ProductoMateriaPrima SetTipo(Tipo tipo)
        {
            this.Tipo = tipo;
            return this;
        }
    }
}
