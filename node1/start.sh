#!/bin/sh

if ! test -f /qdata/dd/initialized; then
    echo "Quorum initializing..."
    geth --datadir=/qdata/dd init /qdata/dd/genesis.json

    touch /qdata/dd/initialized
else
    echo "Quorum already initialized, skipping..."
fi

geth --http -http.port 22011 --datadir /qdata/dd --nodiscover --verbosity 6 --raft --raftjoinexisting 2 --raftport 50501 --rpc --rpcaddr 0.0.0.0 --rpcvhosts=* --rpcapi admin,db,eth,debug,miner,net,shh,txpool,personal,web3,quorum,raft --emitcheckpoints --port 22006 --allow-insecure-unlock --ptm.url "http://172.15.0.5:21011"