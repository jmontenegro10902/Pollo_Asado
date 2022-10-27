using Microsoft.AspNetCore.Mvc;
using System.Diagnostics;
using WebApp_Pollo_Asado.Models;

namespace WebApp_Pollo_Asado.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;

        public HomeController(ILogger<HomeController> logger)
        {
            _logger = logger;
        }

        public IActionResult Contact()
        {
            return View();
        }

        public IActionResult About_Us()
        {
            return View();
        }

        public ActionResult Main()
        {
            return View();
        }

        public IActionResult Shopping()
        {
            return View();
        }


        public IActionResult Index()
        {
            return View();
        }

      
    }
}