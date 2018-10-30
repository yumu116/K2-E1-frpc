#!/bin/sh

sleep 1
cd /tmp
if [ ! -d frp ];then
    mkdir frp
fi

func_downfrpc()
{
        for i in 1 2 3;
        do
          wget -O frpc https://github.com/yumu116/K2-E1-frpc/raw/master/frpc_mipsle
          if [ $? == 0 ] ;then
                break
          fi
          sleep 5
        done
}
cd frp
func_downfrpc

if [ -f ./frpc ]; then
    chmod +x frpc
    /tmp/frp/frpc -c /etc/storage/frp/frpc.ini > /dev/null 2>&1 &
else
    echo "download error!"
fi
cd -
cd -
