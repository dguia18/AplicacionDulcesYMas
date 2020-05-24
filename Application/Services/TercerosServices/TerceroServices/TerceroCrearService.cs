
using Application.Request;
using Domain.Contracts;
using Domain.Entities.Tercero;

namespace Application.Services.TercerosServices.TerceroServices
{
    public class TerceroCrearService
    {
        protected readonly IUnitOfWork _unitOfWork;
        public TerceroCrearService(IUnitOfWork unitOfWork)
        {
            this._unitOfWork = unitOfWork;
        }
        public Response CrearTercero(TerceroRequest request)
        {
            Tercero tercero = this._unitOfWork.TerceroRepository.
                FindFirstOrDefault(tercero => tercero.Nit == request.NitTercero);

            if (tercero != null)
            {
                return new Response { Mensaje = $"El nit {request.NitTercero} ya se encuentra registrado" };
            }
            tercero = new Tercero.TerceroBuilder(request.NitTercero, request.RazonSocialTercero).Build();
            request.ContactosTercero.ForEach((contacto) =>
            {
                tercero.Contactos.Add(
                    new Contacto.ContactoBuilder().
                    SetDireccion(contacto.TerceroDireccion).
                    SetEmail(contacto.TerceroEmail).
                    SetNumeroCelular(contacto.TerceroNumeroCelular).Build()
                    );
            });
            this._unitOfWork.TerceroRepository.Add(tercero);
            this._unitOfWork.Commit();
            return new Response
            {
                Mensaje = "Tercero registrado con éxito",
                Data = new TerceroRequest().Map(tercero)
            };
        }
    }
}
