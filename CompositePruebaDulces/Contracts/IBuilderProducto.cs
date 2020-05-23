using Domain.Entities.EntitiesProducto;

namespace Domain.Contracts
{
    public interface IBuilderProducto : IGenericBuilderProducto<Producto>
    {
    }public interface IBuilderProductoMateriaPrima : IGenericBuilderProducto<ProductoMateriaPrima>
    {
    }public interface IBuilderProductoParaVenderSinEnvoltorio : IGenericBuilderProducto<ProductoParaVenderSinEnvoltorio>
    {
    }public interface IBuilderProductoParaVenderConEnvoltorio : IGenericBuilderProducto<ProductoParaVenderConEnvoltorio>
    {
    }public interface IBuilderProductoParaFabricarSuave : IGenericBuilderProducto<ProductoParaFabricarSuave>
    {
    }public interface IBuilderProductoParaFabricarDuro : IGenericBuilderProducto<ProductoParaFabricarDuro>
    {
    }
}
