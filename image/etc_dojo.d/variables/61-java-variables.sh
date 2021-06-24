#!/bin/bash

# those are set by a base image, but when using dojo, user may have overwritten
# them, so set them again:
export JAVA_HOME=/usr/local/openjdk-11
export JAVA_VERSION=11.0.7
export PATH=$JAVA_HOME/bin:$PATH
