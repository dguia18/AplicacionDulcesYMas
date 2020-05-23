
using Domain.Base;
using System.Collections.Generic;

namespace Domain.Entities.Tercero
{
    public class TerceroCliente : Entity<int>
    {
        public Tercero Tercero { get; set; }
        public List<PrecioCliente> ListaDePrecios { get; set; }
        public TerceroCliente(TerceroClienteBuilder terceroClienteBuilder)
        {
            this.Tercero = terceroClienteBuilder.Tercero;
        }
        public void AddPrecio(PrecioCliente precio)
        {
            ListaDePrecios.Add(precio);
        }
        public class TerceroClienteBuilder
        {
            public Tercero Tercero { get; private set; }
            public TerceroClienteBuilder(Tercero tercero)
            {
                this.Tercero = tercero;
            }
            public TerceroCliente Build()
            {
                TerceroCliente cliente = new TerceroCliente(this);
                return cliente;
            }
        }
    }
}
