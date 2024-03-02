---
title: 'Dashboard'
date: 2019-02-11T19:27:37+10:00
weight: 3
---

The dashboard is built on VueJs, much of the base plumbing was stolen from:
[amazon-cognito-vue-workshop](https://github.com/aws-samples/amazon-cognito-vue-workshop)


###### Requirements

- [Node.js](https://nodejs.org/en)
- [Git](https://git-scm.com/)
- [jq](https://jqlang.github.io/jq/)
- [AWS cli](https://aws.amazon.com/cli/)

<!--more-->

The current website supports MFA but the Android application does not.

### Pre Installation

First clone the repository.

```zsh
git clone git@codeberg.org:Heron/Dashboard.git
cd Dashboard
```

To change the Region you will deploy to, edit the Makefile.


### Deploy

This downloads stack outputs from Cloudformation and loads it into the app before building.

Build the Node.js app and push the S3 bucket.


```zsh
make buildandupload
```


### Visit

Depending on how fast your DNS propagates you will eventually be able to visit

```
https://dashboard.yourdomain.com
```

![dashboard](/images/dashboard.png)


#### Register

Self registration is disabled by default.

To enable self registration you can run:

```zsh
make selfregisterenable
```

***It is recommended once you register your test user you disable self registration***

Disable self registration by running:

```zsh
make selfregisterdisable
```

When self registration is enabled you can click sign up to create a new user.

You will have an email sent to registration email.  This will have a code needed to verify the account.
Check your Spam box.

Once you have successfully confirmed your account it is best you disable self registration.

***Disable self registration by running:***

```zsh
make selfregisterdisable
```

#### Around the Dashboard

![logged in dashboard](/images/dashboard-loggedin.png)


You will land on the videos page. There should be no videos.

The menu has several screens:
- Videos - Videos can be viewed or deleted from here.
- Signals - Configure signals, currently only supports Email and Twitter
- Integrations - Give authorization to external apps to allow Heron to post on your behalf, currently only Twitter
- App Configuration - Generates a QR Code to automatically configure your Android App for your infra, not implemented in app yet.
- Settings - Enable MFA, ***not enabled in Android app yet, enabling will block Android App.***
