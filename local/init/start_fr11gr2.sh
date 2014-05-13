#!/bin/bash

. /orasoft/scripts/set_fr11gr2_env.sh

# Start NodeManager
echo "Starting NodeManager..."
cd $DOMAIN_HOME/servers
nohup $MIDDLEWARE_HOME/wlserver_10.3/server/bin/startNodeManager.sh `hostname` 5556 &

sleep 30

#start AdminServer
echo "Starting WebLogic..."
cd $ADMINSERVER_LOGS
nohup $DOMAIN_HOME/bin/startWebLogic.sh &

sleep 60

#start managed server
echo "Starting WLS_FORMS..."
cd $DOMAIN_HOME/servers/WLS_FORMS/logs
nohup $DOMAIN_HOME/bin/startManagedWebLogic.sh WLS_FORMS &

sleep 60

#start managed server
echo "Starting WLS_REPORTS..."
cd $DOMAIN_HOME/servers/WLS_REPORTS/logs
nohup $DOMAIN_HOME/bin/startManagedWebLogic.sh WLS_REPORTS &

sleep 60

# Start OPMN/OHS
echo "Starting OPMN managed components..."
$INSTANCE_HOME/bin/opmnctl startall
