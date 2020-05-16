using Domain.Entities;
using Domain.Entities.Tercero;
using Domain.Repositories;
using Infrastructure.Base;

namespace Infrastructure.Repositories
{
    public class TerceroUsuarioRepository : GenericRepository<TerceroUsuario>, ITerceroUsuarioRepository
    {
        public TerceroUsuarioRepository(IDbContext context) : base(context)
        {
        }
    }
}
