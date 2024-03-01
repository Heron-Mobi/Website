---
title: 'Twitter Setup'
date: 2019-02-11T19:27:37+10:00
weight: 2
---

To use Twitter integration you need to add API Keys from Twitter.

###### Requirements

- [AWS cli](https://aws.amazon.com/cli/)

<!--more-->


### Signup

You will need to setup an account for the [developer portal](https://developer.twitter.com/).

Once you are setup you will be given a default project and default app.

You need to setup authentication. Go to the app page and click "Setup"

![twitter app_page](/images/twitterapp.png)



### Setup

You will be presented with this page:

![twitter setup](/images/twittersetup.png)


You must be setup as above.
- Read and Write
- Web App
- Callback url must be in the format dashboard.YOUR_DOMAIN/integrations/twittertoken

The rest of the fields are up to you.

When you submit that form you will be given credentials.

![twitter creds](/images/twittercreds.png)


Then you need to use these values to create your secret:

Replace these values in the below command

- YOUR_CLIENT_ID
- YOUR_CLIENT_SECRET
- YOUR_REGION

```zsh
aws secretsmanager create-secret \
	--secret-string '{"clientid":"YOUR_CLIENT_ID","clientsecret":"YOUR_CLIENT_SECRET"}' \
	--name heron/integrations/twitter \
	--region YOUR_REGION
```

You are now setup for Twitter.
