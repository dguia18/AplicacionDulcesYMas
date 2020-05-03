using Domain.Base;
using System;
using System.Collections.Generic;
using System.Text;

namespace Domain
{
    public class ProductoParaVenderDetalle : Entity<int>
    {
        public ProductoParaFabricar ProductoParaFabricar { get; set; }
        public ProductoParaVender ProductoParaVender { get; set; }
        public int ProductoParaFabricarId { get; set; }
        public int ProductoParaVenderId { get; set; }
        public double Cantidad { get; private set; }
        public double Costo { get; private set; }
        public ProductoParaVenderDetalle(ProductoParaFabricar productoParaFabricar,
            ProductoParaVender productoParaVender)
        {
            this.ProductoParaFabricarId = productoParaFabricar.Id;
            this.ProductoParaVenderId = productoParaVender.Id;
            this.ProductoParaVender = productoParaVender;
            this.ProductoParaFabricar = productoParaFabricar;            
        }
        public void SetCantidadNecesaria(double cantidad)
        {
            this.Cantidad = cantidad;            
        }
        public void ActualizarCosto()
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
