using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace EventStoreService.Configuration.Strategy
{
    internal class CommandLineStrategy : InstanceStrategy
    {
        protected override string GenerateArguments(IEnumerable<Argument> arguments)
        {
            return arguments.Aggregate(new StringBuilder(),
                (sb, argument) => sb.AppendFormat("{0} ", argument))
                .ToString().Trim();
        }
    }
}