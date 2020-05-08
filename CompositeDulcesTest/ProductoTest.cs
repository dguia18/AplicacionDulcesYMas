using Domain.Entities;
using NUnit.Framework;
using System;
using System.Collections.Generic;
using System.Text;

namespace DomainTest
{
    public class ProductoTest
    {
        [SetUp]
        public void SetUp()
        {

        }
        [TestCaseSource("DatosIncorrectosParaProducto")]
        public void PuedeCrearProducto(double cantidad, double costoUnitario,
            string esperado)
        {
            var obtenido = ProductoPuedeCrear.PuedeCrearProducto(cantidad, costoUnitario);
            Assert.AreEqual(esperado, string.Join(", ",obtenido));
        }
        private static IEnumerable<TestCaseData> DatosIncorrectosParaProducto()
        {
            yield return new TestCaseData(-5, -560,
                "Cantidad invalida, Costo unitario invalido").SetName("CrearProductoCantidadYCostoInvalido");
            yield return new TestCaseData(5, -560,
                "Costo unitario invalido").SetName("CrearProductoCostoInvalido");
            yield return new TestCaseData(-5, 560,
                "Cantidad invalida").SetName("CrearProductoCantidadInvalida");
        }
    }
}
