using System;

namespace Domain
{
    public static class FabricacionDetalleCrear
    {
        public static FabricacionDetalle CrearFabricacionDetalle(Fabricacion fabricacion, Producto materiaPrima)
        {
            return new FabricacionDetalle(fabricacion, materiaPrima);
        }
    }
}