using Domain.Entities.EntitiesProducto;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

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
