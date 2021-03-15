using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Threading.Tasks;

namespace NaosFrontend
{
    public class ApiAgent
    {
        private static string baseURI = "http://naos-api";
        private static readonly HttpClient client = new();

        public static async Task<string> GetColor()
        {
            var color = await client.GetStringAsync($"{baseURI}/ColorForecast");
            return color;
        }

        public static async Task<string> GetVersion()
        {
            var version = await client.GetStringAsync($"{baseURI}/ColorForecast/version");
            return version;
        }
    }
}
