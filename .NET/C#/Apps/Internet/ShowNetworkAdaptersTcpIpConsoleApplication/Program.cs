using System;
using System.Collections.Generic;
using bo.Internet;
using System.Net;

namespace ShowNetworkAdaptersTcpIpConsoleApplication
{
    class Program : bo.ConsoleProgram
    {
        protected override int logic(string[] args)
        {
            string hostname = "TEST-W2K3"; // ... = Dns.GetHostName();
            ICollection<Ipv4Quad> hostIpv4Quads = Ipv4Quad.From(Dns.GetHostEntry(hostname));
            log("hostname: {0}", hostname);
            foreach (Ipv4Quad hostIpv4Quad in hostIpv4Quads)
            {
                log("hostIpv4Quad: {0}", hostIpv4Quad);
            }
            log("--------------------");
            Ipv4Quad ipv4Quad1 = new Ipv4Quad("192.168.71.25");
            Ipv4Quad ipv4Quad2 = new Ipv4Quad("192.168.171.25");
            log("ipv4Quad1: {0}", ipv4Quad1);
            log("ipv4Quad2: {0}", ipv4Quad2);

            ICollection<Ipv4Quad> ipv4Quads = Ipv4Quad.All();
            foreach (Ipv4Quad ipv4Quad in ipv4Quads)
            {
                log("dotted quad: {0}", ipv4Quad);
            }
            ICollection<Ipv4Address> ipv4Addresses = Ipv4Address.All();
            foreach (Ipv4Address ipv4Address in ipv4Addresses)
            {
                log("IPv4: {0}", ipv4Address);
                if (ipv4Address.InSameSubnet(ipv4Quad1))
                    log("ipv4Quad1 is in the same subnet");
                if (ipv4Address.InSameSubnet(ipv4Quad2))
                    log("ipv4Quad2 is in the same subnet");
                if (ipv4Address.InSameSubnet(hostIpv4Quads))
                    log("{0} is in the same subnet", hostname);
            }
            return base.logic(args);
        }

        static void Main(string[] args)
        {
#if DEBUG
            new Program().debugMain(args);
#else
            new Program().regularMain(args);
#endif
        }
    }
}
