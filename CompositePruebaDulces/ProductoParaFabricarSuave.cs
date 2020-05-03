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

        public override void AdicionarCantidad(double cantidadProducida)
        {
            var ultimaFabricacion = this.Fabricaciones.Last();
            ultimaFabricacion.Cantidad = cantidadProducida;
            this.Cantidad += cantidadProducida;
            this.CostoUnitario = this.CostoUnitario != 0 ?
                (this.CostoUnitario + ultimaFabricacion.Costo / ultimaFabricacion.Cantidad) / 2 :
                ultimaFabricacion.Costo / ultimaFabricacion.Cantidad;
        }
    }
}
