using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace avFramworktalents.core
{
    public class ApplicationOptions
    {
        public Dictionary<string, Dictionary<string, string>> ConnectionStrings { get; set; }

        public ApplicationOptions()
        {
            ConnectionStrings = new Dictionary<string, Dictionary<string, string>>();
        }
    }
}
