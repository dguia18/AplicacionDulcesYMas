using Domain.Contracts;
using System.Collections.Generic;
using System.Linq;

namespace Domain.Entities.EntitiesProducto
{
    public class ProductoMateriaPrima : Producto,IBuilderProducto<ProductoMateriaPrima>
    {
        public List<FabricacionDetalle> FabricacionDetalles { get; set; }              

        public ProductoMateriaPrima(string nombre, double cantidad,
            double costoUnitario, UnidadDeMedida unidad) : 
            base(nombre, cantidad, costoUnitario, unidad)
        {
            FabricacionDetalles = new List<FabricacionDetalle>();
            this.SetTipo(Tipo.MateriaPrima);
            this.SetEspecificaion(Especificacion.MateriaPrima);
        }
        public ProductoMateriaPrima()
        {
            FabricacionDetalles = new List<FabricacionDetalle>();
            this.SetTipo(Tipo.MateriaPrima);
            this.SetEspecificaion(Especificacion.MateriaPrima);
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

        ProductoMateriaPrima IBuilderProducto<ProductoMateriaPrima>.SetCostoUnitario(double costo)
        {
            this.CostoUnitario = costo;
            return this;
        }

        ProductoMateriaPrima IBuilderProducto<ProductoMateriaPrima>.SetCantidad(double cantidad)
        {
            this.Cantidad = cantidad;
            return this;
        }

        ProductoMateriaPrima IBuilderProducto<ProductoMateriaPrima>.SetNombre(string nombre)
        {
            this.Nombre = nombre;
            return this;
        }

        ProductoMateriaPrima IBuilderProducto<ProductoMateriaPrima>.SetUnidadDeMedida(UnidadDeMedida unidadDeMedida)
        {
            this.UnidadDeMedida = unidadDeMedida;
            return this;
        }

        ProductoMateriaPrima IBuilderProducto<ProductoMateriaPrima>.SetPorcentajeDeUtilidad(double porcentajeDeUtilidad)
        {
            this.PorcentajeDeUtilidad = porcentajeDeUtilidad;
            return this;
        }

        ProductoMateriaPrima IBuilderProducto<ProductoMateriaPrima>.SetEspecificaion(Especificacion especificacion)
        {
            this.Especificacion = especificacion;
            return this;
        }

        ProductoMateriaPrima IBuilderProducto<ProductoMateriaPrima>.SetTipo(Tipo tipo)
        {
            this.Tipo = tipo;
            return this;
        }
    }
}
