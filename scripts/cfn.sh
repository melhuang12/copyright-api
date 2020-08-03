#!/bin/bash

if [[ $# -eq 0 ]]; then
    echo "TO DEPLOY: ./cfn.sh deploy STACK_NAME TEMPLATE_FILE_NAME"
    echo "TO TEARDOWN: ./cfn.sh teardown STACK_NAME"
    exit 1
fi
AWS="$(which aws)"

set -xe
#default to region ca-central-1
#now run aws cli command to deploy, update or delete the stack
if [[ "$1" == "deploy" ]]; then
  $AWS cloudformation deploy --stack-name $2 --template-file $3 --region ca-central-1
elif [[ "$1" == "teardown" ]]; then
  $AWS cloudformation delete-stack --stack-name $2
else
  echo "Only deploy and teardown actions are supported, run ./cfn.sh for help"
  exit 1
fi
