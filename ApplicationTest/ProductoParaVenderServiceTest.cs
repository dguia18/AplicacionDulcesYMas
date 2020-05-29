
using Application.Request;
using Application.Services;
using Application.Services.ProductoServices;
using Application.Services.ProductoServices.CategoriaServices;
using Domain.Entities.EntitiesProducto;
using Infrastructure;
using Infrastructure.Base;
using Microsoft.EntityFrameworkCore;
using NUnit.Framework;
using System.Collections.Generic;

namespace ApplicationTest
{
    public class ProductoParaVenderServiceTest
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
            #region CrearCategorias
            new ProductoCategoriaCrearService(this._unitOfWork).Crear(new ProductoCategoriaRequest.
                ProductoCategoriaRequestBuilder("Comestibles").SetId(1).Build());
            #endregion

            #region CrearSubCategorias
            new ProductoCategoriaAgregarSubCategoriaService(this._unitOfWork).Agregar(new ProductoSubCategoriaRequest.
                ProductoSubCategoriaRequestBuilder("Materia prima").SetId(1).SetIdCategoria(1).Build());
            #endregion

            #region CrearProductos
            ProductoRequest request = new ProductoRequest.ProductoRequestBuilder(1, "Dulce de Maduro" +
                " Envuelto").SetCantidad(0).SetPorcentajeDeUtilidad(0).SetSubCategoria(1).
                SetUnidadDeMedida(UnidadDeMedida.Unidades).SetCostoUnitario(0).
                SetEspecificacion(Especificacion.Duro).Build();

            ProductoRequest request2 = new ProductoRequest.ProductoRequestBuilder(1, "Bandeja Surtida " +
                "Pequeña").SetCantidad(0).SetPorcentajeDeUtilidad(0).SetSubCategoria(1).
                SetUnidadDeMedida(UnidadDeMedida.Unidades).SetCostoUnitario(0).SetTipo(Tipo.ParaVender).
                SetEspecificacion(Especificacion.TieneEnvoltorio).Build();

            ProductoRequest request3 = new ProductoRequest.ProductoRequestBuilder(1, "Unidades Pequeñas")
                .SetCantidad(0).SetPorcentajeDeUtilidad(0).SetSubCategoria(1).
                SetUnidadDeMedida(UnidadDeMedida.Unidades).SetCostoUnitario(0).SetTipo(Tipo.ParaVender).
                SetEspecificacion(Especificacion.NoTieneEnvoltorio).Build();

            ProductoRequest request4 = new ProductoRequest.ProductoRequestBuilder(1, "Unidades Medianas")
                .SetCantidad(0).SetPorcentajeDeUtilidad(0).SetSubCategoria(1).
                SetUnidadDeMedida(UnidadDeMedida.Unidades).SetCostoUnitario(0).SetTipo(Tipo.ParaVender).
                SetEspecificacion(Especificacion.NoTieneEnvoltorio).Build();

            new ProductoCrearService(_unitOfWork).Crear(request);
            new ProductoCrearService(_unitOfWork).Crear(request2);
            new ProductoCrearService(_unitOfWork).Crear(request3);
            new ProductoCrearService(_unitOfWork).Crear(request4);
            #endregion

        }
        [Test, Order(1)]
        public void ListarProductosParaVender()
        {
            Response response = new ListarProductosPorTipo(_unitOfWork).
                EstablecerTipo(Tipo.ParaVender).Filtrar();

            List<ProductoRequest> productos = (List<ProductoRequest>)response.Data;
            Assert.AreEqual(3, productos.Count);
        }        
        [TestCaseSource("DataTestInvalidos"), Order(3)]
        public void CrearProductoParaVender(string nombreProducto,
            double cantidadProducto, double costoUnitarioProducto,
            UnidadDeMedida unidadDeMedidaProducto,int idSubCategoria,
            double porcentajeDeUtilidadProducto,Especificacion especificacion, string esperado)
        {
            ProductoRequest request = new ProductoRequest.ProductoRequestBuilder(1, nombreProducto).
                SetCantidad(cantidadProducto).SetCostoUnitario(costoUnitarioProducto).SetTipo(Tipo.ParaVender).
                SetUnidadDeMedida(unidadDeMedidaProducto).SetEspecificacion(especificacion).
                SetPorcentajeDeUtilidad(porcentajeDeUtilidadProducto).SetSubCategoria(idSubCategoria).Build();

            Response response = new ProductoCrearService(_unitOfWork).
                Crear(request);

            Assert.AreEqual(esperado, response.Mensaje);
        }
        private static IEnumerable<TestCaseData> DataTestInvalidos()
        {
            yield return new TestCaseData("Bandeja de leche", -5, 1000, 
                UnidadDeMedida.Unidades,1, 0,Especificacion.TieneEnvoltorio,"Cantidad invalida").
                SetName("CrearProductoConCantidadInvalida");

            yield return new TestCaseData("Bandeja de Leche", 5, -1000,
                UnidadDeMedida.Unidades,1, 0, Especificacion.TieneEnvoltorio,"Costo unitario invalido").
                SetName("CrearProductoConCostoInvalida");

            yield return new TestCaseData("Bandeja de Leche", -5, -1000,
                UnidadDeMedida.Unidades,1, 0, Especificacion.TieneEnvoltorio, "Cantidad invalida, Costo unitario invalido").
                SetName("CrearProductoConCostoyCantidadInvalida");

            yield return new TestCaseData("Bandeja de Leche", 5, 1000,
                UnidadDeMedida.Unidades,1, 0, Especificacion.TieneEnvoltorio, "Producto registrado con éxito").
                SetName("ProductoRegistradoConExito");
        }
        [TestCaseSource("DataTestCorrecto"), Order(4)]
        public void CrearMateriaPrimaDuplicado(string nombreProducto,
            double cantidadProducto, double costoUnitarioProducto,
            UnidadDeMedida unidadDeMedidaProducto, double porcentajeDeUtilidadProducto,
            Especificacion especificacion,int idSubCategoria)
        {
            ProductoRequest request = new ProductoRequest.ProductoRequestBuilder(1, nombreProducto).
                SetCantidad(cantidadProducto).SetCostoUnitario(costoUnitarioProducto).SetTipo(Tipo.ParaVender).
                SetUnidadDeMedida(unidadDeMedidaProducto).SetEspecificacion(especificacion).
                SetPorcentajeDeUtilidad(porcentajeDeUtilidadProducto).SetSubCategoria(idSubCategoria).Build();

            _ = new ProductoCrearService(_unitOfWork).
                Crear(request);

            Response response = new ProductoCrearService(_unitOfWork).
                Crear(request);

            Assert.AreEqual("El producto ya existe", response.Mensaje);
        }
        private static IEnumerable<TestCaseData> DataTestCorrecto()
        {
            yield return new TestCaseData("Dulce de Maduro Envuelto", 5,
                1000, UnidadDeMedida.Unidades, 0,Especificacion.TieneEnvoltorio,1).
                SetName("ProductoMateriaPrimaDuplicado");
        }

    }
}
