#!/bin/bash

###########################################################################
# This file is an init script to properly start ide docker container.
###########################################################################

set -e

# source any additional scripts with environment variables
for SCRIPT in /etc/ide.d/variables/* ; do
	if [ -f $SCRIPT -a -x $SCRIPT ] ; then
		source $SCRIPT
	fi
done
# run any additional scripts to setup custom configuration files or secrets
# or source any files or wait for linux daemons
for SCRIPT in /etc/ide.d/scripts/* ; do
	if [ -f $SCRIPT -a -x $SCRIPT ] ; then
		$SCRIPT
	fi
done

GREEN='\033[0;32m'
NC='\033[0m'
if [ -t 0 ] ; then
    # interactive shell
    echo -e "${GREEN}ide init finished (interactive shell)${NC}"

    # No "set -e" here, you don't want to be logged out when sth returns not 0
    # in interactive shell.
    set +e
else
    # not interactive shell
    echo -e "${GREEN}ide init finished (not interactive shell)${NC}"
    set -e
fi

if [ -n "$this_image_name" ] || [ -n "$this_image_tag" ]; then
	  # variables set
	  echo -e "${GREEN}using ${this_image_name}:${this_image_tag}${NC}"
fi

# those are set by a base image, but when using ide, user may have overwritten
# them, so set them again:
export JAVA_HOME=/docker-java-home
export JAVA_VERSION=8u181
export JAVA_DEBIAN_VERSION=8u181-b13-1~deb9u1
export CA_CERTIFICATES_JAVA_VERSION=20170531+nmu1
sudo -E -H -u ide /bin/bash -lc "$@"