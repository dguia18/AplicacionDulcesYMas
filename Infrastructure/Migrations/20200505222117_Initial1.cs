using Microsoft.EntityFrameworkCore.Migrations;

namespace Infrastructure.Migrations
{
    public partial class Initial1 : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "Terceros",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Nit = table.Column<string>(nullable: true),
                    RazonSocial = table.Column<string>(nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Terceros", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "Contacto",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Direccion = table.Column<string>(nullable: true),
                    NumeroCelular = table.Column<string>(nullable: true),
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
                name: "TercerosEmpleados",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    TerceroId = table.Column<int>(nullable: true)
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
                    TerceroId = table.Column<int>(nullable: true)
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
                name: "Producto",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Nombre = table.Column<string>(nullable: true),
                    Cantidad = table.Column<double>(nullable: false),
                    CostoUnitario = table.Column<double>(nullable: false),
                    UnidadDeMedida = table.Column<string>(nullable: true),
                    PorcentajeDeUtilidad = table.Column<double>(nullable: false),
                    Contestura = table.Column<int>(nullable: false),
                    Emboltorio = table.Column<int>(nullable: false),
                    Discriminator = table.Column<string>(nullable: false),
                    TerceroPropietarioId = table.Column<int>(nullable: true),
                    EmboltorioProductoId = table.Column<int>(nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Producto", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Producto_TercerosPropietario_TerceroPropietarioId",
                        column: x => x.TerceroPropietarioId,
                        principalTable: "TercerosPropietario",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_Producto_Producto_EmboltorioProductoId",
                        column: x => x.EmboltorioProductoId,
                        principalTable: "Producto",
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
                    ProductoParaFabricarId = table.Column<int>(nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Fabricaciones", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Fabricaciones_Producto_ProductoParaFabricarId",
                        column: x => x.ProductoParaFabricarId,
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
                    Costo = table.Column<double>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_ProductosParaVenderDetalles", x => new { x.ProductoParaVenderId, x.ProductoParaFabricarId });
                    table.ForeignKey(
                        name: "FK_ProductosParaVenderDetalles_Producto_ProductoParaFabricarId",
                        column: x => x.ProductoParaFabricarId,
                        principalTable: "Producto",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.NoAction);
                    table.ForeignKey(
                        name: "FK_ProductosParaVenderDetalles_Producto_ProductoParaVenderId",
                        column: x => x.ProductoParaVenderId,
                        principalTable: "Producto",
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
                    Costo = table.Column<double>(nullable: false)
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
                });

            migrationBuilder.CreateIndex(
                name: "IX_Contacto_TerceroId",
                table: "Contacto",
                column: "TerceroId");

            migrationBuilder.CreateIndex(
                name: "IX_FabricacionDetalles_MateriaPrimaId",
                table: "FabricacionDetalles",
                column: "MateriaPrimaId");

            migrationBuilder.CreateIndex(
                name: "IX_Fabricaciones_ProductoParaFabricarId",
                table: "Fabricaciones",
                column: "ProductoParaFabricarId");

            migrationBuilder.CreateIndex(
                name: "IX_Fabricaciones_TerceroEmpleadoId",
                table: "Fabricaciones",
                column: "TerceroEmpleadoId");

            migrationBuilder.CreateIndex(
                name: "IX_Producto_TerceroPropietarioId",
                table: "Producto",
                column: "TerceroPropietarioId");

            migrationBuilder.CreateIndex(
                name: "IX_Producto_EmboltorioProductoId",
                table: "Producto",
                column: "EmboltorioProductoId");

            migrationBuilder.CreateIndex(
                name: "IX_ProductosParaVenderDetalles_ProductoParaFabricarId",
                table: "ProductosParaVenderDetalles",
                column: "ProductoParaFabricarId");

            migrationBuilder.CreateIndex(
                name: "IX_TercerosEmpleados_TerceroId",
                table: "TercerosEmpleados",
                column: "TerceroId");

            migrationBuilder.CreateIndex(
                name: "IX_TercerosPropietario_TerceroId",
                table: "TercerosPropietario",
                column: "TerceroId");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "Contacto");

            migrationBuilder.DropTable(
                name: "FabricacionDetalles");

            migrationBuilder.DropTable(
                name: "ProductosParaVenderDetalles");

            migrationBuilder.DropTable(
                name: "Fabricaciones");

            migrationBuilder.DropTable(
                name: "Producto");

            migrationBuilder.DropTable(
                name: "TercerosEmpleados");

            migrationBuilder.DropTable(
                name: "TercerosPropietario");

            migrationBuilder.DropTable(
                name: "Terceros");
        }
    }
}
