using Application;
using Application.Request;
using Infrastructure;
using Infrastructure.Base;
using Microsoft.EntityFrameworkCore;
using NUnit.Framework;

namespace ApplicationTest
{
    public class ProductoTest
    {
        private DulcesYmasContext _context;
        private UnitOfWork _unitOfWork; 
        private ProductoService _productoService;
        [SetUp]
        public void Setup()
        {
            var optionsInMemory = new DbContextOptionsBuilder<DulcesYmasContext>().
                UseInMemoryDatabase("Libranzas").Options;

            _context = new DulcesYmasContext(optionsInMemory);
            _unitOfWork = new UnitOfWork(_context);
        }

        [Test]
        public void CrearProducto()
        {
            
        }
    }
}