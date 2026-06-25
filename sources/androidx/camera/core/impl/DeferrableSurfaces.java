package androidx.camera.core.impl;

import android.view.Surface;
import androidx.camera.core.impl.DeferrableSurface;
import androidx.camera.core.impl.utils.futures.FutureCallback;
import androidx.camera.core.impl.utils.futures.Futures;
import androidx.concurrent.futures.CallbackToFutureAdapter;
import com.google.common.util.concurrent.ListenableFuture;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.List;
import java.util.concurrent.Executor;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.ScheduledFuture;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.TimeoutException;
/* loaded from: classes.dex */
public final class DeferrableSurfaces {
    private DeferrableSurfaces() {
    }

    public static ListenableFuture<List<Surface>> surfaceListWithTimeout(Collection<DeferrableSurface> deferrableSurfaces, final boolean removeNullSurfaces, final long timeout, final Executor executor, final ScheduledExecutorService scheduledExecutorService) {
        final List<ListenableFuture<Surface>> listenableFutureSurfaces = new ArrayList<>();
        for (DeferrableSurface deferrableSurface : deferrableSurfaces) {
            listenableFutureSurfaces.add(Futures.nonCancellationPropagating(deferrableSurface.getSurface()));
        }
        return CallbackToFutureAdapter.getFuture(new CallbackToFutureAdapter.Resolver() { // from class: androidx.camera.core.impl.DeferrableSurfaces$$ExternalSyntheticLambda0
            @Override // androidx.concurrent.futures.CallbackToFutureAdapter.Resolver
            public final Object attachCompleter(CallbackToFutureAdapter.Completer completer) {
                return DeferrableSurfaces.lambda$surfaceListWithTimeout$3(listenableFutureSurfaces, scheduledExecutorService, executor, timeout, removeNullSurfaces, completer);
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static /* synthetic */ Object lambda$surfaceListWithTimeout$3(List listenableFutureSurfaces, ScheduledExecutorService scheduledExecutorService, final Executor executor, final long timeout, final boolean removeNullSurfaces, final CallbackToFutureAdapter.Completer completer) throws Exception {
        final ListenableFuture<List<Surface>> listenableFuture = Futures.successfulAsList(listenableFutureSurfaces);
        final ScheduledFuture<?> scheduledFuture = scheduledExecutorService.schedule(new Runnable() { // from class: androidx.camera.core.impl.DeferrableSurfaces$$ExternalSyntheticLambda2
            @Override // java.lang.Runnable
            public final void run() {
                executor.execute(new Runnable() { // from class: androidx.camera.core.impl.DeferrableSurfaces$$ExternalSyntheticLambda1
                    @Override // java.lang.Runnable
                    public final void run() {
                        DeferrableSurfaces.lambda$surfaceListWithTimeout$0(ListenableFuture.this, r2, r3);
                    }
                });
            }
        }, timeout, TimeUnit.MILLISECONDS);
        completer.addCancellationListener(new Runnable() { // from class: androidx.camera.core.impl.DeferrableSurfaces$$ExternalSyntheticLambda3
            @Override // java.lang.Runnable
            public final void run() {
                ListenableFuture.this.cancel(true);
            }
        }, executor);
        Futures.addCallback(listenableFuture, new FutureCallback<List<Surface>>() { // from class: androidx.camera.core.impl.DeferrableSurfaces.1
            @Override // androidx.camera.core.impl.utils.futures.FutureCallback
            public void onSuccess(List<Surface> result) {
                ArrayList arrayList = new ArrayList(result);
                if (removeNullSurfaces) {
                    arrayList.removeAll(Collections.singleton(null));
                }
                completer.set(arrayList);
                scheduledFuture.cancel(true);
            }

            @Override // androidx.camera.core.impl.utils.futures.FutureCallback
            public void onFailure(Throwable t) {
                completer.set(Collections.unmodifiableList(Collections.emptyList()));
                scheduledFuture.cancel(true);
            }
        }, executor);
        return "surfaceList";
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static /* synthetic */ void lambda$surfaceListWithTimeout$0(ListenableFuture listenableFuture, CallbackToFutureAdapter.Completer completer, long timeout) {
        if (!listenableFuture.isDone()) {
            completer.setException(new TimeoutException("Cannot complete surfaceList within " + timeout));
            listenableFuture.cancel(true);
        }
    }

    public static boolean tryIncrementAll(List<DeferrableSurface> surfaceList) {
        try {
            incrementAll(surfaceList);
            return true;
        } catch (DeferrableSurface.SurfaceClosedException e) {
            return false;
        }
    }

    public static void incrementAll(List<DeferrableSurface> surfaceList) throws DeferrableSurface.SurfaceClosedException {
        if (!surfaceList.isEmpty()) {
            int i = 0;
            do {
                try {
                    surfaceList.get(i).incrementUseCount();
                    i++;
                } catch (DeferrableSurface.SurfaceClosedException e) {
                    for (int i2 = i - 1; i2 >= 0; i2--) {
                        surfaceList.get(i2).decrementUseCount();
                    }
                    throw e;
                }
            } while (i < surfaceList.size());
        }
    }

    public static void decrementAll(List<DeferrableSurface> surfaceList) {
        for (DeferrableSurface surface : surfaceList) {
            surface.decrementUseCount();
        }
    }
}
