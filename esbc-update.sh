#!/bin/bash

RED='\033[0;91m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

esbcoin-cli stop
echo -e "${GREEN} Stopping ESBC wallet   ${NC}"
sleep 10
rm -rf /usr/local/bin/esbcoin*
rm -rf esbc-daemon-linux-x86_64*
rm -rf .esbcoin/mncache.dat .esbcoin/mnpayments.dat .esbcoin/peers.dat .esbcoin/blocks .esbcoin/chainstate .esbcoin/database

wget https://github.com/BlockchainFor/ESBC2/releases/download/2.0.4.14/esbc-daemon-linux-x86_64-static.tar.gz
tar -xvf esbc-daemon-linux-x86_64-static.tar.gz
sudo chmod -R 755 esbcoin-cli
sudo chmod -R 755 esbcoind
sudo cp -p -r esbcoind /usr/local/bin
sudo cp -p -r esbcoin-cli /usr/local/bin
echo -e "${GREEN} I will start downloading the blockchain files in 5 seconds... ${NC}"
sleep 5s
wget http://files.esbproject.online/bootstrap.zip
sleep 2s
sudo apt-get install unzip
unzip -u bootstrap.zip -d .esbcoin
echo -e "${GREEN} Files succesfully installed! ${NC}"
sleep 1s
echo -e "${GREEN} Removing .zip file from your directory ${NC}"
rm -rf bootstrap.zip 
echo -e "${GREEN} Starting the Server... ${NC}"
esbcoind -daemon
sleep 10
esbcoin-cli getinfo

#echo -e  "

#${YELLOW}YOU NEED TO START YOUR MASTERNODE FROM WALLET${NC}
#"
#sleep 60
#echo -e "
#IF YOU DON'T SEE ${GREEN}"Masternode successfully started"${NC} START NOW
#"
#sleep 30
#esbcoin-cli --version
#sleep 2
#while ! /usr/local/bin/esbcoin-cli masternode status | grep -o "Masternode successfully started";do
#/usr/local/bin/esbcoin-cli stop;
#sleep 2;
#/usr/local/bin/esbcoind -daemon;
#sleep 10;
#done
