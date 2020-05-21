using Domain.Services;
using NUnit.Framework;
using System.Collections.Generic;

namespace DomainTest
{
    public class ProductoTest
    {
        [SetUp]
        public void SetUp()
        {

        }
        [TestCaseSource("DatosIncorrectosParaProducto")]
        public void PuedeCrearProducto(double cantidad, double costoUnitario,double porcentajeDeUtilidad,
            string esperado)
        {
            var obtenido = ProductoPuedeCrear.PuedeCrearProducto(cantidad, costoUnitario, porcentajeDeUtilidad);
            Assert.AreEqual(esperado, string.Join(", ",obtenido));
        }
        private static IEnumerable<TestCaseData> DatosIncorrectosParaProducto()
        {
            yield return new TestCaseData(-5, -560,0,
                "Cantidad invalida, Costo unitario invalido").SetName("CrearProductoCantidadYCostoInvalido");
            yield return new TestCaseData(5, -560,0,
                "Costo unitario invalido").SetName("CrearProductoCostoInvalido");
            yield return new TestCaseData(5, 560,1000,
                "Porcentaje de utilidad invalido").SetName("CrearProductoPorcentajeDeUtilidadMayorQueCien");
            yield return new TestCaseData(5, 560,-1000,
                "Porcentaje de utilidad invalido").SetName("CrearProductoPorcentajeDeUtilidadNegativo");
            yield return new TestCaseData(-5, 560,0,
                "Cantidad invalida").SetName("CrearProductoCantidadInvalida");
        }
    }
}
