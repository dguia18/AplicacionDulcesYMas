
using Application.Request;
using Domain.Contracts;
using Domain.Entities;
using System.Collections.Generic;

namespace Application.Services.CompraServices
{
	public class ListarComprasService
	{
		public ListarComprasService()
		{
		}
		public List<CompraRequest> ConvertirComprasARequest(List<Compra> compras)
		{
			var comprasRequest = new List<CompraRequest>();
			compras.ForEach(x => comprasRequest.Add(new CompraRequest().Map(x)));
			return comprasRequest;
		}
	}
}
