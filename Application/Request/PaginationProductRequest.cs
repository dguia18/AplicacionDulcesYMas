using System;
using System.Collections.Generic;
using System.Text;

namespace Application.Request
{
    public class PaginationProductRequest
    {
        public int Page { get; set; }
        public int Rows { get; set; }
        private string _termSearch;
        public string TermSearch { get => _termSearch; set => _termSearch = value.ToUpper(); }
    }
}
