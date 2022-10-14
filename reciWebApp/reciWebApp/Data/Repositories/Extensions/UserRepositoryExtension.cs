using reciWebApp.Data.Models;

namespace reciWebApp.Data.Repositories.Extensions
{
    public static class UserRepositoryExtension
    {
        public static IQueryable<User> FilterUserByName(this IQueryable<User> users, ReciContext context,
                                                        string? name)
        {
            return string.IsNullOrWhiteSpace(name)
                ? users
                : users.Where(x => x.Name.Contains(name));
        }

        public static IQueryable<User> FilterUserByStatus(this IQueryable<User> users, ReciContext context,
                                                        bool status)
        {
            return status 
                ? users.Where(x => x.BanTime == null)
                : users.Where(x => x.BanTime != null);
        }
    }
}
