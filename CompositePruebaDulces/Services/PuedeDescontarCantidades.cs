using Domain.Entities.EntitiesProducto;
using System.Collections.Generic;

namespace Domain.Services
{
    public static class PuedeDescontarCantidades
    {
        public static IReadOnlyList<string> CanDiscountAmounts(Producto producto, double cantidadADescontar)
        {
            return producto.PuedeDescontarCantidad(cantidadADescontar);
        }
        
    }
}
