using Application.Request;
using Application.Services;
using Domain;
using Domain.Contracts;
using Domain.Entities;
using Domain.Entities.Tercero;
using System;
using System.Collections.Generic;
using System.Linq;

namespace Application
{
    public abstract class ProductoService
    {
        protected IUnitOfWork _unitOfWork;
        protected ProductoService(IUnitOfWork unitOfWork)
        {
            this._unitOfWork = unitOfWork;
        }
        protected IEnumerable<Producto> GetProductos()
        {
            return this._unitOfWork.ProductoRepository.
                FindBy();
        }
        protected ProductoRequest Map(Producto producto)
        {
            ProductoRequest request = new ProductoRequest();
            return request.Map(producto);
        }       
        public abstract Response CrearProducto(ProductoRequest request);
    }
    public class CrearProductoMateriaPrima : ProductoService
    {
        public CrearProductoMateriaPrima(IUnitOfWork unitOfWork) : base(unitOfWork)
        {
        }

        public override Response CrearProducto(ProductoRequest request)
        {

            var errores = ProductoPuedeCrear.PuedeCrearProducto
                (request.CantidadProducto,
                request.CostoUnitarioProducto);

            if (errores.Any())
                return new Response { Mensaje = String.Join(", ", errores) };

            Producto producto = this._unitOfWork.ProductoRepository.
                FindFirstOrDefault(t => t.Nombre == request.NombreProducto);

            if (producto != null)
                return new Response { Mensaje = "El producto ya existe" };

            producto = new ProductoMateriaPrima(request.NombreProducto,
                request.CantidadProducto, request.CostoUnitarioProducto,
                request.UnidadDeMedidaProducto);

            this._unitOfWork.ProductoRepository.Add(producto);
            this._unitOfWork.Commit();
            return new Response
            {
                Mensaje = "Producto registrado con éxito",
                Data = new ProductoRequest().Map(producto)
            };
        }

    }
    public class CrearProductoParaFabricar : ProductoService
    {
        public CrearProductoParaFabricar(IUnitOfWork unitOfWork) : base(unitOfWork)
        {
        }
        public override Response CrearProducto(ProductoRequest request)
        {
            var errores = ProductoPuedeCrear.PuedeCrearProducto
                (request.CantidadProducto,
                request.CostoUnitarioProducto);

            if (errores.Any())
                return new Response { Mensaje = String.Join(", ", errores) };

            Producto producto = this._unitOfWork.ProductoRepository.
                FindFirstOrDefault(t => t.Nombre == request.NombreProducto);

            if (producto != null)
                return new Response { Mensaje = "El producto ya existe" };

            if (request.Contestura == Contestura.Duro)
            {
                producto = new ProductoParaFabricarDuro(request.NombreProducto,
                request.CantidadProducto, request.CostoUnitarioProducto);
            }
            else
            {
                producto = new ProductoParaFabricarSuave(request.NombreProducto,
                request.CantidadProducto, request.CostoUnitarioProducto);
            }

            this._unitOfWork.ProductoRepository.Add(producto);
            this._unitOfWork.Commit();
            return new Response
            {
                Mensaje = "Producto registrado con éxito",
                Data = new ProductoRequest().Map(producto)
            };
        }
    }
    public class CrearProductoParaVender : ProductoService
    {
        public CrearProductoParaVender(IUnitOfWork unitOfWork) : base(unitOfWork)
        {
        }
        public override Response CrearProducto(ProductoRequest request)
        {
            var errores = ProductoPuedeCrear.PuedeCrearProducto
                (request.CantidadProducto,
                request.CostoUnitarioProducto);

            if (errores.Any())
                return new Response { Mensaje = String.Join(", ", errores) };

            Producto producto = this._unitOfWork.ProductoRepository.
                FindFirstOrDefault(t => t.Nombre == request.NombreProducto);

            if (producto != null)
                return new Response { Mensaje = "El producto ya existe" };

            if (request.Envoltorio == Envoltorio.TieneEnvoltorio)
            {
                producto = new ProductoParaVenderConEnvoltorio(request.NombreProducto,
                request.CantidadProducto, request.CostoUnitarioProducto,
                request.UnidadDeMedidaProducto);
            }
            else
            {
                producto = new ProductoParaVenderSinEnvoltorio(request.NombreProducto,
                request.CantidadProducto, request.CostoUnitarioProducto,
                request.UnidadDeMedidaProducto);
            }

            this._unitOfWork.ProductoRepository.Add(producto);
            this._unitOfWork.Commit();
            return new Response
            {
                Mensaje = "Producto registrado con éxito",
                Data = new ProductoRequest().Map(producto)
            };
        }

    }
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

