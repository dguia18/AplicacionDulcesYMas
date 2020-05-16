
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
        private List<FabricacionDetalleRequest> 
            fabricacionDetalleRequestsConErrorEnPrimerIndice = new List<FabricacionDetalleRequest>();
        private List<FabricacionDetalleRequest> fabricacionDetalleRequestsConErrorEnSegundoIndice;
        private List<FabricacionDetalleRequest> fabricacionDetalleRequestsConErrorEnUltimoIndice;
        private List<FabricacionDetalleRequest> fabricacionDetalleRequestsCorrectos;
        
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
            double porcentajeDeUtilidadProducto, Contestura contestura, ProductoService service)
        {
            ProductoRequest request = new ProductoRequest(nombreProducto, cantidadProducto,
            costoUnitarioProducto, unidadDeMedidaProducto,
            porcentajeDeUtilidadProducto, contestura);
            return service.
                CrearProducto(request);
        }
        [Test, Order(1)]
        public void ListarProductoParaFabricarDuro()
        {
            CrearProductoParaFabricarDataTest("Dulce de Ñame", 0,
                0, UnidadDeMedida.Unidades, 0, Contestura.Duro,
                new CrearProductoParaFabricar(_unitOfWork));

            CrearProductoParaFabricarDataTest("Dulce de Batata", 0,
                0, UnidadDeMedida.Unidades, 0, Contestura.Duro,
                new CrearProductoParaFabricar(_unitOfWork));

            CrearProductoParaFabricarDataTest("Dulce de Leche", 0,
                0, UnidadDeMedida.Litros, 0, Contestura.Suave,
                new CrearProductoParaFabricar(_unitOfWork));

            CrearProductoParaFabricarDataTest("Dulce de Grosella", 0,
                0, UnidadDeMedida.Litros, 0, Contestura.Suave,
                new CrearProductoParaFabricar(_unitOfWork));

            Response response = new ListarProductosPorTipo(_unitOfWork).
                EstablecerTipo(new ProductoParaFabricarDuro()).Filtrar();
            List<ProductoRequest> productos = (List<ProductoRequest>)response.Data;
            Assert.AreEqual(2, productos.Count);
        }
        [Test, Order(2)]
        public void ListarProductoParaFabricarSuave()
        {
            CrearProductoParaFabricarDataTest("Dulce de Ñame", 0,
                0, UnidadDeMedida.Unidades, 0, Contestura.Duro,
                new CrearProductoParaFabricar(_unitOfWork));

            CrearProductoParaFabricarDataTest("Dulce de Batata", 0,
                0, UnidadDeMedida.Unidades, 0, Contestura.Duro,
                new CrearProductoParaFabricar(_unitOfWork));

            CrearProductoParaFabricarDataTest("Dulce de Leche", 0,
                0, UnidadDeMedida.Litros, 0, Contestura.Suave,
                new CrearProductoParaFabricar(_unitOfWork));

            CrearProductoParaFabricarDataTest("Dulce de Grosella", 0,
                0, UnidadDeMedida.Litros, 0, Contestura.Suave,
                new CrearProductoParaFabricar(_unitOfWork));

            Response response = new ListarProductosPorTipo(_unitOfWork).
                EstablecerTipo(new ProductoParaFabricarSuave()).Filtrar();
            List<ProductoRequest> productos = (List<ProductoRequest>)response.Data;
            Assert.AreEqual(2, productos.Count);
        }
        [TestCaseSource("DataTestInvalidos"), Order(3)]
        public void CrearProductoParaFabricar(string nombreProducto, double cantidadProducto,
            double costoUnitarioProducto, UnidadDeMedida unidadDeMedidaProducto,
            Contestura contestura, string esperado)
        {
            Response response = CrearProductoParaFabricarDataTest(nombreProducto,
                cantidadProducto, costoUnitarioProducto, unidadDeMedidaProducto,0,
                contestura, new CrearProductoParaFabricar(_unitOfWork));

            Assert.AreEqual(esperado, response.Mensaje);
        }
        private static IEnumerable<TestCaseData> DataTestInvalidos()
        {
            yield return new TestCaseData("Dulce de Leche", -5, 1000, UnidadDeMedida.Litros,
                Contestura.Duro,"Cantidad invalida").SetName("CrearProductoConCantidadInvalida");

            yield return new TestCaseData("Dulce de Papaya", 5, -1000, UnidadDeMedida.Litros,
                Contestura.Duro,"Costo unitario invalido").SetName("CrearProductoConCostoInvalida");

            yield return new TestCaseData("Dulce de Batata", -5, -1000, UnidadDeMedida.Unidades,
                Contestura.Duro,"Cantidad invalida, Costo unitario invalido").
                SetName("CrearProductoConCostoyCantidadInvalida");

            yield return new TestCaseData("Dulce de Papaya Piña y coco",
                5, 1000, UnidadDeMedida.Unidades,Contestura.Duro, "Producto registrado con exito")
                .SetName("ProductoRegistradoConExito");
        }
        [TestCaseSource("DataTestCorrecto"), Order(4)]
        public void CrearProductoParaFabricarDuplicado(string nombreProducto,
            double cantidadProducto, double costoUnitarioProducto,
            UnidadDeMedida unidadDeMedidaProducto,
            double porcentajeDeUtilidadProducto)
        {
            ProductoRequest request = new ProductoRequest(nombreProducto,
                cantidadProducto, costoUnitarioProducto, unidadDeMedidaProducto,
                porcentajeDeUtilidadProducto);

            _ = new CrearProductoParaFabricar(_unitOfWork).
                CrearProducto(request);

            Response response = new CrearProductoParaFabricar(_unitOfWork).
                CrearProducto(request);

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
