---
title: 'Android Application'
date: 2019-02-11T19:27:37+10:00
weight: 4
---

The Android App is still under development. It will need to be manually loaded with Android Studio.
Until it is ready to be published. To test in real life implementation it will require a phone in Developer Mode,
otherwise it can be done with the emulated phone.

###### Requirements

- [Android Studio](https://developer.android.com/studio)

<!--more-->


Import the project via Version Control in Android Studio.

![android import vcs](/images/androidimport.png)

Use this url:
```
https://codeberg.org/Heron/AndroidApp.git
```


From here you should be able to build and deploy to either an emulated phone or
a plugged in phone in debug mode. If you have gotten this far you are comfortable with
Android development.

If you are using an emulated phone the phone needs to be configured for camera pass through
or emulated phone camera for front and back camera.

You will need to go into the settings to grant permissions.

![android permissions](/images/androidperms.png)

When the app starts you see this screen.

![android start up](/images/androidstartup.png)


First you have to enter the root domain in the top line, and hit save.

This will download the configuration needed for the app to speak to AWS.

Then you can enter in your username and password created earlier for your user.

Then hit Login.

You should see that login in is successful.

When that is done, you can click Go Back

You will see the below screen

![android start](/images/androidstart.png)

The app will always start on this screen as long as the configuration file is present.

The Config button brings you back to the previous screen.

The Start and Stop buttons start and stop recording video.
