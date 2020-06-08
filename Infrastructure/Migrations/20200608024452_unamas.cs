using Microsoft.EntityFrameworkCore.Migrations;

namespace Infrastructure.Migrations
{
    public partial class unamas : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Producto_SubCategorias_SubCategoriaId",
                table: "Producto");

            migrationBuilder.AlterColumn<int>(
                name: "SubCategoriaId",
                table: "Producto",
                nullable: false,
                oldClrType: typeof(int),
                oldType: "int",
                oldNullable: true);

            migrationBuilder.AddForeignKey(
                name: "FK_Producto_SubCategorias_SubCategoriaId",
                table: "Producto",
                column: "SubCategoriaId",
                principalTable: "SubCategorias",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Producto_SubCategorias_SubCategoriaId",
                table: "Producto");

            migrationBuilder.AlterColumn<int>(
                name: "SubCategoriaId",
                table: "Producto",
                type: "int",
                nullable: true,
                oldClrType: typeof(int));

            migrationBuilder.AddForeignKey(
                name: "FK_Producto_SubCategorias_SubCategoriaId",
                table: "Producto",
                column: "SubCategoriaId",
                principalTable: "SubCategorias",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);
        }
    }
}
