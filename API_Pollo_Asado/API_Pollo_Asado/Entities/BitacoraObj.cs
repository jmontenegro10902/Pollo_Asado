namespace PROYECTO_API.Entities
{
    public class BitacoraObj
    {
        public long IdError { get; set; } 
        public string Usuario { get; set; } = string.Empty;
        public DateTime Fecha { get; set; } 
        public int Codigo { get; set; } 
        public string Mensaje { get; set; } = string.Empty;
        public string Accion { get; set; } = string.Empty;
    }
}
