using System;
using System.Linq;
using System.Net;
using System.Net.Sockets;
using EventStoreService.Configuration;
using Topshelf;

namespace EventStoreService
{
    class Program
    {
        static void Main()
        {
            var configuration = ServiceConfiguration.Read();
            var address = GetIpAddress();

            HostFactory.Run(x =>
            {
                x.RunAsLocalSystem();
                x.StartAutomatically();
                x.EnableShutdown();
                x.EnableServiceRecovery(c => c.RestartService(1));

                x.Service<EventStoreProcessWrapper>(s =>
                {
                    s.ConstructUsing(name => new EventStoreProcessWrapper(configuration, address));
                    s.WhenStarted(tc => tc.Start());
                    s.WhenStopped(tc => tc.Stop());
                });

                x.SetDescription(configuration.Service.Description);
                x.SetDisplayName(configuration.Service.DisplayName);
                x.SetServiceName(configuration.Service.ServiceName);
            }); 

            Console.ReadLine();
        }

        private static IPAddress GetIpAddress()
        {
            return Dns.GetHostAddresses(Dns.GetHostName()).First(a => a.AddressFamily == AddressFamily.InterNetwork && !a.Equals(IPAddress.Loopback));
        }
    }
}
