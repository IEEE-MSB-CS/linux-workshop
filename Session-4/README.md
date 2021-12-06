# Session 4

The Difference between Local and Public IP addresses
IP address allocation(Static, DHCP)
Data Packets
Gateways
Network Address Classes
Domain Name Systems(DNS)
Open Systems Interconnection(OSI) Model
TCP/IP Stack
SSH
SCP
Network Configuration
Ping
Traceroute
NSLOOKUP
Network Configuration File

# Capturing the traffic

We have so many tool to capture the traffic, but we will discuss the most important tools [GUI, command line].

- Wireshark [GUI]
- tcpdump [Command line]
-

## Wireshark

start as sudo user

- using filters (so important when large file in hand)
  inside filter: ip.addr == 192.0.2.1 and port 80
- importing and exporting

in terminal
route -n -> routing table

## tcpdump

- tcpdump -nn -X -v -s0 -i wlo1
  (-nn) to prevent resolving
  (-i) for the interface
  (-v) verbosity
  (-X) print data using HEX and ASCII
  (-s0) don't truncate the the packet if it's too big

- tcpdump -nn {tcp| udp|icmp | arp| ip} {and|or|not} {port} {and| or|not} {dst|src| host} 8.8.8.9

for example:
tcpdump -nn tcp and port 80 and host 192.168.1.1 -i wlo1 -s0

then go open the 192.168.1.1 (router homepage)
To redirect to the output to file
tcpdump -nn tcp and port 80 and host 192.168.1.1 -i wlo1 -s0 -w
(-w) write to the file
to read from file (-r)
tcpdump -nn -r ftp.pcap

tcpick is more verbous
tcpick -C -yP -r ftbTcpdump.pcapng

Task
