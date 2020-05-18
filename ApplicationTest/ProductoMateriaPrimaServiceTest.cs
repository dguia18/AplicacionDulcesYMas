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
    public class ProductoMateriaPrimaServiceTest
    {
        private DulcesYmasContext _context;
        private UnitOfWork _unitOfWork; 
        private ProductoService _productoService;
        [SetUp]
        public void Setup()
        {
            var optionsInMemory = new DbContextOptionsBuilder<DulcesYmasContext>().
                UseInMemoryDatabase("DulcesYmas1").Options;

            _context = new DulcesYmasContext(optionsInMemory);
            _unitOfWork = new UnitOfWork(_context);

            ProductoRequest request = new ProductoRequest.ProductoRequestBuilder(1,"Ñame").
                SetCantidad(0).SetPorcentajeDeUtilidad(0).SetUnidadDeMedida(UnidadDeMedida.Kilos).
                Build();

            ProductoRequest request2 = new ProductoRequest.ProductoRequestBuilder(1, "Batata").
                SetCantidad(0).SetPorcentajeDeUtilidad(0).SetUnidadDeMedida(UnidadDeMedida.Kilos).
                Build();

            new CrearProductoMateriaPrima(_unitOfWork).
                CrearProducto(request);
            new CrearProductoMateriaPrima(_unitOfWork).
                CrearProducto(request2);
        }
        [Test, Order(1)]
        public void ListarProductoMateriaPrima()
        {
            Response response = new ListarProductosPorTipo(_unitOfWork).
                EstablecerTipo(new ProductoMateriaPrima()).Filtrar();
            List<ProductoRequest> productos = (List<ProductoRequest>)response.Data;
            Assert.AreEqual(2, productos.Count);
        }
        [TestCaseSource("DataTestInvalidos"),Order(2)]
        public void CrearProductoMateriaPrima(string nombreProducto, 
            double cantidadProducto,double costoUnitarioProducto, 
            UnidadDeMedida unidadDeMedidaProducto,
            double porcentajeDeUtilidadProducto,string esperado)
        {
            ProductoRequest request = new ProductoRequest.ProductoRequestBuilder(1,nombreProducto).
                SetCantidad(cantidadProducto).SetCostoUnitario(costoUnitarioProducto).
                SetUnidadDeMedida(unidadDeMedidaProducto).
                SetPorcentajeDeUtilidad(porcentajeDeUtilidadProducto).Build();
            
            Response response = new CrearProductoMateriaPrima(_unitOfWork).
                CrearProducto(request);
            
            Assert.AreEqual(esperado, response.Mensaje);
        }
        private static IEnumerable<TestCaseData> DataTestInvalidos()
        {
            yield return new TestCaseData("Azúcar", -5, 1000, UnidadDeMedida.Kilos, 0, 
                "Cantidad invalida").SetName("CrearProductoConCantidadInvalida");

            yield return new TestCaseData("Azúcar", 5, -1000, UnidadDeMedida.Kilos, 0,
                "Costo unitario invalido").SetName("CrearProductoConCostoInvalida");

            yield return new TestCaseData("Azúcar", -5, -1000, UnidadDeMedida.Kilos, 0,
                "Cantidad invalida, Costo unitario invalido").
                SetName("CrearProductoConCostoyCantidadInvalida");

            yield return new TestCaseData("Azúcar", 5, 1000, UnidadDeMedida.Kilos, 0,
                "Producto registrado con éxito").SetName("ProductoRegistradoConExito" +
                "");
        }
        [TestCaseSource("DataTestCorrecto"),Order(3)]
        public void CrearMateriaPrimaDuplicado(string nombreProducto,
            double cantidadProducto,double costoUnitarioProducto, 
            UnidadDeMedida unidadDeMedidaProducto,double porcentajeDeUtilidadProducto)
        {
            ProductoRequest request = new ProductoRequest.ProductoRequestBuilder(1, nombreProducto).
                SetCantidad(cantidadProducto).SetCostoUnitario(costoUnitarioProducto).
                SetUnidadDeMedida(unidadDeMedidaProducto).
                SetPorcentajeDeUtilidad(porcentajeDeUtilidadProducto).Build();

            _ = new CrearProductoMateriaPrima(_unitOfWork).
                CrearProducto(request);
            
            Response response = new CrearProductoMateriaPrima(_unitOfWork).
                CrearProducto(request);
            
            Assert.AreEqual("El producto ya existe", response.Mensaje);
        }
        private static IEnumerable<TestCaseData> DataTestCorrecto()
        {            
            yield return new TestCaseData("Azúcar", 5, 1000, UnidadDeMedida.Kilos, 0).
                SetName("ProductoMateriaPrimaDuplicado");
        }    
        
    }
}