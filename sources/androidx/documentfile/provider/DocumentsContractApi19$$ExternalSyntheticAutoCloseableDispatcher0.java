package androidx.documentfile.provider;

import android.content.res.TypedArray;
import android.media.MediaDrm;
import android.media.MediaMetadataRetriever;
import java.util.concurrent.ExecutorService;
/* compiled from: D8$$SyntheticClass */
/* loaded from: classes11.dex */
public final /* synthetic */ class DocumentsContractApi19$$ExternalSyntheticAutoCloseableDispatcher0 {
    public static /* synthetic */ void m(Object obj) {
        if (obj instanceof AutoCloseable) {
            ((AutoCloseable) obj).close();
        } else if (obj instanceof ExecutorService) {
            DocumentsContractApi19$$ExternalSyntheticAutoCloseableForwarder1.m((ExecutorService) obj);
        } else if (obj instanceof TypedArray) {
            ((TypedArray) obj).recycle();
        } else if (obj instanceof MediaMetadataRetriever) {
            ((MediaMetadataRetriever) obj).release();
        } else if (obj instanceof MediaDrm) {
            ((MediaDrm) obj).release();
        } else {
            DocumentsContractApi19$$ExternalSyntheticThrowIAE2.m(obj);
        }
    }
}
