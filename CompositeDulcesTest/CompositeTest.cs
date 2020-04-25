using NUnit.Framework;
using Domain;
namespace DomainTest
{
    public class Tests
    {
        [SetUp]
        public void Setup()
        {
        }

        [Test]
        public void Test1()
        {
            MateriaPrima leche = new MateriaPrima("leche", 1500, 15, "Litros");
            leche.Preparar();
            MateriaPrima azucar = new MateriaPrima("Azucar", 1800, 17, "Libras");
            azucar.Preparar();
            MateriaPrima ArinaPan = new MateriaPrima("Arina Pan", 1300, 0.5, "Libras");
            ArinaPan.Preparar();
            Producto dulceLeche = new Producto("Dulce de Leche");
            dulceLeche.Agregar(leche);
            dulceLeche.Agregar(azucar);
            dulceLeche.Agregar(ArinaPan);
            dulceLeche.Preparar();
            dulceLeche.Cantidad = 26;
            dulceLeche.CostoHechura = 15000;
            System.Console.WriteLine("Costo: "+dulceLeche.GetCosto());
            System.Console.WriteLine("Costo unitaro: "+dulceLeche.CostoUnitaro);
            MateriaPrima BandejaSelloPlus4Onzas = new MateriaPrima("Bandeja de Sello Plus de 8 Onzas", 300, 1, "Onza");
            BandejaSelloPlus4Onzas.Preparar();
            Producto PresentacionBandejaSelloPlus4Onzas = new Producto("Presentacion de Bandeja Sello Plus 4 Onzas");
            PresentacionBandejaSelloPlus4Onzas.Agregar(dulceLeche);
        }
    }
}