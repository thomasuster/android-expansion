package com.thomasuster;

import com.google.android.vending.expansion.downloader.IDownloaderClient;
import android.os.Messenger;
import com.google.android.vending.expansion.downloader.DownloadProgressInfo;

public class DownloaderClientImpl implements IDownloaderClient {

    public DownloaderClientImpl() {}

    public void onServiceConnected(Messenger m) {
//        mRemoteService = DownloaderServiceMarshaller.CreateProxy(m);
//        mRemoteService.onClientUpdated(mDownloaderClientStub.getMessenger());
    }

    public void onDownloadStateChanged(int newState) {

    }

    public void onDownloadProgress(DownloadProgressInfo progress) {

    }
}