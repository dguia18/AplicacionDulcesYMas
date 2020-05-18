using System;
using Microsoft.EntityFrameworkCore.Migrations;

namespace Infrastructure.Migrations
{
    public partial class Initial6 : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<DateTime>(
                name: "FechaCreacion",
                table: "TerceroUsuarios",
                nullable: false,
                defaultValue: new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified));

            migrationBuilder.AddColumn<DateTime>(
                name: "FechaCreacion",
                table: "TercerosProvedor",
                nullable: false,
                defaultValue: new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified));

            migrationBuilder.AddColumn<DateTime>(
                name: "FechaCreacion",
                table: "TercerosPropietario",
                nullable: false,
                defaultValue: new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified));

            migrationBuilder.AddColumn<DateTime>(
                name: "FechaCreacion",
                table: "TercerosEmpleados",
                nullable: false,
                defaultValue: new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified));

            migrationBuilder.AddColumn<DateTime>(
                name: "FechaCreacion",
                table: "Terceros",
                nullable: false,
                defaultValue: new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified));

            migrationBuilder.AddColumn<DateTime>(
                name: "FechaCreacion",
                table: "Producto",
                nullable: false,
                defaultValue: new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified));

            migrationBuilder.AddColumn<DateTime>(
                name: "FechaCreacion",
                table: "Fabricaciones",
                nullable: false,
                defaultValue: new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified));

            migrationBuilder.AddColumn<string>(
                name: "Email",
                table: "Contacto",
                nullable: true);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "FechaCreacion",
                table: "TerceroUsuarios");

            migrationBuilder.DropColumn(
                name: "FechaCreacion",
                table: "TercerosProvedor");

            migrationBuilder.DropColumn(
                name: "FechaCreacion",
                table: "TercerosPropietario");

            migrationBuilder.DropColumn(
                name: "FechaCreacion",
                table: "TercerosEmpleados");

            migrationBuilder.DropColumn(
                name: "FechaCreacion",
                table: "Terceros");

            migrationBuilder.DropColumn(
                name: "FechaCreacion",
                table: "Producto");

            migrationBuilder.DropColumn(
                name: "FechaCreacion",
                table: "Fabricaciones");

            migrationBuilder.DropColumn(
                name: "Email",
                table: "Contacto");
        }
    }
}
