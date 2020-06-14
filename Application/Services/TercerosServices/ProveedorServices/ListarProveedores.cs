using System.Collections.Generic;
using System.Linq;
using Application.Request;
using Domain.Contracts;
using Domain.Entities.Tercero;
namespace Application.Services.TercerosServices.ProveedorServices
{
	public class ListarProveedores
	{
		private readonly IUnitOfWork _unitOfWork;
		public ListarProveedores(IUnitOfWork unitOfWork)
		{
			this._unitOfWork = unitOfWork;
		}
		public ListarProveedores()
		{

		}
		public Response Get()
		{
			var proveedores = this._unitOfWork.TerceroProvedorRepository
				.FindBy(includeProperties: "Tercero").ToList();

			if (!proveedores.Any())
			{
				return new Response { Mensaje = "No hay proveedores para mostrar" };
			}
			return new Response { Data = ConvertirProveedoresARequest(proveedores) };
		}
		public List<TerceroProveedorRequest> ConvertirProveedoresARequest(List<TerceroProveedor> terceros)
		{
			List<TerceroProveedorRequest> request = new List<TerceroProveedorRequest>();
			terceros.ForEach(x => request.Add(new TerceroProveedorRequest().Map(x)));
			return request;
		}
	}
}