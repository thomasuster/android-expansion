NME Extension for Android Expansion files

```
haxelib dev android-expansion android-expansion
cd android-expansion
cd samples/DisplayingABitmap/
nme test android
```

You should see an orange NME logo. Now Close the app.

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