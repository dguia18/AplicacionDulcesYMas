using Application.Request;
using Domain.Contracts;
using Domain.Entities.EntitiesProducto;
using System.Linq;

namespace Application.Services.ProductoServices
{
    public class ListarProductosPorTipo : ListarProductos
    {
        private Tipo _tipo;
        public ListarProductosPorTipo(IUnitOfWork unitOfWork) : base(unitOfWork)
        {
        }
        public ListarProductosPorTipo EstablecerTipo(Tipo tipo)
        {
            _tipo = tipo;
            return this;
        }
        public Response Filtrar()
        {
            var filtrado =
            this._unitOfWork.ProductoRepository.FindBy(x => x.Tipo == _tipo);                
            if (!filtrado.Any())
            {
                return new Response { Mensaje = $"No hay productos de tipo {_tipo.ToString()}" };
            }
            return new Response
            {
                Data = this.ConvertirProductosARequest(filtrado.ToList())
            };
        }        
    }
}
