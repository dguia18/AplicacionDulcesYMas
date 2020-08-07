using NUnit.Framework;
using System.Collections.Generic;
using System;
using Domain.Entities.Tercero;
using Domain.Entities;
using Domain.Entities.EntitiesProducto;

namespace DomainTest
{
    public class CompositeTest
    {
        TerceroPropietario Administrador;
        ProductoMateriaPrima leche;
        ProductoMateriaPrima azucar;
        ProductoMateriaPrima ArinaPan;
        ProductoMateriaPrima BandejaSelloPlus4Onzas;
        ProductoParaFabricarDuro calderoLeche;
        ProductoParaVenderConEnvoltorio PresentacionBandejaSelloPlus4Onzas;
        ProductoParaVenderSinEnvoltorio UnidadesDeLeche;
        Tercero tercero;
        TerceroEmpleado TerceroEmpleado;
        Fabricacion Fabricacion;
        List<ProductoMateriaPrima> materiasPrimas;        
        [SetUp]
        public void Setup()
        {
            leche = new ProductoMateriaPrima().SetNombre("leche").SetCantidad(15).
                SetCostoUnitario(2000).SetUnidadDeMedida(UnidadDeMedida.Litros);

            azucar = new ProductoMateriaPrima().SetNombre("Azucar").SetCantidad( 10).
                SetCostoUnitario(1000).SetUnidadDeMedida( UnidadDeMedida.Libras);

            ArinaPan = new ProductoMateriaPrima().SetNombre("Arina Pan").SetCantidad( 0.5m).
                SetCostoUnitario(1000).SetUnidadDeMedida( UnidadDeMedida.Litros);

            calderoLeche = new ProductoParaFabricarDuro().SetNombre("Caldero de Leche");
            calderoLeche.PorcentajeDeUtilidad = 30;

            BandejaSelloPlus4Onzas =
                new ProductoMateriaPrima().SetNombre("Bandeja de Sello Plus de 4 Onzas").
                SetCantidad(1).SetCostoUnitario( 300).SetUnidadDeMedida( UnidadDeMedida.Litros);
            BandejaSelloPlus4Onzas.SetCantidad(4);

            PresentacionBandejaSelloPlus4Onzas =
                new ProductoParaVenderConEnvoltorio().SetNombre
                ("Presentacion de Bandeja Sello Plus 4 Onzas");
            PresentacionBandejaSelloPlus4Onzas.SetEnvoltorio(BandejaSelloPlus4Onzas);
            
            tercero = new Tercero.TerceroBuilder("Duvan", "1065840833").Build();
            TerceroEmpleado = new TerceroEmpleado(tercero);            
            Administrador = new TerceroPropietario(tercero);
            Administrador.Productos.Add(leche);


            materiasPrimas = new List<ProductoMateriaPrima>();
            materiasPrimas.Add(leche);
            materiasPrimas.Add(ArinaPan);
            materiasPrimas.Add(azucar);
            Administrador.Productos.Add(azucar);
            Administrador.Productos.Add(PresentacionBandejaSelloPlus4Onzas);

            UnidadesDeLeche = new ProductoParaVenderSinEnvoltorio();
        }

        [Test]
        public void ProbarCostoDelaPrimeraFabricacion()
        {
            Fabricacion = new Fabricacion(TerceroEmpleado);
            

            Fabricacion.AgregarDetalle(new FabricacionDetalle(Fabricacion,leche,15));
            Fabricacion.AgregarDetalle(new FabricacionDetalle(Fabricacion,ArinaPan,1));
            Fabricacion.AgregarDetalle(new FabricacionDetalle(Fabricacion,azucar,10));
            calderoLeche.AgregarFabricacion(Fabricacion);
            calderoLeche.AdicionarCantidad(23);
            //((15*2000) + (1*1000) + (10*1000))/(0+23*50)
            Assert.AreEqual(35.65, calderoLeche.CostoUnitario);
            Console.WriteLine(calderoLeche.PrecioSugeridoDeVenta + " " +  calderoLeche.Cantidad);
        }

