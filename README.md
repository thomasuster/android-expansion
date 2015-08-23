NME, OpenFL Extension for Android Expansion files

Make a main OBB file out of the folder main-expansion.
```
cd displayingabitmap
haxelib run android-expansion zip io.nme.samples.displayingabitmap 181 main-expansion
```

The 181 is from...
```
<meta build-number="181" />
```


It will print something like this...
```
MacBook:displayingabitmap thomasuster$ haxelib run android-expansion zip io.nme.samples.displayingabitmap 181 main-expansion
  adding: main-expansion/ (stored 0%)
  adding: main-expansion/nme.png (deflated 32%)
6342
```

6342 is the number of bytes of the OBB file, copy this number, you will need to pass this at runtime to ensure validity of the OBB.

Push that OBB file to your device for testing.
```
haxelib run android-expansion push io.nme.samples.displayingabitmap 200
```

```
//Services & API -> Base64-encoded RSA public key
AndroidExpansion.setKey('MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAul9VjbxKwReCzuLeVfNi1sCrsv/upIiSQsTS+5ToOiFD5tjEHNd4p/m95m4/8wf7aLgTjkhi7w8LTKwm+JVdFl5l4ZADY66Y+klysm95jrYhCHnbNjZIpQp6dKD94pVzo8Hf3d00vB0ZnyVhOZO8aMg9RrJtyzdioJgdMrpBq8yHXL8X/gvD00w/AkqHT+YUAXVn7FwuljMiDSAK15wO/uc/ec37yA4m8zMEK8K4skvzbA9cbAdBp+0PkxK+ep7zxNBtDtfCBJjlW4l1Fb3O7VA3i2abrxeWUnWZu3I51Rj/00h/cUXKz19TE8x/pDsUWUrRPqO5y98MsYctxX2drwIDAQAB');
AndroidExpansion.setVersion(181);
AndroidExpansion.setBytes(6342);
//Modify this salt
AndroidExpansion.setSalt([1, 42, -12, -1, 99, 98, -100, -12, 43, 2, -8, -4, 9, 5, -106, -107, -33, 45, -1, 84]);
if(!AndroidExpansion.expansionFilesDelivered())
    AndroidExpansion.startDownloadServiceIfRequired();
else
    expansionReader.getBitmapData('main-expansion/nme.png');

```