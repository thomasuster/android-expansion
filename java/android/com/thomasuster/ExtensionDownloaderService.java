package com.thomasuster;

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

    // You should also modify this salt
    public static final byte[] SALT = new byte[] { 1, 42, -12, -1, 99, 98,
            -100, -12, 43, 2, -8, -4, 9, 5, -106, -107, -33, 45, -1, 84
    };

    @Override
    public String getPublicKey() {
        return Expansion.BASE64_PUBLIC_KEY;
    }

    @Override
    public byte[] getSALT() {
        return SALT;
    }

    @Override
    public String getAlarmReceiverClassName() {
        return DownloaderReceiver.class.getName();
    }
}