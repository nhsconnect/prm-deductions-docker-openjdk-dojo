#!/bin/bash

# those are set by a base image, but when using dojo, user may have overwritten
# them, so set them again:
export JAVA_HOME=/usr/local/openjdk-21
export JAVA_VERSION=21-ea+26
export PATH=$JAVA_HOME/bin:$PATH
