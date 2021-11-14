!#bin/bash
#Menu script; choose your preference

echo "If preference is running the simulator with one of the following rounding module, type 1: 0.20, 0.10, 0.05, 0.1, 0.001, or 0.000000001."
echo "If preference is not to apply rounding to the simulator's calculations, type 2"
echo ''
read PREFERENCE
echo "$PREFERENCE" > PREFERENCE.txt

DEVICE_SELECTION=1

if [[ $PREFERENCE -eq 1 ]] && [[ $DEVICE_SELECTION -eq 1 ]]; then bash bolus-sim-device1; fi

if [[ $PREFERENCE -eq 2 ]] && [[ $DEVICE_SELECTION -eq 1 ]]; then bash bolus-sim-device1-test; fi

echo 'test'
echo 'done'

#V
