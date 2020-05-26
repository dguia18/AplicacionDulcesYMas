using System;
using Microsoft.EntityFrameworkCore.Migrations;

namespace Infrastructure.Migrations
{
    public partial class rolDeUsuario : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Roles_TerceroUsuarios_TerceroUsuarioId",
                table: "Roles");

            migrationBuilder.DropIndex(
                name: "IX_Roles_TerceroUsuarioId",
                table: "Roles");

            migrationBuilder.DropColumn(
                name: "TerceroUsuarioId",
                table: "Roles");

            migrationBuilder.AddColumn<int>(
                name: "RoleId",
                table: "TerceroUsuarios",
                nullable: true);

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
                name: "IX_TerceroUsuarios_RoleId",
                table: "TerceroUsuarios",
                column: "RoleId");

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
                name: "IX_TerceroClientePrecios_ClienteId",
                table: "TerceroClientePrecios",
                column: "ClienteId");

            migrationBuilder.CreateIndex(
                name: "IX_TercerosCliente_TerceroId",
                table: "TercerosCliente",
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

            migrationBuilder.AddForeignKey(
                name: "FK_TerceroUsuarios_Roles_RoleId",
                table: "TerceroUsuarios",
                column: "RoleId",
                principalTable: "Roles",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_TerceroUsuarios_Roles_RoleId",
                table: "TerceroUsuarios");

            migrationBuilder.DropTable(
                name: "DevolucionDetalles");

            migrationBuilder.DropTable(
                name: "TerceroClientePrecios");

            migrationBuilder.DropTable(
                name: "VentaAbonos");

            migrationBuilder.DropTable(
                name: "VentaDetalles");

            migrationBuilder.DropTable(
                name: "Devoluciones");

            migrationBuilder.DropTable(
                name: "Ventas");

            migrationBuilder.DropTable(
                name: "TercerosCliente");

            migrationBuilder.DropIndex(
                name: "IX_TerceroUsuarios_RoleId",
                table: "TerceroUsuarios");

            migrationBuilder.DropColumn(
                name: "RoleId",
                table: "TerceroUsuarios");

            migrationBuilder.AddColumn<int>(
                name: "TerceroUsuarioId",
                table: "Roles",
                type: "int",
                nullable: true);

            migrationBuilder.CreateIndex(
                name: "IX_Roles_TerceroUsuarioId",
                table: "Roles",
                column: "TerceroUsuarioId");

            migrationBuilder.AddForeignKey(
                name: "FK_Roles_TerceroUsuarios_TerceroUsuarioId",
                table: "Roles",
                column: "TerceroUsuarioId",
                principalTable: "TerceroUsuarios",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);
        }
    }
}
