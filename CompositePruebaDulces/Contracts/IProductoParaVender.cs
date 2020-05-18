using Domain.Entities.EntitiesProducto;

namespace Domain.Contracts
{
    public interface IProductoParaVender
    {
        void AgregarDetalle(ProductoParaVenderDetalle productoParaVenderDetalle);
    }
}