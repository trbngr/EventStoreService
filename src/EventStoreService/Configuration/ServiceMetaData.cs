using System.Configuration;

namespace EventStoreService.Configuration
{
    public class ServiceMetaData : ConfigurationElement, IServiceMetaData
    {
        [ConfigurationProperty("name", IsRequired = true)]
        public string ServiceName
        {
            get { return (string) this["name"]; }
            set { this["name"] = value; }
        }

        [ConfigurationProperty("description", IsRequired = true)]
        public string Description
        {
            get { return (string) this["description"]; }
            set { this["description"] = value; }
        }

        [ConfigurationProperty("displayName", IsRequired = true)]
        public string DisplayName
        {
            get { return (string) this["displayName"]; }
            set { this["displayName"] = value; }
        }
    }
}