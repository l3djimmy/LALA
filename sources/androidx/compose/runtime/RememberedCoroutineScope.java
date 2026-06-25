package androidx.compose.runtime;

import java.util.concurrent.CancellationException;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.coroutines.CoroutineContext;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.coroutines.CompletableJob;
import kotlinx.coroutines.CoroutineScope;
import kotlinx.coroutines.Job;
import kotlinx.coroutines.JobKt;
/* compiled from: Effects.kt */
@Metadata(d1 = {"\u0000$\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u0002\n\u0002\b\u0005\b\u0000\u0018\u0000 \u00122\u00020\u00012\u00020\u0002:\u0001\u0012B\u0015\u0012\u0006\u0010\u0003\u001a\u00020\u0004\u0012\u0006\u0010\u0005\u001a\u00020\u0004¢\u0006\u0002\u0010\u0006J\u0006\u0010\r\u001a\u00020\u000eJ\b\u0010\u000f\u001a\u00020\u000eH\u0016J\b\u0010\u0010\u001a\u00020\u000eH\u0016J\b\u0010\u0011\u001a\u00020\u000eH\u0016R\u0010\u0010\u0007\u001a\u0004\u0018\u00010\u0004X\u0082\u000e¢\u0006\u0002\n\u0000R\u0014\u0010\b\u001a\u00020\u00048VX\u0096\u0004¢\u0006\u0006\u001a\u0004\b\t\u0010\nR\u000e\u0010\u000b\u001a\u00020\fX\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\u0005\u001a\u00020\u0004X\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\u0003\u001a\u00020\u0004X\u0082\u0004¢\u0006\u0002\n\u0000¨\u0006\u0013"}, d2 = {"Landroidx/compose/runtime/RememberedCoroutineScope;", "Lkotlinx/coroutines/CoroutineScope;", "Landroidx/compose/runtime/RememberObserver;", "parentContext", "Lkotlin/coroutines/CoroutineContext;", "overlayContext", "(Lkotlin/coroutines/CoroutineContext;Lkotlin/coroutines/CoroutineContext;)V", "_coroutineContext", "coroutineContext", "getCoroutineContext", "()Lkotlin/coroutines/CoroutineContext;", "lock", "", "cancelIfCreated", "", "onAbandoned", "onForgotten", "onRemembered", "Companion", "runtime_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes11.dex */
public final class RememberedCoroutineScope implements CoroutineScope, RememberObserver {
    private volatile CoroutineContext _coroutineContext;
    private final Object lock = this;
    private final CoroutineContext overlayContext;
    private final CoroutineContext parentContext;
    public static final Companion Companion = new Companion(null);
    public static final int $stable = 8;
    public static final CoroutineContext CancelledCoroutineContext = new CancelledCoroutineContext();

    public RememberedCoroutineScope(CoroutineContext parentContext, CoroutineContext overlayContext) {
        this.parentContext = parentContext;
        this.overlayContext = overlayContext;
    }

    @Override // kotlinx.coroutines.CoroutineScope
    public CoroutineContext getCoroutineContext() {
        CoroutineContext coroutineContext = this._coroutineContext;
        if (coroutineContext == null || coroutineContext == CancelledCoroutineContext) {
            Object lock$iv = this.lock;
            synchronized (lock$iv) {
                coroutineContext = this._coroutineContext;
                if (coroutineContext == null) {
                    CoroutineContext parentContext = this.parentContext;
                    CompletableJob childJob = JobKt.Job((Job) parentContext.get(Job.Key));
                    coroutineContext = parentContext.plus(childJob).plus(this.overlayContext);
                } else if (coroutineContext == CancelledCoroutineContext) {
                    CoroutineContext parentContext2 = this.parentContext;
                    CompletableJob $this$_get_coroutineContext__u24lambda_u241_u24lambda_u240 = JobKt.Job((Job) parentContext2.get(Job.Key));
                    $this$_get_coroutineContext__u24lambda_u241_u24lambda_u240.cancel((CancellationException) new ForgottenCoroutineScopeException());
                    coroutineContext = parentContext2.plus($this$_get_coroutineContext__u24lambda_u241_u24lambda_u240).plus(this.overlayContext);
                }
                this._coroutineContext = coroutineContext;
                Unit unit = Unit.INSTANCE;
            }
        }
        Intrinsics.checkNotNull(coroutineContext);
        return coroutineContext;
    }

    public final void cancelIfCreated() {
        Object lock$iv = this.lock;
        synchronized (lock$iv) {
            CoroutineContext context = this._coroutineContext;
            if (context == null) {
                this._coroutineContext = CancelledCoroutineContext;
            } else {
                JobKt.cancel(context, (CancellationException) new ForgottenCoroutineScopeException());
            }
            Unit unit = Unit.INSTANCE;
        }
    }

    @Override // androidx.compose.runtime.RememberObserver
    public void onRemembered() {
    }

    @Override // androidx.compose.runtime.RememberObserver
    public void onForgotten() {
        cancelIfCreated();
    }

    @Override // androidx.compose.runtime.RememberObserver
    public void onAbandoned() {
        cancelIfCreated();
    }

    /* compiled from: Effects.kt */
    @Metadata(d1 = {"\u0000\u0012\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\b\u0086\u0003\u0018\u00002\u00020\u0001B\u0007\b\u0002¢\u0006\u0002\u0010\u0002R\u0010\u0010\u0003\u001a\u00020\u00048\u0006X\u0087\u0004¢\u0006\u0002\n\u0000¨\u0006\u0005"}, d2 = {"Landroidx/compose/runtime/RememberedCoroutineScope$Companion;", "", "()V", "CancelledCoroutineContext", "Lkotlin/coroutines/CoroutineContext;", "runtime_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
    /* loaded from: classes11.dex */
    public static final class Companion {
        public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }

        private Companion() {
        }
    }
}
