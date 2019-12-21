#  Hardware Unclonable Fingerprint V5.0
#  ====================================
#
#  identifier.py
#
#  Copyright 2019 Upsec Cyber Inc.
#
#  Author: Fang Hao (fanghao@upsec.cn)
#
import pickle
import os
import struct
import socket
import socketserver

import numpy as np

import signal

# def init_worker():
#     signal.signal(signal.SIGINT, signal.SIG_IGN)

# import multiprocessing
# pool = multiprocessing.Pool(multiprocessing.cpu_count(), init_worker)

def _recvall(sock, n):
    # Helper function to recv n bytes or return None if EOF is hit
    data = bytearray()
    while len(data) < n:
        packet = sock.recv(n - len(data))
        if not packet:
            return None
        data.extend(packet)
    return data

def send_msg(sock, msg):
    msg = struct.pack('<I', len(msg)) + msg
    sock.sendall(msg)

def recv_msg(sock):
    raw_msglen = _recvall(sock, 4)
    if not raw_msglen:
        return None
    msglen = struct.unpack('<I', raw_msglen)[0]
    return _recvall(sock, msglen)
    
def split_msg(msg):
    n = struct.unpack('<I', msg[:4])[0]
    return msg[4:4+n], msg[4+n:]

HOST, PORT = "127.0.0.1", 40868
import subprocess
import datetime

class MyHandler(socketserver.BaseRequestHandler):
    def handle(self):
        global g_count
        while True:
            msg = recv_msg(self.request)
            if msg is None:
                return
            raw, msg = split_msg(msg)
            filename_base = '/home/rfid/data/realtime/%s' % (datetime.datetime.now().strftime('%m%d-%H%M%S'), )
            print(filename_base[20:], 'recv', len(msg), msg[16:])
            f = open(filename_base+'.raw', 'wb')
            f.write(raw)
            f.close()
            f = open(filename_base+'.msg', 'wb')
            f.write(msg)
            f.close()         
            f = open('/home/rfid/data/receive', 'wb')
            f.write(raw)
            f.close()
            try:
                output = subprocess.check_output(["./run_m", "run('lorafiger_thread')"], universal_newlines=True)
                output = output[output.find('!!')+3:-2]
            except:
                output = 'err'
            print('idnt', output)

class MyServer(socketserver.TCPServer):
    allow_reuse_address = True

def _server():
    print('start...')
    
    with MyServer((HOST, PORT), MyHandler) as server:
        try:
            server.serve_forever()
        except KeyboardInterrupt:
            pass
            #pool.terminate()
            #pool.join()

if __name__ == '__main__':
    import argparse, sys

    parser = argparse.ArgumentParser(description='Identify frames.')
    parser.add_argument('-d', action="store_true", help='Server mode')
    parser.add_argument('-p', metavar='filename', default=None, help='parse filename')
    parser.add_argument('-t', metavar='filter', default=None, help='train all|mac')
    parser.add_argument('-e', metavar='filter', default=None, help='erase all|mac')
    parser.add_argument("-i", help="identify", action="store_true")
    args = parser.parse_args()

    if args.d:
        _server()

