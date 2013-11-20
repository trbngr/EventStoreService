using System;
using System.ComponentModel;
using System.Globalization;
using System.Net;

namespace EventStoreService.Configuration
{
    public partial class IPAddressTypeConverter
    {
        private IPAddress ConvertFromStringToIPAddress(ITypeDescriptorContext context,
            CultureInfo culture, string value)
        {
            return IPAddress.Parse(value);
        }

        private string ConvertToIPAddressFromString(ITypeDescriptorContext context, CultureInfo culture, IPAddress value,
            Type type)
        {
            return value.ToString();
        }
    }
}