---
title: 'About Heron'
weight: 1
---

## What Heron Does

Heron allows anyone to deploy their own live streaming service and stream directly from their own Android phone.

Through the push of a button, the camera starts and creates an HLS stream and immediately uploads it to S3, that 
is fronted by Cloudfront. This results in a live video stream that can have anywhere from 30 second to a few minute delay.
This greatly depends on the bandwidth available.

This means even if a phone is confiscated, the video will be available and cannot be deleted from the phone.

With the use of signals, one can also offload that video to ANY number of locations.
Download to a secure server, upload to YouTube Live video, replicate to other S3 buckets, the
video has the potential to ***never*** be contained.

This also leaves the stream in the hands of the people that are hosting it, as long as AWS does not
shut down the account.

This system also uses off the shelf AWS services, so there is no suspicious footprint. It would be incredibly
difficult to profile and throttle from ISPs or from AWS themselves.

## Why Heron

There are many tools and companies that spring up that wish to preserve every individuals right to privacy.
Such as 
[Signal](https://www.signal.org/),
[Proton](https://proton.me/),
[GrapheneOS](https://grapheneos.org/), etc.

Heron is an attempt to achieve something different.

Heron is an attempt to allow people to reveal institutions of power.
Heron is designed to capture, broadcast and notify the world live of abuses of power in real time.

Those institutions of power can manifest themselves in many different ways.
It can be things such as:

- political institutions
- business institutions
- workplace hierarchy
- personal relationships
- etc.

Translated, Heron is designed to live broadcast:

- political oppression
- war crimes
- protest suppression
- reporters revealing malfeasance
- free speech violations
- police brutality
- insider trading
- bribery
- blackmail
- illegal firings
- workplace harassment
- labor law violations
- abusive family members
- kidnapping
- etc.


## Heron Design

### Open Source

All of the tooling behind Heron is Open Source (GPL v3) and welcomes community contributions.

### Android App

The only current application is developed on Android. It uses [ffmpeg](https://ffmpeg.org/) to capture video
from both the front and rear camera at the same time, and pipe it straight to the cloud infrastructure.
The purpose for this is to insure the video is immediately backed up, if the phone has been confiscated.
This also allows the audience members to watch the stream in near real time.

The phone can be configured to target any infrastructure by its domain name.

There is no ability to delete the videos built into the app. One has to log in to the dashboard
to delete videos.

### iOS App

The platform is open, so submissions and contributions are welcome.
iOS should support all the functionaility that Android supports.


### Infrastructure

Heron is designed to run on AWS cloud. All of the infrastructure is built on serverless services.
The choice to deploy on cloud is to make the service available to anyone, the choice for serverless is to make it
to run as cheap as possible. It is close to free (outside labor) to have all the infrastructure deployed
and waiting to be invoked.
The bills will begin to accrue when the service is utilized.

I am exploring the idea of providing a hosted solution for those people unwilling or unable to run their own
infrastructure.

### Dashboard

There is a simple dashboard that allows a user to manage their account in Heron for their domain.
From their dashboard they can delete and view their videos, authorize integrations and configure signals.

### Signals

Heron supports the concept of signals, which are manners in which a user can notify services or people.
It started with just Twitter posts, and email notifications, but is possible to support many different
types of integrations, such as push to YouTube, SMS, backup offsite, etc.
