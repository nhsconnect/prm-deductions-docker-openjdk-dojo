#!/bin/bash

# those are set by a base image, but when using dojo, user may have overwritten
# them, so set them again:
export JAVA_HOME=/usr/local/openjdk-17
export JAVA_VERSION=17.0.3
export PATH=$JAVA_HOME/bin:$PATH
