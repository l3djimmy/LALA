package androidx.compose.runtime;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import kotlin.Deprecated;
import kotlin.Metadata;
import kotlin.Pair;
import kotlin.TuplesKt;
import kotlin.collections.CollectionsKt;
/* compiled from: HotReloader.kt */
@Metadata(d1 = {"\u00004\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0003\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0000\u001a\b\u0010\u0000\u001a\u00020\u0001H\u0007\u001a\u001e\u0010\u0002\u001a\u0018\u0012\u0014\u0012\u0012\u0012\b\u0012\u00060\u0005j\u0002`\u0006\u0012\u0004\u0012\u00020\u00070\u00040\u0003H\u0007\u001a\u001a\u0010\b\u001a\u0014\u0012\u0010\u0012\u000e\u0012\u0004\u0012\u00020\t\u0012\u0004\u0012\u00020\u00070\u00040\u0003H\u0007\u001a\u0010\u0010\n\u001a\u00020\u00012\u0006\u0010\u000b\u001a\u00020\fH\u0007\u001a\u0010\u0010\r\u001a\u00020\u00012\u0006\u0010\u000e\u001a\u00020\u000fH\u0007¨\u0006\u0010"}, d2 = {"clearCompositionErrors", "", "currentCompositionErrors", "", "Lkotlin/Pair;", "Ljava/lang/Exception;", "Lkotlin/Exception;", "", "getCurrentCompositionErrors", "", "invalidateGroupsWithKey", "key", "", "simulateHotReload", "context", "", "runtime_release"}, k = 2, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes11.dex */
public final class HotReloaderKt {
    public static final void simulateHotReload(Object context) {
        HotReloader.Companion.simulateHotReload$runtime_release(context);
    }

    public static final void invalidateGroupsWithKey(int key) {
        HotReloader.Companion.invalidateGroupsWithKey$runtime_release(key);
    }

    @Deprecated(message = "currentCompositionErrors only reports errors that extend from Exception. This method is unsupported outside of Compose runtime tests. Internally, getCurrentCompositionErrors should be used instead.")
    public static final List<Pair<Exception, Boolean>> currentCompositionErrors() {
        Iterable $this$mapNotNull$iv = getCurrentCompositionErrors();
        Collection destination$iv$iv = new ArrayList();
        for (Object element$iv$iv$iv : $this$mapNotNull$iv) {
            Pair pair = (Pair) element$iv$iv$iv;
            Throwable cause = (Throwable) pair.component1();
            boolean recoverable = ((Boolean) pair.component2()).booleanValue();
            Exception exc = cause instanceof Exception ? (Exception) cause : null;
            Pair pair2 = exc != null ? TuplesKt.to(exc, Boolean.valueOf(recoverable)) : null;
            if (pair2 != null) {
                destination$iv$iv.add(pair2);
            }
        }
        return (List) destination$iv$iv;
    }

    public static final List<Pair<Throwable, Boolean>> getCurrentCompositionErrors() {
        Iterable $this$map$iv = HotReloader.Companion.getCurrentErrors$runtime_release();
        Collection destination$iv$iv = new ArrayList(CollectionsKt.collectionSizeOrDefault($this$map$iv, 10));
        for (Object item$iv$iv : $this$map$iv) {
            RecomposerErrorInfo it = (RecomposerErrorInfo) item$iv$iv;
            destination$iv$iv.add(TuplesKt.to(it.getCause(), Boolean.valueOf(it.getRecoverable())));
        }
        return (List) destination$iv$iv;
    }

    public static final void clearCompositionErrors() {
        HotReloader.Companion.clearErrors$runtime_release();
    }
}
