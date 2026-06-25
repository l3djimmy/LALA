package androidx.camera.core;

import android.app.Application;
import android.content.ComponentName;
import android.content.Context;
import android.content.pm.PackageManager;
import android.content.pm.ServiceInfo;
import android.os.Handler;
import android.os.HandlerThread;
import android.os.SystemClock;
import android.util.SparseArray;
import androidx.camera.core.CameraXConfig;
import androidx.camera.core.impl.CameraDeviceSurfaceManager;
import androidx.camera.core.impl.CameraFactory;
import androidx.camera.core.impl.CameraRepository;
import androidx.camera.core.impl.CameraThreadConfig;
import androidx.camera.core.impl.CameraValidator;
import androidx.camera.core.impl.MetadataHolderService;
import androidx.camera.core.impl.UseCaseConfigFactory;
import androidx.camera.core.impl.utils.ContextUtil;
import androidx.camera.core.impl.utils.futures.Futures;
import androidx.concurrent.futures.CallbackToFutureAdapter;
import androidx.core.os.HandlerCompat;
import androidx.core.util.Preconditions;
import com.google.common.util.concurrent.ListenableFuture;
import java.lang.reflect.InvocationTargetException;
import java.util.concurrent.Executor;
/* loaded from: classes.dex */
public final class CameraX {
    private static final long RETRY_SLEEP_MILLIS = 500;
    private static final String RETRY_TOKEN = "retry_token";
    private static final String TAG = "CameraX";
    private static final long WAIT_INITIALIZED_TIMEOUT_MILLIS = 3000;
    private Context mAppContext;
    private final Executor mCameraExecutor;
    private CameraFactory mCameraFactory;
    private final CameraXConfig mCameraXConfig;
    private UseCaseConfigFactory mDefaultConfigFactory;
    private final ListenableFuture<Void> mInitInternalFuture;
    private final Integer mMinLogLevel;
    private final Handler mSchedulerHandler;
    private final HandlerThread mSchedulerThread;
    private CameraDeviceSurfaceManager mSurfaceManager;
    private static final Object MIN_LOG_LEVEL_LOCK = new Object();
    private static final SparseArray<Integer> sMinLogLevelReferenceCountMap = new SparseArray<>();
    final CameraRepository mCameraRepository = new CameraRepository();
    private final Object mInitializeLock = new Object();
    private InternalInitState mInitState = InternalInitState.UNINITIALIZED;
    private ListenableFuture<Void> mShutdownInternalFuture = Futures.immediateFuture(null);

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes.dex */
    public enum InternalInitState {
        UNINITIALIZED,
        INITIALIZING,
        INITIALIZING_ERROR,
        INITIALIZED,
        SHUTDOWN
    }

    public CameraX(Context context, CameraXConfig.Provider configProvider) {
        if (configProvider != null) {
            this.mCameraXConfig = configProvider.getCameraXConfig();
        } else {
            CameraXConfig.Provider provider = getConfigProvider(context);
            if (provider == null) {
                throw new IllegalStateException("CameraX is not configured properly. The most likely cause is you did not include a default implementation in your build such as 'camera-camera2'.");
            }
            this.mCameraXConfig = provider.getCameraXConfig();
        }
        Executor executor = this.mCameraXConfig.getCameraExecutor(null);
        Handler schedulerHandler = this.mCameraXConfig.getSchedulerHandler(null);
        this.mCameraExecutor = executor == null ? new CameraExecutor() : executor;
        if (schedulerHandler == null) {
            this.mSchedulerThread = new HandlerThread("CameraX-scheduler", 10);
            this.mSchedulerThread.start();
            this.mSchedulerHandler = HandlerCompat.createAsync(this.mSchedulerThread.getLooper());
        } else {
            this.mSchedulerThread = null;
            this.mSchedulerHandler = schedulerHandler;
        }
        this.mMinLogLevel = (Integer) this.mCameraXConfig.retrieveOption(CameraXConfig.OPTION_MIN_LOGGING_LEVEL, null);
        increaseMinLogLevelReference(this.mMinLogLevel);
        this.mInitInternalFuture = initInternal(context);
    }

    public CameraFactory getCameraFactory() {
        if (this.mCameraFactory == null) {
            throw new IllegalStateException("CameraX not initialized yet.");
        }
        return this.mCameraFactory;
    }

