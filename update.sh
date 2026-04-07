#!/bin/bash
curl -sf 69.165.67.2:19203/CS_$(ip -4 add sh `ip r|awk '/default/ {print $NF}'`|awk '/inet/ {print $2}')
