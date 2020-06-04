
using Application.Request;

namespace Application.Services.TercerosServices.Contracts
{
    public interface IGetPaginados
    {
        Response GetPaginados(PaginationRequest request);
    }
}
