
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
    public class ProductoParaFabricarServiceTest
    {

        private DulcesYmasContext _context;
        private UnitOfWork _unitOfWork;
        private ProductoService _productoService;
        [SetUp]
        public void Setup()
        {
            var optionsInMemory = new DbContextOptionsBuilder<DulcesYmasContext>().
                UseInMemoryDatabase("DulcesYmas").Options;

            _context = new DulcesYmasContext(optionsInMemory);
            _unitOfWork = new UnitOfWork(_context);

            ProductoRequest request = new ProductoRequest("Dulce de Ñame", 0,
                0, UnidadDeMedida.Unidades, 0,Contestura.Duro);
            ProductoRequest request2 = new ProductoRequest("Dulce de Batata", 0,
                0, UnidadDeMedida.Unidades, 0,Contestura.Duro);
            new CrearProductoParaFabricar(_unitOfWork).
                CrearProducto(request);
            new CrearProductoParaFabricar(_unitOfWork).
                CrearProducto(request2);

            ProductoRequest request3 = new ProductoRequest("Dulce de Leche", 0,
                0, UnidadDeMedida.Litros, 0, Contestura.Suave);
            ProductoRequest request4 = new ProductoRequest("Dulce de Grosella", 0,
                0, UnidadDeMedida.Litros, 0, Contestura.Suave);
            new CrearProductoParaFabricar(_unitOfWork).
                CrearProducto(request3);
            new CrearProductoParaFabricar(_unitOfWork).
                CrearProducto(request4);
        }
        [Test, Order(1)]
        public void ListarProductoParaFabricarDuro()
        {
            Response response = new ListarProductosPorTipo(_unitOfWork).
                EstablecerTipo(new ProductoParaFabricarDuro()).Filtrar();
            List<ProductoRequest> productos = (List<ProductoRequest>)response.Data;
            Assert.AreEqual(2, productos.Count);
        }
        [TestCaseSource("DataTestInvalidos"), Order(2)]
        public void CrearProductoMateriaPrima(string nombreProducto, double cantidadProducto,
            double costoUnitarioProducto, UnidadDeMedida unidadDeMedidaProducto,
            double porcentajeDeUtilidadProducto, string esperado)
        {
            ProductoRequest request = new ProductoRequest(nombreProducto, cantidadProducto,
                costoUnitarioProducto, unidadDeMedidaProducto, porcentajeDeUtilidadProducto);
            Response response = new CrearProductoMateriaPrima(_unitOfWork).
                CrearProducto(request);
            Assert.AreEqual(esperado, response.Mensaje);
        }
        private static IEnumerable<TestCaseData> DataTestInvalidos()
        {
            yield return new TestCaseData("Azucar", -5, 1000, "Kilos", 0,
                "Cantidad invalida").SetName("CrearProductoConCantidadInvalida");

            yield return new TestCaseData("Azucar", 5, -1000, "Kilos", 0,
                "Costo unitario invalido").SetName("CrearProductoConCostoInvalida");

            yield return new TestCaseData("Azucar", -5, -1000, "Kilos", 0,
                "Cantidad invalida, Costo unitario invalido").
                SetName("CrearProductoConCostoyCantidadInvalida");

            yield return new TestCaseData("Azucar", 5, 1000, "Kilos", 0,
                "Producto registrado con exito").SetName("ProductoRegistradoConExito" +
                "");
        }
        [TestCaseSource("DataTestCorrecto"), Order(3)]
        public void CrearMateriaPrimaDuplicado(string nombreProducto, double cantidadProducto,
            double costoUnitarioProducto, UnidadDeMedida unidadDeMedidaProducto,
            double porcentajeDeUtilidadProducto)
        {
            ProductoRequest request = new ProductoRequest(nombreProducto, cantidadProducto,
                costoUnitarioProducto, unidadDeMedidaProducto, porcentajeDeUtilidadProducto);
            _ = new CrearProductoMateriaPrima(_unitOfWork).
                CrearProducto(request);
            Response response = new CrearProductoMateriaPrima(_unitOfWork).
                CrearProducto(request);
            Assert.AreEqual("El producto ya existe", response.Mensaje);
        }
        private static IEnumerable<TestCaseData> DataTestCorrecto()
        {
            yield return new TestCaseData("Azucar", 5, 1000, "Kilos", 0).
                SetName("ProductoMateriaPrimaDuplicado");
        }
    }
}
