using System;
using System.Collections.Generic;
using System.Linq;

namespace Domain
{
    public abstract class ProductoParaVender : Producto
    {        
        public Producto EmboltorioProducto { get; set; }
        public List<ProductoParaVenderDetalle> ProductoParaVenderDetalles { get; private set; }        
        protected ProductoParaVender(string nombre, double cantidad,
            double costoUnitario, string unidad) : 
            base(nombre,cantidad,costoUnitario,unidad)
        {
            this.ProductoParaVenderDetalles = new List<ProductoParaVenderDetalle>();
        }
        protected ProductoParaVender(string nombre) : base(nombre)
        {
            this.ProductoParaVenderDetalles = new List<ProductoParaVenderDetalle>();
        }
        public void AgregarDetalle(ProductoParaVenderDetalle productoParaVenderDetalle)
        {
            this.ProductoParaVenderDetalles.Add(productoParaVenderDetalle);
        }
        public abstract void Preparar(double cantidad);        
    }    
}
