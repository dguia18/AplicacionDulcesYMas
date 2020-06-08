
using Application.Request;
using Domain.Contracts;
using Domain.Entities.EntitiesProducto;
using System.Collections.Generic;
using System.Linq;

namespace Application.Services.ProductoServices.CategoriaServices
{
    public class ListarSubCategoriasService
    {
        private readonly IUnitOfWork _unitOfWork;
        public ListarSubCategoriasService(IUnitOfWork unitOfWork)
        {
            this._unitOfWork = unitOfWork;
        }
        public List<ProductoSubCategoriaRequest> ConvertirSubCategoriasARequest(List<ProductoSubCategoria> subCategorias)
        {
            List<ProductoSubCategoriaRequest> request = new List<ProductoSubCategoriaRequest>();
            subCategorias.ForEach(x => request.Add(new ProductoSubCategoriaRequest().Map(x)));
            return request;
        }
        public Response GetSubCategorias()
        {
            var subCategorias = this._unitOfWork.SubCategoriaRepository.GetAll().ToList();
            if (subCategorias == null)
            {
                return new Response { Mensaje = "No hay subcategorías para mostrar" };
            }
            return new Response { Data = ConvertirSubCategoriasARequest(subCategorias) };
        }
        public ProductoSubCategoria BuscarSubCategoriaConId(int idSubcategoria)
        {
            return this._unitOfWork.SubCategoriaRepository.
                FindFirstOrDefault(subCategoria => subCategoria.Id == idSubcategoria);
        }
    }
}
