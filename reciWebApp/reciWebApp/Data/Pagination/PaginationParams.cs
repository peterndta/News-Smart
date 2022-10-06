namespace reciWebApp.Data.Pagination
{
    public abstract class PaginationParams
    {
        private const int maxPageSize = 50;
        private const int minPageNumber = 1;

        private int _pageNumber;

        private int _pageSize = maxPageSize;

        public int PageNumber
        {
            get => _pageNumber;
            set => _pageNumber = value < minPageNumber ? minPageNumber : value;
        }

        public int PageSize
        {
            get => _pageSize;
            set => _pageSize = (value > maxPageSize || value <= 0) ? maxPageSize : value;
        }
    }
}
