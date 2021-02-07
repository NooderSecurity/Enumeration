import os
import sys
import socket

def Enumerate(host):
    ports = [ 21,22,25,53,80,110,137,143,161,389,443,445 ]
    print("")
    for port in ports:
        try:
            sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
            sock.settimeout(1000)
            sock.connect((host, port))
            sock.sendall(b"a")
            sock.close()
            print(f"{host}:{port}\t:\tOpen")
        except TimeoutError:
            print(f"{host}:{port}\t:\tTimed out")
        except ConnectionRefusedError:
            print(f"{host}:{port}\t:\tClosed/Filtered")
        except KeyboardInterrupt:
            exit()

if (__name__ == "__main__"):
    if (len(sys.argv) < 2 or len(sys.argv) > 2):
        print("Usage: portenum.py host")
    else:
        Enumerate(sys.argv[1])
        print("Created By Mxmnt @ NooderSecurity")
