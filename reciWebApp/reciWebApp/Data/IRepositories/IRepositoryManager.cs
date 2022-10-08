namespace reciWebApp.Data.IRepositories
{
    public interface IRepositoryManager
    {
        IUserRepository User { get; }
        IPostRepository Post { get; }
        IStepRepository Step {get; }
        ICategoryRepository Category { get; }
        ICookingMethodRepository CookingMethod { get; }
        IRecipeRegionRepository RecipeRegion { get; }
        Task SaveChangesAsync();
    }
}
