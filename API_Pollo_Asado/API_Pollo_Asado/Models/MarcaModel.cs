using API_Pollo_Asado.Entities;
using Dapper;
using System.Data;
using System.Data.SqlClient;

namespace API_Pollo_Asado.Models
{
    public class MarcaModel
    {
        BitacoraModel bitacoraM = new BitacoraModel();
        public MarcaObj? ObtenerMarca(string id_marca, IConfiguration stringConnection)
        {
            try
            {
                using (var connection = new SqlConnection(stringConnection.GetSection("ConnectionStrings:Connection").Value))
                {

                    var datos = connection.Query<MarcaObj>("Consultar_Marca",
                        new { id_Marca = id_marca }, commandType: CommandType.StoredProcedure).FirstOrDefault();

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

        public List<MarcaObj>? ObtenerMarcas(IConfiguration stringConnection)
        {
            try
            {
                using (var connection = new SqlConnection(stringConnection.GetSection("ConnectionStrings:Connection").Value))
                {
                    var datos = connection.Query<MarcaObj>("Consultar_Marcas",
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

        public bool ExisteMarca(string id_marca, IConfiguration stringConnection)
        {
            try
            {
                using (var connection = new SqlConnection(stringConnection.GetSection("ConnectionStrings:Connection").Value))
                {
                    var datos = connection.Query<MarcaObj>("Consultar_Marca",
                        new { id_marca }, commandType: CommandType.StoredProcedure).FirstOrDefault();

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

        public int RegistrarMarca(MarcaObj marca, IConfiguration stringConnection)
        {
            try
            {
                using (var connection = new SqlConnection(stringConnection.GetSection("ConnectionStrings:Connection").Value))
                {
                    return connection.Execute("Agregar_Marca",
                        new
                        {
                            marca.Id_Marca,
                            marca.Descripcion,
                        }, commandType: CommandType.StoredProcedure);
                }
            }
            catch (Exception ex)
            {
                bitacoraM.RegistrarErrores("Invitado", ex, bitacoraM.GetMethodName(), stringConnection);
                throw;
            }
            
        }

        public int ActualizarMarca(MarcaObj marca, IConfiguration stringConnection)
        {
            try
            {
                using (var connection = new SqlConnection(stringConnection.GetSection("ConnectionStrings:Connection").Value))
                {
                    return connection.Execute("Actualizar_Marca",
                        new
                        {
                            marca.Id_Marca,
                            marca.Descripcion,
                            marca.Activo,
                        }, commandType: CommandType.StoredProcedure);
                }
            }
            catch (Exception ex)
            {
                bitacoraM.RegistrarErrores("Invitado", ex, bitacoraM.GetMethodName(), stringConnection);
                throw;
            }
            
        }

        public int EliminarMarca(string Id_Marca, IConfiguration stringConnection)
        {
            try
            {
                using (var connection = new SqlConnection(stringConnection.GetSection("ConnectionStrings:Connection").Value))
                {
                    return connection.Execute("Eliminar_Marca",
                        new
                        { Id_Marca }, commandType: CommandType.StoredProcedure);
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
