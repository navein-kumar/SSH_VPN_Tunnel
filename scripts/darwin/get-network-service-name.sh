#!/usr/bin/env bash
#
# Get name of the MacOSX network service (device connection)
#
if [[ -n "${FORCE_NETWORK_SERVICE}" ]]; then
  echo "${FORCE_NETWORK_SERVICE}"
  exit 0
fi

DEF_GW_IF=$(netstat -nr | grep default | tail -n1 | awk '{print $NF}')
networksetup -listnetworkserviceorder | grep -B1 " Device: ${DEF_GW_IF})" | head -n1 | sed 's/^(.*) //'
