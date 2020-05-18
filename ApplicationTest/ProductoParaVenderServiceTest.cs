
using Application;
using Application.Request;
using Application.Services;
using Domain;
using Infrastructure;
using Infrastructure.Base;
using Microsoft.EntityFrameworkCore;
using NUnit.Framework;
using System.Collections.Generic;

namespace ApplicationTest
{
    public class ProductoParaVenderServiceTest
    {
        private DulcesYmasContext _context;
        private UnitOfWork _unitOfWork;
        [SetUp]
        public void Setup()
        {
            var optionsInMemory = new DbContextOptionsBuilder<DulcesYmasContext>().
                UseInMemoryDatabase("DulcesYmas").Options;

            _context = new DulcesYmasContext(optionsInMemory);
            _unitOfWork = new UnitOfWork(_context);
            #region CrearProductos
            ProductoRequest request = new ProductoRequest.ProductoRequestBuilder(1, "Dulce de Maduro" +
                " Envuelto").SetCantidad(0).SetPorcentajeDeUtilidad(0).
                SetUnidadDeMedida(UnidadDeMedida.Unidades).SetCostoUnitario(0).
                SetEnvoltorio(Envoltorio.TieneEnvoltorio).Build();

            ProductoRequest request2 = new ProductoRequest.ProductoRequestBuilder(1, "Bandeja Surtida " +
                "Pequeña").SetCantidad(0).SetPorcentajeDeUtilidad(0).
                SetUnidadDeMedida(UnidadDeMedida.Unidades).SetCostoUnitario(0).
                SetEnvoltorio(Envoltorio.TieneEnvoltorio).Build();

            ProductoRequest request3 = new ProductoRequest.ProductoRequestBuilder(1, "Unidades Pequeñas")
                .SetCantidad(0).SetPorcentajeDeUtilidad(0).
                SetUnidadDeMedida(UnidadDeMedida.Unidades).SetCostoUnitario(0).
                SetEnvoltorio(Envoltorio.NoTieneEnvoltorio).Build();

            ProductoRequest request4 = new ProductoRequest.ProductoRequestBuilder(1, "Unidades Medianas")
                .SetCantidad(0).SetPorcentajeDeUtilidad(0).
                SetUnidadDeMedida(UnidadDeMedida.Unidades).SetCostoUnitario(0).
                SetEnvoltorio(Envoltorio.NoTieneEnvoltorio).Build();

            new CrearProductoParaVender(_unitOfWork).CrearProducto(request);
            new CrearProductoParaVender(_unitOfWork).CrearProducto(request2);
            new CrearProductoParaVender(_unitOfWork).CrearProducto(request3);
            new CrearProductoParaVender(_unitOfWork).CrearProducto(request4);
            #endregion

        }
        [Test, Order(1)]
        public void ListarProductosConEnvoltorio()
        {
            Response response = new ListarProductosPorTipo(_unitOfWork).
                EstablecerTipo(new ProductoParaVenderConEnvoltorio()).Filtrar();

            List<ProductoRequest> productos = (List<ProductoRequest>)response.Data;
            Assert.AreEqual(2, productos.Count);
        }
        [Test, Order(2)]
        public void ListarProductosSinEnvoltorio()
        {
            Response response = new ListarProductosPorTipo(_unitOfWork).
                EstablecerTipo(new ProductoParaVenderSinEnvoltorio()).Filtrar();

            List<ProductoRequest> productos = (List<ProductoRequest>)response.Data;
            Assert.AreEqual(2, productos.Count);
        }
        [TestCaseSource("DataTestInvalidos"), Order(3)]
        public void CrearProductoParaVender(string nombreProducto,
            double cantidadProducto, double costoUnitarioProducto,
            UnidadDeMedida unidadDeMedidaProducto,
            double porcentajeDeUtilidadProducto, string esperado)
        {
            ProductoRequest request = new ProductoRequest.ProductoRequestBuilder(1, nombreProducto).
                SetCantidad(cantidadProducto).SetCostoUnitario(costoUnitarioProducto).
                SetUnidadDeMedida(unidadDeMedidaProducto).
                SetPorcentajeDeUtilidad(porcentajeDeUtilidadProducto).Build();

            Response response = new CrearProductoParaVender(_unitOfWork).
                CrearProducto(request);

            Assert.AreEqual(esperado, response.Mensaje);
        }
        private static IEnumerable<TestCaseData> DataTestInvalidos()
        {
            yield return new TestCaseData("Bandeja de leche", -5, 1000, 
                UnidadDeMedida.Unidades, 0,"Cantidad invalida").
                SetName("CrearProductoConCantidadInvalida");

            yield return new TestCaseData("Bandeja de Leche", 5, -1000,
                UnidadDeMedida.Unidades, 0,"Costo unitario invalido").
                SetName("CrearProductoConCostoInvalida");

            yield return new TestCaseData("Bandeja de Leche", -5, -1000,
                UnidadDeMedida.Unidades, 0,"Cantidad invalida, Costo unitario invalido").
                SetName("CrearProductoConCostoyCantidadInvalida");

            yield return new TestCaseData("Bandeja de Leche", 5, 1000,
                UnidadDeMedida.Unidades, 0,"Producto registrado con éxito").
                SetName("ProductoRegistradoConExito");
        }
        [TestCaseSource("DataTestCorrecto"), Order(4)]
        public void CrearMateriaPrimaDuplicado(string nombreProducto,
            double cantidadProducto, double costoUnitarioProducto,
            UnidadDeMedida unidadDeMedidaProducto, double porcentajeDeUtilidadProducto)
        {
            ProductoRequest request = new ProductoRequest.ProductoRequestBuilder(1, nombreProducto).
                SetCantidad(cantidadProducto).SetCostoUnitario(costoUnitarioProducto).
                SetUnidadDeMedida(unidadDeMedidaProducto).
                SetPorcentajeDeUtilidad(porcentajeDeUtilidadProducto).Build();

            _ = new CrearProductoParaVender(_unitOfWork).
                CrearProducto(request);

            Response response = new CrearProductoParaVender(_unitOfWork).
                CrearProducto(request);

            Assert.AreEqual("El producto ya existe", response.Mensaje);
        }
        private static IEnumerable<TestCaseData> DataTestCorrecto()
        {
            yield return new TestCaseData("Dulce de Maduro Envuelto", 5,
                1000, UnidadDeMedida.Unidades, 0).
                SetName("ProductoMateriaPrimaDuplicado");
        }

    }
}
