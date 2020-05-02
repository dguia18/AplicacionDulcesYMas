using NUnit.Framework;
using Domain;
using System.Collections.Generic;
using System;

namespace DomainTest
{
    public class Tests
    {
        Administrador Administrador;
        ProductoMateriaPrima leche;
        ProductoMateriaPrima azucar;
        ProductoMateriaPrima ArinaPan;
        ProductoMateriaPrima BandejaSelloPlus4Onzas;
        ProductoParaFabricar calderoLeche;
        ProductoParaVender PresentacionBandejaSelloPlus4Onzas;
        Tercero tercero;
        TerceroEmpleado TerceroEmpleado;
        Fabricacion Fabricacion;
        List<ProductoMateriaPrima> materiasPrimas;
        [SetUp]
        public void Setup()
        {
            leche = new ProductoMateriaPrima("leche", 15, 1500 , "Litros");

            azucar = new ProductoMateriaPrima("Azucar", 17, 1800, "Libras");

            ArinaPan = new ProductoMateriaPrima("Arina Pan", 0.5 , 1300, "Libras");

            calderoLeche = new ProductoParaFabricar("Caldero de Leche");           

            BandejaSelloPlus4Onzas =
                new ProductoMateriaPrima("Bandeja de Sello Plus de 4 Onzas", 300, 1, "Onza");
            BandejaSelloPlus4Onzas.Cantidad = 4;

            PresentacionBandejaSelloPlus4Onzas =
                new ProductoParaVender("Presentacion de Bandeja Sello Plus 4 Onzas");

            tercero = new Tercero("Duvan", "1065840833");
            TerceroEmpleado = new TerceroEmpleado(tercero);
            Fabricacion = new Fabricacion(TerceroEmpleado);
            Administrador = new Administrador(tercero);
            Administrador.Productos.Add(leche);


            materiasPrimas = new List<ProductoMateriaPrima>();
            materiasPrimas.Add(leche);
            materiasPrimas.Add(ArinaPan);
            materiasPrimas.Add(azucar);
        }

        [Test]
        public void ProbarCostoDelaPrimeraFabricacion()
        {
            calderoLeche.Preparar(terceroEmpleado: TerceroEmpleado, 
                materiasPrimas: materiasPrimas);
            calderoLeche.AdicionarCantidad(26);
            Assert.AreEqual(2067.31, calderoLeche.CostoUnitario);
        }

        [Test]
        public void ProbarCostoLuegoDeLaPrimeraPreparacion()
        {
            calderoLeche.Preparar(terceroEmpleado: TerceroEmpleado,
                materiasPrimas: materiasPrimas);
            calderoLeche.AdicionarCantidad(26);
            
            List<ProductoMateriaPrima> productoMateriaPrimas = new List<ProductoMateriaPrima>();
            leche.Cantidad = 35;
            productoMateriaPrimas.Add(leche);
            productoMateriaPrimas.Add(ArinaPan);
            azucar.Cantidad = 30;
            productoMateriaPrimas.Add(azucar);
            calderoLeche.Preparar(terceroEmpleado: TerceroEmpleado,
                materiasPrimas: productoMateriaPrimas);
            calderoLeche.AdicionarCantidad(35);
            Assert.AreEqual(2564.37, calderoLeche.CostoUnitario);
            Assert.AreEqual(61, calderoLeche.Cantidad);
        }

    }
}