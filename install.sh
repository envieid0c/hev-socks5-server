#!/bin/bash
distr=/etc/tsocks5

cd ~

git clone https://github.com/envieid0c/hev-socks5-server.git
cd hev-socks5-server
git submodule init
git submodule update
make

service tsocks5 stop
rm -rf /etc/tsocks5/tsocks5

mkdir -p /etc/tsocks5
cp bin/hev-socks5-server $distr/tsocks5
cp conf/main.ini $distr/main.ini
cp services/tsocks5-service.sh /etc/init.d/tsocks5

chmod +x /etc/init.d/tsocks5

systemctl daemon-reload

service tsocks5 restart

rm -rf ~/hev-socks5-server