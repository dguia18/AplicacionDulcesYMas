using System.Collections.Generic;

namespace Domain
{
    public abstract class ProductoParaVender : Producto
    {        
        public Producto EmboltorioProducto { get; set; }
        public List<ProductoParaVenderDetalle>
            ProductoParaVenderDetalles = new List<ProductoParaVenderDetalle>();         
        protected ProductoParaVender(string nombre, double cantidad,
            double costoUnitario, string unidad) : 
            base(nombre,cantidad,costoUnitario,unidad)
        {
            
        }
        protected ProductoParaVender(string nombre) : base(nombre)
        {
            
        }
        protected ProductoParaVender()
        {

        }
        public void AgregarDetalle(ProductoParaVenderDetalle productoParaVenderDetalle)
        {
            this.ProductoParaVenderDetalles.Add(productoParaVenderDetalle);
        }
        public abstract void Preparar(double cantidad);        
    }    
}
