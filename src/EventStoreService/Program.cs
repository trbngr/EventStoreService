using System;
using System.Diagnostics;
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
                x.RunAsLocalService();
                x.StartAutomatically();
                x.EnableShutdown();
                x.EnableServiceRecovery(c => c.RestartService(1));

                x.UseLog4Net("Log4Net.config");

                x.Service<ProcessWrapper>(s =>
                {
                    s.ConstructUsing(name => ProcessWrapper.Create(configuration.EventStore));
                    s.WhenStarted(tc => tc.Start());
                    s.WhenStopped(tc => tc.Stop());
                });

                var windowsService = configuration.WindowsService;

                x.SetDescription(windowsService.Description);
                x.SetDisplayName(windowsService.DisplayName);
                x.SetServiceName(windowsService.ServiceName);
            }); 
        }
    }
}
