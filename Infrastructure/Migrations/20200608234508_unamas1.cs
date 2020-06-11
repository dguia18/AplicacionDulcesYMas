using Microsoft.EntityFrameworkCore.Migrations;

namespace Infrastructure.Migrations
{
    public partial class unamas1 : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<int>(
                name: "ProductoMateriaPrimaId",
                table: "ProductosParaVenderDetalles",
                nullable: true);

            migrationBuilder.CreateIndex(
                name: "IX_ProductosParaVenderDetalles_ProductoMateriaPrimaId",
                table: "ProductosParaVenderDetalles",
                column: "ProductoMateriaPrimaId");

            migrationBuilder.AddForeignKey(
                name: "FK_ProductosParaVenderDetalles_Producto_ProductoMateriaPrimaId",
                table: "ProductosParaVenderDetalles",
                column: "ProductoMateriaPrimaId",
                principalTable: "Producto",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_ProductosParaVenderDetalles_Producto_ProductoMateriaPrimaId",
                table: "ProductosParaVenderDetalles");

            migrationBuilder.DropIndex(
                name: "IX_ProductosParaVenderDetalles_ProductoMateriaPrimaId",
                table: "ProductosParaVenderDetalles");

            migrationBuilder.DropColumn(
                name: "ProductoMateriaPrimaId",
                table: "ProductosParaVenderDetalles");
        }
    }
}
