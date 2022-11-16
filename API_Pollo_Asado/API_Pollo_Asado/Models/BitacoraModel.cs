using Dapper;
using System.Data;
using System.Data.SqlClient;
using System.Runtime.CompilerServices;

namespace API_Pollo_Asado.Models
{
    public class BitacoraModel
    {
        public void RegistrarErrores(string Usuario, Exception ex, string Accion, IConfiguration stringConnection)
        {
            try
            {
                using (var connection = new SqlConnection(stringConnection.GetSection("ConnectionStrings:Connection").Value))
                {
                    int Codigo = ex.HResult;
                    string Mensaje = ex.Message; 

                    var datos = connection.Execute("Registrar_Errores",
                        new { Usuario, Codigo, Mensaje, Accion }, commandType: CommandType.StoredProcedure);
                }
            }
            catch (Exception)
            {
                throw;
            }
            
        }

        public  string GetMethodName([CallerMemberName] string caller = null)
        {
            return caller;
        }
    }
}
