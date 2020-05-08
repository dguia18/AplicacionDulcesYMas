using Microsoft.EntityFrameworkCore.Migrations;

namespace Infrastructure.Migrations
{
    public partial class Initial3 : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "TerceroUsuarios",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    TerceroId = table.Column<int>(nullable: true),
                    Usuario = table.Column<string>(nullable: true),
                    Password = table.Column<string>(nullable: true),
                    Roles = table.Column<string>(nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_TerceroUsuarios", x => x.Id);
                    table.ForeignKey(
                        name: "FK_TerceroUsuarios_Terceros_TerceroId",
                        column: x => x.TerceroId,
                        principalTable: "Terceros",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateIndex(
                name: "IX_TerceroUsuarios_TerceroId",
                table: "TerceroUsuarios",
                column: "TerceroId");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "TerceroUsuarios");
        }
    }
}
