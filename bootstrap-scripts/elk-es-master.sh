#!/bin/bash -v

# This script runs on instances with a node_type tag of "elk-es-master"
# It sets the roles that determine what software is installed
# on this instance by platform-salt scripts and the minion
# id and hostname

# The pnda_env-<cluster_name>.sh script generated by the CLI should
# be run prior to running this script to define various environment
# variables

# Parameters:
#  $1 - node index for this datanode - as this node type may be horizontally scaled, should start at 0.
#  $2 - number of master nodes in this cluster.

set -e

cat >> /etc/salt/grains <<EOF
roles:
  - elk-es-master
EOF

cat >> /etc/salt/minion <<EOF
id: $PNDA_CLUSTER-elk-es-master-$1
EOF

echo $PNDA_CLUSTER-elk-es-master-$1 > /etc/hostname
hostname $PNDA_CLUSTER-elk-es-master-$1

service salt-minion restart
