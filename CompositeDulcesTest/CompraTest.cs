using Domain;
using Domain.Entities;
using Domain.Entities.EntitiesProducto;
using Domain.Entities.Tercero;
using NUnit.Framework;
using System;
using System.Collections.Generic;
using System.Text;

namespace DomainTest
{
    public class CompraTest
    {
        Producto azucar;
        Producto leche;
        Tercero terceroDuvan;
        Tercero terceroMartin;
        TerceroUsuario usuarioDuvan;
        TerceroProvedor provedorMartin;
        [SetUp]
        public void SetUp()
        {
            azucar = new ProductoMateriaPrima("azúcar",15,1700,UnidadDeMedida.Kilos);
            leche = new ProductoMateriaPrima("leche",45,1500,UnidadDeMedida.Litros);

            terceroDuvan = new Tercero("1065840833", "Duvan");
            terceroMartin = new Tercero("1010103118", "Martin");

            usuarioDuvan = new TerceroUsuario(terceroDuvan);
            provedorMartin = new TerceroProvedor(terceroMartin);
        }
        [Test]
        public void ProbarCompra()
        {
            Compra compra = new Compra.CompraBuilder(provedorMartin, usuarioDuvan).Build();
            
            CompraDetalle detalle1 = new CompraDetalle.CompraDetalleBuilder(azucar, compra).
                SetCantidad(15).SetCostoUnitario(1800).Build();

            CompraDetalle detalle2 = new CompraDetalle.CompraDetalleBuilder(leche, compra).
                SetCantidad(30).SetCostoUnitario(1500).Build();

            compra.AddDetalle(detalle1);
            compra.AddDetalle(detalle2);

            leche.AddCompraDetalle(detalle2);
            azucar.AddCompraDetalle(detalle1);

            Assert.AreEqual(72000, compra.Total);
            Assert.AreEqual(75, leche.Cantidad);
            Assert.AreEqual(30, azucar.Cantidad);
        }
    }
}
