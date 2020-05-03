using Infrastructure.Base;
using Microsoft.EntityFrameworkCore;
using System;

namespace Infrastructure
{
    public class TiendaContext : DbContextBase
    {
        public TiendaContext(DbContextOptions options) : base(options)
        {
        }
    }
}
