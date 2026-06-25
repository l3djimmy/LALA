package androidx.camera.view;

import androidx.arch.core.util.Function;
import androidx.camera.core.impl.utils.Threads;
import androidx.camera.core.impl.utils.futures.Futures;
import androidx.concurrent.futures.CallbackToFutureAdapter;
import androidx.core.util.Pair;
import com.google.common.util.concurrent.ListenableFuture;
import java.util.Objects;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public class PendingValue<T> {
    private Pair<CallbackToFutureAdapter.Completer<Void>, T> mCompleterAndValue;

    /* JADX INFO: Access modifiers changed from: package-private */
    public ListenableFuture<Void> setValue(final T value) {
        Threads.checkMainThread();
        return CallbackToFutureAdapter.getFuture(new CallbackToFutureAdapter.Resolver() { // from class: androidx.camera.view.PendingValue$$ExternalSyntheticLambda0
            @Override // androidx.concurrent.futures.CallbackToFutureAdapter.Resolver
            public final Object attachCompleter(CallbackToFutureAdapter.Completer completer) {
                return PendingValue.this.m255lambda$setValue$0$androidxcameraviewPendingValue(value, completer);
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: lambda$setValue$0$androidx-camera-view-PendingValue  reason: not valid java name */
    public /* synthetic */ Object m255lambda$setValue$0$androidxcameraviewPendingValue(Object value, CallbackToFutureAdapter.Completer completer) throws Exception {
        if (this.mCompleterAndValue != null) {
            ((CallbackToFutureAdapter.Completer) Objects.requireNonNull(this.mCompleterAndValue.first)).setCancelled();
        }
        this.mCompleterAndValue = new Pair<>(completer, value);
        return "PendingValue " + value;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void propagateIfHasValue(Function<T, ListenableFuture<Void>> setValueFunction) {
        Threads.checkMainThread();
        if (this.mCompleterAndValue != null) {
            Futures.propagate(setValueFunction.apply(this.mCompleterAndValue.second), (CallbackToFutureAdapter.Completer) Objects.requireNonNull(this.mCompleterAndValue.first));
            this.mCompleterAndValue = null;
        }
    }
}
