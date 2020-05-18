using Application.Base;
using Domain.Entities;
using Domain.Entities.Tercero;
using System;

namespace Application.Request
{
    public class TerceroUsuarioRequest : Request<int>
    {
        public string NitTercero { get; set; }
        private string _usuarioTercero;
        public string UsuarioTercero { get => _usuarioTercero; set => _usuarioTercero = value.ToUpper(); }
        public string PasswordTercero { get; set; }
        public DateTime FechaCreacion { get; set; }
        public TerceroUsuarioRequest()
        {

        }

        public TerceroUsuarioRequest(TerceroUsuarioBuilder terceroUsuarioBuilder)
        {
            this.NitTercero = terceroUsuarioBuilder.NitTercero;
            this.UsuarioTercero = terceroUsuarioBuilder.UsuarioTercero;
            this.PasswordTercero = terceroUsuarioBuilder.PasswordTercero;
        }

        public TerceroUsuarioRequest Map(TerceroUsuario usuario)
        {
            this.Id = usuario.Id;
            this.FechaCreacion = usuario.FechaCreacion;
            NitTercero = usuario.Tercero.Nit;
            UsuarioTercero = usuario.Usuario;
            PasswordTercero = usuario.Password;
            return this;
        }

        public class TerceroUsuarioBuilder
        {
            public string NitTercero { get; private set; }
            public string UsuarioTercero { get; private set; }
            public string PasswordTercero { get; private set; }
            public TerceroUsuarioBuilder(TerceroRequest terceroDuvan)
            {
                this.NitTercero = terceroDuvan.NitTercero;
            }

            public TerceroUsuarioBuilder SetUsuario(string usuario)
            {
                this.UsuarioTercero = usuario;
                return this;
            }
            public TerceroUsuarioBuilder SetPassword(string password)
            {
                this.PasswordTercero = password;
                return this;
            }
            public TerceroUsuarioRequest Build()
            {
                TerceroUsuarioRequest usuario = new TerceroUsuarioRequest(this);
                return usuario;
            }
        }
    }
    public class RolRequest
    {
        public string Nombre { get; set; }
    }
}
