using Domain.Entities;

namespace Application.Request
{
    public class TerceroUsuarioRequest
    {
        public string NitTercero { get; set; }
        public string UsuarioTercero { get; set; }
        public string PasswordTercero { get; set; }
        public TerceroUsuarioRequest()
        {

        }
        public TerceroUsuarioRequest Map(TerceroUsuario usuario)
        {
            NitTercero = usuario.Tercero.Nit;
            UsuarioTercero = usuario.Usuario;
            PasswordTercero = usuario.Password;
            return this;
        }
    }
    public class TerceroUsuarioResponse
    {
        public string Mensaje { get; set; }

    }
}
