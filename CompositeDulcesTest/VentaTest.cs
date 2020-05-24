
using Domain.Entities;
using Domain.Entities.EntitiesProducto;
using Domain.Entities.Tercero;
using NUnit.Framework;
using System;

namespace DomainTest
{
    public class VentaTest
    {
        private ProductoParaVenderConEnvoltorio _bandejaDeMaduro;
        private ProductoParaVenderConEnvoltorio _envueltoDeMaduro;
        private ProductoParaVenderConEnvoltorio _bandejaDeLeche;
        private ProductoParaVenderSinEnvoltorio _unidadesMedianasDeMaduro;
        private ProductoMateriaPrima _leche;
        private ProductoParaFabricarDuro _dulceDeLeche;
        private Tercero _duvan;
        private TerceroCliente _clienteDuvan;
        private Venta _venta;
        private TerceroUsuario _usuarioDuvan;
        [SetUp]
        public void SetUp()
        {
            #region BaseProductos

            _bandejaDeMaduro = new ProductoParaVenderConEnvoltorio().
                SetNombre("Bandeja de maduro").SetCantidad(25).SetCostoUnitario(2500);
            _bandejaDeMaduro.Id = 1;

            _envueltoDeMaduro = new ProductoParaVenderConEnvoltorio().
                SetNombre("Embuelto de Maduro").SetCantidad(10).SetCostoUnitario(3000);
            _envueltoDeMaduro.Id = 2;

            _bandejaDeLeche = new ProductoParaVenderConEnvoltorio().
                SetNombre("Bandeja de Leche").SetCantidad(13).SetCostoUnitario(2700);
            _bandejaDeLeche.Id = 3;

            _leche = new ProductoMateriaPrima().SetNombre("Leche").
                SetCantidad(15).SetCostoUnitario(1500);
            _leche.Id = 4;

            _dulceDeLeche = new ProductoParaFabricarDuro().SetNombre("Dulce de leche").
                SetCantidad(35).SetCostoUnitario(1500);
            _dulceDeLeche.Id = 5;

            _unidadesMedianasDeMaduro = new ProductoParaVenderSinEnvoltorio().
                SetNombre("Unidades medianas de maduro").SetCantidad(50).
                SetCostoUnitario(300);
            #endregion
            #region BaseTercero
            _duvan = new Tercero.TerceroBuilder("1065840833", "Duvan").Build();

            #endregion
            #region BaseCliente


            _clienteDuvan = new TerceroCliente.
                TerceroClienteBuilder(_duvan).Build();
            _clienteDuvan.Id = 1;

            TerceroClientePrecioProducto precioProducto3 = new TerceroClientePrecioProducto.
                TerceroClientePrecioProductoBuilder(_clienteDuvan, _bandejaDeMaduro).
                SetPrecio(3600).Build();
            _clienteDuvan.AddPrecio(precioProducto3);

            TerceroClientePrecioProducto precioProducto4 = new TerceroClientePrecioProducto.
                TerceroClientePrecioProductoBuilder(_clienteDuvan, _bandejaDeLeche).
                SetPrecio(3900).Build();
            _clienteDuvan.AddPrecio(precioProducto4);

            TerceroClientePrecioProducto precioProducto5 = new TerceroClientePrecioProducto.
                TerceroClientePrecioProductoBuilder(_clienteDuvan, _envueltoDeMaduro).
                SetPrecio(4300).Build();
            _clienteDuvan.AddPrecio(precioProducto5);
            #endregion
            #region BaseUsuario
            _usuarioDuvan = new TerceroUsuario.TerceroUsuarioBuilder(_duvan).
                SetUsuario("duvaninho").SetPassword("1234").Build();
            _usuarioDuvan.Id = 1;
            #endregion
        }
        [Test]
        public void VentaRealizadaConExito()
        {
            _venta = new Venta.VentaBuilder(_usuarioDuvan, _clienteDuvan).Build();

            VentaDetalle detalle1 = new VentaDetalle.VentaDetalleBuilder(_venta, _bandejaDeMaduro).
                SetCantidad(10).SetValor(3600).Build();
            _venta.AgregarDetalle(detalle1);

            VentaDetalle detalle = new VentaDetalle.VentaDetalleBuilder(_venta, _bandejaDeLeche).
                SetCantidad(10).SetValor(3900).Build();
            _venta.AgregarDetalle(detalle);

            VentaDetalle detalle2 = new VentaDetalle.VentaDetalleBuilder(_venta, _envueltoDeMaduro).
                SetCantidad(10).SetValor(4300).Build();
            _venta.AgregarDetalle(detalle2);

            _venta.SetDescuento(2000);
            Assert.AreEqual(3, _venta.VentaDetalles.Count);
            Assert.AreEqual(34000, _venta.UtilidadReal);
        }
        [Test]
        public void VentaConProductosQueNoEstanEnLaListaDePreciosDelCliente()
        {
            _venta = new Venta.VentaBuilder(_usuarioDuvan, _clienteDuvan).Build();

            VentaDetalle detalle1 = new VentaDetalle.VentaDetalleBuilder(_venta, _bandejaDeMaduro).
                SetCantidad(10).SetValor(3600).Build();
            _venta.AgregarDetalle(detalle1);

            Assert.AreEqual(36000, detalle1.ValorTotal);

            VentaDetalle detalle = new VentaDetalle.VentaDetalleBuilder(_venta, _bandejaDeLeche).
                SetCantidad(10).SetValor(3900).Build();
            _venta.AgregarDetalle(detalle);

            Assert.AreEqual(39000, detalle.ValorTotal);

            VentaDetalle detalle2 = new VentaDetalle.VentaDetalleBuilder(_venta, _unidadesMedianasDeMaduro).
                SetCantidad(10).SetValor(500).Build();
            _venta.AgregarDetalle(detalle2);

            Assert.AreEqual(5000, detalle2.ValorTotal);

            Assert.AreEqual(3, _venta.VentaDetalles.Count);
            Assert.AreEqual(25000, _venta.UtilidadReal);
            Assert.AreEqual(80000, _venta.Total);
        }
        [Test]
        public void VentaConProductosQueNoSonParaVender()
        {
            _venta = new Venta.VentaBuilder(_usuarioDuvan, _clienteDuvan).Build();

            VentaDetalle detalle1 = new VentaDetalle.VentaDetalleBuilder(_venta, _bandejaDeMaduro).
                SetCantidad(10).SetValor(3600).Build();
            _venta.AgregarDetalle(detalle1);

            Assert.AreEqual(36000, detalle1.ValorTotal);

            VentaDetalle detalle;
            InvalidOperationException ex = Assert.Throws<InvalidOperationException>(() =>
            {
                detalle = new VentaDetalle.VentaDetalleBuilder(_venta, _leche).
                SetCantidad(10).SetValor(3900).Build();
                _venta.AgregarDetalle(detalle);
            });
            
            Assert.AreEqual($"El producto Leche " +
                        $"no se puede vender, es solo para MateriaPrima", ex.Message);
           
        }

