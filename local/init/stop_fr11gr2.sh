#!/bin/sh

. /orasoft/scripts/set_oracle_env.sh 

# Stop OPMN/OHS
echo "Stopping OPMN managed componets (...)"
$INSTANCE_HOME/bin/opmnctl stopall

echo "Stopping WLS_REPORTS managed server (...)"
cd $REPORTS_LOGS
$DOMAIN_HOME/bin/stopManagedWebLogic.sh WLS_FORMS &

sleep 30

echo "Stopping WLS_FORMS managed server (...)"
cd $REPORTS_LOGS
$DOMAIN_HOME/bin/stopManagedWebLogic.sh WLS_REPORTS &

sleep 30

echo "Stopping AdminServer (...)"
cd $ADMINSERVER_LOGS
$DOMAIN_HOME/bin/stopWebLogic.sh

sleep 30

# Stop NodeManager
echo "Stopping NodeManager (...)"
pkill -f startNodeManager.sh
