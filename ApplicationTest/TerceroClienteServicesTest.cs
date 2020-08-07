
using Application.Request;
using Application.Services.ProductoServices;
using Application.Services.ProductoServices.CategoriaServices;
using Application.Services.TercerosServices.ClienteServices;
using Application.Services.TercerosServices.TerceroServices;
using Domain.Entities.EntitiesProducto;
using Infrastructure;
using Infrastructure.Base;
using Microsoft.EntityFrameworkCore;
using NUnit.Framework;
using System.Collections.Generic;

namespace ApplicationTest
{
	class TerceroClienteServicesTest
	{
		private DulcesYmasContext _context;
		private UnitOfWork _unitOfWork;
		[SetUp]
		public void Setup()
		{
			var optionsInMemory = new DbContextOptionsBuilder<DulcesYmasContext>().
				UseInMemoryDatabase("TerceroClienteServicesBD").Options;

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
			ProductoRequest request1 = new ProductoRequest.ProductoRequestBuilder(1, "Bandeja de leche").
				SetCantidad(15m).SetCostoUnitario(2000m).SetEspecificacion(Especificacion.TieneEnvoltorio)
				.SetTipo(Tipo.ParaVender).SetPorcentajeDeUtilidad(30m).
				SetUnidadDeMedida(UnidadDeMedida.Unidades).SetSubCategoria(1).Build();
			new ProductoCrearService(_unitOfWork).Crear(request1);

			ProductoRequest request2 = new ProductoRequest.ProductoRequestBuilder(2, "Bandeja de papaya").
				SetCantidad(10m).SetCostoUnitario(2200m).SetEspecificacion(Especificacion.TieneEnvoltorio)
				.SetTipo(Tipo.ParaVender).SetPorcentajeDeUtilidad(30m)
				.SetUnidadDeMedida(UnidadDeMedida.Unidades).SetSubCategoria(1).Build();
			new ProductoCrearService(_unitOfWork).Crear(request2);

			ProductoRequest request3 = new ProductoRequest.ProductoRequestBuilder(3, "Dulce de Leche")
				.SetTipo(Tipo.ParaFabricar).SetPorcentajeDeUtilidad(30m).
				SetCantidad(15m).SetCostoUnitario(400m).SetSubCategoria(1).SetEspecificacion(Especificacion.Duro)
				.SetUnidadDeMedida(UnidadDeMedida.Libras).Build();
			new ProductoCrearService(_unitOfWork).Crear(request3);
			#endregion

			#region Tercero
			TerceroRequest terceroDuvan = new TerceroRequest("1065840833", "Duvan");
			new TerceroCrearService(_unitOfWork).CrearTercero(terceroDuvan);

			TerceroRequest terceroMaria = new TerceroRequest("1010103112", "Maria");
			new TerceroCrearService(_unitOfWork).CrearTercero(terceroMaria);

			TerceroRequest terceroFelipe = new TerceroRequest("98032461204", "Felipe");
			new TerceroCrearService(_unitOfWork).CrearTercero(terceroFelipe);
			#endregion
			new TerceroClienteCrearService(_unitOfWork).Crear(new TerceroClienteRequest("98032461204"));
		}
		[TestCaseSource("DataTest"), Order(1)]
		public void ClienteCrearService(string nit, int idProducto1, decimal precioProducto1,
			int idProducto2, decimal precioProducto2, string esperado)
		{

			TerceroClienteRequest request = new TerceroClienteRequest(nit);
			request.Precios.Add(
				new TerceroClientePrecioRequest.TerceroClientePrecioRequestBuilder(idProducto1,
				precioProducto1).Build());

			request.Precios.Add(
				new TerceroClientePrecioRequest.TerceroClientePrecioRequestBuilder(idProducto2,
				precioProducto2).Build());

			Response response = new TerceroClienteCrearService(_unitOfWork).Crear(request);
			Assert.AreEqual(esperado, response.Mensaje);
		}
		private static IEnumerable<TestCaseData> DataTest()
		{
			yield return new TestCaseData("106584034", 1, 2900m, 2, 3800m, $"La identificación 106584034," +
					$" no se encuentra registrada hasta el momento").
					SetName("ClienteTerceroNoEstaRegistrado");

			yield return new TestCaseData("98032461204", 1, 2900m, 2, 3800m, $"No se pudo registrar el cliente" +
				$" porque ya esta en el sistema").
					SetName("ClienteTerceroDuplicado");

			yield return new TestCaseData("1065840833", 1, 2000m, 2, 3800m, "El precio del " +
						$"producto BANDEJA DE LECHE no puede ser menor al" +
						$" precio sugerido de 2857,14").
					SetName("ClienteTerceroConListaPrecioInvalidaPorPrecioBajoPrimerIndice");

			yield return new TestCaseData("1065840833", 1, 2900m, 2, 3000m, "El precio del " +
						$"producto BANDEJA DE PAPAYA no puede ser menor al" +
						$" precio sugerido de 3142,86").
					SetName("ClienteTerceroConListaPrecioInvalidaPorPrecioBajoSegundoIndice");

			yield return new TestCaseData("1065840833", 3, 2900m, 2, 3800m, $"El producto " +
						$"DULCE DE LECHE no se puede vender").
					SetName("ClienteTerceroProductoParaPrecioNoEsParaVender");

			yield return new TestCaseData("1065840833", 1, 2900m, 2, 3800m, "Cliente registrado con éxito").
					SetName("ClienteTerceroRegistradoConExito");
		}

		[TestCaseSource("DataTestProductosNoEncontrados")]
		public void ClienteCrearServiceProductosNoExistentes(string nit, int idProducto1, string nombre1,
			 decimal precioProducto1, int idProducto2, string nombre2, decimal precioProducto2, string esperado)
		{

			TerceroClienteRequest request = new TerceroClienteRequest(nit);
			request.Precios.Add(
				new TerceroClientePrecioRequest.TerceroClientePrecioRequestBuilder(idProducto1,
				precioProducto1).SetNombreProducto(nombre1).Build());

			request.Precios.Add(
				new TerceroClientePrecioRequest.TerceroClientePrecioRequestBuilder(idProducto2,
				precioProducto2).SetNombreProducto(nombre2).Build());

			Response response = new TerceroClienteCrearService(_unitOfWork).Crear(request);
			Assert.AreEqual(esperado, response.Mensaje);

		}
		private static IEnumerable<TestCaseData> DataTestProductosNoEncontrados()
		{
			yield return new TestCaseData("1010103112", 5, "Papaya", 2900m, 1, "BANDEJA DE LECHE", 3500m,
				"Los siguientes productos no fueron encontrados en el sistema\nPAPAYA con Id 5").
					SetName("ClienteTerceroProductoNoEncontradoPrimerIndice");

			yield return new TestCaseData("1010103112", 1, "BANDEJA DE LECHE", 2900m, 7, "COROZO", 5000m,
				"Los siguientes productos no fueron encontrados en el sistema\nCOROZO con Id 7").
					SetName("ClienteTerceroProductoNoEncontradoSegundoIndice");

			yield return new TestCaseData("1010103112", 4, "BANDEJA DE PIÑA", 2900m, 7, "COROZO", 5000m,
				"Los siguientes productos no fueron encontrados en el sistema\nBANDEJA DE PIÑA con Id 4\n" +
				"COROZO con Id 7").
					SetName("ClienteTerceroProductoNoEncontradoTodosLosIndices");
		}
	}
}
