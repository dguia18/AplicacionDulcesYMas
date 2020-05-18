
namespace Application.Base
{
    public abstract class BaseRequest
    {

    }
    public abstract class Request<T> : BaseRequest, IRequest<T> 
    {
        public virtual T Id { get ; set ; }
    }
}
