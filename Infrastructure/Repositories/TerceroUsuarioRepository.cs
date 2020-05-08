using Domain.Entities;
using Domain.Repositories;
using Infrastructure.Base;
using System;
using System.Collections.Generic;
using System.Text;

namespace Infrastructure.Repositories
{
    public class TerceroUsuarioRepository : GenericRepository<TerceroUsuario>, ITerceroUsuarioRepository
    {
        public TerceroUsuarioRepository(IDbContext context) : base(context)
        {
        }
    }
}
