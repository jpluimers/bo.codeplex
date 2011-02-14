using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Net;
using System.Net.NetworkInformation;
using System.Net.Sockets;

namespace bo.Internet
{
    public class Ipv4Quad
    {
        private byte _B1;
        public byte B1
        {
            get { return _B1; }
        }

        private byte _B2;
        public byte B2
        {
            get { return _B2; }
        }

        private byte _B3;
        public byte B3
        {
            get { return _B3; }
        }

        private byte _B4;
        public byte B4
        {
            get { return _B4; }
        }

        public byte[] Bytes
        {
            get
            {
                // be compatible with the inet_addr function (http://msdn.microsoft.com/en-us/library/ms738563.aspx) 
                // and in_addr structure (http://msdn.microsoft.com/en-us/library/ms738571.aspx)
                byte[] result = { B1, B2, B3, B4 };
                return result;
            }
        }

        public bool IsNull
        {
            get { return Value == 0; }
        }

        public uint Value
        {
            get 
            {
                uint result = BitConverter.ToUInt32(Bytes, 0);
                return result; 
            }
        }        

        public Ipv4Quad(byte b1, byte b2, byte b3, byte b4)
        {
            _B1 = b1;
            _B2 = b2;
            _B3 = b3;
            _B4 = b4;
        }

        public Ipv4Quad(string ipString): this(IPAddress.Parse(ipString))
        {
        }

        /// <summary>
        /// Initializes a new instance of the Ipv4Quad class.
        /// </summary>
        public Ipv4Quad(IPAddress ipAddress)
        {
            if (null != ipAddress)
            {
                if (ipAddress.AddressFamily != AddressFamily.InterNetwork)
                    throw new InvalidEnumArgumentException("ipAddress", (int)(ipAddress.AddressFamily), typeof(IPAddress));
                byte[] addressBytes = ipAddress.GetAddressBytes();
                _B1 = addressBytes[0];
                _B2 = addressBytes[1];
                _B3 = addressBytes[2];
                _B4 = addressBytes[3];
            }
        }

        public IPAddress IPAddress
        {
            get
            {
                byte[] address = { B1, B2, B3, B4 };
                return new IPAddress(address);
            }
        }

        public override bool Equals(object obj)
        {
            Ipv4Quad ipv4Quad = obj as Ipv4Quad;
            if (null == ipv4Quad)
                return base.Equals(obj);
            else
                return (
                    (this.B1 == ipv4Quad.B1) &&
                    (this.B3 == ipv4Quad.B2) &&
                    (this.B3 == ipv4Quad.B3) &&
                    (this.B4 == ipv4Quad.B4)
                    );
        }

        public override string ToString()
        {
            return IPAddress.ToString();
        }

        public static ICollection<Ipv4Quad> All()
        {
            List<Ipv4Quad> result = new List<Ipv4Quad>();
            foreach (NetworkInterface netInterface in NetworkInterface.GetAllNetworkInterfaces())
            {
                IPInterfaceProperties ipProperties = netInterface.GetIPProperties();

                UnicastIPAddressInformationCollection unicastIPAddresses = ipProperties.UnicastAddresses;
                foreach (UnicastIPAddressInformation unicastIPAddress in unicastIPAddresses)
                {
                    IPAddress ipAddress = unicastIPAddress.Address;
                    if (ipAddress.AddressFamily == AddressFamily.InterNetwork)
                        result.Add(new Ipv4Quad(ipAddress));
                }
            }
            return result;
        }

        public static ICollection<Ipv4Quad> From(IPHostEntry IPHostEntry)
        {
            return From(IPHostEntry.AddressList);
        }

        public static ICollection<Ipv4Quad> From(IPAddress[] addressList)
        {
            ICollection<Ipv4Quad> result = new List<Ipv4Quad>();
            foreach (IPAddress address in addressList)
            {
                result.Add(new Ipv4Quad(address));
            }
            return result;

        }

    }
}
