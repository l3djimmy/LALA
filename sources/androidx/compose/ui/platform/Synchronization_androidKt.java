package androidx.compose.ui.platform;

import kotlin.Metadata;
import kotlin.jvm.functions.Function0;
/* compiled from: Synchronization.android.kt */
@Metadata(d1 = {"\u0000\u0018\n\u0000\n\u0002\u0010\u0000\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\u001a\u0015\u0010\u0000\u001a\u00020\u00012\n\b\u0002\u0010\u0002\u001a\u0004\u0018\u00010\u0001H\u0080\b\u001a;\u0010\u0003\u001a\u0002H\u0004\"\u0004\b\u0000\u0010\u00042\n\u0010\u0005\u001a\u00060\u0001j\u0002`\u00062\f\u0010\u0007\u001a\b\u0012\u0004\u0012\u0002H\u00040\bH\u0080\b\u0082\u0002\n\n\b\b\u0001\u0012\u0002\u0010\u0002 \u0001¢\u0006\u0002\u0010\t*\f\b\u0000\u0010\n\"\u00020\u00012\u00020\u0001¨\u0006\u000b"}, d2 = {"makeSynchronizedObject", "", "ref", "synchronized", "R", "lock", "Landroidx/compose/ui/platform/SynchronizedObject;", "block", "Lkotlin/Function0;", "(Ljava/lang/Object;Lkotlin/jvm/functions/Function0;)Ljava/lang/Object;", "SynchronizedObject", "ui_release"}, k = 2, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes11.dex */
public final class Synchronization_androidKt {
    public static /* synthetic */ void SynchronizedObject$annotations() {
    }

    public static final Object makeSynchronizedObject(Object ref) {
        return ref == null ? new Object() : ref;
    }

    public static /* synthetic */ Object makeSynchronizedObject$default(Object ref, int i, Object obj) {
        if ((i & 1) != 0) {
            ref = null;
        }
        return ref == null ? new Object() : ref;
    }

    /* renamed from: synchronized  reason: not valid java name */
    public static final <R> R m6081synchronized(Object lock, Function0<? extends R> function0) {
        R invoke;
        synchronized (lock) {
            invoke = function0.invoke();
        }
        return invoke;
    }
}
