using Domain;
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
        public DbSet<Producto> Productos { get; set; }
        public DbSet<Tercero> Terceros { get; set; }
        public DbSet<TerceroEmpleado> TercerosEmpleados { get; set; }
        public DbSet<ProductoMateriaPrima> ProductosMateriaPrima { get; set; }
        public DbSet<Fabricacion> Fabricaciones { get; set; }
        public DbSet<FabricacionDetalle> FabricacionDetalles { get; set; }
        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<FabricacionDetalle>().
                HasKey(fb => new { fb.FabricacionId, fb.MateriaPrimaId});
        }
    }
}
