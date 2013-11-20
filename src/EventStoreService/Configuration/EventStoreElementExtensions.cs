using EventStoreService.Configuration.Strategy;

namespace EventStoreService.Configuration
{
    public static class EventStoreElementExtensions
    {
        public static EventStoreInstanceInfo GetEventStoreInstanceInfo(this EventStoreElement configuration)
        {
            var strategy = InstanceStrategy.Create(configuration);
            return strategy.GetInstanceInfo(configuration);
        }
    }
}