using System;
using System.Collections.Generic;
using Domain.Base;

namespace Domain.Entities.Tercero
{
    public class Tercero : Entity<int>
    {
        public string Nit { get; set; }
        public string RazonSocial { get; set; }
        public List<Contacto> Contactos { get; set; }
        public DateTime FechaCreacion { get; set; } = DateTime.Now;
        public List<TerceroUsuario> Usuarios { get; set; }
        public Tercero()
        {
            this.Contactos = new List<Contacto>();
            this.Usuarios = new List<TerceroUsuario>();
        }        
        public Tercero(TerceroBuilder terceroBuilder)
        {
            Nit = terceroBuilder.Nit;
            RazonSocial = terceroBuilder.RazonSocial;
            this.Usuarios = new List<TerceroUsuario>();
            this.Contactos = terceroBuilder.Contactos;
        }
        public Tercero SetContacto(Contacto contacto)
        {
            this.Contactos.Add(contacto);
            return this;
        }


        public class TerceroBuilder
        {
            public int Id { get; private set; }
            public string Nit { get; private set; }
            public string RazonSocial { get; private set; }
            public List<Contacto> Contactos { get; private set; }
            public List<TerceroUsuario> Usuarios { get; private set; }
            public TerceroBuilder(string nit, string razonSocial)
            {
                this.Nit = nit;
                this.RazonSocial = razonSocial;
            }
            public TerceroBuilder SetId(int id)
            {
                this.Id = id;
                return this;
            }
            public TerceroBuilder SetContactos(List<Contacto> contactos)
            {
                this.Contactos = contactos;
                return this;
            }
            public TerceroBuilder SetUsuarios(List<TerceroUsuario> usuarios)
            {
                this.Usuarios = usuarios;
                return this;
            }
            public Tercero Build()
            {
                Tercero tercero = new Tercero(this);
                return tercero;
            }
        }
    }
}
