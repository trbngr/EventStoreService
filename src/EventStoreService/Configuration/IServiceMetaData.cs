namespace EventStoreService.Configuration
{
    public interface IServiceMetaData
    {
        string ServiceName { get; }
        string Description { get; }
        string DisplayName { get; }
    }
}