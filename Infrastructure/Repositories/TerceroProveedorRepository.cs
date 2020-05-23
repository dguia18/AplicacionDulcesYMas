using Domain.Entities.Tercero;
using Domain.Repositories;
using Infrastructure.Base;

namespace Infrastructure.Repositories
{
    public class TerceroProveedorRepository : GenericRepository<TerceroProveedor>, ITerceroProvedorRepository
    {
        public TerceroProveedorRepository(IDbContext context) : base(context)
        {
        }
    }
}
