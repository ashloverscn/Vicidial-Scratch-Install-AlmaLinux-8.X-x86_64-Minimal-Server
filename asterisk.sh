#!/bin/bash

service=$@asterisk
/bin/systemctl -q is-active "$service.service"
status=$?
if [ "$status" == 0 ]; then
    echo "$status"
    echo "Asterisk Service Already Running"
    echo "OK"
else
    /bin/systemctl restart "$service.service"
    echo "Asterisk Service Started"
    echo "OK"
fi
