using System;
using System.Net;
using Newtonsoft.Json;

namespace EventStoreService.Configuration.Serialization
{
    public class IPAddressConverter : ToStringConverter<IPAddress>
    {
        public override object ReadJson(JsonReader reader, Type objectType, object existingValue, JsonSerializer serializer)
        {
            throw new NotImplementedException();
        }
    }
}