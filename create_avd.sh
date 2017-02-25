#!/bin/bash
if [ ${TEST} == "android" ]; then
    echo no | android create avd --force --name test --target $ANDROID_TARGET --abi $ANDROID_ABI --sdcard 800M
    echo "runtime.network.latency=none" >> $HOME/.android/avd/test.avd/config.ini
    echo "runtime.network.speed=full" >> $HOME/.android/avd/test.avd/config.ini
    echo "hw.keyboard=yes" >> $HOME/.android/avd/test.avd/config.ini
    emulator -avd test -debug all -memory 4000 -noskin -no-audio -cache-size 400 -netdelay none -netspeed full -no-window -no-boot-anim &
    ./wait_for_emulator.sh
    adb shell input keyevent 82 &
    cat $HOME/.android/avd/test.avd/config.ini
    adb devices
    sleep 10
    adb shell settings put global window_animation_scale 0 &
    adb shell settings put global transition_animation_scale 0 &
    adb shell settings put global animator_duration_scale 0 &
    adb -e logcat *:W | tee logcat.log > /dev/null 2>&1 &
fi