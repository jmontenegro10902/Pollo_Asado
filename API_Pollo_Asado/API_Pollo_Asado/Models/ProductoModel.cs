using API_Pollo_Asado.Entities;
using Dapper;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;

namespace API_Pollo_Asado.Models
{
    public class ProductoModel
    {
        BitacoraModel bitacoraM = new BitacoraModel();
        public ProductoObj? ObtenerProducto(string id_producto, IConfiguration stringConnection)
        {
            try
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
            catch (Exception ex)
            {
                bitacoraM.RegistrarErrores("Invitado", ex, bitacoraM.GetMethodName(), stringConnection);
                throw;
            }
            

        }

        public List<ProductoObj>? ObtenerProductos(IConfiguration stringConnection)
        {
            try
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
            catch (Exception ex)
            {
                bitacoraM.RegistrarErrores("Invitado", ex, bitacoraM.GetMethodName(), stringConnection);
                throw;
            }
            
        }

        public bool ExisteProducto(string id_producto, IConfiguration stringConnection)
        {
            try
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
            catch (Exception ex)
            {
                bitacoraM.RegistrarErrores("Invitado", ex, bitacoraM.GetMethodName(), stringConnection);
                throw;
            }
            
        }

        public int RegistrarProducto(ProductoObj producto, IConfiguration stringConnection)
        {
            try
            {
                using (var connection = new SqlConnection(stringConnection.GetSection("ConnectionStrings:Connection").Value))
                {
                    return connection.Execute("Agregar_Producto",
                        new
                        {
                            producto.Id_Producto,
                            producto.Id_Marca,
                            producto.Id_Categoria,
                            producto.Nombre,
                            producto.Precio,
                            producto.Existencia,
                            producto.RutaImagen
                        }, commandType: CommandType.StoredProcedure);
                }
            }
            catch (Exception ex)
            {
                bitacoraM.RegistrarErrores("Invitado", ex, bitacoraM.GetMethodName(), stringConnection);
                throw;
            }
            
        }

        public int ActualizarProducto(ProductoObj producto, IConfiguration stringConnection)
        {
            try
            {
                using (var connection = new SqlConnection(stringConnection.GetSection("ConnectionStrings:Connection").Value))
                {
                    return connection.Execute("Actualizar_Producto",
                        new
                        {
                            producto.Id_Producto,
                            producto.Id_Marca,
                            producto.Id_Categoria,
                            producto.Nombre,
                            producto.Precio,
                            producto.Existencia,
                            producto.RutaImagen
                        }, commandType: CommandType.StoredProcedure);
                }
            }
            catch (Exception ex)
            {
                bitacoraM.RegistrarErrores("Invitado", ex, bitacoraM.GetMethodName(), stringConnection);
                throw;
            }
            
        }

        public int EliminarProducto(string id_producto, IConfiguration stringConnection)
        {
            try
            {
                using (var connection = new SqlConnection(stringConnection.GetSection("ConnectionStrings:Connection").Value))
                {
                    return connection.Execute("Eliminar_Producto",
                        new
                        { id_producto }, commandType: CommandType.StoredProcedure);
                }
            }
            catch (Exception ex)
            {
                bitacoraM.RegistrarErrores("Invitado", ex, bitacoraM.GetMethodName(), stringConnection);
                throw;
            }
            
        }


    }
}
