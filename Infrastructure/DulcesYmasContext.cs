using Domain.Entities;
using Domain.Entities.EntitiesProducto;
using Domain.Entities.Tercero;
using Infrastructure.Base;
using Microsoft.EntityFrameworkCore;

namespace Infrastructure
{
    public class DulcesYmasContext : DbContextBase
    {
        public DulcesYmasContext(DbContextOptions options) : base(options)
        {
        }
        public DbSet<Rol> Roles { get; set; }
        public DbSet<Tercero> Terceros { get; set; }
        public DbSet<TerceroUsuario> TerceroUsuarios { get; set; }
        public DbSet<TerceroProvedor> TercerosProvedor { get; set; }
        public DbSet<TerceroEmpleado> TercerosEmpleados { get; set; }
        public DbSet<TerceroPropietario> TercerosPropietario { get; set; }
        public DbSet<ProductoMateriaPrima> ProductosMateriaPrima { get; set; }
        public DbSet<ProductoParaFabricarDuro> ProductosParaFabricarDuro { get; set; }
        public DbSet<ProductoParaFabricarSuave> ProductosParaFabricarSuave { get; set; }
        public DbSet<ProductoParaVenderConEnvoltorio> ProductosParaVenderConEnvoltorio { get; set; }
        public DbSet<ProductoParaVenderSinEnvoltorio> ProductosParaVenderSinEnvoltorio { get; set; }
        public DbSet<ProductoParaVenderDetalle> ProductosParaVenderDetalles { get; set; }
        public DbSet<Fabricacion> Fabricaciones { get; set; }
        public DbSet<FabricacionDetalle> FabricacionDetalles { get; set; }
        public DbSet<Compra> Compras { get; set; }
        public DbSet<CompraDetalle> CompraDetalles { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<FabricacionDetalle>().
                HasKey(fb => new { fb.FabricacionId, fb.MateriaPrimaId});

            modelBuilder.Entity<ProductoParaVenderDetalle>().
                HasKey(ppvd => new { ppvd.ProductoParaVenderId, ppvd.ProductoParaFabricarId });
            
            modelBuilder.Entity<CompraDetalle>().
                HasKey(cd => new { cd.ProductoId, cd.CompraId});            
        }
    }
}
