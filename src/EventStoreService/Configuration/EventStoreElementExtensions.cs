using System;
using System.Collections.Generic;
using System.Configuration;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Text;

namespace EventStoreService.Configuration
{
    public static class EventStoreElementExtensions
    {
        public static ProcessStartInfo GetProcessStartInfo(this EventStoreElement configuration)
        {
            string exe;
            switch (configuration.RunMode)
            {
                case RunMode.SingleNode:
                    exe = "EventStore.SingleNode.exe";
                    break;
                case RunMode.Cluster:
                    exe = "EventStore.ClusterNode.exe";
                    break;
                default:
                    throw new ArgumentOutOfRangeException();
            }

            var fileName = Path.Combine(configuration.BinaryPath, exe);
            var arguments = configuration.GenerateArguments();

            return new ProcessStartInfo(fileName, arguments)
            {
                UseShellExecute = false,
                RedirectStandardError = true,
                RedirectStandardOutput = true,
            };
        }

        private static string GenerateArguments(this EventStoreElement configuration)
        {
            IEnumerable<KeyValuePair<string, object>> arguments;

            switch (configuration.RunMode)
            {
                case RunMode.SingleNode:
                    arguments = GenerateArguments(configuration.SingleNode);
                    break;
                case RunMode.Cluster:
                    arguments = GenerateArguments(configuration.Cluster);
                    break;
                default:
                    throw new ArgumentOutOfRangeException();
            }

            arguments = arguments.Union(GenerateArguments(configuration.Database));

            var seed = new StringBuilder();

            return arguments.Aggregate(seed, (sb, pair) =>
            {
                if (pair.Value == null)
                    return sb.AppendFormat("{0} ", pair.Key);
                return sb.AppendFormat("--{0} {1} ", pair.Key, pair.Value);
            }).ToString().Trim();
        }

        private static IEnumerable<KeyValuePair<string, object>> GenerateArguments(ConfigurationElement element)
        {
            var arguments = new List<KeyValuePair<string, object>>();

            var collection = element as ConfigurationElementCollection;
            
            if (collection != null)
            {
                foreach (ConfigurationElement child in collection)
                {
                    arguments.AddRange(GenerateArguments(child));
                }
            }
            else
            {
                foreach (PropertyInfo property in element.GetType().GetProperties())
                {
                    object propertyValue = property.GetValue(element, null);

                    if (typeof (ConfigurationElement).IsAssignableFrom(property.PropertyType))
                    {
                        arguments.AddRange(GenerateArguments((ConfigurationElement) propertyValue));
                    }

                    var attribute = property.GetCustomAttribute<PropertyCommandAttribute>();
                    if (attribute == null) continue;

                    string command = attribute.Command;
                    bool requiresValue = command.EndsWith("=");
                    string[] commands = command.Split(new[] {'|'}, StringSplitOptions.RemoveEmptyEntries);

                    string argument = commands.Last().TrimEnd('=');

                    KeyValuePair<string, object> arg = requiresValue
                        ? new KeyValuePair<string, object>(argument, propertyValue)
                        : new KeyValuePair<string, object>(
                            string.Format("{0}{1}", argument, (bool) propertyValue ? "" : "-"), null);

                    arguments.Add(arg);
                }
            }
            return arguments;
        }
    }
}