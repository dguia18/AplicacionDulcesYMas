using Domain;
using Domain.Repositories;
using Infrastructure.Base;
using System;
using System.Collections.Generic;
using System.Text;

namespace Infrastructure.Repositories
{
    public class TerceroRepository : GenericRepository<Tercero>, ITerceroRepository
    {
        public TerceroRepository(IDbContext context) : base(context)
        {
        }
    }
}
