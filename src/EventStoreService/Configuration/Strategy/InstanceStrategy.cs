using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Reflection;

namespace EventStoreService.Configuration.Strategy
{
    internal abstract class InstanceStrategy
    {
        public static InstanceStrategy Create(EventStoreElement configuration)
        {
            switch (configuration.Arguments)
            {
                case ArgumentKind.Json:
                    return new JsonConfigStrategy();
                case ArgumentKind.CommandLine:
                    return new CommandLineStrategy();
                default:
                    throw new ArgumentOutOfRangeException();
            }
        }

        public EventStoreInstanceInfo GetInstanceInfo(EventStoreElement configuration)
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

            string fileName = Path.Combine(configuration.BinaryPath, exe);
            string arguments = GenerateArguments(ReadConfiguration(configuration));
            return new EventStoreInstanceInfo(fileName, arguments, OnStop);
        }

        protected abstract string GenerateArguments(IEnumerable<Argument> arguments);

        protected virtual void OnStop()
        {
        }

        private IEnumerable<Argument> ReadConfiguration(EventStoreElement configuration)
        {
            IEnumerable<Argument> arguments = ReadConfigurationElement(configuration.Database);

            switch (configuration.RunMode)
            {
                case RunMode.SingleNode:
                    arguments = arguments.Union(ReadConfigurationElement(configuration.SingleNode));
                    break;
                case RunMode.Cluster:
                    arguments = arguments.Union(ReadConfigurationElement(configuration.Cluster));
                    break;
                default:
                    throw new ArgumentOutOfRangeException();
            }

            return arguments;
        }

        private static IEnumerable<Argument> ReadConfigurationElement(ConfigurationElement element)
        {
            var arguments = new List<Argument>();

            var collection = element as ConfigurationElementCollection;

            if (collection != null)
            {
                foreach (ConfigurationElement child in collection)
                {
                    arguments.AddRange(ReadConfigurationElement(child));
                }
            }
            else
            {
                foreach (PropertyInfo property in element.GetType().GetProperties())
                {
                    object propertyValue = property.GetValue(element, null);

                    if (typeof (ConfigurationElement).IsAssignableFrom(property.PropertyType))
                    {
                        arguments.AddRange(ReadConfigurationElement((ConfigurationElement) propertyValue));
                    }

                    var argument = new Argument(property, propertyValue);
                    if (argument.Include())
                    {
                        arguments.Add(argument);
                    }
                }
            }
            return arguments;
        }
    }
}