        [Test]
        public void ProbarCostoLuegoDeLaPrimeraPreparacion()
        {
            //Primera Fabricacion
            Fabricacion = new Fabricacion(TerceroEmpleado);
            Fabricacion.AgregarDetalle(new FabricacionDetalle(Fabricacion, leche, 15));
            Fabricacion.AgregarDetalle(new FabricacionDetalle(Fabricacion, ArinaPan, 1));
            Fabricacion.AgregarDetalle(new FabricacionDetalle(Fabricacion, azucar, 10));

            calderoLeche.AgregarFabricacion(Fabricacion);
            calderoLeche.AdicionarCantidad(23);
            
            leche.SetCantidad(35);
            azucar.SetCantidad(30);
            ArinaPan.SetCantidad(0.5m);
            //Segunda Fabricacion
            Fabricacion = new Fabricacion(TerceroEmpleado);
            Fabricacion.AgregarDetalle(new FabricacionDetalle(Fabricacion, leche, 35));
            Fabricacion.AgregarDetalle(new FabricacionDetalle(Fabricacion, ArinaPan, 0.5m));
            Fabricacion.AgregarDetalle(new FabricacionDetalle(Fabricacion, azucar, 30));

            calderoLeche.AgregarFabricacion(Fabricacion);
            calderoLeche.AdicionarCantidad(35);

            //(35.65*23*50 + (35*2000) + (0.5*1000) + (30*1000))/(23*50+35*50)
            Assert.AreEqual(48.79, calderoLeche.CostoUnitario);
            Assert.AreEqual((35+23)*50, calderoLeche.Cantidad);
        }
        [Test]
        public void ProbarCreacionDePresentacionConEnvoltorio()
        {
            Fabricacion = new Fabricacion(TerceroEmpleado);
            Fabricacion.AgregarDetalle(new FabricacionDetalle(Fabricacion, leche, 15));
            Fabricacion.AgregarDetalle(new FabricacionDetalle(Fabricacion, ArinaPan, 1));
            Fabricacion.AgregarDetalle(new FabricacionDetalle(Fabricacion, azucar, 10));

            calderoLeche.AgregarFabricacion(Fabricacion);
            calderoLeche.AdicionarCantidad(cantidad: 23);

            ProductoParaVenderDetalle productoParaVenderDetalle =
                new ProductoParaVenderDetalle(calderoLeche, PresentacionBandejaSelloPlus4Onzas);
            productoParaVenderDetalle.SetCantidadNecesaria(cantidad:30);

            PresentacionBandejaSelloPlus4Onzas.AgregarDetalle(productoParaVenderDetalle);
            
            PresentacionBandejaSelloPlus4Onzas.
                AdicionarCantidad(cantidad:7);
            Assert.AreEqual(expected: 1369.5, 
                actual: PresentacionBandejaSelloPlus4Onzas.CostoUnitario);

            Assert.AreEqual(expected: 4, 
                actual: PresentacionBandejaSelloPlus4Onzas.Cantidad);
            Console.WriteLine(PresentacionBandejaSelloPlus4Onzas.PrecioSugeridoDeVenta);
        }
        [Test]
        public void ProbarCreacionDePresentacionSinEnvoltorio()
        {
            Fabricacion = new Fabricacion(TerceroEmpleado);
            Fabricacion.AgregarDetalle(new FabricacionDetalle(Fabricacion, leche, 15));
            Fabricacion.AgregarDetalle(new FabricacionDetalle(Fabricacion, ArinaPan, 1));
            Fabricacion.AgregarDetalle(new FabricacionDetalle(Fabricacion, azucar, 10));

            calderoLeche.AgregarFabricacion(Fabricacion);
            calderoLeche.AdicionarCantidad(cantidad: 23);

            ProductoParaVenderDetalle productoParaVenderDetalle =
                new ProductoParaVenderDetalle(calderoLeche, UnidadesDeLeche);
            productoParaVenderDetalle.SetCantidadNecesaria(cantidad: 5);

            UnidadesDeLeche.AgregarDetalle(productoParaVenderDetalle);

            UnidadesDeLeche.
                AdicionarCantidad(cantidad: 10);

            Assert.AreEqual(expected: 178.25,
                actual: UnidadesDeLeche.CostoUnitario);
            Assert.AreEqual(expected: 10, actual: UnidadesDeLeche.Cantidad);
            Console.WriteLine(UnidadesDeLeche.PrecioSugeridoDeVenta);
        }
    }
}