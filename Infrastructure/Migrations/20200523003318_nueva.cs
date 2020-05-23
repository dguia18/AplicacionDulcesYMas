using Microsoft.EntityFrameworkCore.Migrations;

namespace Infrastructure.Migrations
{
    public partial class nueva : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Producto_Producto_EnvoltorioProductoId",
                table: "Producto");

            migrationBuilder.DropIndex(
                name: "IX_Producto_EnvoltorioProductoId",
                table: "Producto");

            migrationBuilder.DropColumn(
                name: "Contestura",
                table: "Producto");

            migrationBuilder.DropColumn(
                name: "Envoltorio",
                table: "Producto");

            migrationBuilder.DropColumn(
                name: "EnvoltorioProductoId",
                table: "Producto");

            migrationBuilder.AddColumn<int>(
                name: "EnvoltorioId",
                table: "Producto",
                nullable: true);

            migrationBuilder.AddColumn<int>(
                name: "Especificacion",
                table: "Producto",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.AddColumn<int>(
                name: "Tipo",
                table: "Producto",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.CreateIndex(
                name: "IX_Producto_EnvoltorioId",
                table: "Producto",
                column: "EnvoltorioId");

            migrationBuilder.AddForeignKey(
                name: "FK_Producto_Producto_EnvoltorioId",
                table: "Producto",
                column: "EnvoltorioId",
                principalTable: "Producto",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Producto_Producto_EnvoltorioId",
                table: "Producto");

            migrationBuilder.DropIndex(
                name: "IX_Producto_EnvoltorioId",
                table: "Producto");

            migrationBuilder.DropColumn(
                name: "EnvoltorioId",
                table: "Producto");

            migrationBuilder.DropColumn(
                name: "Especificacion",
                table: "Producto");

            migrationBuilder.DropColumn(
                name: "Tipo",
                table: "Producto");

            migrationBuilder.AddColumn<int>(
                name: "Contestura",
                table: "Producto",
                type: "int",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.AddColumn<int>(
                name: "Envoltorio",
                table: "Producto",
                type: "int",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.AddColumn<int>(
                name: "EnvoltorioProductoId",
                table: "Producto",
                type: "int",
                nullable: true);

            migrationBuilder.CreateIndex(
                name: "IX_Producto_EnvoltorioProductoId",
                table: "Producto",
                column: "EnvoltorioProductoId");

            migrationBuilder.AddForeignKey(
                name: "FK_Producto_Producto_EnvoltorioProductoId",
                table: "Producto",
                column: "EnvoltorioProductoId",
                principalTable: "Producto",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);
        }
    }
}
