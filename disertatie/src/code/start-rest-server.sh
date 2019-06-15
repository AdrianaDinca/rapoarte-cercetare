#!/bin/bash

# creates the bna with all the business network files
composer archive create --sourceType dir --sourceName hardware-manufacture-network -a hardware-manufacture-network-1.0.0.bna

# generates the PeerAdmin card 
# fabric should be up and running before deploying the bna archive
composer network install --archiveFile hardware-manufacture-network-1.0.0.bna --card PeerAdmin@hlfv1

# generates the network admin card: admin@hardware-manufacture-network.card
# starts the Loopback interface on the machine
composer network start --networkName hardware-manufacture-network  --networkVersion 1.0.0 --card PeerAdmin@hlfv1 --networkAdmin admin --networkAdminEnrollSecret adminpw

# restart composer-rest-server after creating the Loopback interface
# test the generated REST API directly from the explorer web interface
composer-rest-server -c admin@hardware-manufacture-network -n always -u true -w true



