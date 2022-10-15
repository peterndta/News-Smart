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
                TotalPages = (int)Math.Ceiling(count / (double)pageSize),
            };

            Meta.From = Meta.PageSize * (Meta.CurrentPage - 1) + 1;

            if (Meta.CurrentPage < Meta.TotalPages)
            {              
                Meta.To = Meta.From + Meta.PageSize - 1;
            }
            else if (Meta.CurrentPage == Meta.TotalPages)
            {
                Meta.To = Meta.PageSize * Meta.CurrentPage - (Meta.PageSize * Meta.CurrentPage % Meta.TotalCount);
                if (Meta.PageSize > Meta.TotalCount)
                {
                    Meta.To = Meta.TotalCount;
                }                
            }
            else
            {
                Meta.From = -1;
                Meta.To = -1;
            }

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
