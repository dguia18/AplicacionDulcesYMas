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
    public class ProductoMateriaPrimaServiceTest
    {
        private DulcesYmasContext _context;
        private UnitOfWork _unitOfWork; 
        [SetUp]
        public void Setup()
        {
            var optionsInMemory = new DbContextOptionsBuilder<DulcesYmasContext>().
                UseInMemoryDatabase("DulcesYmas1").Options;

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

            ProductoRequest request = new ProductoRequest.ProductoRequestBuilder(1,"Ñame").
                SetCantidad(0).SetPorcentajeDeUtilidad(0).SetUnidadDeMedida(UnidadDeMedida.Kilos).
                SetSubCategoria(1).
                Build();

            ProductoRequest request2 = new ProductoRequest.ProductoRequestBuilder(1, "Batata").
                SetCantidad(0).SetPorcentajeDeUtilidad(0).SetUnidadDeMedida(UnidadDeMedida.Kilos).
                SetSubCategoria(1).Build();

            new ProductoCrearService(_unitOfWork).
                Crear(request);
            new ProductoCrearService(_unitOfWork).
                Crear(request2);
        }
        [Test, Order(1)]
        public void ListarProductoMateriaPrima()
        {
            Response response = new ListarProductosPorTipo(_unitOfWork).
                EstablecerTipo(Tipo.MateriaPrima).Filtrar();
            List<ProductoRequest> productos = (List<ProductoRequest>)response.Data;
            Assert.AreEqual(2, productos.Count);
        }
        [TestCaseSource("DataTestInvalidos"),Order(2)]
        public void CrearProductoMateriaPrima(string nombreProducto, 
            double cantidadProducto,double costoUnitarioProducto, 
            UnidadDeMedida unidadDeMedidaProducto,
            double porcentajeDeUtilidadProducto, int idSubCategoria,string esperado)
        {
            ProductoRequest request = new ProductoRequest.ProductoRequestBuilder(1,nombreProducto).
                SetCantidad(cantidadProducto).SetCostoUnitario(costoUnitarioProducto).
                SetUnidadDeMedida(unidadDeMedidaProducto).SetSubCategoria(idSubCategoria).
                SetPorcentajeDeUtilidad(porcentajeDeUtilidadProducto).Build();
            
            Response response = new ProductoCrearService(_unitOfWork).
                Crear(request);
            
            Assert.AreEqual(esperado, response.Mensaje);
        }
        private static IEnumerable<TestCaseData> DataTestInvalidos()
        {
            yield return new TestCaseData("Azúcar", -5, 1000, UnidadDeMedida.Kilos, 0,1, 
                "Cantidad invalida").SetName("CrearProductoConCantidadInvalida");

            yield return new TestCaseData("Azúcar", 5, -1000, UnidadDeMedida.Kilos, 0,1,
                "Costo unitario invalido").SetName("CrearProductoConCostoInvalida");

            yield return new TestCaseData("Azúcar", -5, -1000, UnidadDeMedida.Kilos, 0,1,
                "Cantidad invalida, Costo unitario invalido").
                SetName("CrearProductoConCostoyCantidadInvalida");

            yield return new TestCaseData("Azúcar", 5, 1000, UnidadDeMedida.Kilos, 0,1,
                "Producto registrado con éxito").SetName("ProductoRegistradoConExito" +
                "");
        }
        [TestCaseSource("DataTestCorrecto"),Order(3)]
        public void CrearMateriaPrimaDuplicado(string nombreProducto,
            double cantidadProducto,double costoUnitarioProducto, int idSubcategoria,
            UnidadDeMedida unidadDeMedidaProducto,double porcentajeDeUtilidadProducto)
        {
            ProductoRequest request = new ProductoRequest.ProductoRequestBuilder(1, nombreProducto).
                SetCantidad(cantidadProducto).SetCostoUnitario(costoUnitarioProducto).
                SetUnidadDeMedida(unidadDeMedidaProducto).SetSubCategoria(idSubcategoria).
                SetPorcentajeDeUtilidad(porcentajeDeUtilidadProducto).Build();

            _ = new ProductoCrearService(_unitOfWork).
                Crear(request);
            
            Response response = new ProductoCrearService(_unitOfWork).
                Crear(request);
            
            Assert.AreEqual("El producto ya existe", response.Mensaje);
        }
        private static IEnumerable<TestCaseData> DataTestCorrecto()
        {            
            yield return new TestCaseData("Azúcar", 5, 1000,1, UnidadDeMedida.Kilos, 0).
                SetName("ProductoMateriaPrimaDuplicado");
        }    
        
    }
}