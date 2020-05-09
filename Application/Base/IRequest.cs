
namespace Application.Base
{
    public interface IRequest<out T> where T : BaseEntityResponse
    {
        public T ToEntity();
    }
    public abstract class BaseEntityResponse
    {

    }
}
