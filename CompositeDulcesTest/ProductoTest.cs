using Domain.Services;
using NUnit.Framework;
using System.Collections.Generic;

namespace DomainTest
{
    public class ProductoTest
    {        
        [TestCaseSource("DatosIncorrectosParaProducto")]
        public void PuedeCrearProducto(decimal cantidad, decimal costoUnitario,decimal porcentajeDeUtilidad,
            string esperado)
        {
            var obtenido = ProductoPuedeCrear.PuedeCrearProducto(cantidad, costoUnitario, porcentajeDeUtilidad);
            Assert.AreEqual(esperado, string.Join(", ",obtenido));
        }
        private static IEnumerable<TestCaseData> DatosIncorrectosParaProducto()
        {
            yield return new TestCaseData(-5m, -560m,0m,
                "Cantidad invalida, Costo unitario invalido").SetName("CrearProductoCantidadYCostoInvalido");
            yield return new TestCaseData(5m, -560m,0m,
                "Costo unitario invalido").SetName("CrearProductoCostoInvalido");
            yield return new TestCaseData(5m, 560m,1000m,
                "Porcentaje de utilidad invalido").SetName("CrearProductoPorcentajeDeUtilidadMayorQueCien");
            yield return new TestCaseData(5m, 560m,-1000m,
                "Porcentaje de utilidad invalido").SetName("CrearProductoPorcentajeDeUtilidadNegativo");
            yield return new TestCaseData(-5m, 560m,0m,
                "Cantidad invalida").SetName("CrearProductoCantidadInvalida");
        }
    }
}
