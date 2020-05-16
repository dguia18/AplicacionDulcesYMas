using Application.Request;
using Domain.Contracts;
using Domain.Entities.Tercero;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Application.Services
{
    public class TerceroProvedorService
    {
        private readonly IUnitOfWork _unitOfWork;
        public TerceroProvedorService(IUnitOfWork unitOfWork)
        {
            this._unitOfWork = unitOfWork;
        }
        public Response CrearTerceroProveedor(TerceroProvedorRequest request)
        {
            Tercero tercero = this._unitOfWork.TerceroRepository.
                FindFirstOrDefault(tercero => tercero.Nit == request.Tercero.NitTercero);
            if (tercero == null)
            {
                return new Response
                {
                    Mensaje = $"La identificacion {request.Tercero.NitTercero}," +
                    $" no se encuentra registrada hasta el momento"
                };
            }
            TerceroProvedor provedor = this._unitOfWork.TerceroProvedorRepository.
                FindBy(provedor => provedor.Tercero.Nit == request.Tercero.NitTercero,
                includeProperties: "Tercero").FirstOrDefault();
            
            if (provedor != null)
            {
                return new Response
                {
                    Mensaje = $"No se pudo registar el provedor porque ya esta en el sistema"
                };
            }
            provedor = new TerceroProvedor(tercero);
            this._unitOfWork.TerceroProvedorRepository.Add(provedor);
            this._unitOfWork.Commit();
            return new Response
            {
                Mensaje = "Provedor registrado con exito",
                Data = new TerceroProvedorRequest().Map(provedor)
            };
        }
    }
}
