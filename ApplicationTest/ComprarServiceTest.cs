using Application.Request;
using Application.Services;
using Application.Services.ProductoServices;
using Application.Services.ProductoServices.CategoriaServices;
using Application.Services.TercerosServices.ProveedorServices;
using Application.Services.TercerosServices.TerceroServices;
using Application.Services.TercerosServices.UsuarioServices;
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

            #region CrearCategorias
            new ProductoCategoriaCrearService(this._unitOfWork).Crear(new ProductoCategoriaRequest.
                ProductoCategoriaRequestBuilder("Comestibles").SetId(1).Build());
            #endregion

            #region CrearSubCategorias
            new ProductoCategoriaAgregarSubCategoriaService(this._unitOfWork).Agregar(new ProductoSubCategoriaRequest.
                ProductoSubCategoriaRequestBuilder("Materia prima").SetId(1).SetIdCategoria(1).Build());
            #endregion

            #region CrearMateriasPrimas

            new ProductoMateriaPrimaCrear(_unitOfWork).Crear(new ProductoRequest.ProductoRequestBuilder(1, "Batata").
                SetCantidad(0).SetCostoUnitario(700).SetUnidadDeMedida(UnidadDeMedida.Kilos).
                SetPorcentajeDeUtilidad(0).SetEspecificacion(Especificacion.MateriaPrima).
                SetSubCategoria(1).Build());

            new ProductoMateriaPrimaCrear(_unitOfWork).Crear(new ProductoRequest.ProductoRequestBuilder(2, "Ñame").
                SetCantidad(15).SetCostoUnitario(500).SetUnidadDeMedida(UnidadDeMedida.Kilos).
                SetPorcentajeDeUtilidad(0).SetEspecificacion(Especificacion.MateriaPrima).
                SetSubCategoria(1).Build());

            new ProductoMateriaPrimaCrear(_unitOfWork).Crear(new ProductoRequest.ProductoRequestBuilder(3, "Leche").
                SetCantidad(95).SetCostoUnitario(1700).SetUnidadDeMedida(UnidadDeMedida.Litros).
                SetPorcentajeDeUtilidad(0).SetEspecificacion(Especificacion.MateriaPrima).
                SetSubCategoria(1).Build());

            new ProductoMateriaPrimaCrear(_unitOfWork).Crear(new ProductoRequest.ProductoRequestBuilder(4, "Azúcar").
                SetCantidad(30).SetCostoUnitario(1300).SetUnidadDeMedida(UnidadDeMedida.Kilos).
                SetPorcentajeDeUtilidad(0).SetEspecificacion(Especificacion.MateriaPrima).
                SetSubCategoria(1).Build());
            
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
            
            RoleRequest roleAdministrador = new RoleRequest();
            roleAdministrador.Nombre = "administrador";
            new RoleCrearService(this._unitOfWork).Crear(roleAdministrador);

            usuarioDuvan = new TerceroUsuarioRequest.TerceroUsuarioBuilder(terceroDuvan).
                SetUsuario("duvaninho").SetPassword("12345").SetRole(roleAdministrador).Build();

            provedorMaria = new TerceroProvedorRequest(terceroMaria);

            new TerceroCrearService(_unitOfWork).CrearTercero(terceroMaria);
            new TerceroCrearService(_unitOfWork).CrearTercero(terceroDuvan);

            new TerceroProveedorCrearService(_unitOfWork).Crear(provedorMaria);
            new TerceroUsuarioCrearService(_unitOfWork).Crear(usuarioDuvan);
            #endregion
        }
        private void CrearProductoParaFabricarDataTest(string nombreProducto,
            double cantidadProducto, double costoUnitarioProducto,
            UnidadDeMedida unidadDeMedidaProducto, double porcentajeDeUtilidadProducto,
            Especificacion especificacion, ProductoService service)
        {
            ProductoRequest request = new ProductoRequest.ProductoRequestBuilder(0, nombreProducto)
                .SetCantidad(cantidadProducto).SetCostoUnitario(costoUnitarioProducto).
                SetUnidadDeMedida(unidadDeMedidaProducto).SetEspecificacion(especificacion).
                SetPorcentajeDeUtilidad(porcentajeDeUtilidadProducto).Build();

         service.
                Crear(request);
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

            yield return new TestCaseData("10103116", "dubannho", $"El usuario dubannho" +
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
