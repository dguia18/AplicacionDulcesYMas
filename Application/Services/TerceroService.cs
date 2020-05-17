using Application.Request;
using Domain;
using Domain.Contracts;
using Domain.Entities.Tercero;
using System.Collections.Generic;
using System.Linq;

namespace Application.Services
{
    public abstract class TerceroService
    {
        protected readonly IUnitOfWork _unitOfWork;
        protected TerceroService(IUnitOfWork unitOfWork)
        {
            this._unitOfWork = unitOfWork;
        }
    }
    public class BuscarTercero : TerceroService
    {
        public BuscarTercero(IUnitOfWork unitOfWork) : base(unitOfWork)
        {
        }
        public Tercero GetTercero(TerceroRequest request)
        {
            return this._unitOfWork.TerceroRepository.
                FindFirstOrDefault(tercero => tercero.Nit == request.NitTercero);
        }
        public IEnumerable<TerceroRequest> GetTerceros()
        {
            List<TerceroRequest> terceros = new List<TerceroRequest>();
            this._unitOfWork.TerceroRepository.GetAll().ToList().
               ForEach((tercero) =>
               {
                   terceros.Add(new TerceroRequest().Map(tercero));
               });
            return terceros;
        }
    }
    public class TerceroCrear : TerceroService
    {
        public TerceroCrear(IUnitOfWork unitOfWork) : base(unitOfWork)
        {
        }
        public Response SaveTercero(TerceroRequest request)
        {
            Tercero tercero = new BuscarTercero(this._unitOfWork).GetTercero(request);
            if (tercero != null)
            {
                return new Response { Mensaje = $"El nit {request.NitTercero} ya se encuentra registrado" };
            }
            tercero = new Tercero(request.NitTercero, request.RazonSocialTercero);
            request.ContactosTercero.ForEach((contacto) =>
            {
                tercero.Contactos.Add(
                    new Contacto.ContactoBuilder().
                    SetDireccion(contacto.TerceroDireccion).
                    SetEmail(contacto.TerceroEmail).
                    SetNumeroCelular(contacto.TerceroNumeroCelular).Build()
                    ) ;
            });
            this._unitOfWork.TerceroRepository.Add(tercero);
            this._unitOfWork.Commit();
            return new Response
            {
                Mensaje = "Tercero registrado con exito",
                Data = new TerceroRequest().Map(tercero)
            };
        }
    }
}
