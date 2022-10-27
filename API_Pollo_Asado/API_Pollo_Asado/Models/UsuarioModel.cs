using Dapper;
using Microsoft.IdentityModel.Tokens;
using PROYECTO_API.Entities;
using System.Data;
using System.Data.SqlClient;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Security.Cryptography;
using System.Text;

namespace PROYECTO_API.Models
{
    public class UsuarioModel
    {
        public UsuarioObj? ObtenerUsuario(string usuario, IConfiguration stringConnection)
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

        public List<UsuarioObj>? ObtenerUsuarios(IConfiguration stringConnection)
        {
            using (var connection = new SqlConnection(stringConnection.GetSection("ConnectionStrings:Connection").Value))
            {
                var datos = connection.Query<UsuarioObj>("Consultar_Usuarios",
                    new { }, commandType: CommandType.StoredProcedure).ToList();

                if (datos != null)
                {
                    return datos;
                }
                return null;
            }
        }

        public bool ExisteUsuario(string usuario, IConfiguration stringConnection)
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

        public int RegistrarUsuario(UsuarioObj usuario, IConfiguration stringConnection)
        {
            using (var connection = new SqlConnection(stringConnection.GetSection("ConnectionStrings:Connection").Value))
            {
                var Contrasena = hashContrasena(usuario.Contrasena);
                return connection.Execute("AgregarUsuario",
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

        public int ActualizarUsuario(UsuarioObj usuario, IConfiguration stringConnection)
        {
            using (var connection = new SqlConnection(stringConnection.GetSection("ConnectionStrings:Connection").Value))
            {
                return connection.Execute("ActualizarUsuario",
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


        public int EliminarUsuario(string usuario, IConfiguration stringConnection)
        {
            using (var connection = new SqlConnection(stringConnection.GetSection("ConnectionStrings:Connection").Value))
            {
                return connection.Execute("EliminarUsuario",
                    new
                    { usuario }, commandType: CommandType.StoredProcedure);
            }
        }

        private string hashContrasena(string contrasena)
        {
            var sha = SHA512.Create();
            var asByteArray = Encoding.Default.GetBytes(contrasena);
            var hashedPassword = sha.ComputeHash(asByteArray);
            return Convert.ToBase64String(hashedPassword);
        }

        public UsuarioObj? ValidarUsuario(UsuarioObj usuario, IConfiguration stringConnection)
        {
            using (var connection = new SqlConnection(stringConnection.GetSection("ConnectionStrings:Connection").Value))
            {
                var Contrasena = hashContrasena(usuario.Contrasena);
                var datos = connection.Query<UsuarioObj>("ValidarCredenciales",
                    new { usuario.Usuario, Contrasena }, commandType: CommandType.StoredProcedure).FirstOrDefault();

                if (datos != null)
                {
                    datos.Token = CrearToken(usuario.Usuario);
                    return datos;
                }
                return null;
            }
        }

        private string CrearToken(string Usuario)
        {
            List<Claim> claims = new List<Claim> {
                new Claim(ClaimTypes.Name, Usuario)
            };

            var key = new SymmetricSecurityKey(Encoding.UTF8.GetBytes("b14ca5898a4e4133bbce2ea2315a1916"));
            var cred = new SigningCredentials(key, SecurityAlgorithms.HmacSha512Signature);

            var token = new JwtSecurityToken(
                claims: claims,
                expires: DateTime.UtcNow.AddMinutes(5),
                signingCredentials: cred);

            return new JwtSecurityTokenHandler().WriteToken(token);
        }

    }
}
