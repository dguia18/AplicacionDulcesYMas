using Domain.Base;

namespace Domain.Entities.Tercero
{
    public class Contacto : Entity<int>
    {
        
        public string Direccion { get; set; }
        public string NumeroCelular { get; set; }
        public string Email { get; set; }
        public Contacto(ContactoBuilder builder)
        {
            this.Direccion = builder.Direccion;
            this.NumeroCelular = builder.NumeroCelular;
            this.Email = builder.Email;
        }
        public Contacto()
        {

        }
        public class ContactoBuilder
        {
            public string Direccion { get; private set; }
            public string NumeroCelular { get; private set; }
            public string Email { get; private set; }
            public ContactoBuilder SetDireccion(string direccion)
            {
                this.Direccion = direccion;
                return this;
            }
            public ContactoBuilder SetNumeroCelular(string celular)
            {
                this.NumeroCelular = celular;
                return this;
            }
            public ContactoBuilder SetEmail(string email)
            {
                this.Email = email;
                return this;
            }
            public Contacto Build()
            {
                Contacto contacto = new Contacto(this);
                return contacto;
            }
        }
    }
}
