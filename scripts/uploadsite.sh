#!/bin/bash

REGION=$1

BUCKET=$(aws cloudformation describe-stacks --region ${REGION} \
	--stack-name heron-website \
	--query 'Stacks[0].Outputs[0].OutputValue' --output text )

aws s3 cp public/ s3://${BUCKET} --recursive
