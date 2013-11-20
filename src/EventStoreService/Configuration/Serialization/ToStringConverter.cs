using System;
using Newtonsoft.Json;

namespace EventStoreService.Configuration.Serialization
{
    public abstract class ToStringConverter<T> : JsonConverter
    {
        public override void WriteJson(JsonWriter writer, object value, JsonSerializer serializer)
        {
            writer.WriteValue(value.ToString());
        }

        public override bool CanConvert(Type objectType)
        {
            return objectType == typeof (T);
        }
    }
}