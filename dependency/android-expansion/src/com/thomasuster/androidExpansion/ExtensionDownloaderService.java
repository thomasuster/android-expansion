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
//import android.content.Service;
import com.google.android.vending.expansion.downloader.impl.DownloaderService;

import java.util.Calendar;

public class ExtensionDownloaderService extends DownloaderService {

    @Override
    public String getPublicKey() {
        return Expansion.BASE64_PUBLIC_KEY;
    }

    @Override
    public byte[] getSALT() {
        return Expansion.SALT;
    }

    @Override
    public String getAlarmReceiverClassName() {
        return DownloaderReceiver.class.getName();
    }
}