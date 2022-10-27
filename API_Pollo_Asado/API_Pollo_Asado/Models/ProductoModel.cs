using Dapper;
using PROYECTO_API.Entities;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;

namespace PROYECTO_API.Models
{
    public class ProductoModel
    {
        public ProductoObj? ObtenerProducto(string id_producto, IConfiguration stringConnection)
        {
            using (var connection = new SqlConnection(stringConnection.GetSection("ConnectionStrings:Connection").Value))
            {
                var datos = connection.Query<ProductoObj>("Consultar_Producto",
                    new { Id_Producto = id_producto }, commandType: CommandType.StoredProcedure).FirstOrDefault();

                if (datos != null)
                {
                    return datos;
                }
                return null;
            }

        }

        public List<ProductoObj>? ObtenerProductos(IConfiguration stringConnection)
        {
            using (var connection = new SqlConnection(stringConnection.GetSection("ConnectionStrings:Connection").Value))
            {
                var datos = connection.Query<ProductoObj>("Consultar_Productos",
                    new { }, commandType: CommandType.StoredProcedure).ToList();

                if (datos != null)
                {
                    return datos;
                }
                return null;
            }
        }

        public bool ExisteProducto(string id_producto, IConfiguration stringConnection)
        {
            using (var connection = new SqlConnection(stringConnection.GetSection("ConnectionStrings:Connection").Value))
            {
                var datos = connection.Query<ProductoObj>("Consultar_Producto",
                    new { id_producto }, commandType: CommandType.StoredProcedure).FirstOrDefault();

                if (datos != null)
                {
                    return true;
                }
                return false;
            }
        }

        public int RegistrarProducto(ProductoObj producto, IConfiguration stringConnection)
        {
            using (var connection = new SqlConnection(stringConnection.GetSection("ConnectionStrings:Connection").Value))
            {
                return connection.Execute("AgregarProducto",
                    new { producto.Id_Producto, producto.Id_Marca, producto.Id_Categoria, producto.Nombre, 
                          producto.Precio, producto.Existencia, producto.RutaImagen }, commandType: CommandType.StoredProcedure);
            }
        }

        public int ActualizarProducto(ProductoObj producto, IConfiguration stringConnection)
        {
            using (var connection = new SqlConnection(stringConnection.GetSection("ConnectionStrings:Connection").Value))
            {
                return connection.Execute("ActualizarProducto",
                    new
                    { producto.Id_Producto,producto.Id_Marca, producto.Id_Categoria, producto.Nombre,
                      producto.Precio, producto.Existencia, producto.RutaImagen}, commandType: CommandType.StoredProcedure);
            }
        }

        public int EliminarProducto(string id_producto, IConfiguration stringConnection)
        {
            using (var connection = new SqlConnection(stringConnection.GetSection("ConnectionStrings:Connection").Value))
            {
                return connection.Execute("EliminarProducto",
                    new
                    { id_producto }, commandType: CommandType.StoredProcedure);
            }
        }


    }
}
