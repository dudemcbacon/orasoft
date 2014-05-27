#!/bin/bash
#
# Set environment variables for OHS and ORAPKI
#

# These will probably change per install...

export INSTALL_NAME=ohs
export INSTANCE_NAME=`hostname`

# Only change these if you know what you're doing...
 
export MIDDLEWARE_HOME=/orasoft/product/middleware
export ORACLE_HOME=${MIDDLEWARE_HOME}/${INSTALL_NAME}
export ORACLE_INSTANCE=${MIDDLEWARE_HOME}/instances/${INSTANCE_NAME}
export HCONF_DIR=${ORACLE_INSTANCE}/config/OHS/ohs1
export LOG_DIR=${ORACLE_INSTANCE}/diagnostics/logs/OHS/ohs1
export ORAPKI=${MIDDLEWARE_HOME}/oracle_common/bin/orapki
export PATH=$PATH:${ORACLE_INSTANCE}/bin#
