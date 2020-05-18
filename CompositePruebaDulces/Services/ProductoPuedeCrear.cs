using System.Collections.Generic;

namespace Domain.Entities.EntitiesProducto
{
    public static class ProductoPuedeCrear
    {
        public static IReadOnlyList<string> PuedeCrearProducto(double cantidad,
            double costoUnitario)
        {
            var errores = new List<string>();
            if (cantidad < 0)
                errores.Add("Cantidad invalida");
            if (costoUnitario < 0)
                errores.Add("Costo unitario invalido");
            return errores;
        }
    }
}
