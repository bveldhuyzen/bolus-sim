BASH Bolus Calculator Simulator
-
v1.07

- Stand-alone bolus calculator simulator
- Works interactive 
- Accepts $DEVICE settings
- Allows for manual input of meal IOB and correction IOB
- Optionally calculates your meal IOB and correction IOB
- Includes calculations with every bolus suggestion
- Runs on tablets, laptops, pc's, smartphones, likely also on raspberry, watches, and chromebooks

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
2. Open Termux application
3. Update the app by typing "pkg update" (without the "") and hit enter
4. Select yes if prompted for confirmation during the update
5. Obtain required packages by typing "pkg install calc perl git" (without the "") and hit enter
6. Select yes if prompted for confirmations during the update
7. Obtain script by typing "git clone https://github.com/bveldhuyzen/bolus-sim.git" (without the "") and hit enter
8. Go to script folder by typing "cd bolus-sim" (without the "") and hit enter
9. Type "bash bolus-sim" (without the "") and hit enter

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
Optionally, the user may include meal IOB and/or correction IOB, in order to further simulate one's situation.
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

The script (#iob_calc.sh) then calculates what part of your last meal and/or correction bolus is still active. It determines the amount of insulin that is still active based on your insulin duration. IOB is calculated as followed:

    Last meal bolus leftover IOB
        $last_meal_bolus - ($hours_ago_last_meal_bolus / $insulin_duration) * $last_meal_bolus = leftover_IOB_from_last_meal_bolus
    Last correction bolus leftover IOB
        $last_correction_bolus - ($hours_ago_last_correction_bolus / $insulin_duration) * $last_correction_bolus = leftover_IOB_from_last_correction_bolus

Function is further under construction to accept different IOB profiles.

#
3. Visual presentation of IOB calculations

Visual presentation of IOB calculations

#
4. Interactive mode (user input) - User settings

This section uses the #read parameter to ask for user input. It accepts at least up to two decimals for input, but most likely more (because of the calc app). Please mind that eventually it will prompt errors if you go crazy with the decimals.

Please consult your healthcare provider for all settings.

The following settings are requested from the user:

    Target BG
        desired target level of blood glucose
        can be set at any number except negatives
    Minimum BG
        required minimum level of blood glucose for bolus calculator to be active
        can be set at any number except negatives
    Correct above BG
        provide correction bolus suggestion when blood glucose level is above
        can be set at any number except negatives
    IC ratio (insulin-to-carbohydrate ratio)
        how many carbohydrates are processed per one unit of insulin
        can be set at any number except negatives
    Correction factor
        how much does your blood glucose level decrease per one unit of insulin
        can be set at any number except negatives
    Reverse correction
        adjusts a meal bolus when current BG is lower than target BG (see $DEVICE manual)
        use 1 for on, use 0 for off


The following status entries are requested from the user:

    Current BG
        your current blood glucose level
        can be set at any number except negatives
        set as target BG, if no current BG
    Current carbohydrate consumption (in gram)
        your intake of carbohydrates in gram
        can be set at any number except negatives
        set as 0 if no current carbohydrate consumption
    Current correction IOB
        the amount of currently active units of insulin from a previous correction bolus
        can be set at any number except negatives
        set at 0 for no correction IOB
        because IOB calculations cause a lot of people headaches, the IOB calculator can be used for this
    Current meal IOB 
        the amount of currently active units of insulin from a previous meal bolus
        can be set at any number except negatives
        set at 0 for no meal IOB
        idem: because IOB calculations cause a lot of people headaches, the IOB calculator can be used for this


Whether you use a dot (e.g. 6.25) or a comma (e.g. 6,25 ) for a setting or entry; no problem, the dot and the comma are one and the same here.

Whether you use mmol/L or mg/dL on your device; no problem, this is of no relevance to the calculations (your bolus suggestion will remain the same)

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
        $MEALBOLUS - (($CURRENTBG - $TARGETBG) / $CORRECTIONFACTOR) = $MEALBOLUS_REVERSED
        *in $DEVICE the reversed correction is calculated otherwise, but the result is the same, see $DEVICE system user guide

    correction bolus no iob entry:
        ($CURRENTBG - $TARGETBG) / $CORRECTIONFACTOR = $CORRECTIONBOLUS

    correction bolus adjusted for iob entry:
        $CORRECTIONBOLUS - $CURRENTIOB_MEAL - $CURRENTIOB_CORRECTION = $CORRECTIONBOLUS_MINUS_IOB
        if $CORRECTIONBOLUS_MINUS_IOB < 0, then $CORRECTIONBOLUS_MINUS_IOB = 0

    meal + correction bolus no iob entry:
        $MEALBOLUS + $CORRECTIONBOLUS = $TOTALBOLUS

    meal + correction bolus adjusted for iob entry:
    
        Pending update: 
        
        This bolus is not a single formula, but a result of several. Giving it a try now.
    
        As first is determined that there is IOB
        Second it is determinded there is need for a meal bolus and a need for a correction bolus
        
        The meal bolus is already calculated as followed:
        $CURRENTCARB / $ICRATIO = $MEALBOLUS
        
        The correction bolus is already calculated as followed:
        ($CURRENTBG - $TARGETBG) / $CORRECTIONFACTOR = $CORRECTIONBOLUS
        
        IOB is specified as followed:
        - Correction IOB (from previous correction bolus)
        - Meal IOB (from previous meal bolus)

        The correction bolus will be adjusted for IOB as followed:
        $CORRECTIONBOLUS - $CURRENTIOB_MEAL = $correctionbolusminusIOBmeal
        if $correctionbolusminusIOBmeal < 0, then $correctionbolusminusIOBmeal = 0 && $correctionbolusminusIOB = 0
                
        if $correctionbolusminusIOBmeal is not less than zero, then
        $correctionbolusminusIOBmeal - $CURRENTIOB_CORRECTION = $correctionbolusminusIOB

        The meal bolus will be adjusted for IOB as followed:
        if correction IOB > (correction bolus - meal IOB), then
        $MEALBOLUS - IOB_leftover = $MEALBOLUS_FINAL       
        where $IOB_leftover = $CURRENTIOB_CORRECTION - $correctionbolusminusIOBmeal 
        else
        $MEALBOLUS = $MEALBOLUS_FINAL
        
        The final bolus suggestion for a meal + correction bolus adjusted for IOB will then be:
        if $correctionbolusminusIOB < 0, then $correctionbolusminusIOB = 0
        if $MEALBOLUS_FINAL < 0, then $MEALBOLUS_FINAL = 0
        $correctionbolusminusIOB + $mealbolus_final = $FULLBOLUSCALC
        
        ...
        
    
edit: the rationale will be included a bit later in a more complete version of the user guide (you may already find it in the system user guide of $DEVICE).

On these bolus suggestions if_then will be applied according to user settings and entries.


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

Even when used, reversed correction would only be able to provide for limited compensation here. The question also remains how the user ends up with such a dose of correction insulin still active while BG is almost near minimum treshold, way below target.

Some insulin pumps include a warning system for these situations. There are even those that provide a counter-suggestion of carbohydrates. This function is already prepared in BASH and will be implemented around Apr 2021 along with some other tweaks. 

Edit: a separate simulator will be provided for future updates. Keeping this one as it is now, so that users of $DEVICE may continue using it as simulator of $DEVICE.

#
+1 if you read everything. 


Roadmap
-
https://github.com/bveldhuyzen/bolus-sim-multitool

#
