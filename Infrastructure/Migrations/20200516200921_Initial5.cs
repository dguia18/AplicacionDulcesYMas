using System;
using Microsoft.EntityFrameworkCore.Migrations;

namespace Infrastructure.Migrations
{
    public partial class Initial5 : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Fabricaciones_Producto_ProductoParaFabricarId",
                table: "Fabricaciones");

            migrationBuilder.DropIndex(
                name: "IX_Fabricaciones_ProductoParaFabricarId",
                table: "Fabricaciones");

            migrationBuilder.DropColumn(
                name: "Roles",
                table: "TerceroUsuarios");

            migrationBuilder.DropColumn(
                name: "ProductoParaFabricarId",
                table: "Fabricaciones");

            migrationBuilder.AddColumn<int>(
                name: "SubCategoriaId",
                table: "Producto",
                nullable: true);

            migrationBuilder.AddColumn<int>(
                name: "ProductoId",
                table: "Fabricaciones",
                nullable: true);

            migrationBuilder.CreateTable(
                name: "ProductoSubCategoria",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Nombre = table.Column<string>(nullable: true),
                    ProductoSubCategoriaId = table.Column<int>(nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_ProductoSubCategoria", x => x.Id);
                    table.ForeignKey(
                        name: "FK_ProductoSubCategoria_ProductoSubCategoria_ProductoSubCategoriaId",
                        column: x => x.ProductoSubCategoriaId,
                        principalTable: "ProductoSubCategoria",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "Roles",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Nombre = table.Column<string>(nullable: true),
                    TerceroUsuarioId = table.Column<int>(nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Roles", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Roles_TerceroUsuarios_TerceroUsuarioId",
                        column: x => x.TerceroUsuarioId,
                        principalTable: "TerceroUsuarios",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "TercerosProvedor",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    TerceroId = table.Column<int>(nullable: true)
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

            migrationBuilder.CreateIndex(
                name: "IX_Producto_SubCategoriaId",
                table: "Producto",
                column: "SubCategoriaId");

            migrationBuilder.CreateIndex(
                name: "IX_Fabricaciones_ProductoId",
                table: "Fabricaciones",
                column: "ProductoId");

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
                name: "IX_ProductoSubCategoria_ProductoSubCategoriaId",
                table: "ProductoSubCategoria",
                column: "ProductoSubCategoriaId");

            migrationBuilder.CreateIndex(
                name: "IX_Roles_TerceroUsuarioId",
                table: "Roles",
                column: "TerceroUsuarioId");

            migrationBuilder.CreateIndex(
                name: "IX_TercerosProvedor_TerceroId",
                table: "TercerosProvedor",
                column: "TerceroId");

            migrationBuilder.AddForeignKey(
                name: "FK_Fabricaciones_Producto_ProductoId",
                table: "Fabricaciones",
                column: "ProductoId",
                principalTable: "Producto",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);

            migrationBuilder.AddForeignKey(
                name: "FK_Producto_ProductoSubCategoria_SubCategoriaId",
                table: "Producto",
                column: "SubCategoriaId",
                principalTable: "ProductoSubCategoria",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Fabricaciones_Producto_ProductoId",
                table: "Fabricaciones");

            migrationBuilder.DropForeignKey(
                name: "FK_Producto_ProductoSubCategoria_SubCategoriaId",
                table: "Producto");

            migrationBuilder.DropTable(
                name: "CompraDetalles");

            migrationBuilder.DropTable(
                name: "ProductoSubCategoria");

            migrationBuilder.DropTable(
                name: "Roles");

            migrationBuilder.DropTable(
                name: "Compras");

            migrationBuilder.DropTable(
                name: "TercerosProvedor");

            migrationBuilder.DropIndex(
                name: "IX_Producto_SubCategoriaId",
                table: "Producto");

            migrationBuilder.DropIndex(
                name: "IX_Fabricaciones_ProductoId",
                table: "Fabricaciones");

            migrationBuilder.DropColumn(
                name: "SubCategoriaId",
                table: "Producto");

            migrationBuilder.DropColumn(
                name: "ProductoId",
                table: "Fabricaciones");

            migrationBuilder.AddColumn<string>(
                name: "Roles",
                table: "TerceroUsuarios",
                type: "nvarchar(max)",
                nullable: true);

            migrationBuilder.AddColumn<int>(
                name: "ProductoParaFabricarId",
                table: "Fabricaciones",
                type: "int",
                nullable: true);

            migrationBuilder.CreateIndex(
                name: "IX_Fabricaciones_ProductoParaFabricarId",
                table: "Fabricaciones",
                column: "ProductoParaFabricarId");

            migrationBuilder.AddForeignKey(
                name: "FK_Fabricaciones_Producto_ProductoParaFabricarId",
                table: "Fabricaciones",
                column: "ProductoParaFabricarId",
                principalTable: "Producto",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);
        }
    }
}
