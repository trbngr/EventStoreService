using System;
using EventStoreService.Configuration;
using Topshelf;

namespace EventStoreService
{
    class Program
    {
        static void Main()
        {
            var configuration = EventStoreServiceConfiguration.Instance;

            HostFactory.Run(x =>
            {
                x.RunAsLocalSystem();
                x.StartAutomatically();
                x.EnableShutdown();
                x.EnableServiceRecovery(c => c.RestartService(1));

                x.Service<EventStoreProcessWrapper>(s =>
                {
                    s.ConstructUsing(name => new EventStoreProcessWrapper(configuration.EventStore));
                    s.WhenStarted(tc => tc.Start());
                    s.WhenStopped(tc => tc.Stop());
                });

                var windowsService = configuration.WindowsService;

                x.SetDescription(windowsService.Description);
                x.SetDisplayName(windowsService.DisplayName);
                x.SetServiceName(windowsService.ServiceName);
            }); 

            Console.ReadLine();
        }

    }
}
