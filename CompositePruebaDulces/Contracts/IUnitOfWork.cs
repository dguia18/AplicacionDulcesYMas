using Domain.Repositories;
using System;

namespace Domain.Contracts
{
    public interface IUnitOfWork : IDisposable
    {
        IProductoRepository ProductoRepository { get; }
        ICategoriaRepository CategoriaRepository { get; }
        ISubCategoriaRepository SubCategoriaRepository { get; }
        ITerceroRepository TerceroRepository { get; }
        ITerceroUsuarioRepository TerceroUsuarioRepository { get; }
        IRoleRepository RoleRepository { get; }
        ITerceroEmpleadoRepository TerceroEmpleadoRepository { get; }
        ITerceroProvedorRepository TerceroProvedorRepository { get; }
        ITerceroClienteRepository TerceroClienteRepository { get; }
        ICompraRepository CompraRepository { get; }
        ITransaccionRepository TransaccionRepository { get; }
        int Commit();
    }
}
