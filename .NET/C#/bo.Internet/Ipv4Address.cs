using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Net;
using System.Net.NetworkInformation;
using System.Net.Sockets;

namespace bo.Internet
{
    public class Ipv4Address
    {
        private Ipv4Quad _Address;
        public Ipv4Quad address
        {
            get { return _Address; }
        }

        private Ipv4Quad _Mask;
        public Ipv4Quad mask
        {
            get { return _Mask; }
        }

        public int CIDR
        {
            get
            {
                //CIDR
                return 1;
            }
        }
        

        public Ipv4Address(IPAddress ipAddress)
        {
            if (ipAddress.AddressFamily == AddressFamily.InterNetwork)
            {
                _Address = new Ipv4Quad(ipAddress);
                IPAddress ipv4Mask = null;
                _Mask = new Ipv4Quad(ipv4Mask);
            }
        }

        public Ipv4Address(Ipv4Quad address, Ipv4Quad mask)
        {
            _Address = address;
            _Mask = mask;
        }

        public static ICollection<Ipv4Address> All()
        {
            List<Ipv4Address> result = new List<Ipv4Address>();
            foreach (NetworkInterface netInterface in NetworkInterface.GetAllNetworkInterfaces())
            {
                IPInterfaceProperties ipProperties = netInterface.GetIPProperties();

                UnicastIPAddressInformationCollection unicastIPAddresses = ipProperties.UnicastAddresses;
                foreach (UnicastIPAddressInformation unicastIPAddress in unicastIPAddresses)
                {
                    IPAddress ipAddress = unicastIPAddress.Address;
                    if (ipAddress.AddressFamily == AddressFamily.InterNetwork)
                    {
                        IPAddress ipv4Mask = unicastIPAddress.IPv4Mask;
                        //if (null != ipv4Mask)
                        result.Add(new Ipv4Address(new Ipv4Quad(ipAddress), new Ipv4Quad(ipv4Mask)));
                    }
                }
            }
            return result;
        }

        public bool InSameSubnet(Ipv4Quad ipv4Quad)
        {
            uint maskValue = mask.Value;
            uint ipv4QuadNetwork = ipv4Quad.Value & maskValue;
            uint myNetwork = address.Value & maskValue;
            bool result = (maskValue != 0) && (ipv4QuadNetwork == myNetwork);
            return result;
        }

        public bool InSameSubnet(ICollection<Ipv4Quad> ipv4Quads)
        {
            foreach (Ipv4Quad ipv4Quad in ipv4Quads)
            {
                if (InSameSubnet(ipv4Quad))
                    return true;
            }
            return false;
        }

        public override string ToString()
        {
            string result = (null == mask) || (mask.Value == 0) ?
                address.ToString()
                :
                string.Format("{0}/{1}", address, mask);
            return result;
        }
                
    }
}
