using System;

namespace EventStoreService
{
    public class EventStoreInstanceInfo : IDisposable
    {
        private readonly Action _onStop;

        public EventStoreInstanceInfo(string fileName, string arguments, Action onStop = null)
        {
            if (fileName == null) throw new ArgumentNullException("fileName");
            if (arguments == null) throw new ArgumentNullException("arguments");
            FileName = fileName;
            Arguments = arguments;
            _onStop = onStop ?? (() => { });
        }

        public string FileName { get; private set; }
        public string Arguments { get; private set; }

        public void Dispose()
        {
            _onStop();
        }
    }
}