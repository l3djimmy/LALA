package com.rajat.pdfviewer.util;

import android.content.Context;
import android.net.ConnectivityManager;
import android.net.NetworkCapabilities;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
/* compiled from: NetworkUtil.kt */
@Metadata(d1 = {"\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0000\bÇ\u0002\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J\u000e\u0010\u0004\u001a\u00020\u00052\u0006\u0010\u0006\u001a\u00020\u0007¨\u0006\b"}, d2 = {"Lcom/rajat/pdfviewer/util/NetworkUtil;", "", "<init>", "()V", "checkInternetConnection", "", "context", "Landroid/content/Context;", "pdfViewer_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes12.dex */
public final class NetworkUtil {
    public static final int $stable = 0;
    public static final NetworkUtil INSTANCE = new NetworkUtil();

    private NetworkUtil() {
    }

    public final boolean checkInternetConnection(Context context) {
        NetworkCapabilities $this$checkInternetConnection_u24lambda_u241_u24lambda_u240;
        Intrinsics.checkNotNullParameter(context, "context");
        int result = 0;
        ConnectivityManager cm = (ConnectivityManager) context.getSystemService("connectivity");
        if (cm != null && ($this$checkInternetConnection_u24lambda_u241_u24lambda_u240 = cm.getNetworkCapabilities(cm.getActiveNetwork())) != null) {
            if ($this$checkInternetConnection_u24lambda_u241_u24lambda_u240.hasTransport(1)) {
                result = 2;
            } else if ($this$checkInternetConnection_u24lambda_u241_u24lambda_u240.hasTransport(0)) {
                result = 1;
            } else if ($this$checkInternetConnection_u24lambda_u241_u24lambda_u240.hasTransport(4)) {
                result = 3;
            }
        }
        return result != 0;
    }
}
