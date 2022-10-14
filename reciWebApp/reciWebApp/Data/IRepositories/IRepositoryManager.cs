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
        IPostCategoryRepository PostCategory { get; }
        IUsesRepository Use { get; }
        IUserInteractRepository UserInteract { get; }
        ICollectionRepository Collection { get; }  
        Task SaveChangesAsync();
    }
}
