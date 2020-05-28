using Domain.Entities.EntitiesProducto;
using Domain.Repositories;
using Infrastructure.Base;

namespace Infrastructure.Repositories
{
    public class CategoriaRepository : GenericRepository<ProductoCategoria>, ICategoriaRepository
    {
        public CategoriaRepository(IDbContext context) : base(context)
        {
        }
    }
}
