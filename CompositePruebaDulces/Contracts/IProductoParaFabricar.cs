using Domain.Entities;

namespace Domain.Contracts
{
    public interface IProductoParaFabricar
    {
        void AgregarFabricacion(Fabricacion fabricacion);
    }
}