#!/bin/sh

if ! test -f /qdata/dd/initialized; then
    echo "Quorum initializing..."
    geth --datadir=/qdata/dd init /qdata/dd/genesis.json

    touch /qdata/dd/initialized
else
    echo "Quorum already initialized, skipping..."
fi

 geth --http --http.port 22010 --datadir /qdata/dd --nodiscover --verbosity 6 --networkid 1337 --raft --raftport 50500 --rpc --rpcaddr 0.0.0.0 --rpcvhosts=* --rpcapi admin,db,eth,debug,miner,net,shh,txpool,personal,web3,quorum,raft --emitcheckpoints --port 22005 --allow-insecure-unlock --ptm.url "http://172.15.0.5:21010" 