# bolus-sim - demo/preliminary

BASH Bolus Calculator Simulator for insulin pumps with bolus calculator in The Netherlands and The United Kingdom. Accepts $DEVICE user settings and status entries. Utilizes the C-style arbitrary precicion calculator app to simulate the bolus calculations of selected device. For educational purposes only.

The simulator works interactive and allows for simulation of the bolus calculations of the following devices:

. manufacturer_1
- $DEVICE1 - Testing (demo operational)
- $DEVICE2 - Testing (demo operational)
- $DEVICE3 - Testing (demo operational (might be scrapped))
- $DEVICE4 - Testing (demo operational)

. manufacturer_2
- $DEVICE5 - Testing (demo pending)
- $DEVICE6 - Bolus calculator specifications in the user guide are either incomplete or incorrect

.manufacturer_3
- $DEVICE7 - Bolus calculator specifications in the user guide are either incomplete or incorrect
- $DEVICE8 - Bolus calculator specifications in the user guide are either incomplete or incorrect
- $DEVICE9 - Bolus calculator specifications in the user guide are either incomplete or incorrect

.manufacturer_4
- $DEVICE10 - Bolus calculator specifications in the user guide are either incomplete or incorrect

.manufacturer_5
- $DEVICE11 - Bolus calculator specifications in the user guide are either incomplete or incorrect

#
Please mind that with this simulator come no guarantees. Validation before use is highly recommended. 

#
Please report errors, bugs, malfunctions, complaints, etc. to: repository [ at ] boluscalculators dot com

Also for suggestions.

#
# Installation guide
IMPORTANT: ALWAYS RUN SIMULATOR FROM ITS OWN FOLDER

#
For linux:
1. Open linux terminal
2. Obtain required packages by typing "sudo apt-get install calc perl git awk" (without the "") and hit enter
3. Confirm the installation of the packages if required
4. Obtain simulator by typing "git clone https://github.com/bveldhuyzen/bolus-sim" (without the "") and hit enter
5. Go to folder by typing "cd bolus-sim" (without the "") and hit enter
6. Type "bash bolus-sim" and hit enter

#
For tablets and smartphones:
1. Intall Termux (application) from appstore on your smartphone or tablet
3. Open Termux application
4. Smaller screens have to be flipped horizontal for optimal experience
5. Update the app by typing "pkg update" (without the "") and hit enter
6. Select yes if prompted for confirmation during the update
7. Obtain required packages by typing "pkg install calc perl git gawk" (without the "") and hit enter
8. Select yes if prompted for confirmations during the update
9. Obtain script by typing "git clone https://github.com/bveldhuyzen/bolus-sim" (without the "") and hit enter
10. Go to script folder by typing "cd bolus-sim" (without the "") and hit enter
11. Type "bash bolus-sim" (without the "") and hit enter

After being installed on tablet or smartphone via Termux:
1. Open the Termux application
2. Type "cd bolus-sim" (without the "") and hit enter
3. Type "bash bolus-sim" (without the "") and hit enter

#
For mac computer systems:
1. The bash shell might have to be set as default, depending on the age of your system.
2. View the available shells in terminal via #cat /etc/shells
3. Set bash as default via #chsh -s /bin/bash
4. Close terminal and open again to verify used shell via #ps -p $$ (or #echo $0)
5. Run instalation as described for linux terminals.

#
For (some) smart watches:
1. Enable/force your WiFi connection
2. Run installation as described for smartphones and tablets.

..

After that, gl

#
# User guide (under construction):
-

#
# Notes
Every (step of) significance is logged into a temporary text file for validation purposes.

To be further specified.

#
# Change log

- All code releases are temporarily on hold
- Please note: Installing Termux and running this simulator might expose your information to other applications/actors. The only exception is Termux v0.118 (which is not available on Android/iOS Playstores).
