
using Domain.Entities;
using Domain.Repositories;
using Infrastructure.Base;

namespace Infrastructure.Repositories
{
    public class TransaccionRepository : GenericRepository<Transaccion>, ITransaccionRepository
    {
        public TransaccionRepository(IDbContext context) : base(context)
        {
        }
    }
}
