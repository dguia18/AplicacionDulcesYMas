
using Application.Request;
using Application.Services;
using Application.Services.ProductoServices;
using Application.Services.ProductoServices.CategoriaServices;
using ApplicationTest.Utils;
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
        private Utilities utilities;
        [SetUp]
        public void Setup()
        {
            var optionsInMemory = new DbContextOptionsBuilder<DulcesYmasContext>().
                UseInMemoryDatabase("DulcesYmas").Options;

            _context = new DulcesYmasContext(optionsInMemory);
            _unitOfWork = new UnitOfWork(_context);
            utilities = new Utilities();

            #region CrearCategorias
            new ProductoCategoriaCrearService(this._unitOfWork).Crear(new ProductoCategoriaRequest.
                ProductoCategoriaRequestBuilder("Comestibles").SetId(1).Build());
            #endregion

            #region CrearSubCategorias
            new ProductoCategoriaAgregarSubCategoriaService(this._unitOfWork).Agregar(new ProductoSubCategoriaRequest.
                ProductoSubCategoriaRequestBuilder("Materia prima").SetId(1).SetIdCategoria(1).Build());
            #endregion
        }
        [Test, Order(1)]
        public void ListarProductoParaFabricarDuro()
        {
            #region CrearProductosParaFabricar


            utilities.CrearProducto(new ProductoRequest.ProductoRequestBuilder(1, "Dulce de Ñame").
                SetCantidad(15m).SetCostoUnitario(500m).SetUnidadDeMedida(UnidadDeMedida.Kilos).SetTipo(Tipo.ParaFabricar).
                SetPorcentajeDeUtilidad(0m).SetEspecificacion(Especificacion.Duro).SetTipo(Tipo.ParaFabricar).
                SetSubCategoria(1).Build(), new ProductoCrearService(_unitOfWork));

            utilities.CrearProducto(new ProductoRequest.ProductoRequestBuilder(1, "Dulce de Leche").
                SetCantidad(15m).SetCostoUnitario(500m).SetUnidadDeMedida(UnidadDeMedida.Kilos).SetTipo(Tipo.ParaFabricar).
                SetPorcentajeDeUtilidad(0m).SetEspecificacion(Especificacion.Suave).SetTipo(Tipo.ParaFabricar).
                SetSubCategoria(1).Build(), new ProductoCrearService(_unitOfWork));

            utilities.CrearProducto(new ProductoRequest.ProductoRequestBuilder(1, "Dulce de MAduro").
                SetCantidad(15m).SetCostoUnitario(500m).SetUnidadDeMedida(UnidadDeMedida.Kilos).SetTipo(Tipo.ParaFabricar).
                SetPorcentajeDeUtilidad(0m).SetEspecificacion(Especificacion.Duro).SetTipo(Tipo.ParaFabricar).
                SetSubCategoria(1).Build(), new ProductoCrearService(_unitOfWork));

            utilities.CrearProducto(new ProductoRequest.ProductoRequestBuilder(1, "Dulce de Grosella").
                SetCantidad(15m).SetCostoUnitario(500m).SetUnidadDeMedida(UnidadDeMedida.Kilos).SetTipo(Tipo.ParaFabricar).
                SetPorcentajeDeUtilidad(0m).SetEspecificacion(Especificacion.Suave).SetTipo(Tipo.ParaFabricar).
                SetSubCategoria(1).Build(), new ProductoCrearService(_unitOfWork));
            #endregion

            Response response = new ListarProductosPorTipo(_unitOfWork).
                EstablecerTipo(Tipo.ParaFabricar).Filtrar();
            List<ProductoRequest> productos = (List<ProductoRequest>)response.Data;
            Assert.AreEqual(4, productos.Count);
        }        
        [TestCaseSource("DataTestInvalidos"), Order(3)]
        public void CrearProductoParaFabricar(string nombreProducto, decimal cantidadProducto,
            decimal costoUnitarioProducto, UnidadDeMedida unidadDeMedidaProducto,
            Especificacion especificacion,int idSubCategoria, string esperado)
        {
            ProductoRequest request = new ProductoRequest.ProductoRequestBuilder(1, nombreProducto).
                SetCantidad(cantidadProducto).SetCostoUnitario(costoUnitarioProducto).SetTipo(Tipo.ParaFabricar).
                SetUnidadDeMedida(unidadDeMedidaProducto).SetSubCategoria(idSubCategoria).
                SetEspecificacion(especificacion).Build();
            Response response = utilities.CrearProducto(request, new ProductoCrearService(_unitOfWork));
            Assert.AreEqual(esperado, response.Mensaje);
        }
        private static IEnumerable<TestCaseData> DataTestInvalidos()
        {
            yield return new TestCaseData("Dulce de Leche", -5m, 1000m, UnidadDeMedida.Litros,
                Especificacion.Duro,1,"Cantidad invalida").SetName("CrearProductoConCantidadInvalida");

            yield return new TestCaseData("Dulce de Papaya", 5m, -1000m, UnidadDeMedida.Litros,
                Especificacion.Duro,1,"Costo unitario invalido").SetName("CrearProductoConCostoInvalida");

            yield return new TestCaseData("Dulce de Batata", -5m, -1000m, UnidadDeMedida.Unidades,
                Especificacion.Duro,1,"Cantidad invalida, Costo unitario invalido").
                SetName("CrearProductoConCostoyCantidadInvalida");

            yield return new TestCaseData("Dulce de Papaya Piña y coco",
                5m, 1000m, UnidadDeMedida.Unidades,Especificacion.Duro,1, "Producto registrado con éxito")
                .SetName("ProductoRegistradoConExito");
        }
        [TestCaseSource("DataTestCorrecto"), Order(4)]
        public void CrearProductoParaFabricarDuplicado(string nombreProducto,
            decimal cantidadProducto, decimal costoUnitarioProducto,
            UnidadDeMedida unidadDeMedidaProducto,int idSubCategoria,
            decimal porcentajeDeUtilidadProducto)
        {
            ProductoRequest request = new ProductoRequest.ProductoRequestBuilder(1, nombreProducto).
                SetCantidad(cantidadProducto).SetCostoUnitario(costoUnitarioProducto).SetTipo(Tipo.ParaFabricar).
                SetUnidadDeMedida(unidadDeMedidaProducto).SetSubCategoria(idSubCategoria).
                SetPorcentajeDeUtilidad(porcentajeDeUtilidadProducto).Build();

            _ = new ProductoCrearService(_unitOfWork).
                Crear(request);

            Response response = new ProductoCrearService(_unitOfWork).
                Crear(request);

            Assert.AreEqual("El producto ya existe", response.Mensaje);
        }
        private static IEnumerable<TestCaseData> DataTestCorrecto()
        {
            yield return new TestCaseData("Dulce de Ñame", 5m, 1000m,
                UnidadDeMedida.Unidades,1, 0m).
                SetName("ProductoParaFabricarDuplicado");
        }

    }
}
