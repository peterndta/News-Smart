namespace reciWebApp.Services.Interfaces
{
    public interface IPostService
    {
        bool CheckPostAuthority(int userId, string postId);
    }
}
