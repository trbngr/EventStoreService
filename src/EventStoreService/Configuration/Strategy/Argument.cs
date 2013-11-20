using System;
using System.Configuration;
using System.Linq;
using System.Net;
using System.Reflection;

namespace EventStoreService.Configuration.Strategy
{
    internal class Argument
    {
        private readonly PropertyInfo _property;
        private bool _requiresValue;

        public Argument(PropertyInfo property, object value)
        {
            _property = property;
            Value = value;
        }

        public bool Include()
        {
            var propertyCommandAttribute = _property.GetCustomAttribute<CommandLineArgumentAttribute>();
            if (propertyCommandAttribute == null)
                return false;

            var jsonPropertyAttribute = _property.GetCustomAttribute<JsonPropertyAttribute>();
            if (jsonPropertyAttribute == null)
                return false;

            var configurationPropertyAttribute = _property.GetCustomAttribute<ConfigurationPropertyAttribute>();
            if (configurationPropertyAttribute == null)
                return false;

            if (!configurationPropertyAttribute.IsRequired && IsDefaultValue(Value, configurationPropertyAttribute))
                return false;

            string command = propertyCommandAttribute.Command;
            string[] commands = command.Split(new[] { '|' }, StringSplitOptions.RemoveEmptyEntries);

            CommandLineArgument = commands.First().TrimEnd('=');
            _requiresValue = command.EndsWith("=");

            JsonProperty = jsonPropertyAttribute.Property;

            return true;
        }

        private static bool IsDefaultValue(object propertyValue, ConfigurationPropertyAttribute configurationPropertyAttribute)
        {
            var type = propertyValue.GetType();

            if (type == typeof(IPAddress) || type == typeof(IPEndPoint))
                return propertyValue.ToString().Equals(configurationPropertyAttribute.DefaultValue.ToString());

            return propertyValue.Equals(configurationPropertyAttribute.DefaultValue);
        }

        public string CommandLineArgument { get; private set; }

        public string JsonProperty { get; private set; }

        public object Value { get; private set; }

        public override string ToString()
        {
            if (_requiresValue)
                return String.Format("--{0} {1}", CommandLineArgument, Value);
            return String.Format("--{0}", String.Concat(CommandLineArgument, (bool)Value ? "" : "-"));
        }
    }
}