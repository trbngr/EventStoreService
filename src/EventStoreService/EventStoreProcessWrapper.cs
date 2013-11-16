using System;
using System.Diagnostics;
using EventStoreService.Configuration;

namespace EventStoreService
{
    public class EventStoreProcessWrapper
    {
        private readonly EventStoreElement _configuration;
        private Process _process;

        public EventStoreProcessWrapper(EventStoreElement configuration)
        {
            _configuration = configuration;
        }

        public void Start()
        {
            ProcessStartInfo info = _configuration.GetProcessStartInfo();

            var process = new Process {StartInfo = info, EnableRaisingEvents = true};
            Console.Out.WriteLine("{0} {1}", info.FileName, info.Arguments);

            process.Start();

            process.Exited += (sender, args) => Stop();

            _process = process;
        }

        public void Stop()
        {
            _process.Refresh();

            if (_process.HasExited) return;

            _process.Kill();
            _process.WaitForExit(TimeSpan.FromSeconds(10).Milliseconds);
            _process.Dispose();
        }
    }
}