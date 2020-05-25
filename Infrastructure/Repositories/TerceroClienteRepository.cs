
using Domain.Entities.Tercero;
using Domain.Repositories;
using Infrastructure.Base;

namespace Infrastructure.Repositories
{
    public class TerceroClienteRepository : GenericRepository<TerceroCliente>, ITerceroClienteRepository
    {
        public TerceroClienteRepository(IDbContext context) : base(context)
        {
        }
    }
}
