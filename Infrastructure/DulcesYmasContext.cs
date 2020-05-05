using Domain;
using Domain.Entities;
using Infrastructure.Base;
using Microsoft.EntityFrameworkCore;
using System;

namespace Infrastructure
{
    public class DulcesYmasContext : DbContextBase
    {
        public DulcesYmasContext(DbContextOptions options) : base(options)
        {
        }
        public DbSet<Tercero> Terceros { get; set; }
        public DbSet<TerceroEmpleado> TercerosEmpleados { get; set; }
        public DbSet<TerceroPropietario> TercerosPropietario { get; set; }
        public DbSet<ProductoMateriaPrima> ProductosMateriaPrima { get; set; }
        public DbSet<ProductoParaFabricarDuro> ProductosParaFabricarDuro { get; set; }
        public DbSet<ProductoParaFabricarSuave> ProductosParaFabricarSuave { get; set; }
        public DbSet<ProductoParaVenderConEmboltorio> ProductosParaVenderConEmboltorio { get; set; }
        public DbSet<ProductoParaVenderSinEmboltorio> ProductosParaVenderSinEmboltorio { get; set; }
        public DbSet<ProductoParaVenderDetalle> ProductosParaVenderDetalles { get; set; }
        public DbSet<Fabricacion> Fabricaciones { get; set; }
        public DbSet<FabricacionDetalle> FabricacionDetalles { get; set; }
        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<FabricacionDetalle>().
                HasKey(fb => new { fb.FabricacionId, fb.MateriaPrimaId});
            modelBuilder.Entity<ProductoParaVenderDetalle>().
                HasKey(ppvd => new { ppvd.ProductoParaVenderId, ppvd.ProductoParaFabricarId });
        }
    }
}
