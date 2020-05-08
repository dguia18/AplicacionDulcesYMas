using System;
using System.Collections.Generic;
using System.Text;

namespace Application.Request
{
    public class TerceroUsuarioRequest
    {
        public string NitTercero { get; set; }
        public string UsuarioTercero { get; set; }
        public string PasswordTercero { get; set; }
    }
    public class TerceroUsuarioResponse
    {
        public string Mensaje { get; set; }

    }
}
