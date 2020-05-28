
using Application.Request;
using Application.Services.ProductoServices;

namespace ApplicationTest.Utils
{
    public class Utilities
    {
        public Response CrearProducto(ProductoRequest request, ProductoService service)
        {
            return service.Crear(request);
        } 
    }
}
