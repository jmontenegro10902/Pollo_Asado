using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using PROYECTO_API.Entities;
using PROYECTO_API.Models;

namespace PROYECTO_API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UsuarioController : ControllerBase
    {
        private readonly IConfiguration _configuration;
        UsuarioModel usuarioM = new UsuarioModel();
        BitacoraModel bitacoraM = new BitacoraModel();

        public UsuarioController(IConfiguration configuration)
        {
            _configuration = configuration;
        }

        [AllowAnonymous]
        [HttpGet]
        [Route("ObtenerUsuario")]
        public ActionResult<UsuarioObj> ObtenerProducto(string usuario)
        {
            try
            {
                var datos = usuarioM.ObtenerUsuario(usuario, _configuration);
                if (datos != null)
                    return Ok(datos);
                else
                    return BadRequest();
            }
            catch (Exception ex)
            {
                bitacoraM.RegistrarErrores("Invitado", ex, ControllerContext.ActionDescriptor.ActionName, _configuration);
                return BadRequest("Se presentó un inconveniente");
            }
        }

        [AllowAnonymous]
        [HttpGet]
        [Route("ObtenerUsuarios")]
        public ActionResult<UsuarioObj> ObtenerProductos()
        {
            try
            {
                var datos = usuarioM.ObtenerUsuarios(_configuration);
                if (datos != null)
                    return Ok(datos);
                else
                    return BadRequest();
            }
            catch (Exception ex)
            {
                bitacoraM.RegistrarErrores("Invitado", ex, ControllerContext.ActionDescriptor.ActionName, _configuration);
                return BadRequest("Se presentó un inconveniente");
            }
        }

        [AllowAnonymous]
        [HttpPost]
        [Route("RegistrarUsuario")]
        public ActionResult RegistrarProducto(UsuarioObj usuario)
        {
            try
            {
                if (usuarioM.ExisteUsuario(usuario.Usuario, _configuration) == false)
                    if (usuarioM.RegistrarUsuario(usuario, _configuration) > 0)
                        return Ok();
                    else
                        return BadRequest();
                else
                    return BadRequest("Error de llave primaria duplicada");
            }
            catch (Exception ex)
            {
                bitacoraM.RegistrarErrores(usuario.Usuario, ex, ControllerContext.ActionDescriptor.ActionName, _configuration);
                return BadRequest("Se presentó un inconveniente");
            }
        }

        [AllowAnonymous]
        [HttpPut]
        [Route("ActualizarUsuario")]
        public ActionResult ActualizarProducto(UsuarioObj usuario)
        {
            try
            {
                if (usuarioM.ActualizarUsuario(usuario, _configuration) > 0)
                    return Ok();
                else
                    return BadRequest();
            }
            catch (Exception ex)
            {
                bitacoraM.RegistrarErrores(usuario.Usuario, ex, ControllerContext.ActionDescriptor.ActionName, _configuration);
                return BadRequest("Se presentó un inconveniente");
            }
        }

        [AllowAnonymous]
        [HttpDelete]
        [Route("EliminarUsuario")]
        public ActionResult EliminarProducto(string usuario)
        {
            try
            {
                if (usuarioM.EliminarUsuario(usuario, _configuration) > 0)
                    return Ok();
                else
                    return BadRequest();
            }
            catch (Exception ex)
            {
                bitacoraM.RegistrarErrores(usuario, ex, ControllerContext.ActionDescriptor.ActionName, _configuration);
                return BadRequest("Se presentó un inconveniente");
            }
        }

        [AllowAnonymous]
        [HttpPost]
        [Route("ValidarUsuario")]
        public ActionResult<UsuarioObj> ValidarUsuario(UsuarioObj usuario)
        {
            try
            {
                var datos = usuarioM.ValidarUsuario(usuario, _configuration);
                if (datos != null)
                    return Ok(datos);
                else
                    return BadRequest();
            }
            catch (Exception ex)
            {
                bitacoraM.RegistrarErrores(usuario.Usuario, ex, ControllerContext.ActionDescriptor.ActionName, _configuration);
                return BadRequest("Se presentó un inconveniente");
            }
        }
    }
}
