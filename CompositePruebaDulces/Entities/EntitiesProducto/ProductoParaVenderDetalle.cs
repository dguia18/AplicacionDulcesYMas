using Domain.Base;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;

namespace Domain.Entities.EntitiesProducto
{
    public class ProductoParaVenderDetalle : Entity<int>
    {
        public ProductoParaFabricar ProductoParaFabricar { get; set; }
        public ProductoParaVender ProductoParaVender { get; set; }
        public int ProductoParaFabricarId { get; set; }
        public int ProductoParaVenderId { get; set; }
        [Column(TypeName = "decimal(7,2)")]
        public decimal Cantidad { get; private set; }
        [Column(TypeName = "decimal(7,2)")]
        public decimal Costo { get; private set; }
        public ProductoParaVenderDetalle(ProductoParaFabricar productoParaFabricar,
            ProductoParaVender productoParaVender)
        {
            this.ProductoParaFabricarId = productoParaFabricar.Id;
            this.ProductoParaVenderId = productoParaVender.Id;
            this.ProductoParaVender = productoParaVender;
            this.ProductoParaFabricar = productoParaFabricar;            
        }
        public ProductoParaVenderDetalle()
        {

        }
        public void SetCantidadNecesaria(decimal cantidad)
        {
            this.Cantidad = cantidad;            
        }
        private void ActualizarCosto()
        {
            this.Costo = this.Cantidad * ProductoParaFabricar.CostoUnitario;
        }
        public void DescontarUnidades()
        {
            ProductoParaFabricar.DescontarCantidad(this.Cantidad);
            this.ActualizarCosto();
        }
        public List<string> PuedeDescontarUnidades()
        {
            return ProductoParaFabricar.PuedeDescontarCantidad(this.Cantidad);
        }
    }
}
