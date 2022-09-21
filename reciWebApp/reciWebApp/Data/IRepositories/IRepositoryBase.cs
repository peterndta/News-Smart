using System.Linq.Expressions;

namespace reciWebApp.Data.IRepositories
{
    public interface IRepositoryBase<T>
    {
        IQueryable<T> GetAll();
        IQueryable<T> GetByCondition(Expression<Func<T, bool>> expession);
        void Create(T entity);
        void Update(T entity);
        void Delete(T entity);
        void BulkDelete(IEnumerable<T> entities);
    }
}
