using reciWebApp.Data.IRepositories;

namespace reciWebApp.Services.Interfaces
{
    public interface IServicesManager
    {
        IAuthService AuthService { get; }
        IPostService PostService { get; }
    }
}
