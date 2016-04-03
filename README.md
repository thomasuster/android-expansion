## NME Extension for Android Expansion files

[![MIT License](https://img.shields.io/badge/license-MIT-blue.svg?style=flat)](LICENSE.md)
[![TravisCI Build Status](https://travis-ci.org/thomasuster/android-expansion.svg?branch=master)](https://travis-ci.org/thomasuster/android-expansion )

Assumes one main obb file and no patch obb file.

```
haxelib dev android-expansion android-expansion
cd android-expansion
cd samples/DisplayingABitmap/
nme test android
```

You should see an orange NME logo. Now close the app. For testing we're going to use 'android-expansion push' which assumes you have Android 6.0 on your phone, go ahead and update the OS if you're under 6.0.

```
haxelib run android-expansion zip io.nme.samples.displayingabitmap 181 main-expansion
haxelib run android-expansion push io.nme.samples.displayingabitmap 181
```

Open the app, you should now see a Pink NME logo.
Now look at the sample to see how it works.

```
open project.nmml
open Source/Main.hx
```

---

Test to make sure your app can launch without the obb file. You can remove the obb file using adb shell.
```
adb shell
cd /mnt/shell/emulated/obb
ls
cd io.nme.samples.displayingabitmap
rm main.180.io.nme.samples.displayingabitmap.obb
```
Once your APK and OBB file are ready through Google Play you should also test that your app properly
downloads the obb file when it has been removed.