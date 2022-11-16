
using API_Pollo_Asado.Entities;
using API_Pollo_Asado.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace API_Pollo_Asado.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CategoriaController : ControllerBase
    {
        private readonly IConfiguration _configuration;
        CategoriaModel categoriaM = new CategoriaModel();
        BitacoraModel bitacoraM = new BitacoraModel();

        public CategoriaController(IConfiguration configuration)
        {
            _configuration = configuration;
        }

        [AllowAnonymous]
        [HttpGet]
        [Route("ObtenerCategoria")]
        public ActionResult<CategoriaObj> ObtenerCategoria(string id_categoria)
        {
            try
            {
                var datos = categoriaM.ObtenerCategoria(id_categoria, _configuration);
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
        [Route("ObtenerCategorias")]
        public ActionResult<CategoriaObj> ObtenerCategorias()
        {
            try
            {
                var datos = categoriaM.ObtenerCategorias(_configuration);
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
        [Route("RegistrarCategoria")]
        public ActionResult RegistrarCategoria(CategoriaObj categoria)
        {
            try
            {
                if (categoriaM.ExisteCategoria(categoria.Id_Categoria, _configuration) == false)
                    if (categoriaM.RegistrarCategoria(categoria, _configuration) > 0)
                        return Ok();
                    else
                        return BadRequest();
                else
                    return BadRequest("Error de llave primaria duplicada");
            }
            catch (Exception ex)
            {
                bitacoraM.RegistrarErrores("Invitado", ex, ControllerContext.ActionDescriptor.ActionName, _configuration);
                return BadRequest("Se presentó un inconveniente");
            }
        }

        [AllowAnonymous]
        [HttpPut]
        [Route("ActualizarCategoria")]
        public ActionResult ActualizarCategoria(CategoriaObj categoria)
        {
            try
            {
                if (categoriaM.ActualizarCategoria(categoria, _configuration) > 0)
                    return Ok();
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
        [HttpDelete]
        [Route("EliminarCategoria")]
        public ActionResult EliminarCategoria(string id_categoria)
        {
            try
            {
                if (categoriaM.EliminarCategoria(id_categoria, _configuration) > 0)
                    return Ok();
                else
                    return BadRequest();
            }
            catch (Exception ex)
            {
                bitacoraM.RegistrarErrores("Invitado", ex, ControllerContext.ActionDescriptor.ActionName, _configuration);
                return BadRequest("Se presentó un inconveniente");
            }
        }
    }
}
