BASH Bolus Calculator Simulator
-
v1.07

- Stand-alone bolus calculator simulator
- Works interactive 
- Accepts $DEVICE settings
- Allows for manual input of meal IOB and correction IOB
- Optionally calculates your meal IOB and correction IOB (linear)
- Includes calculations with every bolus suggestion
- Runs on smartphone, tablet, laptop, pc, probably also raspberry and chromebook


- Extended/wave/burst bolus function under construction (will include IOB adjustment)
- Fully configurable, please request for additional options if missing*


*if requesting a function or option that is currently available on a device of your knowing, please provide brand, type/model, iteration, and a series of user settings as defined in the system user guide. Or just provide system user guide.

#

#
#Recommended to use only as simulation, e.g. for training and educational purposes
#
#IMPORTANT: ALWAYS RUN SIMULATOR FROM ITS OWN FOLDER

For linux terminals:
1. Open linux terminal
2. Obtain required packages by typing "sudo apt-get install calc perl git" (without the "") and hit enter
3. Confirm the installation of the packages if required
4. Obtain simulator by typing "git clone https://github.com/bveldhuyzen/bolus-sim.git" (without the "") and hit enter
5. Go to folder by typing "cd bolus-sim" (without the "") and hit enter
6. Type "bash bolus-sim" and hit enter


For tablets and smartphones:
1. Intall Termux (application) from appstore on your smartphone or tablet
3. Open Termux application
4. Smaller screens have to be flipped horoizontal for optimal experience
5. Update the app by typing "pkg update" (without the "") and hit enter
6. Select yes if prompted for confirmation during the update
7. Obtain required packages by typing "pkg install calc perl git" (without the "") and hit enter
8. Select yes if prompted for confirmations during the update
9. Obtain script by typing "git clone https://github.com/bveldhuyzen/bolus-sim.git" (without the "") and hit enter
10. Go to script folder by typing "cd bolus-sim" (without the "") and hit enter
11. Type "bash bolus-sim" (without the "") and hit enter

After being installed on tablet via Termux:
1. Open the Termux application
2. Type "cd bolus-sim" (without the "") and hit enter
3. Type "bash bolus-sim" (without the "") and hit enter


After that, gl
#


SIMULATOR USER GUIDE (under construction):
-

Because the purpose of this file is education and practical utility, it would be a waste not to include the specifics of file itself.