        [Test]
        public void VentaConProductosSinExistenciasSuficientes()
        {
            _venta = new Venta.VentaBuilder(_usuarioDuvan, _clienteDuvan).Build();
            
            InvalidOperationException ex = Assert.Throws<InvalidOperationException>(() =>
            {
                VentaDetalle detalle1 = new VentaDetalle.VentaDetalleBuilder(_venta, _bandejaDeMaduro).
                SetCantidad(30).SetValor(3600).Build();
                _venta.AgregarDetalle(detalle1);
            });

            Assert.AreEqual($"El producto Bandeja de maduro no " +
                        $"tiene existencias suficientes, solo tiene 25 Unidades", ex.Message);
        }
        [Test]
        public void VentaPagarMasDelPendiente()
        {
            _venta = new Venta.VentaBuilder(_usuarioDuvan, _clienteDuvan).Build();
            #region DetallesDeVenta

            VentaDetalle detalle1 = new VentaDetalle.VentaDetalleBuilder(_venta, _bandejaDeMaduro).
                SetCantidad(10).SetValor(3600).Build();
            _venta.AgregarDetalle(detalle1);

            VentaDetalle detalle = new VentaDetalle.VentaDetalleBuilder(_venta, _bandejaDeLeche).
                SetCantidad(10).SetValor(3900).Build();
            _venta.AgregarDetalle(detalle);

            VentaDetalle detalle2 = new VentaDetalle.VentaDetalleBuilder(_venta, _envueltoDeMaduro).
                SetCantidad(10).SetValor(4300).Build();
            _venta.AgregarDetalle(detalle2);
            #endregion

            _venta.SetDescuento(2000);
            Assert.AreEqual(3, _venta.VentaDetalles.Count);
            Assert.AreEqual(118000, _venta.Total);
            Assert.AreEqual(116000, _venta.TotalReal);
            Assert.AreEqual(34000, _venta.UtilidadReal);
            Assert.AreEqual(Estado.Pendiente, _venta.Estado);

            VentaAbono abono = new VentaAbono.VentaAbonoBuilder(_venta, 60000).Build();
            _venta.AgregarAbono(abono);

            Assert.AreEqual(60000, _venta.Pagado);

            InvalidOperationException ex = Assert.Throws<InvalidOperationException>(() =>
            {
                VentaAbono abono1 = new VentaAbono.VentaAbonoBuilder(_venta, 60000).Build();
                _venta.AgregarAbono(abono1);
            });

            Assert.AreEqual($"El valor a abonar es " +
                        $"superior al pendiente de 56000", ex.Message);
            Assert.AreEqual(56000, _venta.Pendiente);
            Assert.AreEqual(Estado.Pendiente, _venta.Estado);
        }
        [Test]
        public void VentaPagarPendiente()
        {
            _venta = new Venta.VentaBuilder(_usuarioDuvan, _clienteDuvan).Build();
            #region DetallesDeVenta

            VentaDetalle detalle1 = new VentaDetalle.VentaDetalleBuilder(_venta, _bandejaDeMaduro).
                SetCantidad(10).SetValor(3600).Build();
            _venta.AgregarDetalle(detalle1);

            VentaDetalle detalle = new VentaDetalle.VentaDetalleBuilder(_venta, _bandejaDeLeche).
                SetCantidad(10).SetValor(3900).Build();
            _venta.AgregarDetalle(detalle);

            VentaDetalle detalle2 = new VentaDetalle.VentaDetalleBuilder(_venta, _envueltoDeMaduro).
                SetCantidad(10).SetValor(4300).Build();
            _venta.AgregarDetalle(detalle2);
            #endregion

            _venta.SetDescuento(2000);
            Assert.AreEqual(3, _venta.VentaDetalles.Count);
            Assert.AreEqual(118000, _venta.Total);
            Assert.AreEqual(116000, _venta.TotalReal);
            Assert.AreEqual(34000, _venta.UtilidadReal);
            Assert.AreEqual(Estado.Pendiente, _venta.Estado);

            VentaAbono abono = new VentaAbono.VentaAbonoBuilder(_venta, 60000).Build();
            _venta.AgregarAbono(abono);

            Assert.AreEqual(60000, _venta.Pagado);

            VentaAbono abono1 = new VentaAbono.VentaAbonoBuilder(_venta, 56000).Build();
            _venta.AgregarAbono(abono1);            
            
            Assert.AreEqual(0, _venta.Pendiente);
            Assert.AreEqual(116000, _venta.Pagado);
            Assert.AreEqual(Estado.Pagado, _venta.Estado);
        }
    }
}
