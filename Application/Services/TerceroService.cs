using Application.Request;
using Domain;
using Domain.Contracts;
using System;
using System.Collections.Generic;
using System.Text;

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
    }
    public class CrearTercero : TerceroService
    {
        public CrearTercero(IUnitOfWork unitOfWork) : base(unitOfWork)
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
            tercero.Contactos = request.ContactosTercero;
            this._unitOfWork.TerceroRepository.Add(tercero);
            this._unitOfWork.Commit();
            return new Response 
            { 
                Mensaje = "Tercero registrado con exito" ,
                Data = new TerceroRequest().Map(tercero)
            };
        }
    }
}
