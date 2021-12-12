# bolus-sim - demo/preliminary

BASH Bolus Calculator Simulator for insulin pumps with bolus calculator in The Netherlands and The United Kingdom. Accepts $DEVICE user settings and status entries. Utilizes the C-style arbitrary precicion calculator app to simulate the bolus calculations of selected device. For educational purposes only.

The simulator works interactive and allows for simulation of the bolus calculations of the following devices:

- $DEVICE1 - Testing (demo operational)
- $DEVICE2 - Testing (demo operational)
- $DEVICE3 - Testing (demo operational (might be scrapped))

- $DEVICE4 - Testing (demo pending)
- $DEVICE5 - Bolus calculator specifications in the user guide are either incomplete or incorrect

- $DEVICE6 - Bolus calculator specifications in the user guide are either incomplete or incorrect
- $DEVICE7 - Bolus calculator specifications in the user guide are either incomplete or incorrect
- $DEVICE8 - Bolus calculator specifications in the user guide are either incomplete or incorrect

- $DEVICE9 - Bolus calculator specifications in the user guide are either incomplete or incorrect

- $DEVICE10 - Bolus calculator specifications in the user guide are either incomplete or incorrect

#
Please mind that with this simulator come no guarantees. Validation before use is highly recommended. 

#
Please report errors, bugs, malfunctions, complaints, etc. to: repository [ at ] boluscalculators dot com

Also for suggestions

#
# Installation guide
IMPORTANT: ALWAYS RUN SIMULATOR FROM ITS OWN FOLDER

For linux:
1. Open linux terminal
2. Obtain required packages by typing "sudo apt-get install calc perl git" (without the "") and hit enter
3. Confirm the installation of the packages if required
4. Obtain simulator by typing "git clone https://github.com/bveldhuyzen/bolus-sim.git" (without the "") and hit enter
5. Go to folder by typing "cd bolus-sim" (without the "") and hit enter
6. Type "bash bolus-sim" and hit enter


For tablets and smartphones:
1. Intall Termux (application) from appstore on your smartphone or tablet
3. Open Termux application
4. Smaller screens have to be flipped horizontal for optimal experience
5. Update the app by typing "pkg update" (without the "") and hit enter
6. Select yes if prompted for confirmation during the update
7. Obtain required packages by typing "pkg install calc perl git" (without the "") and hit enter
8. Select yes if prompted for confirmations during the update
9. Obtain script by typing "git clone https://github.com/bveldhuyzen/bolus-sim.git" (without the "") and hit enter
10. Go to script folder by typing "cd bolus-sim" (without the "") and hit enter
11. Type "bash bolus-sim" (without the "") and hit enter

After being installed on tablet or smartphone via Termux:
1. Open the Termux application
2. Type "cd bolus-sim" (without the "") and hit enter
3. Type "bash bolus-sim" (without the "") and hit enter


For mac computer systems:
1. The bash shell might have to be set as default, depending on the age of your system.
2. View the available shells in terminal via #cat /etc/shells
3. Set bash as default via #chsh -s /bin/bash
4. Close terminal and open again to verify used shell via #ps -p $$ (or #echo $0)
5. Run instalation as described for linux terminals.


After that, gl

#
# User guide (under construction):
-

#
# Notes
Due to inadequate specification of the bolus calculator function in the user guides of devices 5 to 10, the simulator will be released (as preliminary) for the devices that come with complete specifications in the user guide.


To be further specified.

#
# Change log

Upcoming:

- Release of testrun data for the simulators of $DEVICE1, $DEVICE2, $DEVICE3 
- Release of the (demo/preliminary) simulator for $DEVICE4
- Release of testrun data for the simulator of $DEVICE4
- Possibly a demo of the simulators of $DEVICE5 and $DEVICE6 (depending on the manufacturers)
- If so, then also testruns for the simulators of $DEVICE5 and $DEVICE6
- Release of looping mode for all simulators (for validation purposes)
- Release of used testing profiles for looping modes (for validation purposes)
- Release of validation procedures for all simulators
- User guide for all simulators pending
- Update of installation guide to provide for a more detailed instruction on how to install and run on various systems (e.g. it probably also runs in Windows via WSL)
- Reorganizing and streamlining of code
- Maybe release of made notifications and/or recommendations (incl. timestamps) to manufacturers of devices 5 to 10 in regard to the inadequate specifications of the bolus calculator function in the user guide.
- Release of device-diff-module to determine accuracy of rounded bolus suggestions (compared to raw)
- Boluscalculators.com


#
10 Dec 2021:
- Simulator of $DEVICE3 might be scrapped, since it is almost not used anymore.
- Simulator of $DEVICE5 (UK) was added to provide some competition, but unfortunately the user guide does not specify a term (value) in regard to the bolus calculations. Of bolus calculations that include this value it cannot be confirmed if the calculations are performed as intended.
- Added United Kingdom to description.
- The updated simulator user guides for $DEVICE1 and $DEVICE2 are nearing completion.
- Simulator user guide for $DEVICE4 in progress.


#
12 Dec 2021
- Added mac to the installation guide
- WSL is next
