
namespace Domain
{
    public static class FabricacionDetalleCrear
    {
        public static FabricacionDetalle CrearFabricacionDetalle(Fabricacion fabricacion, Producto materiaPrima,double cantidad)
        {
            return new FabricacionDetalle(fabricacion, materiaPrima).SetCantidad(cantidad);
        }
    }
}