using System;

// ReSharper disable once CheckNamespace
public class PropertyCommandAttribute : Attribute
{
    public PropertyCommandAttribute(string command)
    {
        Command = command;
    }

    public string Command { get; private set; }
}