using Domain.Repositories;
using System;
using System.Collections.Generic;
using System.Text;

namespace Domain.Contracts
{
    public interface IUnitOfWork : IDisposable
    {
        IProductoRepository ProductoRepository { get; }
        int Commit();
    }
}
