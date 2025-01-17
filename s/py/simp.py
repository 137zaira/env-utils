#!/usr/bin/env python3
"""
Very simple HTTP server in python for logging requests
Usage::
    ./server.py [<port>]
"""
# https://gist.github.com/mdonkers/63e115cc0c79b4f6b8b3a6b797e485c7

# $_s/simp.py 64231
# gedit /etc/sysctl.conf
## Uncomment the next line to enable packet forwarding for IPv4
# net.ipv4.ip_forward=1
# sudo sysctl -p
# iptables -P INPUT 
# iptables -L
# 

from http.server import BaseHTTPRequestHandler, HTTPServer
import logging

class S(BaseHTTPRequestHandler):
    def _set_response(self):
        # self.send_response(200)
        self.send_response(404)
        self.send_header('Content-type', 'text/html')
        self.end_headers()

    def do_GET(self):
        logging.info("GET request,\nPath: %s\nHeaders:\n%s\n", str(self.path), str(self.headers))
        self._set_response()
        # self.wfile.write("GET request for {}".format(self.path).encode('utf-8'))
        # fn = "/_/u/s/lit"
        # fn = "/_/u/s/simp.py"
        # with open (fn) as fil:
        #     fcontent = "<br/>".join(fil.read().splitlines())
        # #lines = file_handle.readlines()
        # #html = (f"{lines}") #.replace("\\n", "")
        # # html = f"{lines.replace("\\n", "")}"
        # self.wfile.write(bytes(fcontent, 'utf-8'))

    def do_POST(self):
        content_length = int(self.headers['Content-Length']) # <--- Gets the size of data
        post_data = self.rfile.read(content_length) # <--- Gets the data itself
        logging.info("POST request,\nPath: %s\nHeaders:\n%s\n\nBody:\n%s\n",
                str(self.path), str(self.headers), post_data.decode('utf-8'))

        self._set_response()
        self.wfile.write("POST request for {}".format(self.path).encode('utf-8'))

def run(server_class=HTTPServer, handler_class=S, http_ip='0.0.0.0', port=80):
    logging.basicConfig(level=logging.INFO)
    #server_address = ('', port)
    #server_address = ('127.0.0.3', port)
    # port=64231
    server_address = (http_ip, port)
    httpd = server_class(server_address, handler_class)
    logging.info('Starting httpd...\n')
    try:
        httpd.serve_forever()
    except KeyboardInterrupt:
        pass
    httpd.server_close()
    logging.info('Stopping httpd...\n')

if __name__ == '__main__':
    from sys import argv

    if len(argv) == 3:
        run(http_ip=argv[1], port=int(argv[2]))
    elif len(argv) == 2:
        run(port=int(argv[2]))
    else:
        run()

# 169.254.41.130

# ip netconf
# inet lo forwarding off rp_filter loose mc_forwarding off proxy_neigh off ignore_routes_with_linkdown off
# inet enp6s0 forwarding off rp_filter loose mc_forwarding off proxy_neigh off ignore_routes_with_linkdown off 
# inet enp7s0 forwarding off rp_filter loose mc_forwarding off proxy_neigh off ignore_routes_with_linkdown off 
# ip address
# 2: enp6s0: <NO-CARRIER,BROADCAST,MULTICAST,UP> mtu 1500 qdisc mq state DOWN group default qlen 1000
#     link/ether 7c:10:c9:46:42:fa brd ff:ff:ff:ff:ff:ff
# 3: enp7s0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc mq state UP group default qlen 1000
#     link/ether 7c:10:c9:46:42:fb brd ff:ff:ff:ff:ff:ff
#     inet 169.254.41.130/16 brd 169.254.255.255 scope link noprefixroute enp7s0
#        valid_lft forever preferred_lft forever
