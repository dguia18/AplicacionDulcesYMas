
using Application.Request;
using Application.Services;
using Application.Services.ProductoServices;
using Application.Services.ProductoServices.CategoriaServices;
using Application.Services.TercerosServices.EmpleadoServices;
using Application.Services.TercerosServices.TerceroServices;
using ApplicationTest.Utils;
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
		private Utilities utilities;
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

			utilities = new Utilities();
			#region CrearMateriasPrimas
			utilities.CrearProducto(new ProductoRequest.ProductoRequestBuilder(1, "Dulce de Ñame").
				SetCantidad(15).SetCostoUnitario(500).SetUnidadDeMedida(UnidadDeMedida.Kilos).SetTipo(Tipo.MateriaPrima).
				SetPorcentajeDeUtilidad(0).SetEspecificacion(Especificacion.Duro).SetTipo(Tipo.ParaFabricar).
				SetSubCategoria(1).Build(), new ProductoCrearService(_unitOfWork));

			utilities.CrearProducto(new ProductoRequest.ProductoRequestBuilder(2, "Ñame").
				SetCantidad(15).SetCostoUnitario(500).SetUnidadDeMedida(UnidadDeMedida.Kilos).SetTipo(Tipo.MateriaPrima).
				SetPorcentajeDeUtilidad(0).SetEspecificacion(Especificacion.MateriaPrima).
				SetSubCategoria(1).Build(), new ProductoCrearService(_unitOfWork));


			new ProductoCrearService(_unitOfWork).Crear(new ProductoRequest.ProductoRequestBuilder(3, "Leche").
				SetCantidad(95).SetCostoUnitario(1700).SetUnidadDeMedida(UnidadDeMedida.Litros).SetTipo(Tipo.MateriaPrima).
				SetPorcentajeDeUtilidad(0).SetEspecificacion(Especificacion.MateriaPrima).
				SetSubCategoria(1).Build());

			new ProductoCrearService(_unitOfWork).Crear(new ProductoRequest.ProductoRequestBuilder(4, "Azúcar").
				SetCantidad(30).SetCostoUnitario(1300).SetUnidadDeMedida(UnidadDeMedida.Kilos).SetTipo(Tipo.MateriaPrima).
				SetPorcentajeDeUtilidad(0).SetEspecificacion(Especificacion.MateriaPrima).
				SetSubCategoria(1).Build());
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

			new TerceroCrearService(_unitOfWork).
				CrearTercero(new TerceroRequest("1065840833", "Duvan Guia"));
			TerceroEmpleadoRequest empleadoRequest = new TerceroEmpleadoRequest
				("1065840833");
			new TerceroEmpleadoCrearService(_unitOfWork).Crear(empleadoRequest);
			#endregion
		}
		[TestCaseSource("DataTestFabricarProducto")]
		public void FabricacionProbar(string identificaciónEmpleado, int idProducto,
			Especificacion contestura, string esperado)
		{
			FabricacionRequest request = new FabricacionRequest(identificaciónEmpleado, idProducto,
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


			FabricacionRequest request = new FabricacionRequest("1065840833", 1
				, 0, 0, Especificacion.Duro, fabricacionDetalleRequestsConErrorEnPrimerIndice);
			Response obtenido = new FabricacionCrearService(_unitOfWork).IniciarFabricacion(request);
			Assert.AreEqual("No hay cantidades suficientes " +
			   $"de ÑAME, solo hay 15", obtenido.Mensaje);
		}
		[Test]
		public void FabricacionConDetalleErradoSegundoIndice()
		{


			FabricacionRequest request = new FabricacionRequest("1065840833", 1
				, 0, 0, Especificacion.Duro, fabricacionDetalleRequestsConErrorEnSegundoIndice);
			Response obtenido = new FabricacionCrearService(_unitOfWork).IniciarFabricacion(request);
			Assert.AreEqual("No hay cantidades suficientes " +
			   $"de LECHE, solo hay 95", obtenido.Mensaje);
		}
		[Test]
		public void FabricacionConDetalleErradoUltimoIndice()
		{


			FabricacionRequest request = new FabricacionRequest("1065840833", 1
				, 0, 0, Especificacion.Duro, fabricacionDetalleRequestsConErrorEnUltimoIndice);
			Response obtenido = new FabricacionCrearService(_unitOfWork).IniciarFabricacion(request);
			Assert.AreEqual("No hay cantidades suficientes " +
			   $"de AZÚCAR, solo hay 30", obtenido.Mensaje);
		}

	}
}
