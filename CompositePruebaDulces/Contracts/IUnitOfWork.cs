using Domain.Repositories;
using System;

namespace Domain.Contracts
{
    public interface IUnitOfWork : IDisposable
    {
        IProductoRepository ProductoRepository { get; }
        ITerceroRepository TerceroRepository { get; }
        ITerceroUsuarioRepository TerceroUsuarioRepository { get; }
        ITerceroEmpleadoRepository TerceroEmpleadoRepository { get; }
        ITerceroProvedorRepository TerceroProvedorRepository { get; }
        ICompraRepository CompraRepository { get; }
        int Commit();
    }
}
