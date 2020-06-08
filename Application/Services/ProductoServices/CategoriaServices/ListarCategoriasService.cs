
using Application.Request;
using Domain.Contracts;
using Domain.Entities.EntitiesProducto;
using System;
using System.Collections.Generic;
using System.Linq;

namespace Application.Services.ProductoServices.CategoriaServices
{
    public class ListarCategoriasService
    {
        private readonly IUnitOfWork _unitOfWork;
        public ListarCategoriasService(IUnitOfWork unitOfWork)
        {
            this._unitOfWork = unitOfWork;
        }

        public Response GetCategorias()
        {
            var categorias = this._unitOfWork.CategoriaRepository.GetAll().ToList();
            if (categorias == null)
            {
                return new Response { Mensaje = "No hay categorías para mostrar" };
            }
            return new Response { Data = ConvertirCategoriasARequest(categorias) };
        }

        private List<ProductoCategoriaRequest> ConvertirCategoriasARequest(List<ProductoCategoria> categorias)
        {
            List<ProductoCategoriaRequest> request = new List<ProductoCategoriaRequest>();
            categorias.ForEach(x => request.Add(new ProductoCategoriaRequest().Map(x)));
            return request;
        }
    }
}
