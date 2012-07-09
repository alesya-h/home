#!/bin/bash
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:/usr/bin/vendor_perl:/usr/bin/core_perl"
CRITICAL=20

battery_level=`acpi -b | grep -o '[0-9]*%' | sed 's/%//'`
if [ ! $battery_level ]
then
   exit
fi
if [ $battery_level -le $CRITICAL ]
then
   if acpi -a | grep 'off-line'
   then
     pm-suspend-hybrid
   fi
fi

