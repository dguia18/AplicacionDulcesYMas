using Domain.Entities;

namespace Domain
{
    public interface IProductoParaFabricar
    {
        void AgregarFabricacion(Fabricacion fabricacion);
    }
}