#!/bin/python3

import argparse
from socket import *

# Usage: python PortScanner.y -a 192.168.0.1 -p 21,80


def printBanner(connSocket, tgPort):
    try:
        # Send data to target
        if(tgPort == 80):
            connSocket.send("GET HTTP/1.1 \r\n")
        else:
            connSocket.send("\r\n")

        # Recive data from target, 4096 is the number of bytes of buffer value
        results = connSocket.recv(4096)
        print("[+] Banner: " + str(results))
    except:
        print("[-] Banner not avaiable\n")


def connScan(tgHost, tgPort):
    try:
        # create the socket object
        connSocket = socket(AF_INET, SOCK_STREAM)
        # try to connect with the target
        connSocket.connect((tgHost, tgPort))
        print("[+] {0} tcp open").format(tgPort)
        printBanner(connSocket, tgPort)
    except:
        # print the failure results
        print("[+] {0} tcp closed").format(tgPort)
    finally:
        # close the socket object
        connSocket.close()


def portScan(tgHost, tgPorts):
    try:
        # if -a was not an IP address this will resolve it an IP
        tgIP = gethostbyname(tgHost)
    except:
        print("[-] Error: Unkown Host")
        exit(0)

    setdefaulttimeout(10)

    # for each port number call the connScan function
    for tgPort in tgPorts:
        connScan(tgHost, int(tgPort))


def main():
    # Parse the command line arguments

    parser = argparse.ArgumentParser('Smart TCP Client Scanner')
    parser.add_argument("-a", "--address", type=str,
                        help="The target IP address")
    parser.add_argument("-p", "--port", type=str,
                        help="The port number to connect with")
    args = parser.parse_args()

    # Store the arguments values
    ipaddress = args.address
    portNumbers = args.port.split(",")

    # Call the port scan function
    portScan(ipaddress, portNumbers)


if __name__ == "__main__":
    main()
