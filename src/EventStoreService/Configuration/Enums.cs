namespace EventStoreService.Configuration
{
    public enum RunProjections
    {
        None,
        System,
        All
    }

    public enum RunMode
    {
        SingleNode,
        Cluster
    }

    public enum ArgumentKind
    {
        Json,
        CommandLine
    }
}