#!/bin/bash
#v1.01
#lightweight IOB calculator
#
#https://www.boluscalculators.com
#repository [at] boluscalculators dot com
#2021
#

echo ''
echo '**** IOB calculator ****'
echo ''
echo '______________________________________________________________________'

#to multiply all settings / adding some zeroes (was previously 10000)
echo '1000000000' > 10000.txt
TENTHOUSAND=$(<10000.txt)

#Last meal bolus in units of insulin
echo 'Last meal bolus in units of insulin'
read last_meal_bolus
echo "$last_meal_bolus" > last_meal_bolus_entry.txt
sed 's/,/./g' last_meal_bolus_entry.txt > last_meal_bolus_entry_1.txt
last_meal_bolus_1=$(<last_meal_bolus_entry_1.txt)

#How many hours ago?
echo 'How many hours ago was this meal bolus (half an hour being 0.5 or 0,5)?'
read hours_ago_last_meal_bolus
echo "$hours_ago_last_meal_bolus" > hours_ago_last_meal_bolus_entry.txt
sed 's/,/./g' hours_ago_last_meal_bolus_entry.txt > hours_ago_last_meal_bolus_entry_1.txt
hours_ago_last_meal_bolus_1=$(<hours_ago_last_meal_bolus_entry_1.txt)
echo '______________________________________________________________________'

#Last correction bolus in units of insulin
echo 'Last correction bolus in units of insulin'
read last_correction_bolus
echo "$last_correction_bolus" > last_correction_bolus_entry.txt
sed 's/,/./g' last_correction_bolus_entry.txt > last_correction_bolus_entry_1.txt
last_correction_bolus_1=$(<last_correction_bolus_entry_1.txt)

#How many hours ago?
echo 'How many hours ago was this correction bolus (half an hour being 0.5 or 0,5)?'
read hours_ago_last_correction_bolus
echo "$hours_ago_last_correction_bolus" > hours_ago_last_correction_bolus_entry.txt
sed 's/,/./g' hours_ago_last_correction_bolus_entry.txt > hours_ago_last_correction_bolus_entry_1.txt
hours_ago_last_correction_bolus_1=$(<hours_ago_last_correction_bolus_entry_1.txt)
echo '______________________________________________________________________'

#Insulin duration in hours
echo 'Insulin duration in hours'
read insulin_duration
echo "$insulin_duration" > insulin_duration_entry.txt
sed 's/,/./g' insulin_duration_entry.txt > insulin_duration_entry_1.txt
insulin_duration_1=$(<insulin_duration_entry_1.txt)
echo '______________________________________________________________________'

#multiplication factor
calc -d "$last_meal_bolus_1 * $TENTHOUSAND" > last_meal_bolus_10000_space.txt
sed -e 's/^[\t]*//' last_meal_bolus_10000_space.txt > last_meal_bolus_10000.txt
calc -d "$hours_ago_last_meal_bolus_1 * $TENTHOUSAND" > hours_ago_last_meal_bolus_10000_space.txt
sed -e 's/^[\t]*//' hours_ago_last_meal_bolus_10000_space.txt > hours_ago_last_meal_bolus_10000.txt
calc -d "$last_correction_bolus_1 * $TENTHOUSAND" > last_correction_bolus_10000_space.txt
sed -e 's/^[\t]*//' last_correction_bolus_10000_space.txt > last_correction_bolus_10000.txt
calc -d "$hours_ago_last_correction_bolus_1 * $TENTHOUSAND" > hours_ago_last_correction_bolus_10000_space.txt
sed -e 's/^[\t]*//' hours_ago_last_correction_bolus_10000_space.txt > hours_ago_last_correction_bolus_10000.txt
calc -d "$insulin_duration_1 * $TENTHOUSAND" > insulin_duration_10000_space.txt
sed -e 's/^[\t]*//' insulin_duration_10000_space.txt > insulin_duration_10000.txt

#new variables
last_meal_bolus10000=$(<last_meal_bolus_10000.txt)
hours_ago_last_meal_bolus10000=$(<hours_ago_last_meal_bolus_10000.txt)
last_correction_bolus10000=$(<last_correction_bolus_10000.txt)
hours_ago_last_correction_bolus10000=$(<hours_ago_last_correction_bolus_10000.txt)
insulin_duration10000=$(<insulin_duration_10000.txt)

#your current meal IOB
echo 'According to your entries, your current meal IOB is'

#part of previous meal bolus used
if [[ $hours_ago_last_meal_bolus10000 -lt $insulin_duration10000 ]]
then
calc -d "$hours_ago_last_meal_bolus10000"/"$insulin_duration10000" > last_meal_bolus_factor_10000.txt
last_meal_bolus_factor10000=$(<last_meal_bolus_factor_10000.txt)
calc -d "$last_meal_bolus10000"*"$last_meal_bolus_factor10000" > last_meal_bolus_used_10000.txt
last_meal_bolus_used10000=$(<last_meal_bolus_used_10000.txt)
#part of previous meal bolus still active
calc -d "$last_meal_bolus10000"-"$last_meal_bolus_used10000" > last_meal_bolus_iob_10000.txt
last_meal_bolus_iob10000=$(<last_meal_bolus_iob_10000.txt)
#printf %.0f $last_meal_bolus_iob10000 > last_meal_bolus_iob_for_if_then.txt
#last_meal_bolus_iob_for_if_then=$(<last_meal_bolus_iob_for_if_then.txt)
calc - "$last_meal_bolus_iob10000 / $TENTHOUSAND" > last_meal_bolus_iob_1.txt
last_meal_bolus_iob_1=$(<last_meal_bolus_iob_1.txt)
echo "$last_meal_bolus_iob_1 units of insulin"
else
echo 'No IOB from previous meal bolus'
fi
echo '______________________________________________________________________'


#your current correction IOB
echo 'According to your entries, your current correction IOB is'

#part of previous correction bolus used
if [[ $hours_ago_last_correction_bolus10000 -lt $insulin_duration10000 ]]
then
calc -d "$hours_ago_last_correction_bolus10000"/"$insulin_duration10000" > last_correction_bolus_factor_10000.txt
last_correction_bolus_factor10000=$(<last_correction_bolus_factor_10000.txt)
calc -d "$last_correction_bolus10000"*"$last_correction_bolus_factor10000" > last_correction_bolus_used_10000.txt
last_correction_bolus_used10000=$(<last_correction_bolus_used_10000.txt)
#part of previous meal bolus still active
calc -d "$last_correction_bolus10000"-"$last_correction_bolus_used10000" > last_correction_bolus_iob_10000.txt
last_correction_bolus_iob10000=$(<last_correction_bolus_iob_10000.txt)
#printf %.0f $last_correction_bolus_iob10000 > last_correction_bolus_iob_for_if_then.txt
#last_correction_bolus_iob_for_if_then=$(<last_correction_bolus_iob_for_if_then.txt)
calc - "$last_correction_bolus_iob10000 / $TENTHOUSAND" > last_correction_bolus_iob_1.txt
last_correction_bolus_iob_1=$(<last_correction_bolus_iob_1.txt)
echo "$last_correction_bolus_iob_1 units of insulin"
else
echo 'No IOB from previous correction bolus'
fi
echo '______________________________________________________________________'


#visual presentation
echo ''
echo '*************************************************************************************' 
echo "You have a meal IOB of $last_meal_bolus_iob_1 units of insulin"
echo '&&'
echo "You have a correction IOB of $last_correction_bolus_iob_1 units of insulin"
echo '*************************************************************************************'


#V
