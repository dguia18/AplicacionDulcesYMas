using Microsoft.EntityFrameworkCore.Migrations;

namespace Infrastructure.Migrations
{
    public partial class Initial4 : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AlterColumn<int>(
                name: "UnidadDeMedida",
                table: "Producto",
                nullable: false,
                oldClrType: typeof(string),
                oldType: "nvarchar(max)",
                oldNullable: true);

            migrationBuilder.AddColumn<int>(
                name: "ProductoMateriaPrimaId",
                table: "FabricacionDetalles",
                nullable: true);

            migrationBuilder.CreateIndex(
                name: "IX_FabricacionDetalles_ProductoMateriaPrimaId",
                table: "FabricacionDetalles",
                column: "ProductoMateriaPrimaId");

            migrationBuilder.AddForeignKey(
                name: "FK_FabricacionDetalles_Producto_ProductoMateriaPrimaId",
                table: "FabricacionDetalles",
                column: "ProductoMateriaPrimaId",
                principalTable: "Producto",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_FabricacionDetalles_Producto_ProductoMateriaPrimaId",
                table: "FabricacionDetalles");

            migrationBuilder.DropIndex(
                name: "IX_FabricacionDetalles_ProductoMateriaPrimaId",
                table: "FabricacionDetalles");

            migrationBuilder.DropColumn(
                name: "ProductoMateriaPrimaId",
                table: "FabricacionDetalles");

            migrationBuilder.AlterColumn<string>(
                name: "UnidadDeMedida",
                table: "Producto",
                type: "nvarchar(max)",
                nullable: true,
                oldClrType: typeof(int));
        }
    }
}
