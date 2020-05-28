using Application.Request;
using Domain.Contracts;
using Domain.Entities.EntitiesProducto;
using System.Linq;

namespace Application.Services.ProductoServices.CategoriaServices
{
    public class ProductoCategoriaCrearService
    {
        private readonly IUnitOfWork _unitOfWork;
        public ProductoCategoriaCrearService(IUnitOfWork unitOfWork)
        {
            this._unitOfWork = unitOfWork;
        }
        public Response Crear(ProductoCategoriaRequest request)
        {
            ProductoCategoria categoria = this._unitOfWork.CategoriaRepository
                .FindBy(categoria => categoria.Nombre == request.NombreCategoria,
                includeProperties: "SubCategorias").FirstOrDefault();

            if (categoria != null)
            {
                return new Response
                {
                    Mensaje = "La categoria ya se encuentra registrada"
                };
            }

            categoria = new ProductoCategoria();
            categoria.Nombre = request.NombreCategoria;

            this._unitOfWork.CategoriaRepository.Add(categoria);
            this._unitOfWork.Commit();


            return new Response
            {
                Mensaje = $"Se ha registrado la categoria {categoria.Nombre} con éxito," +
                $"pero las siguientes "
            };

        }
    }
}
