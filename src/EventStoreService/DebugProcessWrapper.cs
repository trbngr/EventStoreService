using System.Diagnostics;
using EventStoreService.Configuration;

namespace EventStoreService
{
    internal class DebugProcessWrapper : DefaultProcessWrapper
    {
        public DebugProcessWrapper(EventStoreElement configuration) : base(configuration)
        {
        }

        protected override void OnStart(Process process)
        {
            process.OutputDataReceived += WriteToFile;
            process.ErrorDataReceived += WriteToFile;
        }

        private void WriteToFile(object sender, DataReceivedEventArgs e)
        {
            Log.Info(e.Data);
        }

        protected override void OnStop(Process process)
        {
            process.OutputDataReceived -= WriteToFile;
            process.ErrorDataReceived -= WriteToFile;
        }
    }
}