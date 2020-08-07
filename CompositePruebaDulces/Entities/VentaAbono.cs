using Domain.Base;
using System;
using System.ComponentModel.DataAnnotations.Schema;

namespace Domain.Entities
{
    public class VentaAbono : Entity<int>
    {
        [Column(TypeName = "decimal(7,2)")]
        public decimal Valor { get; set; }
        public Venta Venta { get; set; }
        public DateTime FechaAbono { get; set; }
        public VentaAbono(VentaAbonoBuilder ventaAbonoBuilder)
        {
            this.Valor = ventaAbonoBuilder.Valor;
            this.Venta = ventaAbonoBuilder.Venta;
            this.FechaAbono = DateTime.Now;
        }
        private VentaAbono()
        {

        }
        public class VentaAbonoBuilder
        {
            public decimal Valor { get; private set; }
            public Venta Venta { get; private set; }
            public VentaAbonoBuilder(Venta venta, decimal valor)
            {
                this.Venta = venta;
                this.Valor = valor;
            }
            public VentaAbono Build()
            {
                ValidarValorDelAbono();
                VentaAbono abono = new VentaAbono(this);
                return abono;
            }

            private void ValidarValorDelAbono()
            {
                if (Valor > Venta.Pendiente)
                {
                    throw new InvalidOperationException($"El valor a abonar es " +
                        $"superior al pendiente de {Venta.Pendiente}");
                }
                if (Valor < 0)
                {
                    throw new InvalidOperationException("El valor a abonar es invalido");
                }
            }
        }
    }    
}