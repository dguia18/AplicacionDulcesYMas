using Domain.Entities.Tercero;
using Domain.Repositories;
using Infrastructure.Base;

namespace Infrastructure.Repositories
{
    public class TerceroRepository : GenericRepository<Tercero>, ITerceroRepository
    {
        public TerceroRepository(IDbContext context) : base(context)
        {
        }
    }
}
