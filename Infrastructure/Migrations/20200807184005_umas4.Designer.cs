﻿// <auto-generated />
using System;
using Infrastructure;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Metadata;
using Microsoft.EntityFrameworkCore.Migrations;
using Microsoft.EntityFrameworkCore.Storage.ValueConversion;

namespace Infrastructure.Migrations
{
    [DbContext(typeof(DulcesYmasContext))]
    [Migration("20200807184005_umas4")]
    partial class umas4
    {
        protected override void BuildTargetModel(ModelBuilder modelBuilder)
        {
#pragma warning disable 612, 618
            modelBuilder
                .HasAnnotation("ProductVersion", "3.1.4")
                .HasAnnotation("Relational:MaxIdentifierLength", 128)
                .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

            modelBuilder.Entity("Domain.Entities.Compra", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<DateTime>("Fecha")
                        .HasColumnType("datetime2");

                    b.Property<int?>("ProveedorId")
                        .HasColumnType("int");

                    b.Property<decimal>("Total")
                        .HasColumnType("decimal(7,2)");

                    b.Property<int?>("UsuarioId")
                        .HasColumnType("int");

                    b.HasKey("Id");

                    b.HasIndex("ProveedorId");

                    b.HasIndex("UsuarioId");

                    b.ToTable("Compras");
                });

            modelBuilder.Entity("Domain.Entities.CompraDetalle", b =>
                {
                    b.Property<int>("ProductoId")
                        .HasColumnType("int");

                    b.Property<int>("CompraId")
                        .HasColumnType("int");

                    b.Property<decimal>("Cantidad")
                        .HasColumnType("decimal(7,2)");

                    b.Property<decimal>("Valor")
                        .HasColumnType("decimal(7,2)");

                    b.HasKey("ProductoId", "CompraId");

                    b.HasIndex("CompraId");

                    b.ToTable("CompraDetalles");
                });

            modelBuilder.Entity("Domain.Entities.Devolucion", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<int?>("ClienteId")
                        .HasColumnType("int");

                    b.Property<decimal>("Total")
                        .HasColumnType("decimal(7,2)");

                    b.Property<int?>("UsuarioId")
                        .HasColumnType("int");

                    b.Property<int?>("VentaId")
                        .HasColumnType("int");

                    b.HasKey("Id");

                    b.HasIndex("ClienteId");

                    b.HasIndex("UsuarioId");

                    b.HasIndex("VentaId");

                    b.ToTable("Devoluciones");
                });

            modelBuilder.Entity("Domain.Entities.DevolucionDetalle", b =>
                {
                    b.Property<int>("ProductoId")
                        .HasColumnType("int");

                    b.Property<int>("DevolucionId")
                        .HasColumnType("int");

                    b.Property<decimal>("Cantidad")
                        .HasColumnType("decimal(7,2)");

                    b.Property<int>("Id")
                        .HasColumnType("int");

                    b.HasKey("ProductoId", "DevolucionId");

                    b.HasIndex("DevolucionId");

                    b.ToTable("DevolucionDetalles");
                });

