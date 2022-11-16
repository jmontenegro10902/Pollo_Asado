namespace API_Pollo_Asado.Entities
{
    public class MarcaObj
    {
        public string Id_Marca { get; set; } = string.Empty;
        public string Descripcion { get; set; } = string.Empty;
        public bool Activo { get; set; } = true;
        public DateTime FechaRegistro { get; set; }
    }
}
