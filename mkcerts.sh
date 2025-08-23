#!/usr/bin/env bash

#Array of domains
DOMAINS=(
  "gitlab.laurenzschmidt.de"
  "jenkins.laurenzschmidt.de"
  "guacamole.laurenzschmidt.de"
  "vaultwarden.laurenzschmidt.de"
  "laurenzschmidt.de"
)

#Initialize certbot command
CERTBOT_CMD="sudo certbot certonly --manual --preferred-challenges dns"

#Add domains to the command
for DOMAIN in "${DOMAINS[@]}"; do
  CERTBOT_CMD+=" -d $DOMAIN"
done

#Run the certbot command
eval "$CERTBOT_CMD"

#Copy certificates
sudo cp "/etc/letsencrypt/live/${DOMAINS[0]}/fullchain.pem ./certs"
sudo cp "/etc/letsencrypt/live/${DOMAINS[0]}/privkey.pem ./certs"