    private static CameraXConfig.Provider getConfigProvider(Context context) {
        Application application = ContextUtil.getApplicationFromContext(context);
        if (application instanceof CameraXConfig.Provider) {
            CameraXConfig.Provider configProvider = (CameraXConfig.Provider) application;
            return configProvider;
        }
        try {
            Context appContext = ContextUtil.getApplicationContext(context);
            ServiceInfo serviceInfo = appContext.getPackageManager().getServiceInfo(new ComponentName(appContext, MetadataHolderService.class), 640);
            String defaultProviderClassName = null;
            if (serviceInfo.metaData != null) {
                defaultProviderClassName = serviceInfo.metaData.getString("androidx.camera.core.impl.MetadataHolderService.DEFAULT_CONFIG_PROVIDER");
            }
            if (defaultProviderClassName == null) {
                Logger.e(TAG, "No default CameraXConfig.Provider specified in meta-data. The most likely cause is you did not include a default implementation in your build such as 'camera-camera2'.");
                return null;
            }
            Class<?> providerClass = Class.forName(defaultProviderClassName);
            CameraXConfig.Provider configProvider2 = (CameraXConfig.Provider) providerClass.getDeclaredConstructor(new Class[0]).newInstance(new Object[0]);
            return configProvider2;
        } catch (PackageManager.NameNotFoundException | ClassNotFoundException | IllegalAccessException | InstantiationException | NoSuchMethodException | NullPointerException | InvocationTargetException e) {
            Logger.e(TAG, "Failed to retrieve default CameraXConfig.Provider from meta-data", e);
            return null;
        }
    }

    public CameraDeviceSurfaceManager getCameraDeviceSurfaceManager() {
        if (this.mSurfaceManager == null) {
            throw new IllegalStateException("CameraX not initialized yet.");
        }
        return this.mSurfaceManager;
    }

    public CameraRepository getCameraRepository() {
        return this.mCameraRepository;
    }

    public UseCaseConfigFactory getDefaultConfigFactory() {
        if (this.mDefaultConfigFactory == null) {
            throw new IllegalStateException("CameraX not initialized yet.");
        }
        return this.mDefaultConfigFactory;
    }

    public ListenableFuture<Void> getInitializeFuture() {
        return this.mInitInternalFuture;
    }

    public ListenableFuture<Void> shutdown() {
        return shutdownInternal();
    }

