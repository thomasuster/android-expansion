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
import android.content.Service;

import java.util.Calendar;

public class DownloaderService extends DownloaderService {

    //PAKKA SPECIFIC
    // You must use the public key belonging to your publisher account
    public static final String BASE64_PUBLIC_KEY = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAk7nKWHD39iIveadXELyu0d5iDOzKuhd7r6+Euc8DsO8YBvDu6Zpn7hPqARMZ/xs1Dip7cZ4lbE5DcAgEfDunBSo128tt2D49o3G3VSuS5uKvGvitz0zQtVjNbztB9B7uFjyU7H+yvey/v9AW5x9K+8SMxDsHLrEvTFny40EleqLdej4IFTnkLh0zvoXuD2lu9Z8P9Yp0DoKfks0zBuv2zu0uVA/QXb+8Qo48Ey+LVcGH1F4k6yBsPwwME7CXnRMymMDn+RZnjkt9Xw3jSOVhgPDwCJcnBY7pXrqxTIH72ksEIMCt3WqTzOt+LLIKq4p+uP+dfMyCXZB7IhJynoLYtQIDAQAB";

    // You should also modify this salt
    public static final byte[] SALT = new byte[] { 11, 242, 312, 41, 554, 698,
            100, 812, 943, 12, 18, 14, 19, 15, 106, 107, 133, 145, 11, 184
    };

    @Override
    public String getPublicKey() {
        return BASE64_PUBLIC_KEY;
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