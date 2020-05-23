using Domain.Base;
using System;


namespace Domain.Entities.Tercero
{
    public class TerceroUsuario : Entity<int>
    {
        public Tercero Tercero { get; set; }
        public string Usuario { get; set; }
        public string Password { get; set; }
        public Rol Rol { get; set; }
        public DateTime FechaCreacion { get; set; } = DateTime.Now;
        public TerceroUsuario(Tercero tercero)
        {
            this.Tercero = tercero;
        }
        public TerceroUsuario()
        {

        }

        public TerceroUsuario(TerceroUsuarioBuilder terceroUsuarioBuilder)
        {
            this.Tercero = terceroUsuarioBuilder.Tercero;
            this.Usuario = terceroUsuarioBuilder.Usuario;
            this.Password = terceroUsuarioBuilder.Password;
            this.Rol = terceroUsuarioBuilder.Rol;
        }

        public class TerceroUsuarioBuilder
        {
            public Tercero Tercero { get; private set; }
            public string Usuario { get; private set; }
            public string Password { get; private set; }
            public Rol Rol { get; private set; }

            public TerceroUsuarioBuilder(Tercero tercero)
            {
                this.Tercero = tercero;
            }
            public TerceroUsuarioBuilder SetUsuario(string usuario)
            {
                this.Usuario = usuario;
                return this;
            }
            public TerceroUsuarioBuilder SetPassword(string password)
            {
                this.Password = password;
                return this;
            }
            public TerceroUsuarioBuilder SetRol(Rol rol)
            {
                this.Rol = rol;
                return this;
            }
            public TerceroUsuario Build()
            {
                TerceroUsuario usuario = new TerceroUsuario(this);
                return usuario;
            }
        }
    }
}
