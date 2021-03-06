﻿using Domain.Repositories;
using Domain.Entities.EntitiesProducto;
using Infrastructure.Base;

namespace Infrastructure.Repositories
{
    public class ProductoRepository : GenericRepository<Producto>, IProductoRepository
    {
        public ProductoRepository(IDbContext context) : base(context)
        {
        }
    }
}
