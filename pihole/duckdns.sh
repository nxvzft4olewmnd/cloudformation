#!/usr/bin/env bash
# Update dynamic DNS @ DuckDNS

echo url="https://www.duckdns.org/update?domains=3c3c1dh&token=a2dd110e-8bc0-450f-9b81-27c1d6239f1b&ip=" | curl -k -o /tmp/duckdnsupdate.log -K -
