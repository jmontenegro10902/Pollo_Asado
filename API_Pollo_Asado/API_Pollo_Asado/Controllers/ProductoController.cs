
using API_Pollo_Asado.Entities;
using API_Pollo_Asado.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace API_Pollo_Asado.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ProductoController : ControllerBase
    {
        private readonly IConfiguration _configuration;
        ProductoModel productoM = new ProductoModel();
        BitacoraModel bitacoraM = new BitacoraModel();

        public ProductoController(IConfiguration configuration)
        {
            _configuration = configuration;
        }

        [AllowAnonymous]
        [HttpGet]
        [Route("ObtenerProducto")]
        public ActionResult<ProductoObj> ObtenerProducto(string id_producto)
        {
            try
            {
                var datos = productoM.ObtenerProducto(id_producto, _configuration);
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
        [Route("ObtenerProductos")]
        public ActionResult<ProductoObj> ObtenerProductos()
        {
            try
            {
                var datos = productoM.ObtenerProductos(_configuration);
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
        [Route("RegistrarProducto")]
        public ActionResult RegistrarProducto(ProductoObj producto)
        {
            try
            {
                if (productoM.ExisteProducto(producto.Id_Producto, _configuration) == false)
                    if (productoM.RegistrarProducto(producto, _configuration) > 0)
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
        [Route("ActualizarProducto")]
        public ActionResult ActualizarProducto(ProductoObj producto)
        {
            try
            {
                if (productoM.ActualizarProducto(producto, _configuration) > 0)
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
        [Route("EliminarProducto")]
        public ActionResult EliminarProducto(string producto)
        {
            try
            {
                if (productoM.EliminarProducto(producto, _configuration) > 0)
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
