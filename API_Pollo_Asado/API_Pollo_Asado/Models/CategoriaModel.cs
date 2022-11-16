using API_Pollo_Asado.Entities;
using Dapper;
using Microsoft.AspNetCore.Mvc;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Reflection;
using System.Runtime.CompilerServices;

namespace API_Pollo_Asado.Models
{
    public class CategoriaModel
    {
        BitacoraModel bitacoraM = new BitacoraModel();

        public CategoriaObj? ObtenerCategoria(string id_categoria, IConfiguration stringConnection)
        {
            try
            {
                using (var connection = new SqlConnection(stringConnection.GetSection("ConnectionStrings:Connection").Value))
                {
                    var datos = connection.Query<CategoriaObj>("Consultar_Categoria",
                        new { Id_Categoria = id_categoria }, commandType: CommandType.StoredProcedure).FirstOrDefault();

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

        public List<CategoriaObj>? ObtenerCategorias(IConfiguration stringConnection)
        {
            using (var connection = new SqlConnection(stringConnection.GetSection("ConnectionStrings:Connection").Value))
            {
                try
                {
                    var datos = connection.Query<CategoriaObj>("Consultar_Categorias",
                    new { }, commandType: CommandType.StoredProcedure).ToList();

                    if (datos != null)
                    {
                        return datos;
                    }
                    return null;
                }
                catch (Exception ex)
                {
                    bitacoraM.RegistrarErrores("Invitado", ex, bitacoraM.GetMethodName(), stringConnection);
                    throw;
                }
                
            }
        }

        public bool ExisteCategoria(string id_categoria, IConfiguration stringConnection)
        {
            try
            {
                using (var connection = new SqlConnection(stringConnection.GetSection("ConnectionStrings:Connection").Value))
                {
                    var datos = connection.Query<CategoriaObj>("Consultar_Categoria",
                        new { id_categoria }, commandType: CommandType.StoredProcedure).FirstOrDefault();

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

        public int RegistrarCategoria(CategoriaObj categoria, IConfiguration stringConnection)
        {
            try
            {
                using (var connection = new SqlConnection(stringConnection.GetSection("ConnectionStrings:Connection").Value))
                {
                    return connection.Execute("Agregar_Categoria",
                        new
                        {
                            categoria.Id_Categoria,
                            categoria.Descripcion,
                        }, commandType: CommandType.StoredProcedure);
                }
            }
            catch (Exception ex)
            {
                bitacoraM.RegistrarErrores("Invitado", ex, bitacoraM.GetMethodName(), stringConnection);
                throw;
            }
            
        }

        public int ActualizarCategoria(CategoriaObj categoria, IConfiguration stringConnection)
        {
            try
            {
                using (var connection = new SqlConnection(stringConnection.GetSection("ConnectionStrings:Connection").Value))
                {
                    return connection.Execute("Actualizar_Categoria",
                        new
                        {
                            categoria.Id_Categoria,
                            categoria.Descripcion,
                            categoria.Activo,
                        }, commandType: CommandType.StoredProcedure);
                }
            }
            catch (Exception ex)
            {
                bitacoraM.RegistrarErrores("Invitado", ex, bitacoraM.GetMethodName(), stringConnection);
                throw;
            }
            
        }

        public int EliminarCategoria(string id_categoria, IConfiguration stringConnection)
        {
            try
            {
                using (var connection = new SqlConnection(stringConnection.GetSection("ConnectionStrings:Connection").Value))
                {
                    return connection.Execute("Eliminar_Categoria",
                        new
                        { id_categoria }, commandType: CommandType.StoredProcedure);
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


