
using Domain.Entities.EntitiesProducto;
using Domain.Entities.Tercero;
using NUnit.Framework;
using System;

namespace DomainTest
{
    public class TerceroClienteTest
    {
        private ProductoParaVenderConEnvoltorio _bandejaDeMaduro;
        private ProductoParaVenderConEnvoltorio _envueltoDeMaduro;
        private ProductoParaVenderConEnvoltorio _bandejaDeLeche;
        private ProductoMateriaPrima _leche;
        private ProductoParaFabricarDuro _dulceDeLeche;
        private Tercero duvan;
        private TerceroCliente clienteDuvan;
        [SetUp]
        public void SetUp()
        {
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

            duvan = new Tercero.TerceroBuilder("1065840833", "Duvan").Build();
            
            clienteDuvan = new TerceroCliente.
                TerceroClienteBuilder(duvan).Build();
            clienteDuvan.Id = 1;
        }
        [Test]
        public void ClienteAgregarPrecioMenorAlPermitido()
        {
            TerceroClientePrecioProducto precioProducto2 = new TerceroClientePrecioProducto.
                TerceroClientePrecioProductoBuilder(clienteDuvan, _bandejaDeMaduro).
                SetPrecio(3600).Build();
            clienteDuvan.AddPrecio(precioProducto2);
            InvalidOperationException ex = Assert.Throws<InvalidOperationException>(() =>
            {
                TerceroClientePrecioProducto precioProducto1 = new TerceroClientePrecioProducto.
                    TerceroClientePrecioProductoBuilder(clienteDuvan, _bandejaDeLeche).
                    SetPrecio(1500).Build();            
                clienteDuvan.AddPrecio(precioProducto1);
            });
            Assert.AreEqual("El precio del " +
                        $"producto Bandeja de Leche no puede ser menor al" +
                        $" precio sugerido de 3857,14", ex.Message);          
        }
        [Test]
        public void ClienteAgregarPrecioProductoNoEsParaVender()
        {
            TerceroClientePrecioProducto precioProducto3 = new TerceroClientePrecioProducto.
                TerceroClientePrecioProductoBuilder(clienteDuvan, _bandejaDeMaduro).
                SetPrecio(3600).Build();
            clienteDuvan.AddPrecio(precioProducto3);

            InvalidOperationException ex = Assert.Throws<InvalidOperationException>(() =>
            {
                TerceroClientePrecioProducto precioProducto1 = new TerceroClientePrecioProducto.
                    TerceroClientePrecioProductoBuilder(clienteDuvan, _leche).
                    SetPrecio(1500).Build();
                clienteDuvan.AddPrecio(precioProducto1);
            });
            Assert.AreEqual("El producto " +
                        $"Leche no se puede vender", ex.Message);
        }
        [Test]
        public void ClienteAgregarPreciosValidos()
        {
            TerceroClientePrecioProducto precioProducto3 = new TerceroClientePrecioProducto.
                TerceroClientePrecioProductoBuilder(clienteDuvan, _bandejaDeMaduro).
                SetPrecio(3600).Build();
            clienteDuvan.AddPrecio(precioProducto3);

            TerceroClientePrecioProducto precioProducto4 = new TerceroClientePrecioProducto.
                TerceroClientePrecioProductoBuilder(clienteDuvan, _bandejaDeLeche).
                SetPrecio(3900).Build();
            clienteDuvan.AddPrecio(precioProducto4);

            TerceroClientePrecioProducto precioProducto5 = new TerceroClientePrecioProducto.
                TerceroClientePrecioProductoBuilder(clienteDuvan, _envueltoDeMaduro).
                SetPrecio(4300).Build();
            clienteDuvan.AddPrecio(precioProducto5);

            Assert.AreEqual(3, clienteDuvan.ListaDePrecios.Count);
        }
    }
}
