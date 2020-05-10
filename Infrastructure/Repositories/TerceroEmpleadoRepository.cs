
using Domain;
using Domain.Repositories;
using Infrastructure.Base;

namespace Infrastructure.Repositories
{
    public class TerceroEmpleadoRepository : GenericRepository<TerceroEmpleado>,
        ITerceroEmpleadoRepository
    {
        public TerceroEmpleadoRepository(IDbContext context) : base(context)
        {
        }
    }
}
