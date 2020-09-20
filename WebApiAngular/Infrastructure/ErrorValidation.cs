﻿using FluentValidation.Results;
using Newtonsoft.Json;
using System.Collections.Generic;

namespace WebApiAngular.Infrastructure
{
    public class ErrorValidation
    {
        public ErrorValidation()
        {
        }
        public string StackTrace { get; set; }
        public int StatusCode { get; set; }
        public string Message { get; set; }
        public IEnumerable<ValidationFailure> Errors { get; set; }
        public override string ToString()
        {
            return JsonConvert.SerializeObject(this);
        }
    }
}