            modelBuilder.Entity("Domain.Entities.EntitiesProducto.Producto", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<decimal>("Cantidad")
                        .HasColumnType("decimal(7,2)");

                    b.Property<decimal>("CostoUnitario")
                        .HasColumnType("decimal(7,2)");

                    b.Property<string>("Discriminator")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.Property<int?>("EnvoltorioId")
                        .HasColumnType("int");

                    b.Property<int>("Especificacion")
                        .HasColumnType("int");

                    b.Property<DateTime>("FechaCreacion")
                        .HasColumnType("datetime2");

                    b.Property<string>("Nombre")
                        .HasColumnType("nvarchar(max)");

                    b.Property<decimal>("PorcentajeDeUtilidad")
                        .HasColumnType("decimal(7,2)");

                    b.Property<int>("SubCategoriaId")
                        .HasColumnType("int");

                    b.Property<int?>("TerceroPropietarioId")
                        .HasColumnType("int");

                    b.Property<int>("Tipo")
                        .HasColumnType("int");

                    b.Property<int>("UnidadDeMedida")
                        .HasColumnType("int");

                    b.HasKey("Id");

                    b.HasIndex("EnvoltorioId");

                    b.HasIndex("SubCategoriaId");

                    b.HasIndex("TerceroPropietarioId");

                    b.ToTable("Producto");

                    b.HasDiscriminator<string>("Discriminator").HasValue("Producto");
                });

            modelBuilder.Entity("Domain.Entities.EntitiesProducto.ProductoCategoria", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<string>("Nombre")
                        .HasColumnType("nvarchar(max)");

                    b.HasKey("Id");

                    b.ToTable("Categorias");
                });

            modelBuilder.Entity("Domain.Entities.EntitiesProducto.ProductoParaVenderDetalle", b =>
                {
                    b.Property<int>("ProductoParaVenderId")
                        .HasColumnType("int");

                    b.Property<int>("ProductoParaFabricarId")
                        .HasColumnType("int");

                    b.Property<decimal>("Cantidad")
                        .HasColumnType("decimal(7,2)");

                    b.Property<decimal>("Costo")
                        .HasColumnType("decimal(7,2)");

                    b.Property<int>("Id")
                        .HasColumnType("int");

                    b.Property<int?>("ProductoMateriaPrimaId")
                        .HasColumnType("int");

                    b.HasKey("ProductoParaVenderId", "ProductoParaFabricarId");

                    b.HasIndex("ProductoMateriaPrimaId");

                    b.HasIndex("ProductoParaFabricarId");

                    b.ToTable("ProductosParaVenderDetalles");
                });

            modelBuilder.Entity("Domain.Entities.EntitiesProducto.ProductoSubCategoria", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<string>("Nombre")
                        .HasColumnType("nvarchar(max)");

                    b.Property<int?>("ProductoCategoriaId")
                        .HasColumnType("int");

                    b.Property<int?>("ProductoSubCategoriaId")
                        .HasColumnType("int");

                    b.HasKey("Id");

                    b.HasIndex("ProductoCategoriaId");

                    b.HasIndex("ProductoSubCategoriaId");

                    b.ToTable("SubCategorias");
                });

            modelBuilder.Entity("Domain.Entities.Fabricacion", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<decimal>("Cantidad")
                        .HasColumnType("decimal(7,2)");

                    b.Property<decimal>("Costo")
                        .HasColumnType("decimal(7,2)");

                    b.Property<DateTime>("FechaCreacion")
                        .HasColumnType("datetime2");

                    b.Property<int?>("ProductoId")
                        .HasColumnType("int");

                    b.Property<int?>("TerceroEmpleadoId")
                        .HasColumnType("int");

                    b.HasKey("Id");

                    b.HasIndex("ProductoId");

                    b.HasIndex("TerceroEmpleadoId");

                    b.ToTable("Fabricaciones");
                });

            modelBuilder.Entity("Domain.Entities.FabricacionDetalle", b =>
                {
                    b.Property<int>("FabricacionId")
                        .HasColumnType("int");

                    b.Property<int>("MateriaPrimaId")
                        .HasColumnType("int");

                    b.Property<decimal>("Cantidad")
                        .HasColumnType("decimal(7,2)");

                    b.Property<decimal>("Costo")
                        .HasColumnType("decimal(7,2)");

                    b.Property<int?>("ProductoMateriaPrimaId")
                        .HasColumnType("int");

                    b.HasKey("FabricacionId", "MateriaPrimaId");

                    b.HasIndex("MateriaPrimaId");

                    b.HasIndex("ProductoMateriaPrimaId");

                    b.ToTable("FabricacionDetalles");
                });

            modelBuilder.Entity("Domain.Entities.Tercero.Contacto", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<string>("Direccion")
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("Email")
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("NumeroCelular")
                        .HasColumnType("nvarchar(max)");

                    b.Property<int?>("TerceroId")
                        .HasColumnType("int");

                    b.HasKey("Id");

                    b.HasIndex("TerceroId");

                    b.ToTable("Contacto");
                });

            modelBuilder.Entity("Domain.Entities.Tercero.Role", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<string>("Nombre")
                        .HasColumnType("nvarchar(max)");

                    b.HasKey("Id");

                    b.ToTable("Roles");
                });

            modelBuilder.Entity("Domain.Entities.Tercero.Tercero", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<DateTime>("FechaCreacion")
                        .HasColumnType("datetime2");

                    b.Property<string>("Nit")
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("RazonSocial")
                        .HasColumnType("nvarchar(max)");

                    b.HasKey("Id");

                    b.ToTable("Terceros");
                });

            modelBuilder.Entity("Domain.Entities.Tercero.TerceroCliente", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<DateTime>("FechaCreacion")
                        .HasColumnType("datetime2");

                    b.Property<int?>("TerceroId")
                        .HasColumnType("int");

                    b.HasKey("Id");

                    b.HasIndex("TerceroId");

                    b.ToTable("TercerosCliente");
                });

            modelBuilder.Entity("Domain.Entities.Tercero.TerceroClientePrecioProducto", b =>
                {
                    b.Property<int>("ProductoId")
                        .HasColumnType("int");

                    b.Property<int>("ClienteId")
                        .HasColumnType("int");

                    b.Property<decimal>("Costo")
                        .HasColumnType("decimal(7,2)");

                    b.Property<int>("Id")
                        .HasColumnType("int");

                    b.Property<decimal>("Precio")
                        .HasColumnType("decimal(7,2)");

                    b.HasKey("ProductoId", "ClienteId");

                    b.HasIndex("ClienteId");

                    b.ToTable("TerceroClientePrecios");
                });

            modelBuilder.Entity("Domain.Entities.Tercero.TerceroEmpleado", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<DateTime>("FechaCreacion")
                        .HasColumnType("datetime2");

                    b.Property<int?>("TerceroId")
                        .HasColumnType("int");

                    b.HasKey("Id");

                    b.HasIndex("TerceroId");

                    b.ToTable("TercerosEmpleados");
                });

            modelBuilder.Entity("Domain.Entities.Tercero.TerceroPropietario", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<DateTime>("FechaCreacion")
                        .HasColumnType("datetime2");

                    b.Property<int?>("TerceroId")
                        .HasColumnType("int");

                    b.HasKey("Id");

                    b.HasIndex("TerceroId");

                    b.ToTable("TercerosPropietario");
                });

            modelBuilder.Entity("Domain.Entities.Tercero.TerceroProveedor", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<DateTime>("FechaCreacion")
                        .HasColumnType("datetime2");

                    b.Property<int?>("TerceroId")
                        .HasColumnType("int");

                    b.HasKey("Id");

                    b.HasIndex("TerceroId");

                    b.ToTable("TercerosProvedor");
                });

            modelBuilder.Entity("Domain.Entities.Tercero.TerceroUsuario", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<DateTime>("FechaCreacion")
                        .HasColumnType("datetime2");

                    b.Property<string>("Password")
                        .HasColumnType("nvarchar(max)");

                    b.Property<int?>("RoleId")
                        .HasColumnType("int");

                    b.Property<int?>("TerceroId")
                        .HasColumnType("int");

                    b.Property<string>("Usuario")
                        .HasColumnType("nvarchar(max)");

                    b.HasKey("Id");

                    b.HasIndex("RoleId");

                    b.HasIndex("TerceroId");

                    b.ToTable("TerceroUsuarios");
                });

            modelBuilder.Entity("Domain.Entities.Transaccion", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<int>("Concepto")
                        .HasColumnType("int");

                    b.Property<string>("Descripcion")
                        .HasColumnType("nvarchar(max)");

                    b.Property<DateTime>("Fecha")
                        .HasColumnType("datetime2");

                    b.Property<decimal>("Monto")
                        .HasColumnType("decimal(7,2)");

                    b.Property<int>("TipoDeTransaccion")
                        .HasColumnType("int");

                    b.HasKey("Id");

                    b.ToTable("Transacciones");
                });

            modelBuilder.Entity("Domain.Entities.Venta", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<int?>("ClienteId")
                        .HasColumnType("int");

                    b.Property<decimal>("Descuento")
                        .HasColumnType("decimal(7,2)");

                    b.Property<int>("Estado")
                        .HasColumnType("int");

                    b.Property<DateTime>("Fecha")
                        .HasColumnType("datetime2");

                    b.Property<decimal>("Pagado")
                        .HasColumnType("decimal(7,2)");

                    b.Property<decimal>("Pendiente")
                        .HasColumnType("decimal(7,2)");

                    b.Property<decimal>("Total")
                        .HasColumnType("decimal(7,2)");

                    b.Property<decimal>("TotalReal")
                        .HasColumnType("decimal(7,2)");

                    b.Property<int?>("UsuarioId")
                        .HasColumnType("int");

                    b.Property<decimal>("Utilidad")
                        .HasColumnType("decimal(7,2)");

                    b.HasKey("Id");

                    b.HasIndex("ClienteId");

                    b.HasIndex("UsuarioId");

                    b.ToTable("Ventas");
                });

            modelBuilder.Entity("Domain.Entities.VentaAbono", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<DateTime>("FechaAbono")
                        .HasColumnType("datetime2");

                    b.Property<decimal>("Valor")
                        .HasColumnType("decimal(7,2)");

                    b.Property<int?>("VentaId")
                        .HasColumnType("int");

                    b.HasKey("Id");

                    b.HasIndex("VentaId");

                    b.ToTable("VentaAbonos");
                });

            modelBuilder.Entity("Domain.Entities.VentaDetalle", b =>
                {
                    b.Property<int>("ProductoId")
                        .HasColumnType("int");

                    b.Property<int>("VentaId")
                        .HasColumnType("int");

                    b.Property<decimal>("Cantidad")
                        .HasColumnType("decimal(7,2)");

                    b.Property<decimal>("CostoUnitario")
                        .HasColumnType("decimal(7,2)");

                    b.Property<decimal>("PrecioUnitario")
                        .HasColumnType("decimal(7,2)");

                    b.HasKey("ProductoId", "VentaId");

                    b.HasIndex("VentaId");

                    b.ToTable("VentaDetalles");
                });

            modelBuilder.Entity("Domain.Entities.EntitiesProducto.ProductoMateriaPrima", b =>
                {
                    b.HasBaseType("Domain.Entities.EntitiesProducto.Producto");

                    b.HasDiscriminator().HasValue("ProductoMateriaPrima");
                });

            modelBuilder.Entity("Domain.Entities.EntitiesProducto.ProductoParaFabricar", b =>
                {
                    b.HasBaseType("Domain.Entities.EntitiesProducto.Producto");

                    b.HasDiscriminator().HasValue("ProductoParaFabricar");
                });

            modelBuilder.Entity("Domain.Entities.EntitiesProducto.ProductoParaVender", b =>
                {
                    b.HasBaseType("Domain.Entities.EntitiesProducto.Producto");

                    b.HasDiscriminator().HasValue("ProductoParaVender");
                });

            modelBuilder.Entity("Domain.Entities.EntitiesProducto.ProductoParaFabricarDuro", b =>
                {
                    b.HasBaseType("Domain.Entities.EntitiesProducto.ProductoParaFabricar");

                    b.HasDiscriminator().HasValue("ProductoParaFabricarDuro");
                });

            modelBuilder.Entity("Domain.Entities.EntitiesProducto.ProductoParaFabricarSuave", b =>
                {
                    b.HasBaseType("Domain.Entities.EntitiesProducto.ProductoParaFabricar");

                    b.HasDiscriminator().HasValue("ProductoParaFabricarSuave");
                });

            modelBuilder.Entity("Domain.Entities.EntitiesProducto.ProductoParaVenderConEnvoltorio", b =>
                {
                    b.HasBaseType("Domain.Entities.EntitiesProducto.ProductoParaVender");

                    b.HasDiscriminator().HasValue("ProductoParaVenderConEnvoltorio");
                });

            modelBuilder.Entity("Domain.Entities.EntitiesProducto.ProductoParaVenderSinEnvoltorio", b =>
                {
                    b.HasBaseType("Domain.Entities.EntitiesProducto.ProductoParaVender");

                    b.HasDiscriminator().HasValue("ProductoParaVenderSinEnvoltorio");
                });

            modelBuilder.Entity("Domain.Entities.Compra", b =>
                {
                    b.HasOne("Domain.Entities.Tercero.TerceroProveedor", "Proveedor")
                        .WithMany()
                        .HasForeignKey("ProveedorId");

                    b.HasOne("Domain.Entities.Tercero.TerceroUsuario", "Usuario")
                        .WithMany()
                        .HasForeignKey("UsuarioId");
                });

            modelBuilder.Entity("Domain.Entities.CompraDetalle", b =>
                {
                    b.HasOne("Domain.Entities.Compra", "Compra")
                        .WithMany("DetallesCompra")
                        .HasForeignKey("CompraId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.HasOne("Domain.Entities.EntitiesProducto.Producto", "Producto")
                        .WithMany("DetallesCompra")
                        .HasForeignKey("ProductoId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();
                });

            modelBuilder.Entity("Domain.Entities.Devolucion", b =>
                {
                    b.HasOne("Domain.Entities.Tercero.TerceroCliente", "Cliente")
                        .WithMany()
                        .HasForeignKey("ClienteId");

                    b.HasOne("Domain.Entities.Tercero.TerceroUsuario", "Usuario")
                        .WithMany()
                        .HasForeignKey("UsuarioId");

                    b.HasOne("Domain.Entities.Venta", null)
                        .WithMany("Devoluciones")
                        .HasForeignKey("VentaId");
                });

            modelBuilder.Entity("Domain.Entities.DevolucionDetalle", b =>
                {
                    b.HasOne("Domain.Entities.Devolucion", "Devolucion")
                        .WithMany("DevolucionDetalles")
                        .HasForeignKey("DevolucionId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.HasOne("Domain.Entities.EntitiesProducto.Producto", "Producto")
                        .WithMany()
                        .HasForeignKey("ProductoId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();
                });

            modelBuilder.Entity("Domain.Entities.EntitiesProducto.Producto", b =>
                {
                    b.HasOne("Domain.Entities.EntitiesProducto.Producto", "Envoltorio")
                        .WithMany()
                        .HasForeignKey("EnvoltorioId");

                    b.HasOne("Domain.Entities.EntitiesProducto.ProductoSubCategoria", "SubCategoria")
                        .WithMany("Productos")
                        .HasForeignKey("SubCategoriaId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.HasOne("Domain.Entities.Tercero.TerceroPropietario", null)
                        .WithMany("Productos")
                        .HasForeignKey("TerceroPropietarioId");
                });

            modelBuilder.Entity("Domain.Entities.EntitiesProducto.ProductoParaVenderDetalle", b =>
                {
                    b.HasOne("Domain.Entities.EntitiesProducto.ProductoMateriaPrima", null)
                        .WithMany("ProductoParaVenderDetalles")
                        .HasForeignKey("ProductoMateriaPrimaId");

                    b.HasOne("Domain.Entities.EntitiesProducto.ProductoParaFabricar", "ProductoParaFabricar")
                        .WithMany("ProductoParaVenderDetalles")
                        .HasForeignKey("ProductoParaFabricarId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.HasOne("Domain.Entities.EntitiesProducto.ProductoParaVender", "ProductoParaVender")
                        .WithMany("ProductoParaVenderDetalles")
                        .HasForeignKey("ProductoParaVenderId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();
                });

            modelBuilder.Entity("Domain.Entities.EntitiesProducto.ProductoSubCategoria", b =>
                {
                    b.HasOne("Domain.Entities.EntitiesProducto.ProductoCategoria", null)
                        .WithMany("SubCategorias")
                        .HasForeignKey("ProductoCategoriaId");

                    b.HasOne("Domain.Entities.EntitiesProducto.ProductoSubCategoria", null)
                        .WithMany("SubCategorias")
                        .HasForeignKey("ProductoSubCategoriaId");
                });

            modelBuilder.Entity("Domain.Entities.Fabricacion", b =>
                {
                    b.HasOne("Domain.Entities.EntitiesProducto.Producto", null)
                        .WithMany("Fabricaciones")
                        .HasForeignKey("ProductoId");

                    b.HasOne("Domain.Entities.Tercero.TerceroEmpleado", "TerceroEmpleado")
                        .WithMany("Fabricaciones")
                        .HasForeignKey("TerceroEmpleadoId");
                });

            modelBuilder.Entity("Domain.Entities.FabricacionDetalle", b =>
                {
                    b.HasOne("Domain.Entities.Fabricacion", "Fabricacion")
                        .WithMany("FabricacionDetalles")
                        .HasForeignKey("FabricacionId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.HasOne("Domain.Entities.EntitiesProducto.Producto", "MateriaPrima")
                        .WithMany()
                        .HasForeignKey("MateriaPrimaId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.HasOne("Domain.Entities.EntitiesProducto.ProductoMateriaPrima", null)
                        .WithMany("FabricacionDetalles")
                        .HasForeignKey("ProductoMateriaPrimaId");
                });

            modelBuilder.Entity("Domain.Entities.Tercero.Contacto", b =>
                {
                    b.HasOne("Domain.Entities.Tercero.Tercero", null)
                        .WithMany("Contactos")
                        .HasForeignKey("TerceroId");
                });

            modelBuilder.Entity("Domain.Entities.Tercero.TerceroCliente", b =>
                {
                    b.HasOne("Domain.Entities.Tercero.Tercero", "Tercero")
                        .WithMany()
                        .HasForeignKey("TerceroId");
                });

            modelBuilder.Entity("Domain.Entities.Tercero.TerceroClientePrecioProducto", b =>
                {
                    b.HasOne("Domain.Entities.Tercero.TerceroCliente", "Cliente")
                        .WithMany("ListaDePrecios")
                        .HasForeignKey("ClienteId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.HasOne("Domain.Entities.EntitiesProducto.Producto", "Producto")
                        .WithMany()
                        .HasForeignKey("ProductoId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();
                });

            modelBuilder.Entity("Domain.Entities.Tercero.TerceroEmpleado", b =>
                {
                    b.HasOne("Domain.Entities.Tercero.Tercero", "Tercero")
                        .WithMany()
                        .HasForeignKey("TerceroId");
                });

            modelBuilder.Entity("Domain.Entities.Tercero.TerceroPropietario", b =>
                {
                    b.HasOne("Domain.Entities.Tercero.Tercero", "Tercero")
                        .WithMany()
                        .HasForeignKey("TerceroId");
                });

            modelBuilder.Entity("Domain.Entities.Tercero.TerceroProveedor", b =>
                {
                    b.HasOne("Domain.Entities.Tercero.Tercero", "Tercero")
                        .WithMany()
                        .HasForeignKey("TerceroId");
                });

            modelBuilder.Entity("Domain.Entities.Tercero.TerceroUsuario", b =>
                {
                    b.HasOne("Domain.Entities.Tercero.Role", "Role")
                        .WithMany()
                        .HasForeignKey("RoleId");

                    b.HasOne("Domain.Entities.Tercero.Tercero", "Tercero")
                        .WithMany("Usuarios")
                        .HasForeignKey("TerceroId");
                });

            modelBuilder.Entity("Domain.Entities.Venta", b =>
                {
                    b.HasOne("Domain.Entities.Tercero.TerceroCliente", "Cliente")
                        .WithMany()
                        .HasForeignKey("ClienteId");

                    b.HasOne("Domain.Entities.Tercero.TerceroUsuario", "Usuario")
                        .WithMany()
                        .HasForeignKey("UsuarioId");
                });

            modelBuilder.Entity("Domain.Entities.VentaAbono", b =>
                {
                    b.HasOne("Domain.Entities.Venta", "Venta")
                        .WithMany("Abonos")
                        .HasForeignKey("VentaId");
                });

            modelBuilder.Entity("Domain.Entities.VentaDetalle", b =>
                {
                    b.HasOne("Domain.Entities.EntitiesProducto.Producto", "Producto")
                        .WithMany()
                        .HasForeignKey("ProductoId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.HasOne("Domain.Entities.Venta", "Venta")
                        .WithMany("VentaDetalles")
                        .HasForeignKey("VentaId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();
                });
#pragma warning restore 612, 618
        }
    }
}