using Application.Request;
using Domain.Contracts;
using Domain.Entities.EntitiesProducto;
using System.Linq;

namespace Application.Services.ProductoServices.CategoriaServices
{
    public class ProductoCategoriaAgregarSubCategoriaService 
    {
        private readonly IUnitOfWork _unitOfWork;
        public ProductoCategoriaAgregarSubCategoriaService(IUnitOfWork unitOfWork)
        {
            this._unitOfWork = unitOfWork;
        }
        public Response Agregar(ProductoSubCategoriaRequest request)
        {
            ProductoCategoria categoria = this._unitOfWork.CategoriaRepository
                .FindBy(categoria => categoria.Id == request.IdCategoria,
                includeProperties: "SubCategorias").FirstOrDefault();

            if (categoria == null)
            {
                return new Response { Mensaje = "La categoria no fue encontrada" };
            }

            ProductoSubCategoria subCategoria = categoria.SubCategorias
                .FirstOrDefault(subCategoria => subCategoria.Nombre == request.NombreSubCategoria);

            if (subCategoria != null)
            {
                return new Response
                {
                    Mensaje = $"La subcategoria {request.NombreSubCategoria} ya " +
                    $"se encuentra registrada"
                };
            }

            subCategoria = new ProductoSubCategoria
                .ProductoSubCategoriaBuilder(request.NombreSubCategoria).Build();

            categoria.SubCategorias.Add(subCategoria);
            this._unitOfWork.CategoriaRepository.Edit(categoria);
            this._unitOfWork.Commit();

            return new Response
            {
                Mensaje = "Subcategoria registrada con éxito",
                Data = new ProductoCategoriaRequest().Map(categoria)
            };
        }
    }
}
