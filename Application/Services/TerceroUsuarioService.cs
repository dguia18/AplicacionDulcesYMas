using Application.Request;
using Domain;
using Domain.Contracts;
using Domain.Entities;
using System;
using System.Collections.Generic;
using System.Linq;

namespace Application.Services
{
    public abstract class TerceroUsuarioService
    {
        protected IUnitOfWork _unitOfWork;
        protected TerceroUsuarioService(IUnitOfWork unitOfWork)
        {
            this._unitOfWork = unitOfWork;
        }        
    }
    public class ValidarUsuario : TerceroUsuarioService
    {
        public ValidarUsuario(IUnitOfWork unitOfWork) : base(unitOfWork)
        {
        }

        public TerceroUsuario ValidarTerceroUsuario(TerceroUsuarioRequest request)
        {
            return this._unitOfWork.TerceroUsuarioRepository.
                FindBy(usuario => request.UsuarioTercero == usuario.Usuario && 
                usuario.Password == request.PasswordTercero,includeProperties:"Tercero").FirstOrDefault();
        }
    }
    public class CrearUsuario : TerceroUsuarioService
    {
        public CrearUsuario(IUnitOfWork unitOfWork) : base(unitOfWork)
        {
        }
        public Response SaveUsuario(TerceroUsuarioRequest request)
        {
            Tercero tercero = this._unitOfWork.TerceroRepository.
                FindFirstOrDefault(tercero => tercero.Nit == request.NitTercero);
            if(tercero == null)
            {
                return new Response { Mensaje = $"El nit {request.NitTercero} no se encuentra registrado" }; 
            }
            var usuario = new ValidarUsuario(this._unitOfWork).ValidarTerceroUsuario(request);
            if (usuario != null)
            {
                return new Response { Mensaje = "Usuario ya se encuentra registrado" };
            }
            TerceroUsuario terceroUsuario = new TerceroUsuario(tercero);
            terceroUsuario.Password = request.PasswordTercero;
            terceroUsuario.Usuario = request.UsuarioTercero;    
            this._unitOfWork.TerceroUsuarioRepository.Add(terceroUsuario);
            this._unitOfWork.Commit();
            return new Response { Mensaje = "Usuario registrado con exito" };

        }
    }
}
