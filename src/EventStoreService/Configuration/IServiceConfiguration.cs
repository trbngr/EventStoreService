using System.Diagnostics;
using System.Net;

namespace EventStoreService.Configuration
{
    public interface IServiceConfiguration
    {
        ServiceMetaData Service { get; }

        string FilePath { get; }

        bool UseLoopback { get; }
        bool SkipDbVerify { get; }
        int TcpPort { get; }
        int HttpPort { get; }
        string DbPath { get; }
        string LogsPath { get; }
        int CachedChunkCount { get; }
        bool RunProjections { get; }

        ProcessStartInfo GetProcessStartInfo(IPAddress address);
    }
}