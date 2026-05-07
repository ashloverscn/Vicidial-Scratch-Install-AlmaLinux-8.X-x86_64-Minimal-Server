
#!/bin/bash

# DNS name to resolve
DNS_NAME="acme-v02.api.letsencrypt.org"

# Get the current IPs
CURRENT_IPS=$(dig +short $DNS_NAME)

# Remove old rules for this DNS name
#firewall-cmd --zone=public --remove-rich-rule='rule family="ipv4" source address="ALL_OLD_IP_ADDRESSES" accept' --permane>

# Add new rules for the current IPs
for IP in $CURRENT_IPS; do
  firewall-cmd --zone=trusted --add-rich-rule="rule family='ipv4' source address='$IP' accept" --permanent
done

# Reload firewalld to apply the changes
firewall-cmd --reload

service firewalld stop
certbot renew
service firewalld start
