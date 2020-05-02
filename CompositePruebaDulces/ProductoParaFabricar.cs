using System;
using System.Collections.Generic;
using System.Linq;

namespace Domain
{
    public class ProductoParaFabricar : Producto
    {
        public List<Fabricacion> Fabricaciones { get; private set; }
        public ProductoParaFabricar(string nombre)
        {
            this.Nombre = nombre;
            this.Fabricaciones = new List<Fabricacion>();
        }
        public void Preparar(TerceroEmpleado terceroEmpleado,
            IEnumerable<ProductoMateriaPrima> materiasPrimas)
        {
            Fabricacion fabricacion = new Fabricacion(terceroEmpleado);
            fabricacion.SetFabricacionDetalles(materiasPrimas);
            Fabricaciones.Add(fabricacion);            
        }
        public void AdicionarCantidad(double cantidadProducida)
        {
            var ultimaFabricacion = this.Fabricaciones.Last();
            ultimaFabricacion.Cantidad = cantidadProducida;
            this.Cantidad += cantidadProducida;
            this.CostoUnitario = this.CostoUnitario != 0 ? 
                (this.CostoUnitario + ultimaFabricacion.Costo / ultimaFabricacion.Cantidad)/2 :
                ultimaFabricacion.Costo / ultimaFabricacion.Cantidad;
        }
    }
}
