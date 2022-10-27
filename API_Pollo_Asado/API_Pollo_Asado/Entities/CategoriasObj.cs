namespace PROYECTO_API.Entities
{
    public class CategoriasObj
    {
        public string Id_Categoria { get; set; } = string.Empty;
        public string Descripcion { get; set; } = string.Empty;
        public bool Activo { get; set; } = true;
        public DateTime FechaRegistro { get; set; }
    }
}
