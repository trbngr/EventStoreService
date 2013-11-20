using System.Collections.Generic;
using System.IO;
using System.Linq;
using EventStoreService.Configuration.Serialization;
using log4net;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;

namespace EventStoreService.Configuration.Strategy
{
    internal class JsonConfigStrategy : InstanceStrategy
    {
        private static readonly ILog Log = LogManager.GetLogger(typeof (JsonConfigStrategy));

        private readonly string _configFile;
        private readonly JsonSerializer _jsonSerializer;

        public JsonConfigStrategy()
        {
            _configFile = Path.GetTempFileName();
            _jsonSerializer = new JsonSerializer();
            _jsonSerializer.Converters.Add(new IPAddressConverter());
            _jsonSerializer.Converters.Add(new IPEndPointConverter());
        }

        protected override string GenerateArguments(IEnumerable<Argument> arguments)
        {
            IEnumerable<IGrouping<string, Argument>> groupings = arguments.GroupBy(a => a.JsonProperty);

            IEnumerable<JProperty> properties = from grouping in groupings
                let o = grouping.Count() > 1
                    ? grouping.Select(a => a.Value).ToArray()
                    : grouping.First().Value
                select new JProperty(grouping.Key, JToken.FromObject(o, _jsonSerializer));

            var configObject = new JObject(properties);

            using (var writer = new StreamWriter(File.OpenWrite(_configFile)))
            {
                writer.Write(JsonConvert.SerializeObject(configObject, Formatting.Indented));
            }

            const string command = Opts.ConfigsCmd;
            string substring = command.Substring(0, command.IndexOf('|'));
            return string.Format("--{0} {1}", substring, _configFile);
        }

        protected override void OnStop()
        {
            Log.InfoFormat("removing json config file: {0}", _configFile);
            File.Delete(_configFile);
        }
    }
}