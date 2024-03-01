
---
title: 'Cloudformation'
date: 2019-02-11T19:27:37+10:00
weight: 2
---

The infrastructure is deployed with Cloudformation to ease user access to the deployment process.
Everything can be rewritten in terraform but will require more technical knowledge.

###### Requirements

- [Make](https://www.gnu.org/software/make/)
- [Git](https://git-scm.com/)
- [jq](https://jqlang.github.io/jq/)
- [AWS cli](https://aws.amazon.com/cli/)
- [An AWS account](https://aws.amazon.com/resources/create-account/)
- A Domain Name
- [A Route 53 hosted Zone](https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/hosted-zones-working-with.html) for the domain
- [An ACM certificate ARN](https://docs.aws.amazon.com/acm/latest/userguide/acm-overview.html) created in us-east-1
- An origin email for sending email signals

<!--more-->

A domain is required, but any base domain will work.

The ACM certificate is required in us-east-1 because of the use of Cloudfront.
It needs to be a wildcard for the base domain.



### Pre Installation

First clone the repository.

```zsh
mkdir -p heron
cd heron
git clone git@codeberg.org:Heron/Cloudformation.git
cd Cloudformation
```

You will have to load some required base parameters.

```zsh
mkdir -p parameters

```

Create a file in the parameters directory called 
```
base.json
```

The contents will look like this

(values below are not real, replace with your value)

```zsh
cat parameters/base.json
[
	{
      		"ParameterKey":"CertARN",
      		"ParameterValue":"arn:aws:acm:us-east-1:123456789012:certificate/a123b456-c789-0123-de45-6f7890g12345"
	},
	{
      		"ParameterKey":"DomainName",
      		"ParameterValue":"yourdomain.com"
	},
	{
      		"ParameterKey":"HostedZone",
      		"ParameterValue":"Z1234567890A1B2C3DE45"
	}
]
```

Create a file in the parameters directory called 
```
03email.json
```

The contents will look like this

(values below are not real, replace with your value)


```zsh
cat parameters/03email.json

[
	{
      		"ParameterKey":"SourceEmail",
      		"ParameterValue":"info@yourdomain.com"
	}
]
```

To change the Region you will deploy to, edit the Makefile.


### Installation

#### Bootstrap

First we will deploy a bucket to put Lambda function code.

```zsh
make createbootstrap
```

#### Lambdas

All lambda code can be built and pushed into the boostrap bucket

```zsh
make buildlambdas
```

#### Base Stack

The base stack creates:
- Cognito identity pools
- Cognito user pools
- S3 bucket for published videos
- S3 bucket for user configuration
- user role
- Cloudfront distribution for watching videos

```zsh
make createbase
```

#### Video player assets

Next we will upload some required static assets for the video player.

```zsh
make uploadplayerassets
```


#### API Gateway

The API Gateway will be deployed with the required Lambdas for the user dashboard.

```zsh
make createapigateway
```

#### Signal

Deploys an SQS queue and a lambda listener that will trigger signals the user has configured.

```zsh
make createsignal
```

#### Signalers

Deploys SQS queues and lambda listeners that will run the signal, currently email and Twitter.

```zsh
make buildsignalers
```


#### Dashboard

Deploys an S3 bucket and Cloudfront distribution for the dashboard.

```zsh
make buildsignalers
```

#### Deploy the Dashboard

Exit current directory


```zsh
cd ..
```


Move on to deploying the [Dashboard](/docs/dashboard/).
