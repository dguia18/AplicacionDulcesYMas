using Application.Request;
using Domain.Contracts;
using Domain.Entities.Tercero;
using System.Linq;

namespace Application.Services.TercerosServices.ProveedorServices
{
    public class TerceroProveedorCrearService
    {
        private readonly IUnitOfWork _unitOfWork;
        public TerceroProveedorCrearService(IUnitOfWork unitOfWork)
        {
            this._unitOfWork = unitOfWork;
        }
        public Response Crear(TerceroProveedorRequest request)
        {
            TerceroProveedor provedor = this._unitOfWork.TerceroProvedorRepository.
                FindBy(provedor => provedor.Tercero.Nit == request.NitTercero,
                includeProperties: "Tercero").FirstOrDefault();

            if (provedor != null)
            {
                return new Response
                {
                    Mensaje = $"No se pudo registrar el proveedor porque ya está en el sistema"
                };
            }

            Tercero tercero = this._unitOfWork.TerceroRepository.
                FindFirstOrDefault(tercero => tercero.Nit == request.NitTercero);
            if (tercero == null)
            {
                tercero = request.Tercero.UnMap();
            }
            
            provedor = new TerceroProveedor(tercero);
            this._unitOfWork.TerceroProvedorRepository.Add(provedor);
            this._unitOfWork.Commit();
            return new Response
            {
                Mensaje = "Proveedor registrado con éxito",
                Data = new TerceroProveedorRequest().Map(provedor)
            };
        }
    }
}