The simulator (#bolus-sim) is small on purpose.
The script will create everything that is required along the way and put it in a temporary folder.
When running #bolus-sim in a linux terminal, or linux terminal emulator, the user will be prompted for entries.
These entries correspond with the user entries and settings required for bolus calculations of $DEVICE.
Optionally, the user may enter meal IOB and/or correction IOB, in order to further simulate one's situation.
A bolus calculation simulation will then run in the background,
of which the most suitable option will be presented to the user.
The script then removes the temporary folder.


The script is composed of several components:

    Interactive mode (user input) - Latest bolus information
    IOB calculation(s)
    Visual presentation of IOB calculations
    Interactive mode - User settings
    Visual presentation of user settings
    Calculations
    Determining which bolus suggestion is suitable for the situation of the user
    Visual presentation of the bolus suggestion and bolus calculation(s)
    Clearing of cache

#
1. Interactive mode (user input) - Latest bolus information

If selecting yes (1) for IOB calculator, then #iob_calc.sh starts. The following entries will be requested from the user:

    Last meal bolus in units of insulin
        can be set at any number except negatives
    Last meal bolus in hours ago
        can be set at any number except negatives
    Last correction bolus in units of insulin
        can be set at any number except negatives
    Last correction bolus in hours ago
        can be set at any number except negatives
    Insulin duration in hours
        can be set at any number except negatives
        
 If selecting no (0), then #bolus-sim will skip to 4.
        
#
2. IOB calculation(s)

The script (#iob_calc.sh) then calculates what part of your last meal and/or correction bolus is still active. It determines the amount of insulin that is still active based on your insulin duration. The method is linear. 

Function is further under construction to accept different IOB profiles.

#
3. Visual presentation of IOB calculations

Visual presentation of IOB calculations

#
4. Interactive mode (user input) - User settings

This section uses the #read parameter to ask for user input. It accepts at least up to two decimals for input, but most likely more (because of the calc app). Please mind that eventually it will prompt errors if you go crazy with the decimals.

The following entries are requested from the user:

    Target BG
        can be set at any number except negatives
    Minimum BG (for calculator to be active)
        can be set at any number except negatives
    Correct above (BG)
        can be set at any number except negatives
    IC ratio (how many carbohydrates are processed per one unit of insulin)
        can be set at any number except negatives
    Correction factor (how much does your blood glucose decrease per one unit of insulin)
        can be set at any number except negatives
    Reverse correction (adjusts a meal bolus when current BG is lower than target BG)
        use 1 for on, use 0 for off

    Current BG
        can be set at any number except negatives
        set as target BG, if no current BG
    Current carbohydrate consumption (in grams)
        can be set at any number except negatives
        set as 0 if no current carbohydrate consumption
    Current correction IOB (the volume of currently active units of insulin from a previous correction bolus)
        can be set at any number except negatives
        set at 0 for no correction IOB
        because IOB calculations cause a lot of people headaches, the IOB calculator can be used for this
    Current meal IOB (the amount of currently active units of insulin from a previous meal bolus)
        can be set at any number except negatives
        set at 0 for no meal IOB
        idem: because IOB calculations cause a lot of people headaches, the IOB calculator can be used for this


Whether you use a dot (e.g. 6.25) or a comma (e.g. 6,25 ) for a setting or entry; no problem, the dot and the comma are one and the same here.

Whether you use mmol/L or mg/dL for a setting or entry; no problem, this is of no relevance to the calculations (your bolus suggestion will remain the same)

For each user entry a separate text file is generated (or more). View the code of #bolus-sim to see what variable relates to what text file. All these separate files are then merged again into a yoursettings.txt file, which will be printed on the screen.

Because the script basically accepts every entry it is provided, it is as well easily corrupted (try running a calculation on letters instead of numbers). Please do not deviate from the instructions for user entries. Please provide feedback if encountering errors or malfunctions or inconsistient behaviour.



#
5. Visual presentation of user settings

After the yoursettings.txt file is generated, the script uses #cat yoursettings.txt to print all user entries on screen. Please confirm that they are correct, before hitting enter. If not correct, you can spam enter until the cache is cleared. Even if one of your entries totally messes up the script and the cache is not cleared, a rerun of the script will overwrite all previous entries.


**************************************************************************************************************

Please mind that clearing the cache involves a removal of all files in the temp folder

**************************************************************************************************************

#
6. Calculations

Of the available bolus options, these are the calculations:

    meal bolus:
    $CURRENTCARB / $ICRATIO = $MEALBOLUS

    meal bolus + reversed correction:
    $MEALBOLUS - (($TARGETBG - $CURRENTBG) / $CORRECTIONFACTOR) = $MEALBOLUS_REVERSED

    correction bolus no iob entry:
    ($CURRENTBG - $TARGETBG) / $CORRECTIONFACTOR = $CORRECTIONBOLUS

    correction bolus adjusted for iob entry:
    $CORRECTIONBOLUS - $CURRENTIOB_MEAL - $CURRENTIOB_CORRECTION = $CORRECTIONBOLUS_MINUS_IOB

    meal + correction bolus no iob entry:
    $MEALBOLUS + $CORRECTIONBOLUS = $TOTALBOLUS

    meal + correction bolus adjusted for iob entry:
    $CORRECTIONBOLUS - $CURRENTIOB_MEAL - $CURRENTIOB_CORRECTION = $CORRECTIONBOLUS_MINUS_IOB
    ($CURRENTCARB / $ICRATIO) - $leftover_CORRECTION_IOB = $MEALBOLUS_FINAL
    $CORRECTIONBOLUS_MINUS_IOB + $MEALBOLUS_FINAL = $FULLBOLUSCALC

On these bolus suggestions if_then will be applied according to user settings and entries.

Please mind that bolus calculators that use a single bolus formula, and also (especially) bolus calculators that do not distinguish between meal IOB and correction IOB, are deprecated, for over twenty years already.


#
7. Determining what bolus suggestion is suitable for the situation of the user

The current simulator offers the following options:

- Meal bolus (bolus for carbohydrates only)
- Meal bolus + reversed correction (bolus for carbohydrates, while target BG < current BG)
- Correction bolus without IOB entry (bolus to correct for current BG > target BG, while IOB = 0)
- Correction bolus adjusted for IOB (bolus to correct for current BG > target BG, while IOB > 0)
- Meal and correction bolus without IOB entry (combined meal + correction bolus, while IOB = 0)
- Meal and correction bolus adjusted for IOB entry (combined meal + correction bolus, while IOB > 0)

The scipt uses if_then to to determine what situation applies. If the situation allows for a bolus, then the suitable option will be presented. 

The rules, of which all have to apply in order for a suggestion to be made, are listed below. The calculator only allows for one of the following rule sets to fully apply at once:

preset:
if no BG entry, then current BG = target BG

Meal bolus rule set*:
- if current BG > minimum BG, then bolus calculator becomes available (1/3)
- if current BG = target BG, or if no BG, then meal bolus becomes available (2/3)
- if carbohydrate entry > 0, then a meal bolus suggestion becomes available (3/3)

*this one might be changed in a future update; it is just a requirement for the script to run to have a current BG entry at the moment, so if no BG available, current BG has to be set as target BG (because if current BG = target BG, then your BG is perfect, and only the carbohydrate entry will be taken into account for the bolus suggestion).

Meal bolus + reversed correction rule set:
- if current BG > minimum BG, then bolus calculator becomes available (1/4)
- if current BG < target BG, then reversed correction becomes available (2/4)
- if carbohydrate entry > 0, then meal bolus becomes available (3/4)
- if reversed correction is on (1), then reversed correction becomes available (4/4)

Correction bolus (no IOB) rule set:
- if current BG > minimum BG, then bolus calculator becomes available (1/4)
- if current BG > target BG, then correction bolus becomes available (2/4)
- if carbohydrate entry = 0, then correction bolus becomes available (3/4)
- if current IOB = 0, then correction bolus (no IOB) becomes available (4/4)

Correction bolus adjusted for IOB rule set:
- if current BG > minimum BG, then bolus calculator becomes available (1/5)
- if current BG > target BG, then correction bolus becomes available (2/5)
- if carbohydrate entry = 0, then correction bolus becomes available (3/5)
- if current IOB > 0, then correction bolus adjusted for IOB becomes available (4/5)
- if correction bolus adjusted for IOB > 0, then bolus suggestion becomes available (5/5)

Meal + correction bolus (no IOB) rule set:
- if current BG > minimum BG, then bolus calculator becomes available (1/4)
- if carbohydrate entry > 0, then meal bolus becomes available (2/4)
- if current BG > target BG, then correction bolus becomes available (3/4)
- if current IOB = 0, then meal + correction bolus (no IOB) becomes available (4/4)

Meal + correction bolus adjusted for IOB rule set:
- if current BG > minimum BG, then bolus calculator becomes available (1/4)
- if carbohydrate entry > 0, then meal bolus becomes available (2/4)
- if current BG > target BG, then correction bolus becomes available (3/4)
- if current IOB > 0, then meal + correction bolus adjusted for IOB becomes available (4/4)

Meal bolus 2 (yes again) rule set:
- If none of the above, then
    - if current BG > minimum BG, then bolus calculator becomes available (1/2)
    - if carbohydrate entry > 0, then a meal bolus suggestion becomes available (2/2)

#
This last meal bolus (yes again) is to provide a meal bolus while there are other entries that prompt for another bolus suggestion, but are nullified by each other in the current circumstances.

#
8. Visual presentation of the bolus suggestion and bolus calculation(s)

Calculations are merged into a report file, which will then be visually presented to the user by #cat.

Please view the code of #bolus-sim for more information

#
9. Clearing of cache

No option for saving data to prevent corruption of the script. This script only stores your information temporarily in order to visually present it to you. All data is deleted after each run. At the end of the script the temp folder is removed via rm -rf.

If you want to save bolus calculations, use printscreen / PrtSc, or use tee.


#
10. Warnings (risk factors)

Never blindly trust a device. Always keep in mind your own situation.

For example, the simulator can almost always be used for a meal bolus, but that doesn't mean a meal bolus is required.

    *************************************************************************************

    BASH Bolus Calculator Simulator - interactive mode
    ...
    *************************************************************************************

    Did you administer a bolus recently? (1=yes, 0=no)
    0
    ______________________________________________________________________
    *************************************************************************************
    You have no meal IOB and no correction IOB
    *************************************************************************************
    Target BG:
    6.00
    ______________________________________________________________________
    Minimum BG:
    3.90
    ______________________________________________________________________
    Correct above (BG)
    6.00
    ______________________________________________________________________
    IC ratio (one unit of insulin consumes X(X(X)) grams of carbohydrates)
    17 
    ______________________________________________________________________
    Correction factor (decrease of BG per unit of insulin)
    2.3
    ______________________________________________________________________
    Reverse correction on (1) or off (0)
    0
    ______________________________________________________________________
    Current BG (if no current BG available, current BG has to be set as target BG):
    4.0
    ______________________________________________________________________
    Carbohydrate consumption in gram:
    40
    ______________________________________________________________________
    Current meal IOB:
    2
    ______________________________________________________________________
    Current correction IOB:
    6 
    ______________________________________________________________________
    Your settings
    Thu 18 Feb 2021 10:29:21 PM WET
    Target BG: 6.00
    Minimum BG: 3.90
    Correct above BG: 6.00
    IC ratio: 17
    Correction factor: 2.3
    Reversed correction: 0
    Current BG: 4.0
    Carbohydrate consumption: 40
    Current meal IOB: 2
    Current correction IOB: 6
    ______________________________________________________________________
    Confirm entries, then hit enter
    ____________________________________________________________
    BASH Bolus Calculator Simulator
    v1.07
    ...

    your settings are loaded

    ****************************************************************************
    you still have 2 units of insulin on board (from previous meal bolus)
    you still have 6 units of insulin on board (from previous correction)
    ****************************************************************************

    Loaded calculators...
    ____________________________________________________________
    MEAL BOLUS (just a meal bolus)
    Unavailable
    ______________________________________________________________________
    MEAL BOLUS + reversed correction
    Unavailable
    ______________________________________________________________________
    CORRECTION BOLUS no IOB entry
    Unavailable
    ______________________________________________________________________
    CORRECTION BOLUS recalculated for IOB
    Unavailable
    ______________________________________________________________________
    MEAL BOLUS + CORRECTION BOLUS no IOB entry
    Unavailable
    ______________________________________________________________________
    MEAL BOLUS + CORRECTION BOLUS recalculated for IOB
    Unavailable
    ______________________________________________________________________
    MEAL BOLUS (just a meal bolus)

    Thu 18 Feb 2021 10:29:21 PM WET
    Target BG: 6.00
    Minimum BG: 3.90
    Correct above BG: 6.00
    IC ratio: 17
    Correction factor: 2.3
    Reversed correction: 0
    Current BG: 4.0
    Carbohydrate consumption: 40
    Current meal IOB: 2
    Current correction IOB: 6

    Your meal bolus is calulated as followed:

    Carbohydrate consumption / IC-ratio =

    MEAL BOLUS
    40 / 17 = 2.35294117647058823529

    TOTAL BOLUS SUGGESTION
    2.35294117647058823529 units of insulin

    ______________________________________________________________________

With a correction IOB of 6, while current BG = 4, the suggested meal bolus doesn't further add to a decrease of BG, but it does not improve the situation either. In this situation, preferably, one takes into account the 6 units = 6 * 2.3 = ~13.8 further decrease in BG, and maybe waits with administering additional insulin until situation is stabilized. 

Reversed correction can only provide for limited compensation here. The question also remains how the user ends up with such a dose of correction insulin still active while BG is almost near minimum treshold, way below target.

Some insulin pumps include a warning system for these situations. There are even those that provide a counter-suggestion of carbohydrates. This function is already prepared in BASH and will be implemented around Apr 2021 along with some other tweaks.

#
+1 if you read everything. 


Roadmap
-
https://i.imgur.com/j7f6r5U.gifv
