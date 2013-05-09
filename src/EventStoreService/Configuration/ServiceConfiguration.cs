using System;
using System.Configuration;
using System.Diagnostics;
using System.Net;
using System.Text;

namespace EventStoreService.Configuration
{
    public class ServiceConfiguration : ConfigurationSection, IServiceConfiguration
    {
        [ConfigurationProperty("service", IsRequired = true)]
        public ServiceMetaData Service
        {
            get { return (ServiceMetaData) this["service"]; }
            set { this["service"] = value; }
        }

        [ConfigurationProperty("filePath", IsRequired = true)]
        public string FilePath
        {
            get { return (string) this["filePath"]; }
            set { this["filePath"] = value; }
        }
        [ConfigurationProperty("useLoopback", IsRequired = false, DefaultValue = false)]
        public bool UseLoopback
        {
            get { return (bool)this["useLoopback"]; }
            set { this["useLoopback"] = value; }
        }

        [ConfigurationProperty("skipDbVerify", IsRequired = false, DefaultValue = false)]
        public bool SkipDbVerify
        {
            get { return (bool)this["skipDbVerify"]; }
            set { this["skipDbVerify"] = value; }
        }

        [ConfigurationProperty("tcpPort", IsRequired = false, DefaultValue = 1113)]
        public int TcpPort
        {
            get { return (int)this["tcpPort"]; }
            set { this["tcpPort"] = value; }
        }

        [ConfigurationProperty("httpPort", IsRequired = false, DefaultValue = 2113)]
        public int HttpPort
        {
            get { return (int)this["httpPort"]; }

            set { this["httpPort"] = value; }
        }

        [ConfigurationProperty("dbPath", IsRequired = true)]
        public string DbPath
        {
            get { return (string)this["dbPath"]; }
            set { this["dbPath"] = value; }
        }

        [ConfigurationProperty("logsPath", IsRequired = false, DefaultValue = null)]
        public string LogsPath
        {
            get { return (string)this["logsPath"]; }
            set { this["logsPath"] = value; }
        }

        [ConfigurationProperty("cachedChunkCount", IsRequired = true)]
        public int CachedChunkCount
        {
            get { return (int)this["cachedChunkCount"]; }
            set { this["cachedChunkCount"] = value; }
        }

        [ConfigurationProperty("runProjections", IsRequired = false)]
        public bool RunProjections
        {
            get
            {
                object run = this["runProjections"];
                if (run != null)
                {
                    return (bool)run;
                }
                return false;
            }
            set { this["runProjections"] = value; }
        }

        public ProcessStartInfo GetProcessStartInfo(IPAddress address)
        {
            string arguments = GetProcessArguments(address);

            return new ProcessStartInfo(FilePath, arguments)
            {
                FileName = FilePath,
                Arguments = arguments,
                UseShellExecute = false,
                RedirectStandardError = true,
                RedirectStandardOutput = true,
            };
        }

        private string GetProcessArguments(IPAddress address)
        {
            if (address == null) throw new ArgumentNullException("address");

            var sb = new StringBuilder();

            sb.AppendFormat("--tcp-port {0} ", TcpPort);
            sb.AppendFormat("--http-port {0} ", HttpPort);
            sb.AppendFormat("--db {0} ", DbPath);
            sb.AppendFormat("--c {0} ", CachedChunkCount);

            if (!UseLoopback)
            {
                sb.AppendFormat("--ip {0} ", address);
            }

            if (!string.IsNullOrWhiteSpace(LogsPath))
            {
                sb.AppendFormat("--logsdir {0} ", LogsPath);
            }

            if (SkipDbVerify)
            {
                sb.Append("--skip-db-verify ");
            }

            if (RunProjections)
            {
                sb.Append("--run-projections ");
            }

            return sb.ToString().Trim();
        }


        public static IServiceConfiguration Read()
        {
            return (IServiceConfiguration) ConfigurationManager.GetSection("eventStore");
        }
    }
}