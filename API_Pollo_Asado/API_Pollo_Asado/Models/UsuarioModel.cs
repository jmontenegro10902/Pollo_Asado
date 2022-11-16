using API_Pollo_Asado.Entities;
using Dapper;
using Microsoft.IdentityModel.Tokens;
using System.Data;
using System.Data.SqlClient;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Security.Cryptography;
using System.Text;

namespace API_Pollo_Asado.Models
{
    public class UsuarioModel
    {
        BitacoraModel bitacoraM = new BitacoraModel();
        public UsuarioObj? ObtenerUsuario(string usuario, IConfiguration stringConnection)
        {
            try
            {
                using (var connection = new SqlConnection(stringConnection.GetSection("ConnectionStrings:Connection").Value))
                {
                    var datos = connection.Query<UsuarioObj>("Consultar_Usuario",
                        new { Usuario = usuario }, commandType: CommandType.StoredProcedure).FirstOrDefault();

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

        public List<UsuarioObj>? ObtenerUsuarios(IConfiguration stringConnection)
        {

            try
            {
                using (var connection = new SqlConnection(stringConnection.GetSection("ConnectionStrings:Connection").Value))
                {
                    var datos = connection.Query<UsuarioObj>("Consultar_Usuariosaaaaa",
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

        public bool ExisteUsuario(string usuario, IConfiguration stringConnection)
        {
            try
            {
                using (var connection = new SqlConnection(stringConnection.GetSection("ConnectionStrings:Connection").Value))
                {
                    var datos = connection.Query<UsuarioObj>("Consultar_Usuario",
                        new { usuario }, commandType: CommandType.StoredProcedure).FirstOrDefault();

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

        public int RegistrarUsuario(UsuarioObj usuario, IConfiguration stringConnection)
        {
            try
            {
                using (var connection = new SqlConnection(stringConnection.GetSection("ConnectionStrings:Connection").Value))
                {
                    var Contrasena = hashContrasena(usuario.Contrasena, stringConnection);
                    return connection.Execute("Agregar_Usuario",
                        new
                        {
                            usuario.Usuario,
                            usuario.Correo,
                            Contrasena,
                            usuario.Nombre,
                            usuario.Apellidos,
                            usuario.Cedula,
                            usuario.idRol
                        }, commandType: CommandType.StoredProcedure);
                }
            }
            catch (Exception ex)
            {
                bitacoraM.RegistrarErrores("Invitado", ex, bitacoraM.GetMethodName(), stringConnection);
                throw;
            }

        }

        public int ActualizarUsuario(UsuarioObj usuario, IConfiguration stringConnection)
        {
            try
            {
                using (var connection = new SqlConnection(stringConnection.GetSection("ConnectionStrings:Connection").Value))
                {
                    return connection.Execute("Actualizar_Usuario",
                        new
                        {
                            usuario.Usuario,
                            usuario.Contrasena,
                            usuario.Correo,
                            usuario.Nombre,
                            usuario.Apellidos,
                            usuario.Cedula,
                            usuario.Activo,
                            usuario.CambioContrasenna
                        }, commandType: CommandType.StoredProcedure);
                }
            }
            catch (Exception ex)
            {
                bitacoraM.RegistrarErrores("Invitado", ex, bitacoraM.GetMethodName(), stringConnection);
                throw;
            }

        }


        public int EliminarUsuario(string usuario, IConfiguration stringConnection)
        {
            try
            {
                using (var connection = new SqlConnection(stringConnection.GetSection("ConnectionStrings:Connection").Value))
                {
                    return connection.Execute("Eliminar_Usuario",
                        new
                        { usuario }, commandType: CommandType.StoredProcedure);
                }
            }
            catch (Exception ex)
            {
                bitacoraM.RegistrarErrores("Invitado", ex, bitacoraM.GetMethodName(), stringConnection);
                throw;
            }

        }

        private string hashContrasena(string contrasena, IConfiguration stringConnection)
        {
            try
            {
                var sha = SHA512.Create();
                var asByteArray = Encoding.Default.GetBytes(contrasena);
                var hashedPassword = sha.ComputeHash(asByteArray);
                return Convert.ToBase64String(hashedPassword);
            }
            catch (Exception ex)
            {
                bitacoraM.RegistrarErrores("Invitado", ex, bitacoraM.GetMethodName(), stringConnection);
                throw;
            }

        }

        public UsuarioObj? ValidarUsuario(UsuarioObj usuario, IConfiguration stringConnection)
        {
            try
            {
                using (var connection = new SqlConnection(stringConnection.GetSection("ConnectionStrings:Connection").Value))
                {
                    var Contrasena = hashContrasena(usuario.Contrasena, stringConnection);
                    var datos = connection.Query<UsuarioObj>("Validar_Credenciales",
                        new { usuario.Usuario, Contrasena }, commandType: CommandType.StoredProcedure).FirstOrDefault();

                    if (datos != null)
                    {
                        datos.Token = CrearToken(usuario.Usuario, stringConnection);
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

        private string CrearToken(string Usuario, IConfiguration stringConnection)
        {
            try
            {
                List<Claim> claims = new List<Claim> {
                new Claim(ClaimTypes.Name, Usuario)
                };

                var key = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(stringConnection.GetSection("TokenAPI:Key").Value));
                var cred = new SigningCredentials(key, SecurityAlgorithms.HmacSha512Signature);

                var token = new JwtSecurityToken(
                    claims: claims,
                    expires: DateTime.UtcNow.AddMinutes(5),
                    signingCredentials: cred);

                return new JwtSecurityTokenHandler().WriteToken(token);
            }
            catch (Exception ex)
            {
                bitacoraM.RegistrarErrores("Invitado", ex, bitacoraM.GetMethodName(), stringConnection);
                throw;
            }

        }

    }
}
