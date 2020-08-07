using System.Collections.Generic;

namespace Domain.Services
{
    public static class ProductoPuedeCrear
    {
        public static IReadOnlyList<string> PuedeCrearProducto(decimal cantidad,
            decimal costoUnitario, decimal porcentajeDeUtilidad=0)
        {
            var errores = new List<string>();
            if (cantidad < 0)
                errores.Add("Cantidad invalida");
            if (costoUnitario < 0)
                errores.Add("Costo unitario invalido");
            if (porcentajeDeUtilidad < 0)
                errores.Add("Porcentaje de utilidad invalido");
            if (porcentajeDeUtilidad >100)
                errores.Add("Porcentaje de utilidad invalido");
            return errores;
        }
    }
}
