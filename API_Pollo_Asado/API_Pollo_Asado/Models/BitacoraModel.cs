using Dapper;
using System.Data;
using System.Data.SqlClient;

namespace PROYECTO_API.Models
{
    public class BitacoraModel
    {
        public void RegistrarErrores(string Usuario, Exception ex, string Accion, IConfiguration stringConnection)
        {
            using (var connection = new SqlConnection(stringConnection.GetSection("ConnectionStrings:Connection").Value))
            {
                int Codigo = ex.HResult;
                string Mensaje = ex.Message;

                connection.Execute("RegistrarErrores",
                    new { Usuario, Codigo, Mensaje, Accion }, commandType: CommandType.StoredProcedure);
            }
        }
    }
}
