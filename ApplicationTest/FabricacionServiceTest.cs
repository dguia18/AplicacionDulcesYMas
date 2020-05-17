
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
    public class FabricacionServiceTest
    {
        private DulcesYmasContext _context;
        private UnitOfWork _unitOfWork;
        private static List<FabricacionDetalleRequest> fabricacionDetalleRequestsConErrorEnPrimerIndice;
        private static List<FabricacionDetalleRequest> fabricacionDetalleRequestsConErrorEnSegundoIndice;
        private static List<FabricacionDetalleRequest> fabricacionDetalleRequestsConErrorEnUltimoIndice;
        private static List<FabricacionDetalleRequest> fabricacionDetalleRequestsCorrectos;

        [SetUp]
        public void Setup()
        {
            var optionsInMemory = new DbContextOptionsBuilder<DulcesYmasContext>().
                UseInMemoryDatabase("DulcesYmas").Options;

            _context = new DulcesYmasContext(optionsInMemory);
            _unitOfWork = new UnitOfWork(_context);
            #region CrearMateriasPrimas

            CrearProductoParaFabricarDataTest("Dulce de Ñame", 0,
                0, UnidadDeMedida.Unidades, 0, Contestura.Duro,
                new CrearProductoParaFabricar(_unitOfWork));
            
            CrearProductoParaFabricarDataTest("Ñame", 15,
                0, UnidadDeMedida.Kilos, 0, Contestura.NoAplica,
                new CrearProductoMateriaPrima(_unitOfWork));     
            
            CrearProductoParaFabricarDataTest("Leche", 95,
                0, UnidadDeMedida.Litros, 0, Contestura.NoAplica,
                new CrearProductoMateriaPrima(_unitOfWork));            
            
            CrearProductoParaFabricarDataTest("Azucar", 30,
                0, UnidadDeMedida.Litros, 0, Contestura.NoAplica,
                new CrearProductoMateriaPrima(_unitOfWork));
            #endregion
            #region CrearDetallesDeFabricacion
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
            detalles3.Add(new FabricacionDetalleRequest("ÑAME", 15));
            detalles3.Add(new FabricacionDetalleRequest("Leche", 95));
            detalles3.Add(new FabricacionDetalleRequest("Azucar", 30));

            fabricacionDetalleRequestsCorrectos = detalles3;
            #endregion
            #region CrearTerceros

            new TerceroCrear(_unitOfWork).
                SaveTercero(new TerceroRequest("1065840833", "Duvan Guia"));
            TerceroEmpleadoRequest empleadoRequest = new TerceroEmpleadoRequest
                ("1065840833");
            new TerceroEmpleadoCrear(_unitOfWork).Crear(empleadoRequest);
            #endregion
        }
        private Response CrearProductoParaFabricarDataTest(string nombreProducto, 
            double cantidadProducto,double costoUnitarioProducto,
            UnidadDeMedida unidadDeMedidaProducto,double porcentajeDeUtilidadProducto,
            Contestura contestura, ProductoService service)
        {
            ProductoRequest request = new ProductoRequest(nombreProducto, cantidadProducto,
            costoUnitarioProducto, unidadDeMedidaProducto,
            porcentajeDeUtilidadProducto, contestura);
            return service.
                CrearProducto(request);
        }
        [TestCaseSource("DataTestFabricarProducto"), Order(5)]
        public void FabricacionProbar(string identificacionEmpleado, string nombreDulce,
            Contestura contestura, string esperado)
        {
            CrearProductoParaFabricarDataTest("Dulce de Ñame", 0,
                0, UnidadDeMedida.Unidades, 0, Contestura.Duro,
                new CrearProductoParaFabricar(_unitOfWork));           

            FabricacionRequest request = new FabricacionRequest(identificacionEmpleado,
                nombreDulce, 0, 0, contestura, fabricacionDetalleRequestsCorrectos);
            Response obtenido = new FabricacionCrearService(_unitOfWork).IniciarFabricacion(request);
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
        [Test, Order(6)]
        public void FabricacionConDetalleErradoPrimerIndice()
        {
            CrearProductoParaFabricarDataTest("Dulce de Ñame", 0,
                0, UnidadDeMedida.Unidades, 0, Contestura.Duro,
                new CrearProductoParaFabricar(_unitOfWork));

            FabricacionRequest request = new FabricacionRequest("1065840833", "Dulce De Ñame"
                , 0, 0, Contestura.Duro, fabricacionDetalleRequestsConErrorEnPrimerIndice);
            Response obtenido = new FabricacionCrearService(_unitOfWork).IniciarFabricacion(request);
            Assert.AreEqual("No hay cantidades suficientes " +
               $"de ÑAME, solo hay 15", obtenido.Mensaje);
        }
        [Test, Order(7)]
        public void FabricacionConDetalleErradoSegundoIndice()
        {
            CrearProductoParaFabricarDataTest("Dulce de Ñame", 0,
                0, UnidadDeMedida.Unidades, 0, Contestura.Duro,
                new CrearProductoParaFabricar(_unitOfWork));

            FabricacionRequest request = new FabricacionRequest("1065840833", "Dulce De Ñame"
                , 0, 0, Contestura.Duro, fabricacionDetalleRequestsConErrorEnSegundoIndice);
            Response obtenido = new FabricacionCrearService(_unitOfWork).IniciarFabricacion(request);
            Assert.AreEqual("No hay cantidades suficientes " +
               $"de LECHE, solo hay 95", obtenido.Mensaje);
        }
        [Test, Order(8)]
        public void FabricacionConDetalleErradoUltimoIndice()
        {
            CrearProductoParaFabricarDataTest("Dulce de Ñame", 0,
                0, UnidadDeMedida.Unidades, 0, Contestura.Duro,
                new CrearProductoParaFabricar(_unitOfWork));

            FabricacionRequest request = new FabricacionRequest("1065840833", "Dulce De Ñame"
                , 0, 0, Contestura.Duro, fabricacionDetalleRequestsConErrorEnUltimoIndice);
            Response obtenido = new FabricacionCrearService(_unitOfWork).IniciarFabricacion(request);
            Assert.AreEqual("No hay cantidades suficientes " +
               $"de AZUCAR, solo hay 30", obtenido.Mensaje);
        }
    }
}
