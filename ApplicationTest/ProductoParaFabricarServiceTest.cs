
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

            ProductoRequest request = new ProductoRequest("Dulce de Ñame", 0,
                0, UnidadDeMedida.Unidades, 0, Contestura.Duro);
            ProductoRequest request2 = new ProductoRequest("Dulce de Batata", 0,
                0, UnidadDeMedida.Unidades, 0, Contestura.Duro);
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

            ProductoRequest materiaPrima = new ProductoRequest("Ñame", 15,
                0, UnidadDeMedida.Kilos, 0);
            new CrearProductoMateriaPrima(_unitOfWork).
                CrearProducto(materiaPrima);

            ProductoRequest materiaPrima1 = new ProductoRequest("Leche", 95,
                0, UnidadDeMedida.Litros, 0);
            new CrearProductoMateriaPrima(_unitOfWork).
                CrearProducto(materiaPrima1);
            
            ProductoRequest materiaPrima2 = new ProductoRequest("Azucar", 30,
                0, UnidadDeMedida.Litros, 0);
            new CrearProductoMateriaPrima(_unitOfWork).
                CrearProducto(materiaPrima2);

            List<FabricacionDetalleRequest> detalles =
                new List<FabricacionDetalleRequest>();
            detalles.Add(new FabricacionDetalleRequest("ÑAME", 16));
            detalles.Add(new FabricacionDetalleRequest("Leche", 95));
            detalles.Add(new FabricacionDetalleRequest("Azucar", 30));

            fabricacionDetalleRequestsConErrorEnPrimerIndice = detalles;

            List<FabricacionDetalleRequest> detalles1 =
                new List<FabricacionDetalleRequest>();
            detalles1.Add(new FabricacionDetalleRequest("ÑAME", 15));
            detalles1.Add(new FabricacionDetalleRequest("Leche", 96));
            detalles1.Add(new FabricacionDetalleRequest("Azucar", 30));

            fabricacionDetalleRequestsConErrorEnSegundoIndice = detalles1;

            List<FabricacionDetalleRequest> detalles2 =
                new List<FabricacionDetalleRequest>();
            detalles2.Add(new FabricacionDetalleRequest("ÑAME", 15));
            detalles2.Add(new FabricacionDetalleRequest("Leche", 95));
            detalles2.Add(new FabricacionDetalleRequest("Azucar", 45));

            fabricacionDetalleRequestsConErrorEnUltimoIndice = detalles2;
            
            List<FabricacionDetalleRequest> detalles3 =
                new List<FabricacionDetalleRequest>();
            detalles2.Add(new FabricacionDetalleRequest("ÑAME", 15));
            detalles2.Add(new FabricacionDetalleRequest("Leche", 95));
            detalles2.Add(new FabricacionDetalleRequest("Azucar", 30));

            fabricacionDetalleRequestsCorrectos = detalles3;

            new TerceroCrear(_unitOfWork).
                SaveTercero(new TerceroRequest("1065840833", "Duvan Guia"));
            TerceroEmpleadoRequest empleadoRequest = new TerceroEmpleadoRequest
                ("1065840833");
            new TerceroEmpleadoCrear(_unitOfWork).Crear(empleadoRequest);
        }
        [Test, Order(1)]
        public void ListarProductoParaFabricarDuro()
        {
            Response response = new ListarProductosPorTipo(_unitOfWork).
                EstablecerTipo(new ProductoParaFabricarDuro()).Filtrar();
            List<ProductoRequest> productos = (List<ProductoRequest>)response.Data;
            Assert.AreEqual(2, productos.Count);
        }
        [Test, Order(2)]
        public void ListarProductoParaFabricarSuave()
        {
            Response response = new ListarProductosPorTipo(_unitOfWork).
                EstablecerTipo(new ProductoParaFabricarDuro()).Filtrar();
            List<ProductoRequest> productos = (List<ProductoRequest>)response.Data;
            Assert.AreEqual(2, productos.Count);
        }
        [TestCaseSource("DataTestInvalidos"), Order(3)]
        public void CrearProductoParaFabricar(string nombreProducto, double cantidadProducto,
            double costoUnitarioProducto, UnidadDeMedida unidadDeMedidaProducto,
            double porcentajeDeUtilidadProducto, string esperado)
        {
            ProductoRequest request = new ProductoRequest(nombreProducto,
                cantidadProducto, costoUnitarioProducto, unidadDeMedidaProducto,
                porcentajeDeUtilidadProducto);

            Response response = new CrearProductoParaFabricar(_unitOfWork).
                CrearProducto(request);

            Assert.AreEqual(esperado, response.Mensaje);
        }
        private static IEnumerable<TestCaseData> DataTestInvalidos()
        {
            yield return new TestCaseData("Dulce de Leche", -5, 1000, UnidadDeMedida.Litros, 0,
                "Cantidad invalida").SetName("CrearProductoConCantidadInvalida");

            yield return new TestCaseData("Dulce de Papaya", 5, -1000, UnidadDeMedida.Litros, 0,
                "Costo unitario invalido").SetName("CrearProductoConCostoInvalida");

            yield return new TestCaseData("Dulce de Batata", -5, -1000, UnidadDeMedida.Unidades, 0,
                "Cantidad invalida, Costo unitario invalido").
                SetName("CrearProductoConCostoyCantidadInvalida");

            yield return new TestCaseData("Dulce de Papaya Piña y coco",
                5, 1000, UnidadDeMedida.Unidades, 0, "Producto registrado con exito")
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
        [TestCaseSource("DataTestFabricarProducto")]
        public void FabricacionProbar(string identificacionEmpleado, string nombreDulce,
            Contestura contestura,string esperado)
        {
            
            FabricacionRequest request = new FabricacionRequest(identificacionEmpleado,
                nombreDulce, 0, 0, contestura,fabricacionDetalleRequestsCorrectos);
            Response obtenido = new CrearFabricacion(_unitOfWork).IniciarFabricacion(request);
            Assert.AreEqual(esperado, obtenido.Mensaje);
        }
       
        private static IEnumerable<TestCaseData> DataTestFabricarProducto()
        {            
            yield return new TestCaseData("1065840833", "Dulce DeÑame", Contestura.Duro,
                "El producto para fabricar no existe, agreguelo").
                SetName("FabricacionNoExisteProducto");

            yield return new TestCaseData("106540833", "Dulce De Ñame", Contestura.Duro,
                $"No hay un empleado con identificacion " +
                $"106540833").SetName("FabricacionNoExisteEmpleado");

            yield return new TestCaseData("1065840833", "Dulce De Ñame", Contestura.Duro,
                "Fabricacion realizada con exito, a espera de definir la cantidad producida").
                SetName("FabricacionCreada");
           
        }
        [Test]
        public void FabricacionConDetalleErradoPrimerIndice()
        {
            FabricacionRequest request = new FabricacionRequest("1065840833", "Dulce De Ñame"
                ,0,0,Contestura.Duro, fabricacionDetalleRequestsConErrorEnPrimerIndice);
            Response obtenido = new CrearFabricacion(_unitOfWork).IniciarFabricacion(request);
            Assert.AreEqual("No hay cantidades suficientes " +
               $"de ÑAME, solo hay 15", obtenido.Mensaje);
        }
        [Test]
        public void FabricacionConDetalleErradoSegundoIndice()
        {
            FabricacionRequest request = new FabricacionRequest("1065840833", "Dulce De Ñame"
                , 0, 0, Contestura.Duro, fabricacionDetalleRequestsConErrorEnSegundoIndice);
            Response obtenido = new CrearFabricacion(_unitOfWork).IniciarFabricacion(request);
            Assert.AreEqual("No hay cantidades suficientes " +
               $"de LECHE, solo hay 95", obtenido.Mensaje);
        }
        [Test]
        public void FabricacionConDetalleErradoUltimoIndice()
        {
            FabricacionRequest request = new FabricacionRequest("1065840833", "Dulce De Ñame"
                , 0, 0, Contestura.Duro, fabricacionDetalleRequestsConErrorEnUltimoIndice);
            Response obtenido = new CrearFabricacion(_unitOfWork).IniciarFabricacion(request);
            Assert.AreEqual("No hay cantidades suficientes " +
               $"de AZUCAR, solo hay 30", obtenido.Mensaje);
        }        
    }
}
