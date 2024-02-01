Hello! 
This file should(hopefully) explain how to get my project up and running from your own setup.
The Empathy VR folder can be opened in unity, it is the entire unity project.
The unity build data contains my final build APK and mapping file alongside the backup folder.

**Note** I had to remove the buold cache as there was no way i could send all of that data, if any issues arise I have a backup whick i can send.

In order to work the project fully you will need:

*An android VR headset (Quest 2 preferably) and right hand controller
*A set of noise cancelling headphones which work with your headset
*A wheelchair(I am aware this is not exactly common to have so any chair will suffice)
*A vibrotactile device that emmits vibrations through low frequency audio input(Also a tall ask, for my testing 
this was a clark synthesis TST429 Gold transducer that was clamped to the chair, it receives audio via 
the running ChucK script which is sent from the pc running it via auxillory cable to an analogue mixer(eurorack ub1832fx-pro)
and then through an amplifier (Samson servo 300) to the vibrotactile plate).
If you have all of these things I am thoroughly impressed. If not something that can vibrate through auxillory cable input 
should work as long as you can amplify the signal somehow.

*MiniAudicle IDE to run the chuck script 'receiver.ck'
*Android studio/some other think that allows you to work with android via pc

Although I attached the APK you will have to open the EmpathyVR folder as a project in unity (version 2022.2.26f1)
and build it again replacing the OSCTransmittor information in the Main scene with your own IP information.
Your headset and PC will have to be connected to the same wifi- The port should work as it is set to the port that 
chuck listens to osc messages on, you will however have to change the IP address to the IP of whatever PC 
is running the ChucK script so the headset can send messages to the right place.

After you do this you should be able to build the application to your headset presuming you have the
necessary android sdk/ndks' (minimum Android 7.0 'Nougat' (API level 24) Target-highest installed)

Once you have installed the application you can open the receiver script on your PC using mini audicle and hit start virtual machine,
add the receiver shred and make sure whatever vibrational device you are using is connected via Aux.
Then simply sit in the chair, put on your headset and earphones and click the application.
There is a loading screen to allow adjustment to seating/headset/headphones, it then transitions to the main scenewhere all of the fun happens. 
In the main scene you can click the primary right hand controller to exit at any time (on quest this is A)
From there you will be brought to the exit scene and the application will quit after 1 minute.
If you do not chose to exit the application stops itself once the video finishes, and you will be brought to the exit scene
where the application will quit.

**note: if the receiver script is not getting osc message logs to console, there is likely a problem 
with IP addresses, useful to check that it works from unity before building**

If you have any more questions please feel free to email me 122115091@umail.ucc.ie