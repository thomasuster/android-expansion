package com.thomasuster.androidExpansion;

import android.app.AlarmManager;
import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.os.Bundle;
import org.haxe.extension.Extension;
import java.util.Map;
import android.content.BroadcastReceiver;
import com.google.android.vending.expansion.downloader.DownloaderClientMarshaller;
import android.content.pm.PackageManager.NameNotFoundException;
import java.util.Calendar;

public class DownloaderReceiver extends BroadcastReceiver {
    @Override
    public void onReceive(Context context, Intent intent) {
        try {
            DownloaderClientMarshaller.startDownloadServiceIfRequired(context,
                    intent, ExtensionDownloaderService.class);
        } catch (NameNotFoundException e) {
            e.printStackTrace();
        }
    }
}