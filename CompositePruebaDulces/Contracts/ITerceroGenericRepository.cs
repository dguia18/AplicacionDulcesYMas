
using Domain.Repositories;

namespace Domain.Contracts
{
    public interface ITerceroGenericRepository : ITerceroClienteRepository,
        ITerceroProvedorRepository,
        ITerceroEmpleadoRepository
    {
    }
}
