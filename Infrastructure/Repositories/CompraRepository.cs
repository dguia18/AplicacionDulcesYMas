using Domain.Entities;
using Domain.Repositories;
using Infrastructure.Base;
using System;
using System.Collections.Generic;
using System.Text;

namespace Infrastructure.Repositories
{
    public class CompraRepository : GenericRepository<Compra>, ICompraRepository
    {
        public CompraRepository(IDbContext context) : base(context)
        {
        }
    }
}
