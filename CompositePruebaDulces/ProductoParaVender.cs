using System;
using System.Collections.Generic;
using System.Text;

namespace Domain
{
    public class ProductoParaVender : Producto
    {        
        public ProductoMateriaPrima MateriaPrima { get; set; }
        public List<ProductoParaFabricar> ProductosParaFabricar { get; private set; }
        public ProductoParaVender(string nombre, double cantidad,
            double costoUnitario, string unidad)
        {
            this.Nombre = nombre;
            this.Cantidad = cantidad;
            this.CostoUnitario = costoUnitario;
            this.UnidadDeMedida = unidad;
        }
        public ProductoParaVender(string nombre)
        {
            this.Nombre = nombre;
        }
        public void Preparar(ProductoMateriaPrima productoMateriaPrima,
            List<ProductoParaFabricar> productosParaFabricar)
        {

        }

    }
    
}
