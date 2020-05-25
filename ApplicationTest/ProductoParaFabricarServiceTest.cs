
using Application.Request;
using Application.Services;
using Application.Services.ProductoServices;
using Domain.Entities.EntitiesProducto;
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
        [SetUp]
        public void Setup()
        {
            var optionsInMemory = new DbContextOptionsBuilder<DulcesYmasContext>().
                UseInMemoryDatabase("DulcesYmas").Options;

            _context = new DulcesYmasContext(optionsInMemory);
            _unitOfWork = new UnitOfWork(_context);                      
            
        }
        private Response CrearProductoParaFabricarDataTest(string nombreProducto, double cantidadProducto,
            double costoUnitarioProducto, UnidadDeMedida unidadDeMedidaProducto,
            double porcentajeDeUtilidadProducto, Especificacion especificacion, ProductoService service)
        {
            ProductoRequest request = new ProductoRequest.ProductoRequestBuilder(1, nombreProducto).
                SetCantidad(cantidadProducto).SetCostoUnitario(costoUnitarioProducto).
                SetUnidadDeMedida(unidadDeMedidaProducto).SetEspecificacion(especificacion).
                SetPorcentajeDeUtilidad(porcentajeDeUtilidadProducto).Build();

            return service.
                Crear(request);
        }
        [Test, Order(1)]
        public void ListarProductoParaFabricarDuro()
        {
            CrearProductoParaFabricarDataTest("Dulce de Ñame", 0,
                0, UnidadDeMedida.Unidades, 0, Especificacion.Duro,
                new ProductoParaFabricarCrearService(_unitOfWork));

            CrearProductoParaFabricarDataTest("Dulce de Batata", 0,
                0, UnidadDeMedida.Unidades, 0, Especificacion.Duro,
                new ProductoParaFabricarCrearService(_unitOfWork));

            CrearProductoParaFabricarDataTest("Dulce de Leche", 0,
                0, UnidadDeMedida.Litros, 0, Especificacion.Suave,
                new ProductoParaFabricarCrearService(_unitOfWork));

            CrearProductoParaFabricarDataTest("Dulce de Grosella", 0,
                0, UnidadDeMedida.Litros, 0, Especificacion.Suave,
                new ProductoParaFabricarCrearService(_unitOfWork));

            Response response = new ListarProductosPorTipo(_unitOfWork).
                EstablecerTipo(Tipo.ParaFabricar).Filtrar();
            List<ProductoRequest> productos = (List<ProductoRequest>)response.Data;
            Assert.AreEqual(4, productos.Count);
        }        
        [TestCaseSource("DataTestInvalidos"), Order(3)]
        public void CrearProductoParaFabricar(string nombreProducto, double cantidadProducto,
            double costoUnitarioProducto, UnidadDeMedida unidadDeMedidaProducto,
            Especificacion especificacion, string esperado)
        {
            Response response = CrearProductoParaFabricarDataTest(nombreProducto,
                cantidadProducto, costoUnitarioProducto, unidadDeMedidaProducto,0,
                especificacion, new ProductoParaFabricarCrearService(_unitOfWork));

            Assert.AreEqual(esperado, response.Mensaje);
        }
        private static IEnumerable<TestCaseData> DataTestInvalidos()
        {
            yield return new TestCaseData("Dulce de Leche", -5, 1000, UnidadDeMedida.Litros,
                Especificacion.Duro,"Cantidad invalida").SetName("CrearProductoConCantidadInvalida");

            yield return new TestCaseData("Dulce de Papaya", 5, -1000, UnidadDeMedida.Litros,
                Especificacion.Duro,"Costo unitario invalido").SetName("CrearProductoConCostoInvalida");

            yield return new TestCaseData("Dulce de Batata", -5, -1000, UnidadDeMedida.Unidades,
                Especificacion.Duro,"Cantidad invalida, Costo unitario invalido").
                SetName("CrearProductoConCostoyCantidadInvalida");

            yield return new TestCaseData("Dulce de Papaya Piña y coco",
                5, 1000, UnidadDeMedida.Unidades,Especificacion.Duro, "Producto registrado con éxito")
                .SetName("ProductoRegistradoConExito");
        }
        [TestCaseSource("DataTestCorrecto"), Order(4)]
        public void CrearProductoParaFabricarDuplicado(string nombreProducto,
            double cantidadProducto, double costoUnitarioProducto,
            UnidadDeMedida unidadDeMedidaProducto,
            double porcentajeDeUtilidadProducto)
        {
            ProductoRequest request = new ProductoRequest.ProductoRequestBuilder(1, nombreProducto).
                SetCantidad(cantidadProducto).SetCostoUnitario(costoUnitarioProducto).
                SetUnidadDeMedida(unidadDeMedidaProducto).
                SetPorcentajeDeUtilidad(porcentajeDeUtilidadProducto).Build();

            _ = new ProductoParaFabricarCrearService(_unitOfWork).
                Crear(request);

            Response response = new ProductoParaFabricarCrearService(_unitOfWork).
                Crear(request);

            Assert.AreEqual("El producto ya existe", response.Mensaje);
        }
        private static IEnumerable<TestCaseData> DataTestCorrecto()
        {
            yield return new TestCaseData("Dulce de Ñame", 5, 1000,
                UnidadDeMedida.Unidades, 0).
                SetName("ProductoParaFabricarDuplicado");
        }

    }
}
