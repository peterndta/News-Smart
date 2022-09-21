using reciWebApp.Data.IRepositories;
using reciWebApp.Data.Models;
using System.Linq.Expressions;

namespace reciWebApp.Data.Repositories
{
    public abstract class RepositoryBase<T> : IRepositoryBase<T> where T : class
    {
        protected ReciContext _reciContext { get; set; }

        public RepositoryBase (ReciContext reciContext)
        {
            _reciContext = reciContext;
        }

        public void BulkDelete(IEnumerable<T> entities)
        {
            _reciContext.Set<T>().RemoveRange(entities);
        }

        public void Create(T entity)
        {
            _reciContext.Set<T>().Add(entity);
        }

        public void Delete(T entity)
        {
            _reciContext.Set<T>().Remove(entity);
        }

        public IQueryable<T> GetAll()
        {
            return _reciContext.Set<T>();
        }

        public IQueryable<T> GetByCondition(Expression<Func<T, bool>> expession)
        {
            return _reciContext.Set<T>().Where(expession);
        }

        public void Update(T entity)
        {
            _reciContext.Set<T>().Update(entity);
        }
    }
}
