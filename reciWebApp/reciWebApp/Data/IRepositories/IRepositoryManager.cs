namespace reciWebApp.Data.IRepositories
{
    public interface IRepositoryManager
    {
        IUserRepository User { get; }
        IPostRepository Post { get; }
        IStepRepository Step {get; }
        Task SaveChangesAsync();
    }
}
