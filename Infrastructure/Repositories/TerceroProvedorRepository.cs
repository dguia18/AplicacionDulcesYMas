using Domain.Entities.Tercero;
using Domain.Repositories;
using Infrastructure.Base;
using System;
using System.Collections.Generic;
using System.Text;

namespace Infrastructure.Repositories
{
    public class TerceroProvedorRepository : GenericRepository<TerceroProvedor>, ITerceroProvedorRepository
    {
        public TerceroProvedorRepository(IDbContext context) : base(context)
        {
        }
    }
}
