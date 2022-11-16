namespace API_Pollo_Asado.Entities
{
    public class CategoriaObj
    {
        public string Id_Categoria { get; set; } = string.Empty;
        public string Descripcion { get; set; } = string.Empty;
        public bool Activo { get; set; } = true;
        public DateTime FechaRegistro { get; set; }
    }
}
