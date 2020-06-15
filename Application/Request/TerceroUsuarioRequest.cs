using Application.Base;
using Domain.Entities.Tercero;
using System;

namespace Application.Request
{
    public class TerceroUsuarioRequest : Request<int>
    {
        public string NitTercero { get; set; }
        private string _usuarioTercero;
        public string UsuarioTercero { get => _usuarioTercero; set => _usuarioTercero = value.ToLower(); }
        public string PasswordTercero { get; set; }
        public RoleRequest Role { get; set; }

        public DateTime FechaCreacion { get; set; }
        public TerceroUsuarioRequest()
        {

        }

        public TerceroUsuarioRequest(TerceroUsuarioRequestBuilder terceroUsuarioBuilder)
        {
            this.NitTercero = terceroUsuarioBuilder.NitTercero;
            this.UsuarioTercero = terceroUsuarioBuilder.UsuarioTercero;
            this.PasswordTercero = terceroUsuarioBuilder.PasswordTercero;
            this.Role = terceroUsuarioBuilder.Role;
            this.Id = terceroUsuarioBuilder.Id;
        }

        public TerceroUsuarioRequest Map(TerceroUsuario usuario)
        {
            this.Id = usuario.Id;
            this.FechaCreacion = usuario.FechaCreacion;
            NitTercero = usuario.Tercero.Nit;
            UsuarioTercero = usuario.Usuario;
            PasswordTercero = usuario.Password;            
            this.Role = new RoleRequest().Map(usuario.Role);
            return this;
        }

        public class TerceroUsuarioRequestBuilder
        {
            public int Id { get; set; }
            public string NitTercero { get; private set; }
            public string UsuarioTercero { get; private set; }
            public string PasswordTercero { get; private set; }
            public RoleRequest Role { get; private set; }
            public TerceroUsuarioRequestBuilder(TerceroRequest terceroDuvan)
            {
                this.NitTercero = terceroDuvan.NitTercero;
            }

            public TerceroUsuarioRequestBuilder SetUsuario(string usuario)
            {
                this.UsuarioTercero = usuario;
                return this;
            }
            public TerceroUsuarioRequestBuilder SetPassword(string password)
            {
                this.PasswordTercero = password;
                return this;
            }
            public TerceroUsuarioRequestBuilder SetRole(RoleRequest role)
            {
                this.Role = role;
                return this;
            }
            public TerceroUsuarioRequestBuilder SetId(int id)
            {
                this.Id = id;
                return this;
            }
            public TerceroUsuarioRequest Build()
            {
                TerceroUsuarioRequest usuario = new TerceroUsuarioRequest(this);
                return usuario;
            }
        }
    }
    public class RoleRequest : Request<int>
    {
        private string _nombre;

        public string Nombre
        {
            get { return _nombre; }
            set { _nombre = value.ToLower(); }
        }

        internal RoleRequest Map(Role role)
        {
            this.Id = role.Id;
            this.Nombre = role.Nombre;
            return this;
        }
    }
}
