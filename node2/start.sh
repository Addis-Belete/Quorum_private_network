#!/bin/sh

if ! test -f /qdata/dd/initialized; then
    echo "Quorum initializing..."
    geth --datadir=/qdata/dd init /qdata/dd/genesis.json

    touch /qdata/dd/initialized
else
    echo "Quorum already initialized, skipping..."
fi

PRIVATE_CONFIG=ignore geth --http --http.port 22012 --datadir /qdata/dd --nodiscover --verbosity 6 --raft --raftjoinexisting 3 --raftport 50502 --rpc --rpcaddr 0.0.0.0 --rpcvhosts=* --rpcapi admin,db,eth,debug,miner,net,shh,txpool,personal,web3,quorum,raft --emitcheckpoints --port 22007 --allow-insecure-unlock 