#!/bin/bash

echo "*******SSH KEYGENERATION STARTED*******"
sleep 1s
mkdir -p key_pairs
cd key_pairs

# Generate SSH key pair without passphrase
ssh-keygen -t rsa -m PEM -f id_rsa -N ""

echo "SSH key pair generated successfully."
