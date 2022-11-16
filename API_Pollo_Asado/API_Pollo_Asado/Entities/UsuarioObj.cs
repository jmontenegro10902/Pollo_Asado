namespace API_Pollo_Asado.Entities
{
    public class UsuarioObj
    {
        public string Usuario { get; set; } = string.Empty;
        public string Correo { get; set; } = string.Empty;
        public string Contrasena { get; set; } = string.Empty;
        public string Nombre { get; set; } = string.Empty;
        public string Apellidos { get; set; } = string.Empty;
        public string Cedula { get; set; } = string.Empty;
        public bool Activo { get; set; }
        public bool CambioContrasenna { get; set; } 
        public string idRol { get; set; } = string.Empty;
        public string Token { get; set; } = string.Empty;
    }
}


