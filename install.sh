#!/bin/bash
distr=/etc/tsocks5

cd ~
echo "Clone TSocks5 and Make"
git clone https://github.com/envieid0c/hev-socks5-server.git >> /tmp/nginx-ee.log 2>&1
cd hev-socks5-server >> /tmp/nginx-ee.log 2>&1
git submodule init >> /tmp/nginx-ee.log 2>&1
git submodule update >> /tmp/nginx-ee.log 2>&1
make >> /tmp/nginx-ee.log 2>&1
echo "Update TSocks5"
service tsocks5 stop >> /tmp/nginx-ee.log 2>&1
rm -rf /etc/tsocks5/tsocks5 >> /tmp/nginx-ee.log 2>&1

mkdir -p /etc/tsocks5 >> /tmp/nginx-ee.log 2>&1
cp bin/hev-socks5-server $distr/tsocks5 >> /tmp/nginx-ee.log 2>&1
cp conf/main.ini $distr/main.ini >> /tmp/nginx-ee.log 2>&1
cp services/tsocks5-service.sh /etc/init.d/tsocks5 >> /tmp/nginx-ee.log 2>&1

chmod +x /etc/init.d/tsocks5 >> /tmp/nginx-ee.log 2>&1

systemctl daemon-reload >> /tmp/nginx-ee.log 2>&1

service tsocks5 restart >> /tmp/nginx-ee.log 2>&1

rm -rf ~/hev-socks5-server >> /tmp/nginx-ee.log 2>&1
echo "TSocks5 installed and started for all interfaces port 8443"
echo ""
echo "Usage: service tsocks5 {start|stop|restart|status}"
echo ""
echo "Powered by envieidoc 2018 (envieidoc@gmail.com)"