

using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace NaosApi.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class ColorForecastController : ControllerBase
    {
        private readonly ILogger<ColorForecastController> _logger;

        public ColorForecastController(ILogger<ColorForecastController> logger)
        {
            _logger = logger;
        }

        [HttpGet]
        public string Get()
        {
            return "blue";
        }

        [HttpGet("version")]
        public string GetVersion()
        {
            return "IMAGE_VERSION";
        }
    }
}
