using Application.Request;
using Domain.Contracts;
using Domain.Entities;
using Domain.Entities.EntitiesProducto;
using Domain.Entities.Tercero;
using System.Collections.Generic;
using System.Linq;

namespace Application.Services.ProductoServices
{
    public class FabricacionCrearService
    {
        private readonly IUnitOfWork _unitOfWork;
        public FabricacionCrearService(IUnitOfWork unitOfWork)
        {
            this._unitOfWork = unitOfWork;
        }

        public Response IniciarFabricacion(FabricacionRequest request)
        {
            Producto productoParaFabricar =
             this._unitOfWork.ProductoRepository.
                FindBy(producto => producto.Id == request.IdProducto,
                includeProperties: "Fabricaciones").FirstOrDefault();

            if (productoParaFabricar == null)
            {
                return new Response
                {
                    Mensaje = "El producto para fabricar no existe, agréguelo"
                };
            }

            if (productoParaFabricar.Especificacion == Especificacion.MateriaPrima)
            {
                return new Response
                {
                    Mensaje = $"El {productoParaFabricar.Nombre} no se puede fabricar"
                };
            }

            TerceroEmpleado empleado = this._unitOfWork.TerceroEmpleadoRepository.
                FindBy(empleado => empleado.Tercero.Nit == request.NitEmpleado,
                includeProperties: "Tercero").FirstOrDefault();

            if (empleado == null)
            {
                return new Response
                {
                    Mensaje = $"No hay un empleado con identificación {request.NitEmpleado}"
                };
            }
            if (request.Detalles.Count == 0)
            {
                return new Response
                {
                    Mensaje = $"Por favor, agregue materias primas " +
                    $"para fabricar el {productoParaFabricar.Nombre}"
                };
            }
            Fabricacion fabricacion = new Fabricacion(empleado);
            productoParaFabricar.AgregarFabricacion(fabricacion);

            

            Producto temp = null;
            temp = ComprobarExistenciasDeEnMateriasPrimas(request, fabricacion, temp);

            if (fabricacion.FabricacionDetalles.Count !=
                request.Detalles.Count)
            {
                if (temp == null)
                {
                    return new Response
                    {
                        Mensaje = "El " +
                        $"{request.Detalles[fabricacion.FabricacionDetalles.Count].NombreMateriaPrima}" +
                        " no se encuentra en el sistema, agréguelo"
                    };
                }
                return new Response
                {
                    Mensaje = $"No hay cantidades suficientes de {temp.Nombre}, " +
                    $"solo hay {temp.Cantidad}"
                };

            }
            fabricacion.DescontarCantidadesEnMateriasPrimas();
            this._unitOfWork.ProductoRepository.Edit(productoParaFabricar);
            this._unitOfWork.Commit();
            return new Response
            {
                Mensaje = "Fabricacion realizada con éxito, a espera de definir la cantidad producida",
                Data = request.Map(fabricacion)
            };
        }

        private Producto ComprobarExistenciasDeEnMateriasPrimas(FabricacionRequest request,
            Fabricacion fabricacion, Producto temp)
        {
            foreach (FabricacionDetalleRequest detalle in request.Detalles)
            {
                Producto productoMateriaPrima =
                    this._unitOfWork.ProductoRepository.
                    FindFirstOrDefault(producto => producto.Nombre == detalle.NombreMateriaPrima);
                if (productoMateriaPrima == null)
                {
                    break;
                }
                else if (productoMateriaPrima.
                    PuedeDescontarCantidad(detalle.CantidadMateriaPrima).Any())
                {
                    temp = productoMateriaPrima;
                    break;
                }
                fabricacion.
                AgregarDetalle(new FabricacionDetalle(fabricacion, productoMateriaPrima,
                detalle.CantidadMateriaPrima));
            }

            return temp;
        }
    }
}
