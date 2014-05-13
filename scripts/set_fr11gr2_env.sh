#!/bin/sh
#
# Source this script to set some general Oracle environment variables for Forms and Reports.
#
 
# Edit these variables for each install.
 
export DOMAIN_NAME=
export INSTALL_NAME=ohs
export INSTANCE_NAME=cpc-upass-ap03_instace
 
# Don't edit below here unless you know what you're doing...
 
export MIDDLEWARE_HOME=/orasoft/product/middleware
 
export CURL=/opt/ACEITuvscan/bin/curl
export ORACLE_HOME=${MIDDLEWARE_HOME}/${INSTALL_NAME}
export INSTANCE_HOME=${MIDDLEWARE_HOME}/instances/${INSTANCE_NAME}
export ORACLE_INSTANCE=${MIDDLEWARE_HOME}/instances/${INSTANCE_NAME}
export WLADMIN=/orasoft/local/wladmin
export DOMAIN_HOME=${MIDDLEWARE_HOME}/user_projects/domains/${DOMAIN_NAME}
export ADMINSERVER_LOGS=${DOMAIN_HOME}/servers/AdminServer/logs
export FORMS_LOGS=${DOMAIN_HOME}/servers/WLS_FORMS/logs
export REPORTS_LOGS=${DOMAIN_HOME}/servers/WLS_REPORTS/logs
export HCONF_DIR=${ORACLE_INSTANCE}/config/OHS/ohs1
export LOG_DIR=${ORACLE_INSTANCE}/diagnostics/logs/OHS/ohs1
export ORAPKI=${MIDDLEWARE_HOME}/oracle_common/bin/orapki
export WLADMIN=/orasoft/local/wladmin
export PATH=$PATH:${ORACLE_INSTANCE}/bin:${ORACLE_HOME}/OPatch:${MIDDLEWARE_HOME}/oracle_common/bin:/oraclebase/local/scripts:/oraclebase/local/wladmin
SETDOMAINENV=${DOMAIN_HOME}/bin/setDomainEnv.sh
. $SETDOMAINENV
cd -
