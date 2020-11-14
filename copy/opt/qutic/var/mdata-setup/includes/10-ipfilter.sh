#!/usr/bin/bash
if mdata-get ipf_ipv4_net 1>/dev/null 2>&1; then
  IPV4NET=$(mdata-get ipf_ipv4_net)
  sed -i \
      -e "s|10.11.12.0/24|${IPV4NET}|g" \
      /etc/ipf/ipf.conf
fi

if mdata-get ipf_ipv6_net 1>/dev/null 2>&1; then
  IPV6NET=$(mdata-get ipf_ipv6_net)
  sed -i \
      -e "s|2001:1234::/32|${IPV6NET}|g" \
      /etc/ipf/ipf6.conf
fi

svcadm enable svc:/network/ipfilter:default
