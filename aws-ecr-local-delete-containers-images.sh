#!/bin/bash

while true; do
    read -p "Do you wish to remove all docker images and containers from this machine?" yn
    case $yn in
        [Yy]* ) docker rm -f $(docker ps -a -q); docker rmi -f $(docker images -q); break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done