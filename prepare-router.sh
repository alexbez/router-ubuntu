#/bin/sh
set -eu

if [ "$EUID" -ne 0 ]
then echo "Please run as root"
exit
fi

echo "========================================================================"
echo "           Preparing this computer to work as a NAT router"
echo "========================================================================"
