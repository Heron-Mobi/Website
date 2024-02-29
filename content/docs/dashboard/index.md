---
title: 'Dashboard'
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

<!--more-->

A domain is required, but any base domain will work.

The ACM certificate is required in us-east-1 because of the use of Cloudfront.
It needs to be a wildcard for the base domain.



### Pre Installation

First clone the repository.
