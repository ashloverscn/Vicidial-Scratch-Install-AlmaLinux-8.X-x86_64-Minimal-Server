#!/bin/sh
# Unban all IPs from all Fail2Ban jails

for jail in $(fail2ban-client status | grep 'Jail list:' | cut -d: -f2 | tr ',' ' '); do
    jail=$(echo "$jail" | xargs)  # trim spaces
    for ip in $(fail2ban-client status "$jail" | grep 'Banned IP list:' | cut -d: -f2); do
        ip=$(echo "$ip" | xargs)  # trim spaces
        if [ -n "$ip" ]; then
            echo "Unbanning $ip from $jail"
            fail2ban-client set "$jail" unbanip "$ip"
        fi
    done
done
