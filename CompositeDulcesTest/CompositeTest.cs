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
            Producto dulceLeche = new Producto("Dulce de Leche",6000);
            dulceLeche.Agregar(leche);
            dulceLeche.Agregar(azucar);
            dulceLeche.Agregar(ArinaPan);
            dulceLeche.Preparar();
            System.Console.WriteLine("Costo: "+dulceLeche.GetCosto());
        }
    }
}