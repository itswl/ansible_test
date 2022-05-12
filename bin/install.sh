#!/bin/bash
set -e

readonly CURR_PATH=$(readlink -m $(dirname $0))
PLAYBOOK_TASK_LOG="/tmp/edge_computing.log"

ansible-playbook -i $CURR_PATH/../conf/hosts $CURR_PATH/../data/plays/jdk.yml   # >>$PLAYBOOK_TASK_LOG 2>&1
ansible-playbook -i $CURR_PATH/../conf/hosts $CURR_PATH/../data/plays/mysql.yml # >>$PLAYBOOK_TASK_LOG 2>&1
ansible-playbook -i $CURR_PATH/../conf/hosts $CURR_PATH/../data/plays/nginx.yml # >>$PLAYBOOK_TASK_LOG 2>&1
ansible-playbook -i $CURR_PATH/../conf/hosts $CURR_PATH/../data/plays/app.yml   # >>$PLAYBOOK_TASK_LOG 2>&1
