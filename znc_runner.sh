#!/bin/bash

# Handle environment variables
export ZNC_PORT="${ZNC_PORT:-9876}"
export ZNC_USER="${ZNC_USER:-admin}"
export ZNC_PASS="${ZNC_PASS:-admin}"
export ZNC_NAME="${ZNC_NAME:-Administrator}"
export ZNC_DATADIR="${ZNC_DATADIR:-/opt/znc-env}"

# Check if the ZNC config exists
if [ ! -d $ZNC_DATADIR ]; then
  # Make ZNC configuration
  ./znc_expect.exp
fi

# Run ZNC
/usr/bin/znc -d $ZNC_DATADIR --foreground
