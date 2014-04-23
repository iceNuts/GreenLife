GreenLife
=========

iOS Final Project For WUSTL #436 

###Install Instructions:
There are two parts for this project: iOS7 xcode project and iOS7 jailbroken Siri feature.

####Xcode Project
You could run this project with a simulator by simply clicking the run button and the app will show up. But when you want to use Siri, there is an alert view stating the Siri requires deb package installed on an iOS jailbroken device.

####Jailbroken Siri (Developer Only)
Only for jailbroken iOS 7.0 - 7.0.6. Device only.

Use your newly jailbroken iOS device. Tap Cydia and install BigBoss Recommended Tools. And you would find it's possible to access the device with ssh. 

```
$ ssh your_device_name@your_device_ip
$ enter your password (default : alpine)

$ scp deb_file_in_sirirunner your_device_name@your_device_ip:~
$ dpkg -i ~/deb_file_in_sirirunner

```
When this deb file installed, Siri is enabled for our app.

###Project Features
We have lots of features in our app:
- Custom table cell
- Like Button
- Facebook integrated
- Recipe using UIWebView 
- Siri integrated
- MapView integrated

Please note all data is faked and we don't implement the network communication with server.

Please Use facebook account below for a trial:
- username: facebookgreenlifedemo@gmail.com
- password: 12345678123




