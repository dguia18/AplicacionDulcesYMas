using System;
using Microsoft.EntityFrameworkCore.Migrations;

namespace Infrastructure.Migrations
{
    public partial class Nueva : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "Categorias",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Nombre = table.Column<string>(nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Categorias", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "Roles",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Nombre = table.Column<string>(nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Roles", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "Terceros",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Nit = table.Column<string>(nullable: true),
                    RazonSocial = table.Column<string>(nullable: true),
                    FechaCreacion = table.Column<DateTime>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Terceros", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "SubCategorias",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Nombre = table.Column<string>(nullable: true),
                    ProductoCategoriaId = table.Column<int>(nullable: true),
                    ProductoSubCategoriaId = table.Column<int>(nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_SubCategorias", x => x.Id);
                    table.ForeignKey(
                        name: "FK_SubCategorias_Categorias_ProductoCategoriaId",
                        column: x => x.ProductoCategoriaId,
                        principalTable: "Categorias",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_SubCategorias_SubCategorias_ProductoSubCategoriaId",
                        column: x => x.ProductoSubCategoriaId,
                        principalTable: "SubCategorias",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "Contacto",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Direccion = table.Column<string>(nullable: true),
                    NumeroCelular = table.Column<string>(nullable: true),
                    Email = table.Column<string>(nullable: true),
                    TerceroId = table.Column<int>(nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Contacto", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Contacto_Terceros_TerceroId",
                        column: x => x.TerceroId,
                        principalTable: "Terceros",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "TercerosCliente",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    TerceroId = table.Column<int>(nullable: true),
                    FechaCreacion = table.Column<DateTime>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_TercerosCliente", x => x.Id);
                    table.ForeignKey(
                        name: "FK_TercerosCliente_Terceros_TerceroId",
                        column: x => x.TerceroId,
                        principalTable: "Terceros",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "TercerosEmpleados",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    TerceroId = table.Column<int>(nullable: true),
                    FechaCreacion = table.Column<DateTime>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_TercerosEmpleados", x => x.Id);
                    table.ForeignKey(
                        name: "FK_TercerosEmpleados_Terceros_TerceroId",
                        column: x => x.TerceroId,
                        principalTable: "Terceros",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "TercerosPropietario",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    TerceroId = table.Column<int>(nullable: true),
                    FechaCreacion = table.Column<DateTime>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_TercerosPropietario", x => x.Id);
                    table.ForeignKey(
                        name: "FK_TercerosPropietario_Terceros_TerceroId",
                        column: x => x.TerceroId,
                        principalTable: "Terceros",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "TercerosProvedor",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    TerceroId = table.Column<int>(nullable: true),
                    FechaCreacion = table.Column<DateTime>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_TercerosProvedor", x => x.Id);
                    table.ForeignKey(
                        name: "FK_TercerosProvedor_Terceros_TerceroId",
                        column: x => x.TerceroId,
                        principalTable: "Terceros",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "TerceroUsuarios",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    TerceroId = table.Column<int>(nullable: true),
                    Usuario = table.Column<string>(nullable: true),
                    Password = table.Column<string>(nullable: true),
                    RoleId = table.Column<int>(nullable: true),
                    FechaCreacion = table.Column<DateTime>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_TerceroUsuarios", x => x.Id);
                    table.ForeignKey(
                        name: "FK_TerceroUsuarios_Roles_RoleId",
                        column: x => x.RoleId,
                        principalTable: "Roles",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_TerceroUsuarios_Terceros_TerceroId",
                        column: x => x.TerceroId,
                        principalTable: "Terceros",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "Producto",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Nombre = table.Column<string>(nullable: true),
                    Cantidad = table.Column<double>(nullable: false),
                    CostoUnitario = table.Column<double>(nullable: false),
                    UnidadDeMedida = table.Column<int>(nullable: false),
                    PorcentajeDeUtilidad = table.Column<double>(nullable: false),
                    Especificacion = table.Column<int>(nullable: false),
                    Tipo = table.Column<int>(nullable: false),
                    EnvoltorioId = table.Column<int>(nullable: true),
                    FechaCreacion = table.Column<DateTime>(nullable: false),
                    SubCategoriaId = table.Column<int>(nullable: false),
                    Discriminator = table.Column<string>(nullable: false),
                    TerceroPropietarioId = table.Column<int>(nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Producto", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Producto_Producto_EnvoltorioId",
                        column: x => x.EnvoltorioId,
                        principalTable: "Producto",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_Producto_SubCategorias_SubCategoriaId",
                        column: x => x.SubCategoriaId,
                        principalTable: "SubCategorias",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_Producto_TercerosPropietario_TerceroPropietarioId",
                        column: x => x.TerceroPropietarioId,
                        principalTable: "TercerosPropietario",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "Compras",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Total = table.Column<double>(nullable: false),
                    ProveedorId = table.Column<int>(nullable: true),
                    UsuarioId = table.Column<int>(nullable: true),
                    Fecha = table.Column<DateTime>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Compras", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Compras_TercerosProvedor_ProveedorId",
                        column: x => x.ProveedorId,
                        principalTable: "TercerosProvedor",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_Compras_TerceroUsuarios_UsuarioId",
                        column: x => x.UsuarioId,
                        principalTable: "TerceroUsuarios",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "Ventas",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    UsuarioId = table.Column<int>(nullable: true),
                    ClienteId = table.Column<int>(nullable: true),
                    Total = table.Column<double>(nullable: false),
                    Pendiente = table.Column<double>(nullable: false),
                    Pagado = table.Column<double>(nullable: false),
                    Descuento = table.Column<double>(nullable: false),
                    TotalReal = table.Column<double>(nullable: false),
                    Utilidad = table.Column<double>(nullable: false),
                    Estado = table.Column<int>(nullable: false),
                    Fecha = table.Column<DateTime>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Ventas", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Ventas_TercerosCliente_ClienteId",
                        column: x => x.ClienteId,
                        principalTable: "TercerosCliente",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_Ventas_TerceroUsuarios_UsuarioId",
                        column: x => x.UsuarioId,
                        principalTable: "TerceroUsuarios",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "Fabricaciones",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    TerceroEmpleadoId = table.Column<int>(nullable: true),
                    Cantidad = table.Column<double>(nullable: false),
                    Costo = table.Column<double>(nullable: false),
                    FechaCreacion = table.Column<DateTime>(nullable: false),
                    ProductoId = table.Column<int>(nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Fabricaciones", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Fabricaciones_Producto_ProductoId",
                        column: x => x.ProductoId,
                        principalTable: "Producto",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_Fabricaciones_TercerosEmpleados_TerceroEmpleadoId",
                        column: x => x.TerceroEmpleadoId,
                        principalTable: "TercerosEmpleados",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "ProductosParaVenderDetalles",
                columns: table => new
                {
                    ProductoParaFabricarId = table.Column<int>(nullable: false),
                    ProductoParaVenderId = table.Column<int>(nullable: false),
                    Id = table.Column<int>(nullable: false),
                    Cantidad = table.Column<double>(nullable: false),
                    Costo = table.Column<double>(nullable: false),
                    ProductoMateriaPrimaId = table.Column<int>(nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_ProductosParaVenderDetalles", x => new { x.ProductoParaVenderId, x.ProductoParaFabricarId });
                    table.ForeignKey(
                        name: "FK_ProductosParaVenderDetalles_Producto_ProductoMateriaPrimaId",
                        column: x => x.ProductoMateriaPrimaId,
                        principalTable: "Producto",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_ProductosParaVenderDetalles_Producto_ProductoParaFabricarId",
                        column: x => x.ProductoParaFabricarId,
                        principalTable: "Producto",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_ProductosParaVenderDetalles_Producto_ProductoParaVenderId",
                        column: x => x.ProductoParaVenderId,
                        principalTable: "Producto",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.NoAction);
                });

            migrationBuilder.CreateTable(
                name: "TerceroClientePrecios",
                columns: table => new
                {
                    ClienteId = table.Column<int>(nullable: false),
                    ProductoId = table.Column<int>(nullable: false),
                    Id = table.Column<int>(nullable: false),
                    Precio = table.Column<double>(nullable: false),
                    Costo = table.Column<double>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_TerceroClientePrecios", x => new { x.ProductoId, x.ClienteId });
                    table.ForeignKey(
                        name: "FK_TerceroClientePrecios_TercerosCliente_ClienteId",
                        column: x => x.ClienteId,
                        principalTable: "TercerosCliente",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_TerceroClientePrecios_Producto_ProductoId",
                        column: x => x.ProductoId,
                        principalTable: "Producto",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "CompraDetalles",
                columns: table => new
                {
                    CompraId = table.Column<int>(nullable: false),
                    ProductoId = table.Column<int>(nullable: false),
                    Valor = table.Column<double>(nullable: false),
                    Cantidad = table.Column<double>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_CompraDetalles", x => new { x.ProductoId, x.CompraId });
                    table.ForeignKey(
                        name: "FK_CompraDetalles_Compras_CompraId",
                        column: x => x.CompraId,
                        principalTable: "Compras",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_CompraDetalles_Producto_ProductoId",
                        column: x => x.ProductoId,
                        principalTable: "Producto",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "Devoluciones",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    ClienteId = table.Column<int>(nullable: true),
                    UsuarioId = table.Column<int>(nullable: true),
                    Total = table.Column<double>(nullable: false),
                    VentaId = table.Column<int>(nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Devoluciones", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Devoluciones_TercerosCliente_ClienteId",
                        column: x => x.ClienteId,
                        principalTable: "TercerosCliente",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_Devoluciones_TerceroUsuarios_UsuarioId",
                        column: x => x.UsuarioId,
                        principalTable: "TerceroUsuarios",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_Devoluciones_Ventas_VentaId",
                        column: x => x.VentaId,
                        principalTable: "Ventas",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "VentaAbonos",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Valor = table.Column<double>(nullable: false),
                    VentaId = table.Column<int>(nullable: true),
                    FechaAbono = table.Column<DateTime>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_VentaAbonos", x => x.Id);
                    table.ForeignKey(
                        name: "FK_VentaAbonos_Ventas_VentaId",
                        column: x => x.VentaId,
                        principalTable: "Ventas",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "VentaDetalles",
                columns: table => new
                {
                    VentaId = table.Column<int>(nullable: false),
                    ProductoId = table.Column<int>(nullable: false),
                    Cantidad = table.Column<double>(nullable: false),
                    PrecioUnitario = table.Column<double>(nullable: false),
                    CostoUnitario = table.Column<double>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_VentaDetalles", x => new { x.ProductoId, x.VentaId });
                    table.ForeignKey(
                        name: "FK_VentaDetalles_Producto_ProductoId",
                        column: x => x.ProductoId,
                        principalTable: "Producto",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_VentaDetalles_Ventas_VentaId",
                        column: x => x.VentaId,
                        principalTable: "Ventas",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "FabricacionDetalles",
                columns: table => new
                {
                    FabricacionId = table.Column<int>(nullable: false),
                    MateriaPrimaId = table.Column<int>(nullable: false),
                    Cantidad = table.Column<double>(nullable: false),
                    Costo = table.Column<double>(nullable: false),
                    ProductoMateriaPrimaId = table.Column<int>(nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_FabricacionDetalles", x => new { x.FabricacionId, x.MateriaPrimaId });
                    table.ForeignKey(
                        name: "FK_FabricacionDetalles_Fabricaciones_FabricacionId",
                        column: x => x.FabricacionId,
                        principalTable: "Fabricaciones",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_FabricacionDetalles_Producto_MateriaPrimaId",
                        column: x => x.MateriaPrimaId,
                        principalTable: "Producto",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_FabricacionDetalles_Producto_ProductoMateriaPrimaId",
                        column: x => x.ProductoMateriaPrimaId,
                        principalTable: "Producto",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "DevolucionDetalles",
                columns: table => new
                {
                    DevolucionId = table.Column<int>(nullable: false),
                    ProductoId = table.Column<int>(nullable: false),
                    Id = table.Column<int>(nullable: false),
                    Cantidad = table.Column<double>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_DevolucionDetalles", x => new { x.ProductoId, x.DevolucionId });
                    table.ForeignKey(
                        name: "FK_DevolucionDetalles_Devoluciones_DevolucionId",
                        column: x => x.DevolucionId,
                        principalTable: "Devoluciones",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_DevolucionDetalles_Producto_ProductoId",
                        column: x => x.ProductoId,
                        principalTable: "Producto",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateIndex(
                name: "IX_CompraDetalles_CompraId",
                table: "CompraDetalles",
                column: "CompraId");

            migrationBuilder.CreateIndex(
                name: "IX_Compras_ProveedorId",
                table: "Compras",
                column: "ProveedorId");

            migrationBuilder.CreateIndex(
                name: "IX_Compras_UsuarioId",
                table: "Compras",
                column: "UsuarioId");

            migrationBuilder.CreateIndex(
                name: "IX_Contacto_TerceroId",
                table: "Contacto",
                column: "TerceroId");

            migrationBuilder.CreateIndex(
                name: "IX_DevolucionDetalles_DevolucionId",
                table: "DevolucionDetalles",
                column: "DevolucionId");

            migrationBuilder.CreateIndex(
                name: "IX_Devoluciones_ClienteId",
                table: "Devoluciones",
                column: "ClienteId");

            migrationBuilder.CreateIndex(
                name: "IX_Devoluciones_UsuarioId",
                table: "Devoluciones",
                column: "UsuarioId");

            migrationBuilder.CreateIndex(
                name: "IX_Devoluciones_VentaId",
                table: "Devoluciones",
                column: "VentaId");

            migrationBuilder.CreateIndex(
                name: "IX_FabricacionDetalles_MateriaPrimaId",
                table: "FabricacionDetalles",
                column: "MateriaPrimaId");

            migrationBuilder.CreateIndex(
                name: "IX_FabricacionDetalles_ProductoMateriaPrimaId",
                table: "FabricacionDetalles",
                column: "ProductoMateriaPrimaId");

            migrationBuilder.CreateIndex(
                name: "IX_Fabricaciones_ProductoId",
                table: "Fabricaciones",
                column: "ProductoId");

            migrationBuilder.CreateIndex(
                name: "IX_Fabricaciones_TerceroEmpleadoId",
                table: "Fabricaciones",
                column: "TerceroEmpleadoId");

            migrationBuilder.CreateIndex(
                name: "IX_Producto_EnvoltorioId",
                table: "Producto",
                column: "EnvoltorioId");

            migrationBuilder.CreateIndex(
                name: "IX_Producto_SubCategoriaId",
                table: "Producto",
                column: "SubCategoriaId");

            migrationBuilder.CreateIndex(
                name: "IX_Producto_TerceroPropietarioId",
                table: "Producto",
                column: "TerceroPropietarioId");

            migrationBuilder.CreateIndex(
                name: "IX_ProductosParaVenderDetalles_ProductoMateriaPrimaId",
                table: "ProductosParaVenderDetalles",
                column: "ProductoMateriaPrimaId");

            migrationBuilder.CreateIndex(
                name: "IX_ProductosParaVenderDetalles_ProductoParaFabricarId",
                table: "ProductosParaVenderDetalles",
                column: "ProductoParaFabricarId");

            migrationBuilder.CreateIndex(
                name: "IX_SubCategorias_ProductoCategoriaId",
                table: "SubCategorias",
                column: "ProductoCategoriaId");

            migrationBuilder.CreateIndex(
                name: "IX_SubCategorias_ProductoSubCategoriaId",
                table: "SubCategorias",
                column: "ProductoSubCategoriaId");

            migrationBuilder.CreateIndex(
                name: "IX_TerceroClientePrecios_ClienteId",
                table: "TerceroClientePrecios",
                column: "ClienteId");

            migrationBuilder.CreateIndex(
                name: "IX_TercerosCliente_TerceroId",
                table: "TercerosCliente",
                column: "TerceroId");

            migrationBuilder.CreateIndex(
                name: "IX_TercerosEmpleados_TerceroId",
                table: "TercerosEmpleados",
                column: "TerceroId");

            migrationBuilder.CreateIndex(
                name: "IX_TercerosPropietario_TerceroId",
                table: "TercerosPropietario",
                column: "TerceroId");

            migrationBuilder.CreateIndex(
                name: "IX_TercerosProvedor_TerceroId",
                table: "TercerosProvedor",
                column: "TerceroId");

            migrationBuilder.CreateIndex(
                name: "IX_TerceroUsuarios_RoleId",
                table: "TerceroUsuarios",
                column: "RoleId");

            migrationBuilder.CreateIndex(
                name: "IX_TerceroUsuarios_TerceroId",
                table: "TerceroUsuarios",
                column: "TerceroId");

            migrationBuilder.CreateIndex(
                name: "IX_VentaAbonos_VentaId",
                table: "VentaAbonos",
                column: "VentaId");

            migrationBuilder.CreateIndex(
                name: "IX_VentaDetalles_VentaId",
                table: "VentaDetalles",
                column: "VentaId");

            migrationBuilder.CreateIndex(
                name: "IX_Ventas_ClienteId",
                table: "Ventas",
                column: "ClienteId");

            migrationBuilder.CreateIndex(
                name: "IX_Ventas_UsuarioId",
                table: "Ventas",
                column: "UsuarioId");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "CompraDetalles");

            migrationBuilder.DropTable(
                name: "Contacto");

            migrationBuilder.DropTable(
                name: "DevolucionDetalles");

            migrationBuilder.DropTable(
                name: "FabricacionDetalles");

            migrationBuilder.DropTable(
                name: "ProductosParaVenderDetalles");

            migrationBuilder.DropTable(
                name: "TerceroClientePrecios");

            migrationBuilder.DropTable(
                name: "VentaAbonos");

            migrationBuilder.DropTable(
                name: "VentaDetalles");

            migrationBuilder.DropTable(
                name: "Compras");

            migrationBuilder.DropTable(
                name: "Devoluciones");

            migrationBuilder.DropTable(
                name: "Fabricaciones");

            migrationBuilder.DropTable(
                name: "TercerosProvedor");

            migrationBuilder.DropTable(
                name: "Ventas");

            migrationBuilder.DropTable(
                name: "Producto");

            migrationBuilder.DropTable(
                name: "TercerosEmpleados");

            migrationBuilder.DropTable(
                name: "TercerosCliente");

            migrationBuilder.DropTable(
                name: "TerceroUsuarios");

            migrationBuilder.DropTable(
                name: "SubCategorias");

            migrationBuilder.DropTable(
                name: "TercerosPropietario");

            migrationBuilder.DropTable(
                name: "Roles");

            migrationBuilder.DropTable(
                name: "Categorias");

            migrationBuilder.DropTable(
                name: "Terceros");
        }
    }
}
