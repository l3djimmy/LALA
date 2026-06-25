package androidx.camera.core.impl;

import android.os.SystemClock;
import androidx.camera.core.impl.LiveDataObservable;
import androidx.camera.core.impl.Observable;
import androidx.camera.core.impl.utils.executor.CameraXExecutors;
import androidx.concurrent.futures.CallbackToFutureAdapter;
import androidx.core.util.Preconditions;
import androidx.lifecycle.LiveData;
import androidx.lifecycle.MutableLiveData;
import androidx.lifecycle.Observer;
import com.google.common.util.concurrent.ListenableFuture;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.Executor;
import java.util.concurrent.atomic.AtomicBoolean;
/* loaded from: classes.dex */
public final class LiveDataObservable<T> implements Observable<T> {
    final MutableLiveData<Result<T>> mLiveData = new MutableLiveData<>();
    private final Map<Observable.Observer<? super T>, LiveDataObserverAdapter<T>> mObservers = new HashMap();

    public void postValue(T value) {
        this.mLiveData.postValue(Result.fromValue(value));
    }

    public void postError(Throwable error) {
        this.mLiveData.postValue(Result.fromError(error));
    }

    public LiveData<Result<T>> getLiveData() {
        return this.mLiveData;
    }

    @Override // androidx.camera.core.impl.Observable
    public ListenableFuture<T> fetchData() {
        return CallbackToFutureAdapter.getFuture(new CallbackToFutureAdapter.Resolver() { // from class: androidx.camera.core.impl.LiveDataObservable$$ExternalSyntheticLambda3
            @Override // androidx.concurrent.futures.CallbackToFutureAdapter.Resolver
            public final Object attachCompleter(CallbackToFutureAdapter.Completer completer) {
                return LiveDataObservable.this.m152lambda$fetchData$1$androidxcameracoreimplLiveDataObservable(completer);
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: lambda$fetchData$1$androidx-camera-core-impl-LiveDataObservable  reason: not valid java name */
    public /* synthetic */ Object m152lambda$fetchData$1$androidxcameracoreimplLiveDataObservable(final CallbackToFutureAdapter.Completer completer) throws Exception {
        CameraXExecutors.mainThreadExecutor().execute(new Runnable() { // from class: androidx.camera.core.impl.LiveDataObservable$$ExternalSyntheticLambda2
            @Override // java.lang.Runnable
            public final void run() {
                LiveDataObservable.this.m151lambda$fetchData$0$androidxcameracoreimplLiveDataObservable(completer);
            }
        });
        return this + " [fetch@" + SystemClock.uptimeMillis() + "]";
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: lambda$fetchData$0$androidx-camera-core-impl-LiveDataObservable  reason: not valid java name */
    public /* synthetic */ void m151lambda$fetchData$0$androidxcameracoreimplLiveDataObservable(CallbackToFutureAdapter.Completer completer) {
        Result<T> result = this.mLiveData.getValue();
        if (result == null) {
            completer.setException(new IllegalStateException("Observable has not yet been initialized with a value."));
        } else if (result.completedSuccessfully()) {
            completer.set(result.getValue());
        } else {
            Preconditions.checkNotNull(result.getError());
            completer.setException(result.getError());
        }
    }

    @Override // androidx.camera.core.impl.Observable
    public void addObserver(Executor executor, Observable.Observer<? super T> observer) {
        synchronized (this.mObservers) {
            final LiveDataObserverAdapter<T> oldAdapter = this.mObservers.get(observer);
            if (oldAdapter != null) {
                oldAdapter.disable();
            }
            final LiveDataObserverAdapter<T> newAdapter = new LiveDataObserverAdapter<>(executor, observer);
            this.mObservers.put(observer, newAdapter);
            CameraXExecutors.mainThreadExecutor().execute(new Runnable() { // from class: androidx.camera.core.impl.LiveDataObservable$$ExternalSyntheticLambda1
                @Override // java.lang.Runnable
                public final void run() {
                    LiveDataObservable.this.m150xb97b3ef8(oldAdapter, newAdapter);
                }
            });
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: lambda$addObserver$2$androidx-camera-core-impl-LiveDataObservable  reason: not valid java name */
    public /* synthetic */ void m150xb97b3ef8(LiveDataObserverAdapter oldAdapter, LiveDataObserverAdapter newAdapter) {
        if (oldAdapter != null) {
            this.mLiveData.removeObserver(oldAdapter);
        }
        this.mLiveData.observeForever(newAdapter);
    }

    @Override // androidx.camera.core.impl.Observable
    public void removeObserver(Observable.Observer<? super T> observer) {
        synchronized (this.mObservers) {
            final LiveDataObserverAdapter<T> adapter = this.mObservers.remove(observer);
            if (adapter != null) {
                adapter.disable();
                CameraXExecutors.mainThreadExecutor().execute(new Runnable() { // from class: androidx.camera.core.impl.LiveDataObservable$$ExternalSyntheticLambda0
                    @Override // java.lang.Runnable
                    public final void run() {
                        LiveDataObservable.this.m153x74a0ce3a(adapter);
                    }
                });
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: lambda$removeObserver$3$androidx-camera-core-impl-LiveDataObservable  reason: not valid java name */
    public /* synthetic */ void m153x74a0ce3a(LiveDataObserverAdapter adapter) {
        this.mLiveData.removeObserver(adapter);
    }

    /* loaded from: classes.dex */
    public static final class Result<T> {
        private final Throwable mError;
        private final T mValue;

        private Result(T value, Throwable error) {
            this.mValue = value;
            this.mError = error;
        }

        static <T> Result<T> fromValue(T value) {
            return new Result<>(value, null);
        }

        static <T> Result<T> fromError(Throwable error) {
            return new Result<>(null, (Throwable) Preconditions.checkNotNull(error));
        }

        public boolean completedSuccessfully() {
            return this.mError == null;
        }

        public T getValue() {
            if (!completedSuccessfully()) {
                throw new IllegalStateException("Result contains an error. Does not contain a value.");
            }
            return this.mValue;
        }

        public Throwable getError() {
            return this.mError;
        }

        public String toString() {
            return "[Result: <" + (completedSuccessfully() ? "Value: " + this.mValue : "Error: " + this.mError) + ">]";
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes.dex */
    public static final class LiveDataObserverAdapter<T> implements Observer<Result<T>> {
        final AtomicBoolean mActive = new AtomicBoolean(true);
        final Executor mExecutor;
        final Observable.Observer<? super T> mObserver;

        @Override // androidx.lifecycle.Observer
        public /* bridge */ /* synthetic */ void onChanged(Object obj) {
            onChanged((Result) ((Result) obj));
        }

        LiveDataObserverAdapter(Executor executor, Observable.Observer<? super T> observer) {
            this.mExecutor = executor;
            this.mObserver = observer;
        }

        void disable() {
            this.mActive.set(false);
        }

        public void onChanged(final Result<T> result) {
            this.mExecutor.execute(new Runnable() { // from class: androidx.camera.core.impl.LiveDataObservable$LiveDataObserverAdapter$$ExternalSyntheticLambda0
                @Override // java.lang.Runnable
                public final void run() {
                    LiveDataObservable.LiveDataObserverAdapter.this.m154x31d6cb3b(result);
                }
            });
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        /* renamed from: lambda$onChanged$0$androidx-camera-core-impl-LiveDataObservable$LiveDataObserverAdapter  reason: not valid java name */
        public /* synthetic */ void m154x31d6cb3b(Result result) {
            if (!this.mActive.get()) {
                return;
            }
            if (result.completedSuccessfully()) {
                this.mObserver.onNewData((Object) result.getValue());
                return;
            }
            Preconditions.checkNotNull(result.getError());
            this.mObserver.onError(result.getError());
        }
    }
}
