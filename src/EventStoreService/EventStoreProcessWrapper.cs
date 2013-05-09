using System;
using System.Diagnostics;
using System.Net;
using EventStoreService.Configuration;

namespace EventStoreService
{
    public class EventStoreProcessWrapper
    {
        private Process _process;
        private readonly IServiceConfiguration _configuration;
        private readonly IPAddress _address;

        public EventStoreProcessWrapper(IServiceConfiguration configuration, IPAddress address)
        {
            _configuration = configuration;
            _address = address;
        }

        public void Start()
        {
            var info = _configuration.GetProcessStartInfo(_address);

            var process = new Process { StartInfo = info, EnableRaisingEvents = true };

            //                string name = instance.Name.ToLowerInvariant();
            //                DataReceivedEventHandler outputHandler = (s, e) => File.AppendAllLines(string.Format("{0}-output.log", name), e.Data.Split(Environment.NewLine.ToCharArray()));
            //                DataReceivedEventHandler errorHandler = (s, e) => File.AppendAllLines(string.Format("{0}-error.log", name), e.Data.Split(Environment.NewLine.ToCharArray()));
            //                process.ErrorDataReceived += errorHandler;
            //                process.OutputDataReceived += outputHandler;

            process.Start();
            process.BeginErrorReadLine();
            process.BeginOutputReadLine();

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