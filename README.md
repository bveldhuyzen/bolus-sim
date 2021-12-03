# bolus-sim-multitool - demo/preliminary

BASH Bolus Calculator Simulator Multitool for insulin pumps with bolus calculator available in The Netherlands. Accepts $DEVICE user settings and status entries. Utilizes the C-style arbitrary precicion calculator app to simulate the bolus calculations of selected device. For educational purposes only.

The simulator works interactive and allows for simulation of the bolus calculations of the following devices:

- $DEVICE1 - Testing (demo operational)
- $DEVICE2 - Testing (demo operational)
- $DEVICE3 - Testing (demo operational)

- $DEVICE4 - Testing (demo pending)
- $DEVICE5 - Bolus calculator specifications in the user guide are either incomplete or incorrect

- $DEVICE6 - Bolus calculator specifications in the user guide are either incomplete or incorrect
- $DEVICE7 - Bolus calculator specifications in the user guide are either incomplete or incorrect
- $DEVICE8 - Bolus calculator specifications in the user guide are either incomplete or incorrect

- $DEVICE9 - Bolus calculator specifications in the user guide are either incomplete or incorrect

- $DEVICE10 - Bolus calculator specifications in the user guide are either incomplete or incorrect


#
If you are a user of one of the devices ($DEVICE) 5 to 10, then please contact the manufacturer of your device. The bolus calculator function is not adequately specified in the user guide. It cannot be confirmed if the device works as intended by the manufacturer. 

#
Please mind that with this app come no guarantees. Validation before use is highly recommended. 

#
Please report errors, bugs, malfunctions, etc. to: repository [ at ] boluscalculators dot com

#
# Installation guide
IMPORTANT: ALWAYS RUN SIMULATOR FROM ITS OWN FOLDER

For linux terminals:
1. Open linux terminal
2. Obtain required packages by typing "sudo apt-get install calc perl git" (without the "") and hit enter
3. Confirm the installation of the packages if required
4. Obtain simulator by typing "git clone https://github.com/bveldhuyzen/bolus-sim-multitool.git" (without the "") and hit enter
5. Go to folder by typing "cd bolus-sim-multitool" (without the "") and hit enter
6. Type "bash bolus-sim" and hit enter


For tablets and smartphones:
1. Intall Termux (application) from appstore on your smartphone or tablet
3. Open Termux application
4. Smaller screens have to be flipped horizontal for optimal experience
5. Update the app by typing "pkg update" (without the "") and hit enter
6. Select yes if prompted for confirmation during the update
7. Obtain required packages by typing "pkg install calc perl git" (without the "") and hit enter
8. Select yes if prompted for confirmations during the update
9. Obtain script by typing "git clone https://github.com/bveldhuyzen/bolus-sim-multitool.git" (without the "") and hit enter
10. Go to script folder by typing "cd bolus-sim-multitool" (without the "") and hit enter
11. Type "bash bolus-sim" (without the "") and hit enter

After being installed on tablet or smartphone via Termux:
1. Open the Termux application
2. Type "cd bolus-sim-multitool" (without the "") and hit enter
3. Type "bash bolus-sim" (without the "") and hit enter


After that, gl


#
# User guide (under construction):
-

#
# Notes
Due to inadequate specification of the bolus calculator function in the user guides of devices 5 to 10, this app will be released (as preliminary) for the devices that come with complete specifications in the user guide. 

#
# Change log

Upcoming:

- Release of testrun data for the simulator of $DEVICE1, $DEVICE2, $DEVICE3 
- Release of the (demo/preliminary) simulator for $DEVICE4
- Release of testrun data for the simulator of $DEVICE4
- Possibly a demo of the simulators of $DEVICE5 and $DEVICE6 (depending on the manufacturer)
- If so, then also testruns for the simulators of $DEVICE5 and $DEVICE6
- Looping mode for all simulators
- User guide for all simulators
- Update of installation guide to provide for a more detailed instruction on how to install and run on various systems (e.g. it probably also runs in Windows via WSL)
- Reorganizing and streamlining of code
- Release of validation procedures for all simulators
- Release of made notifications and/or recommendations (incl. timestamps) to manufacturers of devices 5 to 10 in regard to the inadequate specifications of the bolus calculator function in the user guide.
