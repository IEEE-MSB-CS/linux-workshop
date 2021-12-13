# Session 7

An Introduction to Python.

## Table of contents

## Resources

## Networking penetration testing with python

### Writing TCP client

What can we do with a tcp client?

- Banner Grabbing
- Port Scanner
- Vulnerability scanner: if you have a list of ports and services, then all you need is Vulnerability database saved on a database and you match it with your results, and you can even start metasploit and start exploiting those vulns.

**always close the socket object**

look at PortScanner.py

### Writing TCP server

what can we do with a tcp server?

- Listener that could interact with a tcp client that execute as a backdoor (reverseshell)
- Proxy server listen for tcp traffic

##### To be organized (Askar)

# Session 6

## how to use pip

An introduction to python.

## Building the Lab

Lap setup:

- python 2.7.x
- Vmware Workstation or VirtualBox
- Two Win7 machines:
  bob-machine
  attacker-machine
  make sure that the machines are connected using NAT

- one linux machine
- any code editor

## Network Security with python

### Introduction to netcat (nc & netcat)

netcat is used for data transmission between two devices

```bash
nc -vlp 1337 -e /bin/sh# listen for port 1337
```

### Python sockets

- What is sockets?
  [head to python documentation for more information].

https://docs.python.org/3/library/socket.html
https://realpython.com/python-sockets/

we need to know the address we want to connect to [host, port]

```py
#!/bin/python2.7
import socket, sys
host = sys.argv[1]
port = int(sys.argv[2])

sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM);
try:
    sock.connect(("localhost", 4040));
    print "[+] Connected"
except:
    print "[+] Error !! :("
sock.end("Hi\n");

```

then try to listen for port 4040 using nc
and run the script on another tab

```bash
python2.7 socket.py 127.0.0.1 4040
```

- Where can we use it?
- How can we use it as a security guys?
- let's play with python sockets

### Writing customized port scanner

- The scanner will be fully customized
- perform simple banner grabbing

We'll scan the bob-machine and extract all the open ports from it.

```py
import socket, sys
target = sys.argv[1];

ports = range(1, 2001);

for port in ports:

    try:
        sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        connect_ex((target, port))
        if(sock.connect_ex((host, port))) == 0:
            print "[+] The port {0} is open".format(port)
        else:
            print "[!] The port is {0} is closed".format(port)
    except socket.error:
        print "[!] Error with socket !"
```

banner grapping: knowing the service on which port using.

### Bypassing the traffic using socks

SOCKS server: pass all the tcp traffic unlink HTTP proxy which pass only the http traffic

https://www.giac.org/paper/gsec/2326/understanding-implementing-socks-server-guide-set-socks-environment/104018

tor:
https://www.linux.com/topic/networking/beginners-guide-tor-ubuntu/

- setup TOR on linux machine
- SOCKS library and how we can use it.
- live example about how we can change our identity

```python
#!/bin/python2.7

import socks, socket, urllib2



socks.setdefaultproxy(socks.PROXY_TYPE_SOCKS5, "localhost", 9050)

req1 = urllib2.urlopen("http://api.ipify.org/?format=text")
print "The real ip is: {0}".format(req1.read())

socket.socket = socks.socksocket # we will forward the traffic comes from sockety and forward the traffic throught socks


req2 = urllib2.urlopen("http://api.ipify.org/?format=text")
print "The SOCKS ip is: {0}".format(req2.read())
```

## Web application Security

- Send HTTP requests to the target
- Parsing HTTP response
- Exctract request headers
-

## Endpoint security

## Buffer Overflow basics with python

## Encryption basics with python

```

```

### tips

1. provide --help for your script
2. make your script more modular by dividing the logic.
3. provide comments and good description of your functions.
4. use exception handlers.

5. use validation for inputs as much as you can
6. test function by function
7. use threading wisely
