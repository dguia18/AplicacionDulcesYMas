using Domain.Repositories;
using System;

namespace Domain.Contracts
{
    public interface IUnitOfWork : IDisposable
    {
        IProductoRepository ProductoRepository { get; }
        ITerceroRepository TerceroRepository { get; }
        ITerceroUsuarioRepository TerceroUsuarioRepository { get; }
        IRoleRepository RoleRepository { get; }
        ITerceroEmpleadoRepository TerceroEmpleadoRepository { get; }
        ITerceroProvedorRepository TerceroProvedorRepository { get; }
        ITerceroClienteRepository TerceroClienteRepository { get; }
        ICompraRepository CompraRepository { get; }
        int Commit();
    }
}
