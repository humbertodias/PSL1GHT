#!/usr/bin/env python
import socket
import sys
UDP_IP=''
UDP_PORT=18194

sock = socket.socket( socket.AF_INET,  socket.SOCK_DGRAM )
sock.bind( (UDP_IP,UDP_PORT) )

out = sys.stdout
if hasattr(out, 'buffer'):
	out = out.buffer

while True:
	data, addr = sock.recvfrom( 1024 ) # buffer size is 1024 bytes
	out.write(data)
	out.flush()

