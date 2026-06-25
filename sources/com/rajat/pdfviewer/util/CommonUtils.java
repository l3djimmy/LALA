package com.rajat.pdfviewer.util;

import android.graphics.Bitmap;
import java.util.Iterator;
import java.util.LinkedList;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import okhttp3.internal.ws.RealWebSocket;
/* compiled from: CommonUtils.kt */
@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0004\b\u0007\u0018\u0000 \u00042\u00020\u0001:\u0001\u0004B\u0007¢\u0006\u0004\b\u0002\u0010\u0003¨\u0006\u0005"}, d2 = {"Lcom/rajat/pdfviewer/util/CommonUtils;", "", "<init>", "()V", "Companion", "pdfViewer_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes12.dex */
public final class CommonUtils {
    public static final int $stable = 0;
    public static final Companion Companion = new Companion(null);
    public static final int MAX_CACHED_PDFS = 5;

    /* compiled from: CommonUtils.kt */
    @Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\u0003\u0018\u00002\u00020\u0001:\u0001\u0006B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u000e\u0010\u0004\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000¨\u0006\u0007"}, d2 = {"Lcom/rajat/pdfviewer/util/CommonUtils$Companion;", "", "<init>", "()V", "MAX_CACHED_PDFS", "", "BitmapPool", "pdfViewer_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    /* loaded from: classes12.dex */
    public static final class Companion {
        public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }

        private Companion() {
        }

        /* compiled from: CommonUtils.kt */
        @Metadata(d1 = {"\u0000,\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\b\n\u0002\b\u0007\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\b\u0002\bÇ\u0002\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J\b\u0010\u000b\u001a\u00020\bH\u0002J \u0010\f\u001a\u00020\u00062\u0006\u0010\r\u001a\u00020\b2\u0006\u0010\u000e\u001a\u00020\b2\b\b\u0002\u0010\u000f\u001a\u00020\u0010J\u000e\u0010\u0011\u001a\u00020\u00122\u0006\u0010\u0013\u001a\u00020\u0006R\u0014\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005X\u0082\u0004¢\u0006\u0002\n\u0000R\u0014\u0010\u0007\u001a\u00020\b8BX\u0082\u0004¢\u0006\u0006\u001a\u0004\b\t\u0010\n¨\u0006\u0014"}, d2 = {"Lcom/rajat/pdfviewer/util/CommonUtils$Companion$BitmapPool;", "", "<init>", "()V", "pool", "Ljava/util/LinkedList;", "Landroid/graphics/Bitmap;", "maxPoolSize", "", "getMaxPoolSize", "()I", "calculateMaxPoolSize", "getBitmap", "width", "height", "config", "Landroid/graphics/Bitmap$Config;", "recycleBitmap", "", "bitmap", "pdfViewer_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
        /* loaded from: classes12.dex */
        public static final class BitmapPool {
            public static final BitmapPool INSTANCE = new BitmapPool();
            private static final LinkedList<Bitmap> pool = new LinkedList<>();
            public static final int $stable = 8;

            private BitmapPool() {
            }

            private final int getMaxPoolSize() {
                return calculateMaxPoolSize();
            }

            private final int calculateMaxPoolSize() {
                long maxMemory = Runtime.getRuntime().maxMemory() / RealWebSocket.DEFAULT_MINIMUM_DEFLATE_SIZE;
                return (int) (maxMemory / 20480);
            }

            public static /* synthetic */ Bitmap getBitmap$default(BitmapPool bitmapPool, int i, int i2, Bitmap.Config config, int i3, Object obj) {
                if ((i3 & 4) != 0) {
                    config = Bitmap.Config.ARGB_8888;
                }
                return bitmapPool.getBitmap(i, i2, config);
            }

            public final Bitmap getBitmap(int width, int height, Bitmap.Config config) {
                Intrinsics.checkNotNullParameter(config, "config");
                synchronized (pool) {
                    Iterator iterator = pool.iterator();
                    Intrinsics.checkNotNullExpressionValue(iterator, "iterator(...)");
                    while (iterator.hasNext()) {
                        Bitmap next = iterator.next();
                        Intrinsics.checkNotNullExpressionValue(next, "next(...)");
                        Bitmap bitmap = next;
                        if (!bitmap.isRecycled() && bitmap.getWidth() == width && bitmap.getHeight() == height && bitmap.getConfig() == config) {
                            iterator.remove();
                            bitmap.eraseColor(0);
                            return bitmap;
                        }
                    }
                    Unit unit = Unit.INSTANCE;
                    Bitmap createBitmap = Bitmap.createBitmap(width, height, config);
                    Intrinsics.checkNotNullExpressionValue(createBitmap, "createBitmap(...)");
                    return createBitmap;
                }
            }

            public final void recycleBitmap(Bitmap bitmap) {
                Intrinsics.checkNotNullParameter(bitmap, "bitmap");
                if (!bitmap.isRecycled()) {
                    synchronized (pool) {
                        if (pool.size() < INSTANCE.getMaxPoolSize()) {
                            Boolean.valueOf(pool.add(bitmap));
                        } else {
                            bitmap.recycle();
                            Unit unit = Unit.INSTANCE;
                        }
                    }
                }
            }
        }
    }
}
