using System;

// ReSharper disable once CheckNamespace
public class JsonPropertyAttribute : Attribute
{
    public string Property { get; private set; }

    public JsonPropertyAttribute(string property)
    {
        Property = property;
    }
}