using Application.Request;
using Application.Services;
using Application.Services.ProductoServices;
using Domain.Contracts;
using Domain.Entities.EntitiesProducto;
using Infrastructure;
using Infrastructure.Base;
using Microsoft.EntityFrameworkCore;
using NUnit.Framework;
using System.Collections.Generic;

namespace ApplicationTest
{
    public class ComprarServiceTest
    {
        private IDbContext _context;
        private IUnitOfWork _unitOfWork;
        private List<CompraDetalleRequest> compraDetallesCorrectos;
        private List<CompraDetalleRequest> compraDetallesInCorrectos;
        private TerceroRequest terceroDuvan;
        private TerceroRequest terceroMaria;
        private TerceroUsuarioRequest usuarioDuvan;
        private TerceroProvedorRequest provedorMaria;
        [SetUp]
        public void SetUp()
        {
            var optionsInMemory = new DbContextOptionsBuilder<DulcesYmasContext>().
                UseInMemoryDatabase("ComprarBD").Options;

            _context = new DulcesYmasContext(optionsInMemory);
            _unitOfWork = new UnitOfWork(_context);

            #region CrearMateriasPrimas

            CrearProductoParaFabricarDataTest("Batata", 0,
                700, UnidadDeMedida.Kilos, 0, Contestura.NoAplica,
                new ProductoMateriaPrimaCrear(_unitOfWork));

            CrearProductoParaFabricarDataTest("Ñame", 15,
                500, UnidadDeMedida.Kilos, 0, Contestura.NoAplica,
                new ProductoMateriaPrimaCrear(_unitOfWork));

            CrearProductoParaFabricarDataTest("Leche", 95,
                1700, UnidadDeMedida.Litros, 0, Contestura.NoAplica,
                new ProductoMateriaPrimaCrear(_unitOfWork));

            CrearProductoParaFabricarDataTest("Azúcar", 30,
                1300, UnidadDeMedida.Kilos, 0, Contestura.NoAplica,
                new ProductoMateriaPrimaCrear(_unitOfWork));
            #endregion

            #region CompraDetallesCorrectos
            this.compraDetallesCorrectos = new List<CompraDetalleRequest>
            {
                new CompraDetalleRequest.CompraDetalleRequestBuilder("Azúcar")
                .SetCantidad(15).SetValor(1500).Build(),
                
                new CompraDetalleRequest.CompraDetalleRequestBuilder("batata")
                .SetCantidad(30).SetValor(600).Build(),
                
                new CompraDetalleRequest.CompraDetalleRequestBuilder("leche")
                .SetCantidad(45).SetValor(1400).Build(),

            };
            #endregion CompraDetallesCorrectos

            #region CompraDetallesInCorrectos
            this.compraDetallesInCorrectos = new List<CompraDetalleRequest>
            {
                new CompraDetalleRequest.CompraDetalleRequestBuilder("Azúcar")
                .SetCantidad(15).SetValor(1500).Build(),
                
                new CompraDetalleRequest.CompraDetalleRequestBuilder("batata1")
                .SetCantidad(-30).SetValor(-600).Build(),
                
                new CompraDetalleRequest.CompraDetalleRequestBuilder("leche")
                .SetCantidad(45).SetValor(1400).Build(),

            };
            #endregion CompraDetallesInCorrectos

            #region Terceros
            terceroDuvan = new TerceroRequest("1065840833", "Duvan");
            terceroMaria = new TerceroRequest("10103116", "Maria");

            usuarioDuvan = new TerceroUsuarioRequest.TerceroUsuarioBuilder(terceroDuvan).
                SetUsuario("duvaninho").SetPassword("12345").Build();

            provedorMaria = new TerceroProvedorRequest(terceroMaria);

            new TerceroCrear(_unitOfWork).CrearTercero(terceroMaria);
            new TerceroCrear(_unitOfWork).CrearTercero(terceroDuvan);

            new TerceroProvedorService(_unitOfWork).CrearTerceroProveedor(provedorMaria);
            new CrearUsuario(_unitOfWork).SaveUsuario(usuarioDuvan);
            #endregion
        }
        private Response CrearProductoParaFabricarDataTest(string nombreProducto,
            double cantidadProducto, double costoUnitarioProducto,
            UnidadDeMedida unidadDeMedidaProducto, double porcentajeDeUtilidadProducto,
            Contestura contestura, ProductoService service)
        {
            ProductoRequest request =  new ProductoRequest.ProductoRequestBuilder(0, nombreProducto)
                .SetCantidad(cantidadProducto).SetCostoUnitario(costoUnitarioProducto).
                SetUnidadDeMedida(unidadDeMedidaProducto).SetContestura(contestura).
                SetPorcentajeDeUtilidad(porcentajeDeUtilidadProducto).Build();

            return service.
                CrearProducto(request);
        }
        [TestCaseSource("DataTestCompras")]
        public void ProbarComprarService(string nitProvedor,string usuario,string esperado)
        {
            CompraRequest request = new CompraRequest.CompraRequestBuilder(nitProvedor,usuario)
                .SetDetalles(compraDetallesCorrectos).Build();
            Response response = new CompraService(_unitOfWork).HacerCompraService(request);
            Assert.AreEqual(esperado, response.Mensaje);
        }
        private  static IEnumerable<TestCaseData> DataTestCompras()
        {
            yield return new TestCaseData("1065840833", "duvaninho", $"El provedor con identificación" +
                $" 1065840833" + " no fue encontrado en el sistema, agréguelo antes").
                SetName("CompraProvedorNoEncontrado");

            yield return new TestCaseData("10103116", "DUVANNHO", $"El usuario DUVANNHO" +
                    $" no fue encontrado en el sistema, agréguelo antes").
                SetName("CompraUsuarioNoEncontrado");
            
            yield return new TestCaseData("10103116", "duvaninho", "Compra registrada con éxito").
                SetName("CompraRegistradaCorrectamente");
        }
        [Test]
        public void ProbarComprarServiceConDetallesIncorrectos()
        {
            CompraRequest request = new CompraRequest.CompraRequestBuilder("10103116", "duvaninho")
                .SetDetalles(compraDetallesInCorrectos).Build();
            Response response = new CompraService(_unitOfWork).HacerCompraService(request);
            Assert.AreEqual("El producto BATATA1 no existe, " +
                "La cantidad de BATATA1 es invalida, " +
                "El valor de BATATA1 es invalida", response.Mensaje);
        }
    }
}
