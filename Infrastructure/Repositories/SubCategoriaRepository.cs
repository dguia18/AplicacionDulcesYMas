
using Domain.Entities.EntitiesProducto;
using Domain.Repositories;
using Infrastructure.Base;

namespace Infrastructure.Repositories
{
    public class SubCategoriaRepository : GenericRepository<ProductoSubCategoria>, ISubCategoriaRepository
    {
        public SubCategoriaRepository(IDbContext context) : base(context)
        {
        }
    }
}
