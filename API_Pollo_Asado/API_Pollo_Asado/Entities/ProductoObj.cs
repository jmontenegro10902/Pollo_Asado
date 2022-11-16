namespace API_Pollo_Asado.Entities
{
    public class ProductoObj
    {
        public string Id_Producto { get; set; } = string.Empty;
        public string Id_Marca { get; set; } = string.Empty;
        public string Id_Categoria { get; set; } = string.Empty;
        public string Nombre { get; set; } = string.Empty;
        public DateTime FechaRegistro { get; set; }
        public decimal Precio { get; set; }
        public int Existencia { get; set; }
        public string RutaImagen { get; set; } = string.Empty;
        public bool Activo { get; set; } = true;
    }
}
