using System;
using System.Collections.Generic;
using System.Linq;

namespace Domain
{
    public class ProductoParaFabricarSuave : ProductoParaFabricar
    {
        public ProductoParaFabricarSuave(string nombre) : base(nombre)
        {
            this.UnidadDeMedida = "Litro";
            this.Contestura = Contestura.Suave;
        }

        protected override void AplicarCantidad(double cantidadProducida)
        {
            this.Cantidad += cantidadProducida;
            this.GetLastFabricacion().SetCantidad(cantidadProducida);
        }       
    }
}
