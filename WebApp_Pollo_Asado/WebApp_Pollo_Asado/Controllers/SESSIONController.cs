using Microsoft.AspNetCore.Mvc;

namespace WebApp_Pollo_Asado.Controllers
{
    public class SESSIONController : Controller
    {
        public IActionResult Log_In()
        {
            return View();
        }


        //CERRAR SESION
        public IActionResult Log_Out()
        {
            return View();
        }




        //RECUPERAR CONTRASEANNA
        public IActionResult Recover_PASS ()
        {
            return View();
        }

    }
}
