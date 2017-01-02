#!/bin/bash

./client_linux_arm7 -l :< local port > -r < ip >:< port > -key "bromide-tavern-sewer" -crypt aes -datashard 10 -parityshard 3 -conn 1 -mtu 1350 -sndwnd 1024 -rcvwnd 1024 -dscp 0 -autoexpire 60 -keepalive 10 -sockbuf 4194304 -mode fast > kcptun.log 2>&1 &

echo "Kcptun started."
