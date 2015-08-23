# NME Extension for Android Expansion files

Assumes one main obb file and no patch obb file.

```
haxelib dev android-expansion android-expansion
cd android-expansion
cd samples/DisplayingABitmap/
nme test android
```

You should see an orange NME logo. Now close the app.

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
```
You should also test that your app properly downloads the obb file when it has been removed.