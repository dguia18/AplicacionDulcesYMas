using Domain.Entities.Tercero;
using Domain.Repositories;
using Infrastructure.Base;

namespace Infrastructure.Repositories
{
    public class RoleRepository : GenericRepository<Role>, IRoleRepository
    {
        public RoleRepository(IDbContext context) : base(context)
        {
        }
    }
}