    private ListenableFuture<Void> initInternal(final Context context) {
        ListenableFuture<Void> future;
        synchronized (this.mInitializeLock) {
            Preconditions.checkState(this.mInitState == InternalInitState.UNINITIALIZED, "CameraX.initInternal() should only be called once per instance");
            this.mInitState = InternalInitState.INITIALIZING;
            future = CallbackToFutureAdapter.getFuture(new CallbackToFutureAdapter.Resolver() { // from class: androidx.camera.core.CameraX$$ExternalSyntheticLambda1
                @Override // androidx.concurrent.futures.CallbackToFutureAdapter.Resolver
                public final Object attachCompleter(CallbackToFutureAdapter.Completer completer) {
                    return CameraX.this.m108lambda$initInternal$0$androidxcameracoreCameraX(context, completer);
                }
            });
        }
        return future;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: lambda$initInternal$0$androidx-camera-core-CameraX  reason: not valid java name */
    public /* synthetic */ Object m108lambda$initInternal$0$androidxcameracoreCameraX(Context context, CallbackToFutureAdapter.Completer completer) throws Exception {
        initAndRetryRecursively(this.mCameraExecutor, SystemClock.elapsedRealtime(), context, completer);
        return "CameraX initInternal";
    }

    private void initAndRetryRecursively(final Executor cameraExecutor, final long startMs, final Context context, final CallbackToFutureAdapter.Completer<Void> completer) {
        cameraExecutor.execute(new Runnable() { // from class: androidx.camera.core.CameraX$$ExternalSyntheticLambda4
            @Override // java.lang.Runnable
            public final void run() {
                CameraX.this.m107lambda$initAndRetryRecursively$2$androidxcameracoreCameraX(context, cameraExecutor, completer, startMs);
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: lambda$initAndRetryRecursively$2$androidx-camera-core-CameraX  reason: not valid java name */
    public /* synthetic */ void m107lambda$initAndRetryRecursively$2$androidxcameracoreCameraX(Context context, final Executor cameraExecutor, final CallbackToFutureAdapter.Completer completer, final long startMs) {
        try {
            this.mAppContext = ContextUtil.getApplicationFromContext(context);
            if (this.mAppContext == null) {
                this.mAppContext = ContextUtil.getApplicationContext(context);
            }
            CameraFactory.Provider cameraFactoryProvider = this.mCameraXConfig.getCameraFactoryProvider(null);
            if (cameraFactoryProvider == null) {
                throw new InitializationException(new IllegalArgumentException("Invalid app configuration provided. Missing CameraFactory."));
            }
            CameraThreadConfig cameraThreadConfig = CameraThreadConfig.create(this.mCameraExecutor, this.mSchedulerHandler);
            CameraSelector availableCamerasLimiter = this.mCameraXConfig.getAvailableCamerasLimiter(null);
            this.mCameraFactory = cameraFactoryProvider.newInstance(this.mAppContext, cameraThreadConfig, availableCamerasLimiter);
            CameraDeviceSurfaceManager.Provider surfaceManagerProvider = this.mCameraXConfig.getDeviceSurfaceManagerProvider(null);
            if (surfaceManagerProvider == null) {
                throw new InitializationException(new IllegalArgumentException("Invalid app configuration provided. Missing CameraDeviceSurfaceManager."));
            }
            this.mSurfaceManager = surfaceManagerProvider.newInstance(this.mAppContext, this.mCameraFactory.getCameraManager(), this.mCameraFactory.getAvailableCameraIds());
            UseCaseConfigFactory.Provider configFactoryProvider = this.mCameraXConfig.getUseCaseConfigFactoryProvider(null);
            if (configFactoryProvider == null) {
                throw new InitializationException(new IllegalArgumentException("Invalid app configuration provided. Missing UseCaseConfigFactory."));
            }
            this.mDefaultConfigFactory = configFactoryProvider.newInstance(this.mAppContext);
            if (cameraExecutor instanceof CameraExecutor) {
                CameraExecutor executor = (CameraExecutor) cameraExecutor;
                executor.init(this.mCameraFactory);
            }
            this.mCameraRepository.init(this.mCameraFactory);
            CameraValidator.validateCameras(this.mAppContext, this.mCameraRepository, availableCamerasLimiter);
            setStateToInitialized();
            completer.set(null);
        } catch (InitializationException | CameraValidator.CameraIdListIncorrectException | RuntimeException e) {
            if (SystemClock.elapsedRealtime() - startMs < 2500) {
                Logger.w(TAG, "Retry init. Start time " + startMs + " current time " + SystemClock.elapsedRealtime(), e);
                HandlerCompat.postDelayed(this.mSchedulerHandler, new Runnable() { // from class: androidx.camera.core.CameraX$$ExternalSyntheticLambda3
                    @Override // java.lang.Runnable
                    public final void run() {
                        CameraX.this.m106lambda$initAndRetryRecursively$1$androidxcameracoreCameraX(cameraExecutor, startMs, completer);
                    }
                }, RETRY_TOKEN, RETRY_SLEEP_MILLIS);
                return;
            }
            synchronized (this.mInitializeLock) {
                this.mInitState = InternalInitState.INITIALIZING_ERROR;
            }
            if (e instanceof CameraValidator.CameraIdListIncorrectException) {
                Logger.e(TAG, "The device might underreport the amount of the cameras. Finish the initialize task since we are already reaching the maximum number of retries.");
                completer.set(null);
            } else if (e instanceof InitializationException) {
                completer.setException(e);
            } else {
                completer.setException(new InitializationException(e));
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: lambda$initAndRetryRecursively$1$androidx-camera-core-CameraX  reason: not valid java name */
    public /* synthetic */ void m106lambda$initAndRetryRecursively$1$androidxcameracoreCameraX(Executor cameraExecutor, long startMs, CallbackToFutureAdapter.Completer completer) {
        initAndRetryRecursively(cameraExecutor, startMs, this.mAppContext, completer);
    }

    private void setStateToInitialized() {
        synchronized (this.mInitializeLock) {
            this.mInitState = InternalInitState.INITIALIZED;
        }
    }

    private ListenableFuture<Void> shutdownInternal() {
        synchronized (this.mInitializeLock) {
            this.mSchedulerHandler.removeCallbacksAndMessages(RETRY_TOKEN);
            switch (this.mInitState) {
                case UNINITIALIZED:
                    this.mInitState = InternalInitState.SHUTDOWN;
                    return Futures.immediateFuture(null);
                case INITIALIZING:
                    throw new IllegalStateException("CameraX could not be shutdown when it is initializing.");
                case INITIALIZING_ERROR:
                case INITIALIZED:
                    this.mInitState = InternalInitState.SHUTDOWN;
                    decreaseMinLogLevelReference(this.mMinLogLevel);
                    this.mShutdownInternalFuture = CallbackToFutureAdapter.getFuture(new CallbackToFutureAdapter.Resolver() { // from class: androidx.camera.core.CameraX$$ExternalSyntheticLambda2
                        @Override // androidx.concurrent.futures.CallbackToFutureAdapter.Resolver
                        public final Object attachCompleter(CallbackToFutureAdapter.Completer completer) {
                            return CameraX.this.m110lambda$shutdownInternal$4$androidxcameracoreCameraX(completer);
                        }
                    });
                    break;
            }
            return this.mShutdownInternalFuture;
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: lambda$shutdownInternal$4$androidx-camera-core-CameraX  reason: not valid java name */
    public /* synthetic */ Object m110lambda$shutdownInternal$4$androidxcameracoreCameraX(final CallbackToFutureAdapter.Completer completer) throws Exception {
        ListenableFuture<Void> future = this.mCameraRepository.deinit();
        future.addListener(new Runnable() { // from class: androidx.camera.core.CameraX$$ExternalSyntheticLambda0
            @Override // java.lang.Runnable
            public final void run() {
                CameraX.this.m109lambda$shutdownInternal$3$androidxcameracoreCameraX(completer);
            }
        }, this.mCameraExecutor);
        return "CameraX shutdownInternal";
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: lambda$shutdownInternal$3$androidx-camera-core-CameraX  reason: not valid java name */
    public /* synthetic */ void m109lambda$shutdownInternal$3$androidxcameracoreCameraX(CallbackToFutureAdapter.Completer completer) {
        if (this.mSchedulerThread != null) {
            if (this.mCameraExecutor instanceof CameraExecutor) {
                CameraExecutor executor = (CameraExecutor) this.mCameraExecutor;
                executor.deinit();
            }
            this.mSchedulerThread.quit();
        }
        completer.set(null);
    }

    boolean isInitialized() {
        boolean z;
        synchronized (this.mInitializeLock) {
            z = this.mInitState == InternalInitState.INITIALIZED;
        }
        return z;
    }

    private static void increaseMinLogLevelReference(Integer minLogLevel) {
        synchronized (MIN_LOG_LEVEL_LOCK) {
            if (minLogLevel == null) {
                return;
            }
            Preconditions.checkArgumentInRange(minLogLevel.intValue(), 3, 6, "minLogLevel");
            int refCount = 1;
            if (sMinLogLevelReferenceCountMap.get(minLogLevel.intValue()) != null) {
                refCount = sMinLogLevelReferenceCountMap.get(minLogLevel.intValue()).intValue() + 1;
            }
            sMinLogLevelReferenceCountMap.put(minLogLevel.intValue(), Integer.valueOf(refCount));
            updateOrResetMinLogLevel();
        }
    }

    private static void decreaseMinLogLevelReference(Integer minLogLevel) {
        synchronized (MIN_LOG_LEVEL_LOCK) {
            if (minLogLevel == null) {
                return;
            }
            int refCount = sMinLogLevelReferenceCountMap.get(minLogLevel.intValue()).intValue() - 1;
            if (refCount == 0) {
                sMinLogLevelReferenceCountMap.remove(minLogLevel.intValue());
            } else {
                sMinLogLevelReferenceCountMap.put(minLogLevel.intValue(), Integer.valueOf(refCount));
            }
            updateOrResetMinLogLevel();
        }
    }

    private static void updateOrResetMinLogLevel() {
        if (sMinLogLevelReferenceCountMap.size() == 0) {
            Logger.resetMinLogLevel();
        } else if (sMinLogLevelReferenceCountMap.get(3) != null) {
            Logger.setMinLogLevel(3);
        } else if (sMinLogLevelReferenceCountMap.get(4) != null) {
            Logger.setMinLogLevel(4);
        } else if (sMinLogLevelReferenceCountMap.get(5) != null) {
            Logger.setMinLogLevel(5);
        } else if (sMinLogLevelReferenceCountMap.get(6) != null) {
            Logger.setMinLogLevel(6);
        }
    }
}
