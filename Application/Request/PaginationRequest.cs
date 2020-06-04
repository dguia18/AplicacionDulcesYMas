
namespace Application.Request
{
    public class PaginationRequest
    {
        public int Page { get; set; }
        public int Rows { get; set; }
        private string _termSearch;
        public string TermSearch { get => _termSearch; set => _termSearch = value.ToUpper(); }
    }
}