            if (productoParaFabricar.Contestura == Contestura.NoAplica)
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
            if (request.FabricacionDetallesRequest.Count == 0)
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
                request.FabricacionDetallesRequest.Count)
            {
                if (temp == null)
                {
                    return new Response
                    {
                        Mensaje = "El " +
                        $"{request.FabricacionDetallesRequest[fabricacion.FabricacionDetalles.Count].NombreMateriaPrima}" +
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
                Data = new FabricacionRequest().Map(fabricacion)
            };
        }

        private Producto ComprobarExistenciasDeEnMateriasPrimas(FabricacionRequest request,
            Fabricacion fabricacion, Producto temp)
        {
            foreach (FabricacionDetalleRequest detalle in request.FabricacionDetallesRequest)
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
    public class ListarProductos

    {
        protected readonly IUnitOfWork _unitOfWork;
        public ListarProductos(IUnitOfWork unitOfWork) 
        {
            this._unitOfWork = unitOfWork;
        }
        protected List<ProductoRequest> ConvertirProductoARequest(List<Producto> productos)
        {
            List<ProductoRequest> request = new List<ProductoRequest>();
            productos.ForEach(x => request.Add(new ProductoRequest().Map(x)));
            return request;
        }       

        public Response GetAllProductos()
        {
            Response productoResponse = new Response();
            productoResponse.Data = ConvertirProductoARequest(
                this._unitOfWork.ProductoRepository.GetAll().ToList());
            return productoResponse;
        }
        public Response BuscarProducto(int id)
        {
            Producto producto = this._unitOfWork.ProductoRepository.
                FindFirstOrDefault(producto => producto.Id == id);
            if (producto == null)
            {
                return new Response { Mensaje = $"El producto con Id {id}, no fue encontrado" };
            }
            return new Response
            {
                Data = new ProductoRequest().Map(producto)
            };
        }
        public Response BuscarFabricaionesDeProducto(int id)
        {
            Producto producto = this._unitOfWork.ProductoRepository.
                FindBy(producto => producto.Id == id, 
                includeProperties: "Fabricaciones.TerceroEmpleado.Tercero").
                FirstOrDefault();
            if (producto == null)
            {
                return new Response { Mensaje = $"El producto con Id {id}, no fue encontrado" };
            }

            if (producto.Contestura == Contestura.NoAplica)
            {
                return new Response
                {
                    Mensaje = $"El producto {producto.Nombre} no tiene " +
                    $"fabricaiones porque no se puede fabricar"
                };
            }
            return new Response
            {
                Data = new ProductoRequest().Map(producto)
            };
        }
    }
    public class ListarProductosPorTipo : ListarProductos
    {
        private Type _tipo;
        public ListarProductosPorTipo(IUnitOfWork unitOfWork) : base(unitOfWork)
        {
        }
        public ListarProductosPorTipo EstablecerTipo(Producto producto)
        {
            _tipo = producto.GetType();
            return this;
        }
        public Response Filtrar()
        {
            var filtrado =
            this._unitOfWork.ProductoRepository.GetAll().
                Where(x => x.GetType() == _tipo);
            return new Response
            {
                Data = this.ConvertirProductoARequest(filtrado.ToList())
            };
        }

        public Response GetProductosParaFabricar()
        {
            var filtrado =
            this._unitOfWork.ProductoRepository.
            FindBy(producto => producto.Contestura != Contestura.NoAplica);
            return new Response
            {
                Data = this.ConvertirProductoARequest(filtrado.ToList())
            };
        }
        public Response GetProductosParaVender()
        {
            var filtrado =
            this._unitOfWork.ProductoRepository.
            FindBy(producto => producto.Envoltorio != Envoltorio.NoAplica);
            return new Response
            {
                Data = this.ConvertirProductoARequest(filtrado.ToList())
            };
        }
    }

}
