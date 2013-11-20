using System;
using System.ComponentModel;
using System.Globalization;
using System.IO;
using System.Net;

namespace EventStoreService.Configuration
{
    public partial class IPEndPointTypeConverter
    {
        private IPEndPoint ConvertFromStringToIPEndPoint(ITypeDescriptorContext context, CultureInfo culture,
            string value)
        {
            var parts = value.Split(new []{':'});
            if(parts.Length != 2)
                throw new InvalidDataException(string.Format("Invalid endpoint '{0}'. Expected format is 127.0.0.1:1113", value));
            var address = IPAddress.Parse(parts[0]);
            var port = int.Parse(parts[1]);

            return new IPEndPoint(address, port);
        }

        private string ConvertToIPEndPointFromString(ITypeDescriptorContext context, CultureInfo culture,
            IPEndPoint value, Type type)
        {
            return value.ToString();
        }
    }
}