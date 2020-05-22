
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
                0, UnidadDeMedida.Unidades, 0, Especificacion.Duro,
                new ProductoParaFabricarCrearService(_unitOfWork));
            
            CrearProductoParaFabricarDataTest("Ñame", 15,
                0, UnidadDeMedida.Kilos, 0, Especificacion.MateriaPrima,
                new ProductoMateriaPrimaCrear(_unitOfWork),2);     
            
            CrearProductoParaFabricarDataTest("Leche", 95,
                0, UnidadDeMedida.Litros, 0, Especificacion.MateriaPrima,
                new ProductoMateriaPrimaCrear(_unitOfWork));            
            
            CrearProductoParaFabricarDataTest("Azúcar", 30,
                0, UnidadDeMedida.Litros, 0, Especificacion.MateriaPrima,
                new ProductoMateriaPrimaCrear(_unitOfWork));
            #endregion
            #region CrearDetallesDeFabricacion
            List<FabricacionDetalleRequest> detalles =
                new List<FabricacionDetalleRequest>();
            detalles.Add(new FabricacionDetalleRequest("ÑAME", 16));
            detalles.Add(new FabricacionDetalleRequest("Leche", 95));
            detalles.Add(new FabricacionDetalleRequest("Azúcar", 30));

            fabricacionDetalleRequestsConErrorEnPrimerIndice = detalles;

            List<FabricacionDetalleRequest> detalles1 =
                new List<FabricacionDetalleRequest>();
            detalles1.Add(new FabricacionDetalleRequest("ÑAME", 15));
            detalles1.Add(new FabricacionDetalleRequest("Leche", 96));
            detalles1.Add(new FabricacionDetalleRequest("Azúcar", 30));

            fabricacionDetalleRequestsConErrorEnSegundoIndice = detalles1;

            List<FabricacionDetalleRequest> detalles2 =
                new List<FabricacionDetalleRequest>();
            detalles2.Add(new FabricacionDetalleRequest("ÑAME", 15));
            detalles2.Add(new FabricacionDetalleRequest("Leche", 95));
            detalles2.Add(new FabricacionDetalleRequest("Azúcar", 45));

            fabricacionDetalleRequestsConErrorEnUltimoIndice = detalles2;

            List<FabricacionDetalleRequest> detalles3 =
               new List<FabricacionDetalleRequest>();
            detalles3.Add(new FabricacionDetalleRequest("ÑAME", 15));
            detalles3.Add(new FabricacionDetalleRequest("Leche", 95));
            detalles3.Add(new FabricacionDetalleRequest("Azúcar", 30));

            fabricacionDetalleRequestsCorrectos = detalles3;
            #endregion
            #region CrearTerceros

            new TerceroCrear(_unitOfWork).
                CrearTercero(new TerceroRequest("1065840833", "Duvan Guia"));
            TerceroEmpleadoRequest empleadoRequest = new TerceroEmpleadoRequest
                ("1065840833");
            new TerceroEmpleadoCrear(_unitOfWork).Crear(empleadoRequest);
            #endregion
        }
        private Response CrearProductoParaFabricarDataTest(string nombreProducto, 
            double cantidadProducto,double costoUnitarioProducto,
            UnidadDeMedida unidadDeMedidaProducto,double porcentajeDeUtilidadProducto,
            Especificacion especificacion, ProductoService service, int id = 0)
        {
            ProductoRequest request = new ProductoRequest.ProductoRequestBuilder(id,nombreProducto)
                .SetCantidad(cantidadProducto).SetCostoUnitario(costoUnitarioProducto).
                SetUnidadDeMedida( unidadDeMedidaProducto).SetEspecificacion(especificacion).
                SetPorcentajeDeUtilidad(porcentajeDeUtilidadProducto).Build();

            return service.
                CrearProducto(request);
        }
        [TestCaseSource("DataTestFabricarProducto")]
        public void FabricacionProbar(string identificaciónEmpleado, int idProducto,
            Especificacion contestura, string esperado)
        {
            CrearProductoParaFabricarDataTest("Dulce de Ñame", 0,
                0, UnidadDeMedida.Unidades, 0, Especificacion.Duro,
                new ProductoParaFabricarCrearService(_unitOfWork),1);           

            FabricacionRequest request = new FabricacionRequest(identificaciónEmpleado,idProducto,
                0, 0, contestura, fabricacionDetalleRequestsCorrectos);
            Response obtenido = new FabricacionCrearService(_unitOfWork).IniciarFabricacion(request);
            Assert.AreEqual(esperado, obtenido.Mensaje);
        }

        private static IEnumerable<TestCaseData> DataTestFabricarProducto()
        {
            yield return new TestCaseData("1065840833", 0, Especificacion.Duro,
                "El producto para fabricar no existe, agréguelo").
                SetName("FabricacionNoExisteProducto");

            yield return new TestCaseData("106540833", 1, Especificacion.Duro,
                $"No hay un empleado con identificación " +
                $"106540833").SetName("FabricacionNoExisteEmpleado");

            yield return new TestCaseData("1065840833", 2, Especificacion.Duro,
                "El ÑAME no se puede fabricar").
                SetName("FabricacionConProductoNoFabricable");
            
            yield return new TestCaseData("1065840833", 1, Especificacion.Duro,
                "Fabricacion realizada con éxito, a espera de definir la cantidad producida").
                SetName("FabricacionCreada");

        }
        [Test]
        public void FabricacionConDetalleErradoPrimerIndice()
        {
            CrearProductoParaFabricarDataTest("Dulce de Ñame", 0,
                0,UnidadDeMedida.Unidades, 0, Especificacion.Duro,
                new ProductoParaFabricarCrearService(_unitOfWork),1);

            FabricacionRequest request = new FabricacionRequest("1065840833", 1
                , 0, 0, Especificacion.Duro, fabricacionDetalleRequestsConErrorEnPrimerIndice);
            Response obtenido = new FabricacionCrearService(_unitOfWork).IniciarFabricacion(request);
            Assert.AreEqual("No hay cantidades suficientes " +
               $"de ÑAME, solo hay 15", obtenido.Mensaje);
        }
        [Test]
        public void FabricacionConDetalleErradoSegundoIndice()
        {
            CrearProductoParaFabricarDataTest("Dulce de Ñame", 0,
                0, UnidadDeMedida.Unidades, 0, Especificacion.Duro,
                new ProductoParaFabricarCrearService(_unitOfWork),1);

            FabricacionRequest request = new FabricacionRequest("1065840833", 1
                , 0, 0, Especificacion.Duro, fabricacionDetalleRequestsConErrorEnSegundoIndice);
            Response obtenido = new FabricacionCrearService(_unitOfWork).IniciarFabricacion(request);
            Assert.AreEqual("No hay cantidades suficientes " +
               $"de LECHE, solo hay 95", obtenido.Mensaje);
        }
        [Test]
        public void FabricacionConDetalleErradoUltimoIndice()
        {
            CrearProductoParaFabricarDataTest("Dulce de Ñame", 0,
                0, UnidadDeMedida.Unidades, 0, Especificacion.Duro,
                new ProductoParaFabricarCrearService(_unitOfWork),1);

            FabricacionRequest request = new FabricacionRequest("1065840833", 1
                , 0, 0, Especificacion.Duro, fabricacionDetalleRequestsConErrorEnUltimoIndice);
            Response obtenido = new FabricacionCrearService(_unitOfWork).IniciarFabricacion(request);
            Assert.AreEqual("No hay cantidades suficientes " +
               $"de AZÚCAR, solo hay 30", obtenido.Mensaje);
        }

    }
}
