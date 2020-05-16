using Application;
using Application.Request;
using Application.Services;
using Domain;
using Domain.Contracts;
using Infrastructure;
using Infrastructure.Base;
using Microsoft.EntityFrameworkCore;
using NUnit.Framework;
using System;
using System.Collections.Generic;
using System.Text;

namespace ApplicationTest
{
    public class ComprarServiceTest
    {
        private IDbContext _context;
        private IUnitOfWork _unitOfWork;

        [SetUp]
        public void SetUp()
        {
            var optionsInMemory = new DbContextOptionsBuilder<DulcesYmasContext>().
                UseInMemoryDatabase("ComprarBD").Options;

            _context = new DulcesYmasContext(optionsInMemory);
            _unitOfWork = new UnitOfWork(_context);

            #region CrearMateriasPrimas

            CrearProductoParaFabricarDataTest("Batata", 0,
                0, UnidadDeMedida.Kilos, 0, Contestura.NoAplica,
                new CrearProductoMateriaPrima(_unitOfWork));

            CrearProductoParaFabricarDataTest("Ñame", 15,
                0, UnidadDeMedida.Kilos, 0, Contestura.NoAplica,
                new CrearProductoMateriaPrima(_unitOfWork));

            CrearProductoParaFabricarDataTest("Leche", 95,
                0, UnidadDeMedida.Litros, 0, Contestura.NoAplica,
                new CrearProductoMateriaPrima(_unitOfWork));

            CrearProductoParaFabricarDataTest("Azucar", 30,
                0, UnidadDeMedida.Kilos, 0, Contestura.NoAplica,
                new CrearProductoMateriaPrima(_unitOfWork));
            #endregion


        }
        private Response CrearProductoParaFabricarDataTest(string nombreProducto,
            double cantidadProducto, double costoUnitarioProducto,
            UnidadDeMedida unidadDeMedidaProducto, double porcentajeDeUtilidadProducto,
            Contestura contestura, ProductoService service)
        {
            ProductoRequest request = new ProductoRequest(nombreProducto, cantidadProducto,
            costoUnitarioProducto, unidadDeMedidaProducto,
            porcentajeDeUtilidadProducto, contestura);
            return service.
                CrearProducto(request);
        }
        [TestCaseSource("DataTestCompras")]
        public void ProbarComprarService(string nitProvedor,string usuario,string esperado)
        {
            CompraRequest request = new CompraRequest.CompraRequestBuilder(nitProvedor,usuario).Build();
            Response response = new CompraService(_unitOfWork).HacerCompraService(request);
            Assert.AreEqual(esperado, response.Mensaje);
        }
        public static IEnumerable<TestCaseData> DataTestCompras()
        {
            yield return new TestCaseData("1010316", "duvaninho", $"El provedor con identificacion" +
                $" 1010316" + " no fue encontrado en el sistema, agreguelo antes").
                SetName("CompraProvedorNoEncontrado");

            yield return new TestCaseData("1065840833", "duvannho", $"El usuario duvannho" +
                    $" no fue encontrado en el sistema, agreguelo antes").
                SetName("CompraUsuarioNoEncontrado");

        }
    }
}
