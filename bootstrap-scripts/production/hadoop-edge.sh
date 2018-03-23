#!/bin/bash -v

# This script runs on instances with a node_type tag of "hadoop-edge"
# It sets the roles that determine what software is installed
# on this instance by platform-salt scripts


# The pnda_env-<cluster_name>.sh script generated by the CLI should
# be run prior to running this script to define various environment
# variables

set -e

# The hadoop:role grain is used by the cm_setup.py (in platform-salt) script to
# place specific hadoop roles on this instance.
# The mapping of hadoop roles to hadoop:role grains is
# defined in the cfg_<flavor>.py.tpl files (in platform-salt)
cat >> /etc/salt/grains <<EOF
hadoop:
  role: EDGE
roles:
  - hadoop_edge
  - console_frontend
  - console_backend_data_logger
  - console_backend_data_manager
  - graphite
  - gobblin
  - flink
  - deployment_manager
  - package_repository
  - data_service
  - impala-shell
  - yarn-gateway
  - hbase_opentsdb_tables
  - hdfs_cleaner
  - master_dataset
  - jupyter

EOF
