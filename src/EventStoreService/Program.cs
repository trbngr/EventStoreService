using System;
using System.Configuration;
using System.Linq;
using System.Net;
using System.Net.Sockets;
using Topshelf;

namespace EventStoreService
{
    class Program
    {
        static void Main()
        {
            var configuration = (EventStoreServiceConfiguration)ConfigurationManager.GetSection("eventStore");
            var address = GetIpAddress();

            foreach (ServiceInstance instance in configuration.Instances)
            {
                var metaData = instance.MetaData;

                HostFactory.Run(x =>
                {
                    x.RunAsLocalSystem();
                    x.StartAutomatically();
                    x.EnableShutdown();
                    x.EnableServiceRecovery(c => c.RestartService(1));

                    x.Service<EventStoreProcessWrapper>(s =>
                    {
                        s.ConstructUsing(name => new EventStoreProcessWrapper(configuration.FilePath, address, instance));
                        s.WhenStarted(tc => tc.Start());
                        s.WhenStopped(tc => tc.Stop());
                    });

                    x.SetDescription(metaData.Description);
                    x.SetDisplayName(metaData.DisplayName);
                    x.SetServiceName(metaData.ServiceName);
                }); 
            }

            Console.ReadLine();
        }

        private static IPAddress GetIpAddress()
        {
            return Dns.GetHostAddresses(Dns.GetHostName()).First(a => a.AddressFamily == AddressFamily.InterNetwork && !a.Equals(IPAddress.Loopback));
        }
    }
}
