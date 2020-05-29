using Microsoft.EntityFrameworkCore.Migrations;

namespace Infrastructure.Migrations
{
    public partial class categoriaYsubcategoria : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Producto_ProductoSubCategoria_SubCategoriaId",
                table: "Producto");

            migrationBuilder.DropForeignKey(
                name: "FK_ProductoSubCategoria_ProductoSubCategoria_ProductoSubCategoriaId",
                table: "ProductoSubCategoria");

            migrationBuilder.DropPrimaryKey(
                name: "PK_ProductoSubCategoria",
                table: "ProductoSubCategoria");

            migrationBuilder.RenameTable(
                name: "ProductoSubCategoria",
                newName: "SubCategorias");

            migrationBuilder.RenameIndex(
                name: "IX_ProductoSubCategoria_ProductoSubCategoriaId",
                table: "SubCategorias",
                newName: "IX_SubCategorias_ProductoSubCategoriaId");

            migrationBuilder.AddColumn<int>(
                name: "ProductoCategoriaId",
                table: "SubCategorias",
                nullable: true);

            migrationBuilder.AddPrimaryKey(
                name: "PK_SubCategorias",
                table: "SubCategorias",
                column: "Id");

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

            migrationBuilder.CreateIndex(
                name: "IX_SubCategorias_ProductoCategoriaId",
                table: "SubCategorias",
                column: "ProductoCategoriaId");

            migrationBuilder.AddForeignKey(
                name: "FK_Producto_SubCategorias_SubCategoriaId",
                table: "Producto",
                column: "SubCategoriaId",
                principalTable: "SubCategorias",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);

            migrationBuilder.AddForeignKey(
                name: "FK_SubCategorias_Categorias_ProductoCategoriaId",
                table: "SubCategorias",
                column: "ProductoCategoriaId",
                principalTable: "Categorias",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);

            migrationBuilder.AddForeignKey(
                name: "FK_SubCategorias_SubCategorias_ProductoSubCategoriaId",
                table: "SubCategorias",
                column: "ProductoSubCategoriaId",
                principalTable: "SubCategorias",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Producto_SubCategorias_SubCategoriaId",
                table: "Producto");

            migrationBuilder.DropForeignKey(
                name: "FK_SubCategorias_Categorias_ProductoCategoriaId",
                table: "SubCategorias");

            migrationBuilder.DropForeignKey(
                name: "FK_SubCategorias_SubCategorias_ProductoSubCategoriaId",
                table: "SubCategorias");

            migrationBuilder.DropTable(
                name: "Categorias");

            migrationBuilder.DropPrimaryKey(
                name: "PK_SubCategorias",
                table: "SubCategorias");

            migrationBuilder.DropIndex(
                name: "IX_SubCategorias_ProductoCategoriaId",
                table: "SubCategorias");

            migrationBuilder.DropColumn(
                name: "ProductoCategoriaId",
                table: "SubCategorias");

            migrationBuilder.RenameTable(
                name: "SubCategorias",
                newName: "ProductoSubCategoria");

            migrationBuilder.RenameIndex(
                name: "IX_SubCategorias_ProductoSubCategoriaId",
                table: "ProductoSubCategoria",
                newName: "IX_ProductoSubCategoria_ProductoSubCategoriaId");

            migrationBuilder.AddPrimaryKey(
                name: "PK_ProductoSubCategoria",
                table: "ProductoSubCategoria",
                column: "Id");

            migrationBuilder.AddForeignKey(
                name: "FK_Producto_ProductoSubCategoria_SubCategoriaId",
                table: "Producto",
                column: "SubCategoriaId",
                principalTable: "ProductoSubCategoria",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);

            migrationBuilder.AddForeignKey(
                name: "FK_ProductoSubCategoria_ProductoSubCategoria_ProductoSubCategoriaId",
                table: "ProductoSubCategoria",
                column: "ProductoSubCategoriaId",
                principalTable: "ProductoSubCategoria",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);
        }
    }
}
