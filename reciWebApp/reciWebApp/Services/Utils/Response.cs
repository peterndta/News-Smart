using System.Runtime.InteropServices;

namespace reciWebApp.Services.Utils
{
    public class Response
    {
        public object data { get; set; }
        public string message { get; set; }
        public bool isSuccess { get; set; }

        public Response([Optional] object data, [Optional] string message)
        {
            isSuccess = true;
            this.data = data;
            this.message = message;
        }

        public Response(string message)
        {
            this.message = message;
            isSuccess = false;
        }
    }
}
