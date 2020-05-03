using System;
using System.Collections.Generic;
using System.Linq;

namespace Domain
{
    public class ProductoParaFabricarDuro : ProductoParaFabricar
    {
        public ProductoParaFabricarDuro(string nombre) : base(nombre)
        {
            this.Contestura = Contestura.Duro;
        }

        public override void AdicionarCantidad(double cantidadProducida)
        {
            cantidadProducida *= 60;
            var ultimaFabricacion = this.Fabricaciones.Last();
            ultimaFabricacion.Cantidad = cantidadProducida;
            this.Cantidad += cantidadProducida;
            this.CostoUnitario = this.CostoUnitario != 0 ?
                (this.CostoUnitario + ultimaFabricacion.Costo / ultimaFabricacion.Cantidad) / 2 :
                ultimaFabricacion.Costo / ultimaFabricacion.Cantidad;
        }
    }
}
