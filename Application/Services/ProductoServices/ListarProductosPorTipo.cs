using Application.Request;
using Domain.Contracts;
using Domain.Entities.EntitiesProducto;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Application.Services.ProductoServices
{
    public class ListarProductosPorTipo : ListarProductos
    {
        private Type _tipo;
        public ListarProductosPorTipo(IUnitOfWork unitOfWork) : base(unitOfWork)
        {
        }
        public ListarProductosPorTipo EstablecerTipo(Producto producto)
        {
            _tipo = producto.GetType();
            return this;
        }
        public Response Filtrar()
        {
            var filtrado =
            this._unitOfWork.ProductoRepository.GetAll().
                Where(x => x.GetType() == _tipo);
            return new Response
            {
                Data = this.ConvertirProductoARequest(filtrado.ToList())
            };
        }

        public Response GetProductosParaFabricar()
        {
            var filtrado =
            this._unitOfWork.ProductoRepository.
            FindBy(producto => producto.Contestura != Contestura.NoAplica);
            return new Response
            {
                Data = this.ConvertirProductoARequest(filtrado.ToList())
            };
        }
        public Response GetProductosParaVender()
        {
            var filtrado =
            this._unitOfWork.ProductoRepository.
            FindBy(producto => producto.Envoltorio != Envoltorio.NoAplica);
            return new Response
            {
                Data = this.ConvertirProductoARequest(filtrado.ToList())
            };
        }
    }
}
