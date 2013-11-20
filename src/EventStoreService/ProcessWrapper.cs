using System.Diagnostics;
using EventStoreService.Configuration;

namespace EventStoreService
{
    public abstract class ProcessWrapper
    {
        public abstract void Start();
        public abstract void Stop();

        protected virtual void OnStart(Process process){}
        protected virtual void OnStop(Process process) { }

        public static ProcessWrapper Create(EventStoreElement configuration)
        {
            if (configuration.Debug)
            {
                return new DebugProcessWrapper(configuration);
            }
            return new DefaultProcessWrapper(configuration);
        }
    }
}