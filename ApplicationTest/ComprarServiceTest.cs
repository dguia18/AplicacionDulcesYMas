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
        private TerceroProveedorRequest provedorMaria;
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

            new ProductoCrearService(_unitOfWork).Crear(new ProductoRequest.ProductoRequestBuilder(1, "Batata").
                SetCantidad(0).SetCostoUnitario(700).SetUnidadDeMedida(UnidadDeMedida.Kilos).SetTipo(Tipo.MateriaPrima).
                SetPorcentajeDeUtilidad(0).SetEspecificacion(Especificacion.MateriaPrima).
                SetSubCategoria(1).Build());

            new ProductoCrearService(_unitOfWork).Crear(new ProductoRequest.ProductoRequestBuilder(2, "Ñame").
                SetCantidad(15).SetCostoUnitario(500).SetUnidadDeMedida(UnidadDeMedida.Kilos).SetTipo(Tipo.MateriaPrima).
                SetPorcentajeDeUtilidad(0).SetEspecificacion(Especificacion.MateriaPrima).
                SetSubCategoria(1).Build());

            new ProductoCrearService(_unitOfWork).Crear(new ProductoRequest.ProductoRequestBuilder(3, "Leche").
                SetCantidad(95).SetCostoUnitario(1700).SetUnidadDeMedida(UnidadDeMedida.Litros).SetTipo(Tipo.MateriaPrima).
                SetPorcentajeDeUtilidad(0).SetEspecificacion(Especificacion.MateriaPrima).
                SetSubCategoria(1).Build());

            new ProductoCrearService(_unitOfWork).Crear(new ProductoRequest.ProductoRequestBuilder(4, "Azúcar").
                SetCantidad(30).SetCostoUnitario(1300).SetUnidadDeMedida(UnidadDeMedida.Kilos).SetTipo(Tipo.MateriaPrima).
                SetPorcentajeDeUtilidad(0).SetEspecificacion(Especificacion.MateriaPrima).
                SetSubCategoria(1).Build());
            
            #endregion

            #region CompraDetallesCorrectos
            this.compraDetallesCorrectos = new List<CompraDetalleRequest>
            {
                new CompraDetalleRequest.CompraDetalleRequestBuilder(4)
                .SetCantidad(15).SetValor(1500).Build(),
                
                new CompraDetalleRequest.CompraDetalleRequestBuilder(1)
                .SetCantidad(30).SetValor(600).Build(),
                
                new CompraDetalleRequest.CompraDetalleRequestBuilder(3)
                .SetCantidad(45).SetValor(1400).Build(),

            };
            #endregion CompraDetallesCorrectos

            #region CompraDetallesInCorrectos
            this.compraDetallesInCorrectos = new List<CompraDetalleRequest>
            {
                new CompraDetalleRequest.CompraDetalleRequestBuilder(4)
                .SetCantidad(15).SetValor(1500).Build(),
                
                new CompraDetalleRequest.CompraDetalleRequestBuilder(7)
                .SetCantidad(-30).SetValor(-600).Build(),
                
                new CompraDetalleRequest.CompraDetalleRequestBuilder(3)
                .SetCantidad(45).SetValor(1400).Build(),

            };
            #endregion CompraDetallesInCorrectos

            #region Terceros
            terceroDuvan = new TerceroRequest("1065840833", "Duvan");
            terceroMaria = new TerceroRequest("10103116", "Maria");
            
            RoleRequest roleAdministrador = new RoleRequest();
            roleAdministrador.Nombre = "administrador";
            new RoleCrearService(this._unitOfWork).Crear(roleAdministrador);

            usuarioDuvan = new TerceroUsuarioRequest.TerceroUsuarioRequestBuilder(terceroDuvan).SetId(1).
                SetUsuario("duvaninho").SetPassword("12345").SetRole(roleAdministrador).Build();

            provedorMaria = new TerceroProveedorRequest(terceroMaria);

            new TerceroCrearService(_unitOfWork).CrearTercero(terceroMaria);
            new TerceroCrearService(_unitOfWork).CrearTercero(terceroDuvan);

            new TerceroProveedorCrearService(_unitOfWork).Crear(provedorMaria);
            new TerceroUsuarioCrearService(_unitOfWork).Crear(usuarioDuvan);
            #endregion
        }   
        [TestCaseSource("DataTestCompras")]
        public void ProbarComprarService(string nitProvedor,int usuarioId,string esperado)
        {
            CompraRequest request = new CompraRequest.CompraRequestBuilder(nitProvedor,usuarioId)
                .SetDetalles(compraDetallesCorrectos).Build();
            Response response = new CompraService(_unitOfWork).HacerCompraService(request);
            Assert.AreEqual(esperado, response.Mensaje);
        }
        private  static IEnumerable<TestCaseData> DataTestCompras()
        {
            yield return new TestCaseData("1065840833", 1, $"El provedor con identificación" +
                $" 1065840833" + " no fue encontrado en el sistema, agréguelo antes").
                SetName("CompraProvedorNoEncontrado");

            yield return new TestCaseData("10103116", 2, $"El usuario con id 2" +
                    $" no fue encontrado en el sistema, agréguelo antes").
                SetName("CompraUsuarioNoEncontrado");
            
            yield return new TestCaseData("10103116", 1, "Compra registrada con éxito").
                SetName("CompraRegistradaCorrectamente");
        }
        [Test]
        public void ProbarComprarServiceConDetallesIncorrectos()
        {
            CompraRequest request = new CompraRequest.CompraRequestBuilder("10103116", 1)
                .SetDetalles(compraDetallesInCorrectos).Build();
            Response response = new CompraService(_unitOfWork).HacerCompraService(request);
            Assert.AreEqual("El producto con id 7 no existe, " +
                "La cantidad del producto con id 7 es invalida, " +
                "El valor del producto con id 7 es invalida", response.Mensaje);
        }
    }
}
