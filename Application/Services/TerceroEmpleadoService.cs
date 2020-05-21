using Application.Request;
using Domain;
using Domain.Contracts;
using Domain.Entities.Tercero;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Application.Services
{
    public abstract class TerceroEmpleadoService
    {
        protected readonly IUnitOfWork _unitOfWork;
        protected TerceroEmpleadoService(IUnitOfWork unitOfWork)
        {
            this._unitOfWork = unitOfWork;
        }
    }
    public class TerceroEmpleadoCrear : TerceroEmpleadoService
    {
        public TerceroEmpleadoCrear(IUnitOfWork unitOfWork) : base(unitOfWork)
        {
        }
        public Response Crear(TerceroEmpleadoRequest request)
        {
            Tercero tercero = this._unitOfWork.TerceroRepository.
                FindFirstOrDefault(tercero => tercero.Nit == request.NitTercero);
            if (tercero == null)
            {
                return new Response
                {
                    Mensaje = $"La identificación {request.NitTercero}," +
                    $" no se encuentra registrada hasta el momento"
                };
            }
            TerceroEmpleado empleado = this._unitOfWork.TerceroEmpleadoRepository.
                FindBy(empleado => empleado.Tercero.Nit == request.NitTercero,
                includeProperties: "Tercero").FirstOrDefault();
            if (empleado != null)
            {
                return new Response
                {
                    Mensaje = $"No se pudo registrar el empleado porque ya esta en el sistema"
                };
            }
            empleado = new TerceroEmpleado(tercero);
            this._unitOfWork.TerceroEmpleadoRepository.Add(empleado);
            this._unitOfWork.Commit();
            return new Response
            {
                Mensaje = "Empleado registrado con éxito",
                Data = new TerceroEmpleadoRequest().Map(empleado)
            };
        }
    }
    public class ListarTerceroEmpleado
    {
        private readonly IUnitOfWork unitOfWork;
        public ListarTerceroEmpleado(IUnitOfWork unitOfWork)
        {
            this.unitOfWork = unitOfWork;
        }
        public Response BuscarEmpleado(int id)
        {
            TerceroEmpleado empleado = this.unitOfWork.TerceroEmpleadoRepository.
                FindBy(empleado => empleado.Id == id, includeProperties: "Tercero").FirstOrDefault();

            if (empleado == null)
            {
                return new Response
                {
                    Mensaje = "No se encontró al empleado"
                };
            }
            return new Response
            {
                Data = new TerceroEmpleadoRequest().Map(empleado)
            };
        }
    }
}
