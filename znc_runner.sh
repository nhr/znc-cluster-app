#!/bin/bash

# Handle environment variables
export ZNC_USER="${ZNC_USER:-admin}"
export ZNC_PASS="${ZNC_PASS:-admin}"
export ZNC_NAME="${ZNC_NAME:-Administrator}"
export ZNC_EXECDIR=/opt/znc-run
export ZNC_DATADIR=/opt/znc-env

# Check if the ZNC config exists
if [ ! -d ${ZNC_DATADIR}/configs ]; then
  # Make ZNC configuration
  ${ZNC_EXECDIR}/znc_expect.exp

  # Disable IP-based web session protection.
  # This is necessary because a cluster-friendly ZNC is probably
  # running behind some load balancers and therefore a client's
  # IP address will likely change.
  sed -i "s/LoadModule\ =\ webadmin/LoadModule\ =\ webadmin\nProtectWebSessions\ =\ false/" ${ZNC_DATADIR}/configs/znc.conf
fi

# Run ZNC
/usr/bin/znc -d $ZNC_DATADIR --foreground
