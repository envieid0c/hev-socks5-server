#!/bin/bash

distr=/etc/tsocks5

mkdir -p /etc/tsocks5
cp bin/hev-socks5-server $distr/tsocks5
cp conf/main.ini $distr/main.ini
cp services/tsocks5-service.sh /etc/init.d/tsocks5

chmod +x /etc/init.d/tsocks5

systemctl daemon-reload

service tsocks5 restart