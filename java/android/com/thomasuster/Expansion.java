package com.thomasuster;

//import android.app.AlarmManager;
//import android.app.PendingIntent;
//import android.content.Context;
//import android.content.Intent;
//import android.database.Cursor;
//import android.database.sqlite.SQLiteDatabase;
//import android.os.Bundle;
import org.haxe.extension.Extension;
//import java.util.Map;
//
//import com.google.android.vending.expansion.downloader.Helpers;
//import java.util.Calendar;

public class Expansion extends Extension {

    public Expansion() {}

    public static void init() {

    }

    boolean expansionFilesDelivered() {
//        for (XAPKFile xf : xAPKS) {
//            String fileName = Helpers.getExpansionAPKFileName(this, xf.mIsBase,
//                    xf.mFileVersion);
//            if (!Helpers.doesFileExist(this, fileName, xf.mFileSize, false))
//                return false;
//        }
        return true;
    }

    /*
    @Override
    public void onCreate(Bundle savedInstanceState) {
        // Check if expansion files are available before going any further
        if (!expansionFilesDelivered()) {
            // Build an Intent to start this activity from the Notification
            Intent notifierIntent = new Intent(this, MainActivity.getClass());
            notifierIntent.setFlags(Intent.FLAG_ACTIVITY_NEW_TASK |
                    Intent.FLAG_ACTIVITY_CLEAR_TOP);
            ...
            PendingIntent pendingIntent = PendingIntent.getActivity(this, 0,
                    notifierIntent, PendingIntent.FLAG_UPDATE_CURRENT);

            // Start the download service (if required)
            int startResult =
                    DownloaderClientMarshaller.startDownloadServiceIfRequired(this,
                            pendingIntent, SampleDownloaderService.class);
            // If download has started, initialize this activity to show
            // download progress
            if (startResult != DownloaderClientMarshaller.NO_DOWNLOAD_REQUIRED) {
                // This is where you do set up to display the download
                // progress (next step)
                ...
                return;
            } // If the download wasn't necessary, fall through to start the app
        }
        startApp(); // Expansion files are available, start the app
    }
    */

    /*
    @Override
protected void onResume() {
    if (null != mDownloaderClientStub) {
        mDownloaderClientStub.connect(this);
    }
    super.onResume();
}

@Override
protected void onStop() {
    if (null != mDownloaderClientStub) {
        mDownloaderClientStub.disconnect(this);
    }
    super.onStop();
}
     */



/*
    // The shared path to all app expansion files
    private final static String EXP_PATH = "/Android/obb/";

    static String[] getAPKExpansionFiles(Context ctx, int mainVersion,
                                         int patchVersion) {
        String packageName = ctx.getPackageName();
        Vector<String> ret = new Vector<String>();
        if (Environment.getExternalStorageState()
                .equals(Environment.MEDIA_MOUNTED)) {
            // Build the full path to the app's expansion files
            File root = Environment.getExternalStorageDirectory();
            File expPath = new File(root.toString() + EXP_PATH + packageName);

            // Check that expansion file path exists
            if (expPath.exists()) {
                if ( mainVersion > 0 ) {
                    String strMainPath = expPath + File.separator + "main." +
                            mainVersion + "." + packageName + ".obb";
                    File main = new File(strMainPath);
                    if ( main.isFile() ) {
                        ret.add(strMainPath);
                    }
                }
                if ( patchVersion > 0 ) {
                    String strPatchPath = expPath + File.separator + "patch." +
                            mainVersion + "." + packageName + ".obb";
                    File main = new File(strPatchPath);
                    if ( main.isFile() ) {
                        ret.add(strPatchPath);
                    }
                }
            }
        }
        String[] retArray = new String[ret.size()];
        ret.toArray(retArray);
        return retArray;
    }*/



    /*
    // Get a ZipResourceFile representing a merger of both the main and patch files
ZipResourceFile expansionFile =
    APKExpansionSupport.getAPKExpansionZipFile(appContext,
        mainVersion, patchVersion);

// Get an input stream for a known file inside the expansion file ZIPs
InputStream fileStream = expansionFile.getInputStream(pathToFileInsideZip);
     */
}