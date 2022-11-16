
using API_Pollo_Asado.Entities;
using API_Pollo_Asado.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace API_Pollo_Asado.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class MarcaController : ControllerBase
    {
        private readonly IConfiguration _configuration;
        MarcaModel marcaM = new MarcaModel();
        BitacoraModel bitacoraM = new BitacoraModel();

        public MarcaController(IConfiguration configuration)
        {
            _configuration = configuration;
        }

        [AllowAnonymous]
        [HttpGet]
        [Route("ObtenerMarca")]
        public ActionResult<MarcaObj> ObtenerMarca(string id_marca)
        {
            try
            {
                var datos = marcaM.ObtenerMarca(id_marca, _configuration);
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
        [Route("ObtenerMarcas")]
        public ActionResult<MarcaObj> ObtenerMarcas()
        {
            try
            {
                var datos = marcaM.ObtenerMarcas(_configuration);
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
        [Route("RegistrarMarca")]
        public ActionResult RegistrarMarca(MarcaObj marca)
        {
            try
            {
                if (marcaM.ExisteMarca(marca.Id_Marca, _configuration) == false)
                    if (marcaM.RegistrarMarca(marca, _configuration) > 0)
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
        [Route("ActualizarMarca")]
        public ActionResult ActualizarMarca(MarcaObj marca)
        {
            try
            {
                if (marcaM.ActualizarMarca(marca, _configuration) > 0)
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
        [Route("EliminarMarca")]
        public ActionResult EliminarMarca(string id_marca)
        {
            try
            {
                if (marcaM.EliminarMarca(id_marca, _configuration) > 0)
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
