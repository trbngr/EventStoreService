using System;
using System.Diagnostics;
using EventStoreService.Configuration;
using log4net;

namespace EventStoreService
{
    public class DefaultProcessWrapper : ProcessWrapper
    {
        protected static readonly ILog Log = LogManager.GetLogger(typeof (DefaultProcessWrapper));
        private readonly Process _process;
        private readonly EventStoreInstanceInfo _instanceInfo;

        public DefaultProcessWrapper(EventStoreElement configuration)
        {
            _instanceInfo = configuration.GetEventStoreInstanceInfo();

            var startInfo = new ProcessStartInfo(_instanceInfo.FileName, _instanceInfo.Arguments)
            {
                RedirectStandardError = true,
                RedirectStandardOutput = true,
                UseShellExecute = false
            };

            _process = new Process { StartInfo = startInfo, EnableRaisingEvents = true };
        }

        public override void Start()
        {
            Log.InfoFormat("{0} {1}", _process.StartInfo.FileName, _process.StartInfo.Arguments);

            OnStart(_process);
            _process.Start();
            _process.BeginErrorReadLine();
            _process.BeginOutputReadLine();
        }

        public override void Stop()
        {
            _instanceInfo.Dispose();
            _process.Refresh();

            OnStop(_process);

            if (_process.HasExited) return;

            _process.Kill();
            _process.WaitForExit(TimeSpan.FromSeconds(10).Milliseconds);
            _process.Dispose();
        }
    }
}