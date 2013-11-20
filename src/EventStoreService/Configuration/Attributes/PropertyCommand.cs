using System;

// ReSharper disable once CheckNamespace
public class CommandLineArgumentAttribute : Attribute
{
    public CommandLineArgumentAttribute(string command)
    {
        Command = command;
    }

    public string Command { get; private set; }
}