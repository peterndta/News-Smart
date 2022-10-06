using reciWebApp.Data.Pagination;

namespace reciWebApp.Services.Utils
{
    public class PaginatedList<T> : List<T>
    {
        public PaginatedList(List<T> items, int count, int pageNumber, int pageSize)
        {
            Meta = new PaginationMeta
            {
                TotalCount = count,
                PageSize = pageSize,
                CurrentPage = pageNumber,
                TotalPages = (int)Math.Ceiling(count / (double)pageSize)
            };

            AddRange(items);
        }

        public PaginationMeta Meta { get; set; }

        public static PaginatedList<T> Create(List<T> source, int pageNumber, int pageSize)
        {
            var count = source.Count();
            var items = source.Skip((pageNumber - 1) * pageSize).Take(pageSize).ToList();
            return new PaginatedList<T>(items, count, pageNumber, pageSize);
        }
    }
}
