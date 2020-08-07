
using Domain.Base;
using System;
using System.ComponentModel.DataAnnotations.Schema;

namespace Domain.Entities
{
    public class Transaccion : Entity<int>
    {
        [Column(TypeName ="decimal(7,2)")]
        public decimal Monto { get; set; }
        public TipoDeTransaccion TipoDeTransaccion { get; set; }
        public Concepto Concepto { get; set; }
        public string Descripcion { get; set; }
        public DateTime Fecha { get; set; } = DateTime.Now;
        public Transaccion()
        {

        }
        public Transaccion(TipoDeTransaccion tipoDeTransaccion, Concepto concepto,
            decimal monto)
        {
            this.TipoDeTransaccion = tipoDeTransaccion;
            this.Concepto = concepto;
            this.Monto = monto;
        }
    }
    public enum TipoDeTransaccion
    {
        Egreso,
        Ingreso
    }
    public enum Concepto
    {
        PagoDeServicios,
        VentaDeProductos,
        CompraDeMateriasPrimas
    }
}
