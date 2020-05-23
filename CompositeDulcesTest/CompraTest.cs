using Domain.Entities;
using Domain.Entities.EntitiesProducto;
using Domain.Entities.Tercero;
using NUnit.Framework;

namespace DomainTest
{
    public class CompraTest
    {
        Producto azucar;
        Producto leche;
        Tercero terceroDuvan;
        Tercero terceroMartin;
        TerceroUsuario usuarioDuvan;
        TerceroProveedor provedorMartin;
        [SetUp]
        public void SetUp()
        {
            azucar = new ProductoMateriaPrima().SetNombre("azúcar").SetCantidad(15).
                SetCostoUnitario(1700).SetUnidadDeMedida(UnidadDeMedida.Kilos);
            leche = new ProductoMateriaPrima().SetNombre("leche").SetCantidad(45).
                SetCostoUnitario(1500).SetUnidadDeMedida(UnidadDeMedida.Litros);

            terceroDuvan = new Tercero.TerceroBuilder("1065840833", "Duvan").Build();
            terceroMartin = new Tercero.TerceroBuilder("1010103118", "Martin").Build();

            usuarioDuvan = new TerceroUsuario(terceroDuvan);
            provedorMartin = new TerceroProveedor(terceroMartin);
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
