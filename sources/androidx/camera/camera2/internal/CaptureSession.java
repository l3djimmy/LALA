package androidx.camera.camera2.internal;

import android.hardware.camera2.CameraAccessException;
import android.hardware.camera2.CameraCaptureSession;
import android.hardware.camera2.CameraDevice;
import android.hardware.camera2.CaptureRequest;
import android.hardware.camera2.TotalCaptureResult;
import android.hardware.camera2.params.DynamicRangeProfiles;
import android.os.Build;
import android.view.Surface;
import androidx.camera.camera2.impl.Camera2ImplConfig;
import androidx.camera.camera2.impl.CameraEventCallbacks;
import androidx.camera.camera2.internal.CameraBurstCaptureCallback;
import androidx.camera.camera2.internal.SynchronizedCaptureSession;
import androidx.camera.camera2.internal.SynchronizedCaptureSessionStateCallbacks;
import androidx.camera.camera2.internal.compat.params.DynamicRangeConversions;
import androidx.camera.camera2.internal.compat.params.DynamicRangesCompat;
import androidx.camera.camera2.internal.compat.params.InputConfigurationCompat;
import androidx.camera.camera2.internal.compat.params.OutputConfigurationCompat;
import androidx.camera.camera2.internal.compat.params.SessionConfigurationCompat;
import androidx.camera.camera2.internal.compat.workaround.StillCaptureFlow;
import androidx.camera.camera2.internal.compat.workaround.TorchStateReset;
import androidx.camera.core.DynamicRange;
import androidx.camera.core.Logger;
import androidx.camera.core.impl.CameraCaptureCallback;
import androidx.camera.core.impl.CaptureConfig;
import androidx.camera.core.impl.Config;
import androidx.camera.core.impl.DeferrableSurface;
import androidx.camera.core.impl.MutableOptionsBundle;
import androidx.camera.core.impl.OptionsBundle;
import androidx.camera.core.impl.SessionConfig;
import androidx.camera.core.impl.utils.futures.AsyncFunction;
import androidx.camera.core.impl.utils.futures.FutureCallback;
import androidx.camera.core.impl.utils.futures.FutureChain;
import androidx.camera.core.impl.utils.futures.Futures;
import androidx.concurrent.futures.CallbackToFutureAdapter;
import androidx.core.util.Preconditions;
import com.google.common.util.concurrent.ListenableFuture;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.concurrent.CancellationException;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final class CaptureSession implements CaptureSessionInterface {
    private static final String TAG = "CaptureSession";
    private static final long TIMEOUT_GET_SURFACE_IN_MS = 5000;
    private final DynamicRangesCompat mDynamicRangesCompat;
    CallbackToFutureAdapter.Completer<Void> mReleaseCompleter;
    ListenableFuture<Void> mReleaseFuture;
    SessionConfig mSessionConfig;
    State mState;
    SynchronizedCaptureSession mSynchronizedCaptureSession;
    SynchronizedCaptureSessionOpener mSynchronizedCaptureSessionOpener;
    final Object mSessionLock = new Object();
    private final List<CaptureConfig> mCaptureConfigs = new ArrayList();
    private final CameraCaptureSession.CaptureCallback mCaptureCallback = new CameraCaptureSession.CaptureCallback() { // from class: androidx.camera.camera2.internal.CaptureSession.1
        @Override // android.hardware.camera2.CameraCaptureSession.CaptureCallback
        public void onCaptureCompleted(CameraCaptureSession session, CaptureRequest request, TotalCaptureResult result) {
        }
    };
    Config mCameraEventOnRepeatingOptions = OptionsBundle.emptyBundle();
    CameraEventCallbacks mCameraEventCallbacks = CameraEventCallbacks.createEmptyCallback();
    private final Map<DeferrableSurface, Surface> mConfiguredSurfaceMap = new HashMap();
    List<DeferrableSurface> mConfiguredDeferrableSurfaces = Collections.emptyList();
    Map<DeferrableSurface, Long> mStreamUseCaseMap = new HashMap();
    final StillCaptureFlow mStillCaptureFlow = new StillCaptureFlow();
    final TorchStateReset mTorchStateReset = new TorchStateReset();
    private final StateCallback mCaptureSessionStateCallback = new StateCallback();

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes.dex */
    public enum State {
        UNINITIALIZED,
        INITIALIZED,
        GET_SURFACE,
        OPENING,
        OPENED,
        CLOSED,
        RELEASING,
        RELEASED
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public CaptureSession(DynamicRangesCompat dynamicRangesCompat) {
        this.mState = State.UNINITIALIZED;
        this.mState = State.INITIALIZED;
        this.mDynamicRangesCompat = dynamicRangesCompat;
    }

    @Override // androidx.camera.camera2.internal.CaptureSessionInterface
    public void setStreamUseCaseMap(Map<DeferrableSurface, Long> streamUseCaseMap) {
        synchronized (this.mSessionLock) {
            this.mStreamUseCaseMap = streamUseCaseMap;
        }
    }

    @Override // androidx.camera.camera2.internal.CaptureSessionInterface
    public SessionConfig getSessionConfig() {
        SessionConfig sessionConfig;
        synchronized (this.mSessionLock) {
            sessionConfig = this.mSessionConfig;
        }
        return sessionConfig;
    }

    @Override // androidx.camera.camera2.internal.CaptureSessionInterface
    public void setSessionConfig(SessionConfig sessionConfig) {
        synchronized (this.mSessionLock) {
            switch (this.mState) {
                case UNINITIALIZED:
                    throw new IllegalStateException("setSessionConfig() should not be possible in state: " + this.mState);
                case INITIALIZED:
                case GET_SURFACE:
                case OPENING:
                    this.mSessionConfig = sessionConfig;
                    break;
                case OPENED:
                    this.mSessionConfig = sessionConfig;
                    if (sessionConfig != null) {
                        if (!this.mConfiguredSurfaceMap.keySet().containsAll(sessionConfig.getSurfaces())) {
                            Logger.e(TAG, "Does not have the proper configured lists");
                            return;
                        }
                        Logger.d(TAG, "Attempting to submit CaptureRequest after setting");
                        issueRepeatingCaptureRequests(this.mSessionConfig);
                        break;
                    } else {
                        return;
                    }
                case CLOSED:
                case RELEASING:
                case RELEASED:
                    throw new IllegalStateException("Session configuration cannot be set on a closed/released session.");
            }
        }
    }

    @Override // androidx.camera.camera2.internal.CaptureSessionInterface
    public ListenableFuture<Void> open(final SessionConfig sessionConfig, final CameraDevice cameraDevice, SynchronizedCaptureSessionOpener opener) {
        synchronized (this.mSessionLock) {
            switch (this.mState) {
                case INITIALIZED:
                    this.mState = State.GET_SURFACE;
                    List<DeferrableSurface> surfaces = sessionConfig.getSurfaces();
                    this.mConfiguredDeferrableSurfaces = new ArrayList(surfaces);
                    this.mSynchronizedCaptureSessionOpener = opener;
                    ListenableFuture<Void> openFuture = FutureChain.from(this.mSynchronizedCaptureSessionOpener.startWithDeferrableSurface(this.mConfiguredDeferrableSurfaces, 5000L)).transformAsync(new AsyncFunction() { // from class: androidx.camera.camera2.internal.CaptureSession$$ExternalSyntheticLambda2
                        @Override // androidx.camera.core.impl.utils.futures.AsyncFunction
                        public final ListenableFuture apply(Object obj) {
                            return CaptureSession.this.m38lambda$open$0$androidxcameracamera2internalCaptureSession(sessionConfig, cameraDevice, (List) obj);
                        }
                    }, this.mSynchronizedCaptureSessionOpener.getExecutor());
                    Futures.addCallback(openFuture, new FutureCallback<Void>() { // from class: androidx.camera.camera2.internal.CaptureSession.2
                        @Override // androidx.camera.core.impl.utils.futures.FutureCallback
                        public void onSuccess(Void result) {
                        }

                        @Override // androidx.camera.core.impl.utils.futures.FutureCallback
                        public void onFailure(Throwable t) {
                            synchronized (CaptureSession.this.mSessionLock) {
                                CaptureSession.this.mSynchronizedCaptureSessionOpener.stop();
                                switch (AnonymousClass4.$SwitchMap$androidx$camera$camera2$internal$CaptureSession$State[CaptureSession.this.mState.ordinal()]) {
                                    case 4:
                                    case 6:
                                    case 7:
                                        if (!(t instanceof CancellationException)) {
                                            Logger.w(CaptureSession.TAG, "Opening session with fail " + CaptureSession.this.mState, t);
                                            CaptureSession.this.finishClose();
                                            break;
                                        }
                                        break;
                                }
                            }
                        }
                    }, this.mSynchronizedCaptureSessionOpener.getExecutor());
                    return Futures.nonCancellationPropagating(openFuture);
                default:
                    Logger.e(TAG, "Open not allowed in state: " + this.mState);
                    return Futures.immediateFailedFuture(new IllegalStateException("open() should not allow the state: " + this.mState));
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* renamed from: openCaptureSession */
    public ListenableFuture<Void> m38lambda$open$0$androidxcameracamera2internalCaptureSession(List<Surface> configuredSurfaces, SessionConfig sessionConfig, CameraDevice cameraDevice) {
        synchronized (this.mSessionLock) {
            try {
                try {
                    switch (this.mState) {
                        case UNINITIALIZED:
                        case INITIALIZED:
                        case OPENED:
                            return Futures.immediateFailedFuture(new IllegalStateException("openCaptureSession() should not be possible in state: " + this.mState));
                        case GET_SURFACE:
                            this.mConfiguredSurfaceMap.clear();
                            for (int i = 0; i < configuredSurfaces.size(); i++) {
                                this.mConfiguredSurfaceMap.put(this.mConfiguredDeferrableSurfaces.get(i), configuredSurfaces.get(i));
                            }
                            this.mState = State.OPENING;
                            Logger.d(TAG, "Opening capture session.");
                            SynchronizedCaptureSession.StateCallback callbacks = SynchronizedCaptureSessionStateCallbacks.createComboCallback(this.mCaptureSessionStateCallback, new SynchronizedCaptureSessionStateCallbacks.Adapter(sessionConfig.getSessionStateCallbacks()));
                            Camera2ImplConfig camera2Config = new Camera2ImplConfig(sessionConfig.getImplementationOptions());
                            this.mCameraEventCallbacks = camera2Config.getCameraEventCallback(CameraEventCallbacks.createEmptyCallback());
                            List<CaptureConfig> presetList = this.mCameraEventCallbacks.createComboCallback().onInitSession();
                            CaptureConfig.Builder captureConfigBuilder = CaptureConfig.Builder.from(sessionConfig.getRepeatingCaptureConfig());
                            for (CaptureConfig config : presetList) {
                                captureConfigBuilder.addImplementationOptions(config.getImplementationOptions());
                            }
                            List<OutputConfigurationCompat> outputConfigList = new ArrayList<>();
                            String physicalCameraIdForAllStreams = camera2Config.getPhysicalCameraId(null);
                            for (SessionConfig.OutputConfig outputConfig : sessionConfig.getOutputConfigs()) {
                                OutputConfigurationCompat outputConfiguration = getOutputConfigurationCompat(outputConfig, this.mConfiguredSurfaceMap, physicalCameraIdForAllStreams);
                                if (this.mStreamUseCaseMap.containsKey(outputConfig.getSurface())) {
                                    outputConfiguration.setStreamUseCase(this.mStreamUseCaseMap.get(outputConfig.getSurface()).longValue());
                                }
                                outputConfigList.add(outputConfiguration);
                            }
                            SessionConfigurationCompat sessionConfigCompat = this.mSynchronizedCaptureSessionOpener.createSessionConfigurationCompat(0, getUniqueOutputConfigurations(outputConfigList), callbacks);
                            if (sessionConfig.getTemplateType() == 5 && sessionConfig.getInputConfiguration() != null) {
                                sessionConfigCompat.setInputConfiguration(InputConfigurationCompat.wrap(sessionConfig.getInputConfiguration()));
                            }
                            try {
                                CaptureRequest captureRequest = Camera2CaptureRequestBuilder.buildWithoutTarget(captureConfigBuilder.build(), cameraDevice);
                                if (captureRequest != null) {
                                    sessionConfigCompat.setSessionParameters(captureRequest);
                                }
                                return this.mSynchronizedCaptureSessionOpener.openCaptureSession(cameraDevice, sessionConfigCompat, this.mConfiguredDeferrableSurfaces);
                            } catch (CameraAccessException e) {
                                return Futures.immediateFailedFuture(e);
                            }
                        case OPENING:
                        default:
                            return Futures.immediateFailedFuture(new CancellationException("openCaptureSession() not execute in state: " + this.mState));
                    }
                } catch (Throwable th) {
                    th = th;
                    throw th;
                }
            } catch (Throwable th2) {
                th = th2;
                throw th;
            }
        }
    }

    private List<OutputConfigurationCompat> getUniqueOutputConfigurations(List<OutputConfigurationCompat> outputConfigurations) {
        List<Surface> addedSurfaces = new ArrayList<>();
        List<OutputConfigurationCompat> results = new ArrayList<>();
        for (OutputConfigurationCompat outputConfiguration : outputConfigurations) {
            if (!addedSurfaces.contains(outputConfiguration.getSurface())) {
                addedSurfaces.add(outputConfiguration.getSurface());
                results.add(outputConfiguration);
            }
        }
        return results;
    }

    private OutputConfigurationCompat getOutputConfigurationCompat(SessionConfig.OutputConfig outputConfig, Map<DeferrableSurface, Surface> configuredSurfaceMap, String physicalCameraIdForAllStreams) {
        DynamicRangeProfiles dynamicRangeProfiles;
        Surface surface = configuredSurfaceMap.get(outputConfig.getSurface());
        Preconditions.checkNotNull(surface, "Surface in OutputConfig not found in configuredSurfaceMap.");
        OutputConfigurationCompat outputConfiguration = new OutputConfigurationCompat(outputConfig.getSurfaceGroupId(), surface);
        if (physicalCameraIdForAllStreams != null) {
            outputConfiguration.setPhysicalCameraId(physicalCameraIdForAllStreams);
        } else {
            outputConfiguration.setPhysicalCameraId(outputConfig.getPhysicalCameraId());
        }
        if (!outputConfig.getSharedSurfaces().isEmpty()) {
            outputConfiguration.enableSurfaceSharing();
            for (DeferrableSurface sharedDeferSurface : outputConfig.getSharedSurfaces()) {
                Surface sharedSurface = configuredSurfaceMap.get(sharedDeferSurface);
                Preconditions.checkNotNull(sharedSurface, "Surface in OutputConfig not found in configuredSurfaceMap.");
                outputConfiguration.addSurface(sharedSurface);
            }
        }
        long dynamicRangeProfile = 1;
        if (Build.VERSION.SDK_INT >= 33 && (dynamicRangeProfiles = this.mDynamicRangesCompat.toDynamicRangeProfiles()) != null) {
            DynamicRange requestedDynamicRange = outputConfig.getDynamicRange();
            Long dynamicRangeProfileOrNull = DynamicRangeConversions.dynamicRangeToFirstSupportedProfile(requestedDynamicRange, dynamicRangeProfiles);
            if (dynamicRangeProfileOrNull == null) {
                Logger.e(TAG, "Requested dynamic range is not supported. Defaulting to STANDARD dynamic range profile.\nRequested dynamic range:\n  " + requestedDynamicRange);
            } else {
                dynamicRangeProfile = dynamicRangeProfileOrNull.longValue();
            }
        }
        outputConfiguration.setDynamicRangeProfile(dynamicRangeProfile);
        return outputConfiguration;
    }

    @Override // androidx.camera.camera2.internal.CaptureSessionInterface
    public void close() {
        synchronized (this.mSessionLock) {
            switch (this.mState) {
                case UNINITIALIZED:
                    throw new IllegalStateException("close() should not be possible in state: " + this.mState);
                case GET_SURFACE:
                    Preconditions.checkNotNull(this.mSynchronizedCaptureSessionOpener, "The Opener shouldn't null in state:" + this.mState);
                    this.mSynchronizedCaptureSessionOpener.stop();
                case INITIALIZED:
                    this.mState = State.RELEASED;
                    break;
                case OPENED:
                    if (this.mSessionConfig != null) {
                        List<CaptureConfig> configList = this.mCameraEventCallbacks.createComboCallback().onDisableSession();
                        if (!configList.isEmpty()) {
                            try {
                                issueCaptureRequests(setupConfiguredSurface(configList));
                            } catch (IllegalStateException e) {
                                Logger.e(TAG, "Unable to issue the request before close the capture session", e);
                            }
                        }
                    }
                case OPENING:
                    Preconditions.checkNotNull(this.mSynchronizedCaptureSessionOpener, "The Opener shouldn't null in state:" + this.mState);
                    this.mSynchronizedCaptureSessionOpener.stop();
                    this.mState = State.CLOSED;
                    this.mSessionConfig = null;
                    break;
            }
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:17:0x005c A[Catch: all -> 0x00bb, TryCatch #1 {, blocks: (B:4:0x0003, B:5:0x000d, B:28:0x00b4, B:7:0x0012, B:10:0x0018, B:14:0x0027, B:13:0x001f, B:15:0x002c, B:17:0x005c, B:18:0x0060, B:20:0x0064, B:21:0x006f, B:22:0x0071, B:24:0x0073, B:25:0x0093, B:26:0x0098, B:27:0x00b3), top: B:36:0x0003, inners: #0 }] */
    /* JADX WARN: Removed duplicated region for block: B:20:0x0064 A[Catch: all -> 0x00bb, TryCatch #1 {, blocks: (B:4:0x0003, B:5:0x000d, B:28:0x00b4, B:7:0x0012, B:10:0x0018, B:14:0x0027, B:13:0x001f, B:15:0x002c, B:17:0x005c, B:18:0x0060, B:20:0x0064, B:21:0x006f, B:22:0x0071, B:24:0x0073, B:25:0x0093, B:26:0x0098, B:27:0x00b3), top: B:36:0x0003, inners: #0 }] */
    @Override // androidx.camera.camera2.internal.CaptureSessionInterface
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public com.google.common.util.concurrent.ListenableFuture<java.lang.Void> release(boolean r5) {
        /*
            r4 = this;
            java.lang.Object r0 = r4.mSessionLock
            monitor-enter(r0)
            int[] r1 = androidx.camera.camera2.internal.CaptureSession.AnonymousClass4.$SwitchMap$androidx$camera$camera2$internal$CaptureSession$State     // Catch: java.lang.Throwable -> Lbb
            androidx.camera.camera2.internal.CaptureSession$State r2 = r4.mState     // Catch: java.lang.Throwable -> Lbb
            int r2 = r2.ordinal()     // Catch: java.lang.Throwable -> Lbb
            r1 = r1[r2]     // Catch: java.lang.Throwable -> Lbb
            switch(r1) {
                case 1: goto L98;
                case 2: goto L93;
                case 3: goto L73;
                case 4: goto L2c;
                case 5: goto L12;
                case 6: goto L12;
                case 7: goto L60;
                default: goto L10;
            }     // Catch: java.lang.Throwable -> Lbb
        L10:
            goto Lb4
        L12:
            androidx.camera.camera2.internal.SynchronizedCaptureSession r1 = r4.mSynchronizedCaptureSession     // Catch: java.lang.Throwable -> Lbb
            if (r1 == 0) goto L2c
            if (r5 == 0) goto L27
            androidx.camera.camera2.internal.SynchronizedCaptureSession r1 = r4.mSynchronizedCaptureSession     // Catch: android.hardware.camera2.CameraAccessException -> L1e java.lang.Throwable -> Lbb
            r1.abortCaptures()     // Catch: android.hardware.camera2.CameraAccessException -> L1e java.lang.Throwable -> Lbb
            goto L27
        L1e:
            r1 = move-exception
            java.lang.String r2 = "CaptureSession"
            java.lang.String r3 = "Unable to abort captures."
            androidx.camera.core.Logger.e(r2, r3, r1)     // Catch: java.lang.Throwable -> Lbb
        L27:
            androidx.camera.camera2.internal.SynchronizedCaptureSession r1 = r4.mSynchronizedCaptureSession     // Catch: java.lang.Throwable -> Lbb
            r1.close()     // Catch: java.lang.Throwable -> Lbb
        L2c:
            androidx.camera.camera2.impl.CameraEventCallbacks r1 = r4.mCameraEventCallbacks     // Catch: java.lang.Throwable -> Lbb
            androidx.camera.camera2.impl.CameraEventCallbacks$ComboCameraEventCallback r1 = r1.createComboCallback()     // Catch: java.lang.Throwable -> Lbb
            r1.onDeInitSession()     // Catch: java.lang.Throwable -> Lbb
            androidx.camera.camera2.internal.CaptureSession$State r1 = androidx.camera.camera2.internal.CaptureSession.State.RELEASING     // Catch: java.lang.Throwable -> Lbb
            r4.mState = r1     // Catch: java.lang.Throwable -> Lbb
            androidx.camera.camera2.internal.SynchronizedCaptureSessionOpener r1 = r4.mSynchronizedCaptureSessionOpener     // Catch: java.lang.Throwable -> Lbb
            java.lang.StringBuilder r2 = new java.lang.StringBuilder     // Catch: java.lang.Throwable -> Lbb
            r2.<init>()     // Catch: java.lang.Throwable -> Lbb
            java.lang.String r3 = "The Opener shouldn't null in state:"
            java.lang.StringBuilder r2 = r2.append(r3)     // Catch: java.lang.Throwable -> Lbb
            androidx.camera.camera2.internal.CaptureSession$State r3 = r4.mState     // Catch: java.lang.Throwable -> Lbb
            java.lang.StringBuilder r2 = r2.append(r3)     // Catch: java.lang.Throwable -> Lbb
            java.lang.String r2 = r2.toString()     // Catch: java.lang.Throwable -> Lbb
            androidx.core.util.Preconditions.checkNotNull(r1, r2)     // Catch: java.lang.Throwable -> Lbb
            androidx.camera.camera2.internal.SynchronizedCaptureSessionOpener r1 = r4.mSynchronizedCaptureSessionOpener     // Catch: java.lang.Throwable -> Lbb
            boolean r1 = r1.stop()     // Catch: java.lang.Throwable -> Lbb
            if (r1 == 0) goto L60
            r4.finishClose()     // Catch: java.lang.Throwable -> Lbb
            goto Lb4
        L60:
            com.google.common.util.concurrent.ListenableFuture<java.lang.Void> r1 = r4.mReleaseFuture     // Catch: java.lang.Throwable -> Lbb
            if (r1 != 0) goto L6f
            androidx.camera.camera2.internal.CaptureSession$$ExternalSyntheticLambda1 r1 = new androidx.camera.camera2.internal.CaptureSession$$ExternalSyntheticLambda1     // Catch: java.lang.Throwable -> Lbb
            r1.<init>()     // Catch: java.lang.Throwable -> Lbb
            com.google.common.util.concurrent.ListenableFuture r1 = androidx.concurrent.futures.CallbackToFutureAdapter.getFuture(r1)     // Catch: java.lang.Throwable -> Lbb
            r4.mReleaseFuture = r1     // Catch: java.lang.Throwable -> Lbb
        L6f:
            com.google.common.util.concurrent.ListenableFuture<java.lang.Void> r1 = r4.mReleaseFuture     // Catch: java.lang.Throwable -> Lbb
            monitor-exit(r0)     // Catch: java.lang.Throwable -> Lbb
            return r1
        L73:
            androidx.camera.camera2.internal.SynchronizedCaptureSessionOpener r1 = r4.mSynchronizedCaptureSessionOpener     // Catch: java.lang.Throwable -> Lbb
            java.lang.StringBuilder r2 = new java.lang.StringBuilder     // Catch: java.lang.Throwable -> Lbb
            r2.<init>()     // Catch: java.lang.Throwable -> Lbb
            java.lang.String r3 = "The Opener shouldn't null in state:"
            java.lang.StringBuilder r2 = r2.append(r3)     // Catch: java.lang.Throwable -> Lbb
            androidx.camera.camera2.internal.CaptureSession$State r3 = r4.mState     // Catch: java.lang.Throwable -> Lbb
            java.lang.StringBuilder r2 = r2.append(r3)     // Catch: java.lang.Throwable -> Lbb
            java.lang.String r2 = r2.toString()     // Catch: java.lang.Throwable -> Lbb
            androidx.core.util.Preconditions.checkNotNull(r1, r2)     // Catch: java.lang.Throwable -> Lbb
            androidx.camera.camera2.internal.SynchronizedCaptureSessionOpener r1 = r4.mSynchronizedCaptureSessionOpener     // Catch: java.lang.Throwable -> Lbb
            r1.stop()     // Catch: java.lang.Throwable -> Lbb
        L93:
            androidx.camera.camera2.internal.CaptureSession$State r1 = androidx.camera.camera2.internal.CaptureSession.State.RELEASED     // Catch: java.lang.Throwable -> Lbb
            r4.mState = r1     // Catch: java.lang.Throwable -> Lbb
            goto Lb4
        L98:
            java.lang.IllegalStateException r1 = new java.lang.IllegalStateException     // Catch: java.lang.Throwable -> Lbb
            java.lang.StringBuilder r2 = new java.lang.StringBuilder     // Catch: java.lang.Throwable -> Lbb
            r2.<init>()     // Catch: java.lang.Throwable -> Lbb
            java.lang.String r3 = "release() should not be possible in state: "
            java.lang.StringBuilder r2 = r2.append(r3)     // Catch: java.lang.Throwable -> Lbb
            androidx.camera.camera2.internal.CaptureSession$State r3 = r4.mState     // Catch: java.lang.Throwable -> Lbb
            java.lang.StringBuilder r2 = r2.append(r3)     // Catch: java.lang.Throwable -> Lbb
            java.lang.String r2 = r2.toString()     // Catch: java.lang.Throwable -> Lbb
            r1.<init>(r2)     // Catch: java.lang.Throwable -> Lbb
            throw r1     // Catch: java.lang.Throwable -> Lbb
        Lb4:
            monitor-exit(r0)     // Catch: java.lang.Throwable -> Lbb
            r0 = 0
            com.google.common.util.concurrent.ListenableFuture r0 = androidx.camera.core.impl.utils.futures.Futures.immediateFuture(r0)
            return r0
        Lbb:
            r1 = move-exception
            monitor-exit(r0)     // Catch: java.lang.Throwable -> Lbb
            throw r1
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.camera.camera2.internal.CaptureSession.release(boolean):com.google.common.util.concurrent.ListenableFuture");
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: lambda$release$1$androidx-camera-camera2-internal-CaptureSession  reason: not valid java name */
    public /* synthetic */ Object m39lambda$release$1$androidxcameracamera2internalCaptureSession(CallbackToFutureAdapter.Completer completer) throws Exception {
        String str;
        synchronized (this.mSessionLock) {
            Preconditions.checkState(this.mReleaseCompleter == null, "Release completer expected to be null");
            this.mReleaseCompleter = completer;
            str = "Release[session=" + this + "]";
        }
        return str;
    }

    @Override // androidx.camera.camera2.internal.CaptureSessionInterface
    public void issueCaptureRequests(List<CaptureConfig> captureConfigs) {
        synchronized (this.mSessionLock) {
            switch (this.mState) {
                case UNINITIALIZED:
                    throw new IllegalStateException("issueCaptureRequests() should not be possible in state: " + this.mState);
                case INITIALIZED:
                case GET_SURFACE:
                case OPENING:
                    this.mCaptureConfigs.addAll(captureConfigs);
                    break;
                case OPENED:
                    this.mCaptureConfigs.addAll(captureConfigs);
                    issuePendingCaptureRequest();
                    break;
                case CLOSED:
                case RELEASING:
                case RELEASED:
                    throw new IllegalStateException("Cannot issue capture request on a closed/released session.");
            }
        }
    }

    @Override // androidx.camera.camera2.internal.CaptureSessionInterface
    public List<CaptureConfig> getCaptureConfigs() {
        List<CaptureConfig> unmodifiableList;
        synchronized (this.mSessionLock) {
            unmodifiableList = Collections.unmodifiableList(this.mCaptureConfigs);
        }
        return unmodifiableList;
    }

    State getState() {
        State state;
        synchronized (this.mSessionLock) {
            state = this.mState;
        }
        return state;
    }

    void finishClose() {
        if (this.mState == State.RELEASED) {
            Logger.d(TAG, "Skipping finishClose due to being state RELEASED.");
            return;
        }
        this.mState = State.RELEASED;
        this.mSynchronizedCaptureSession = null;
        if (this.mReleaseCompleter != null) {
            this.mReleaseCompleter.set(null);
            this.mReleaseCompleter = null;
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public int issueRepeatingCaptureRequests(SessionConfig sessionConfig) {
        synchronized (this.mSessionLock) {
            if (sessionConfig == null) {
                Logger.d(TAG, "Skipping issueRepeatingCaptureRequests for no configuration case.");
                return -1;
            } else if (this.mState != State.OPENED) {
                Logger.d(TAG, "Skipping issueRepeatingCaptureRequests due to session closed");
                return -1;
            } else {
                CaptureConfig captureConfig = sessionConfig.getRepeatingCaptureConfig();
                if (captureConfig.getSurfaces().isEmpty()) {
                    Logger.d(TAG, "Skipping issueRepeatingCaptureRequests for no surface.");
                    try {
                        this.mSynchronizedCaptureSession.stopRepeating();
                    } catch (CameraAccessException e) {
                        Logger.e(TAG, "Unable to access camera: " + e.getMessage());
                        Thread.dumpStack();
                    }
                    return -1;
                }
                try {
                    Logger.d(TAG, "Issuing request for session.");
                    CaptureConfig.Builder captureConfigBuilder = CaptureConfig.Builder.from(captureConfig);
                    this.mCameraEventOnRepeatingOptions = mergeOptions(this.mCameraEventCallbacks.createComboCallback().onRepeating());
                    captureConfigBuilder.addImplementationOptions(this.mCameraEventOnRepeatingOptions);
                    CaptureRequest captureRequest = Camera2CaptureRequestBuilder.build(captureConfigBuilder.build(), this.mSynchronizedCaptureSession.getDevice(), this.mConfiguredSurfaceMap);
                    if (captureRequest == null) {
                        Logger.d(TAG, "Skipping issuing empty request for session.");
                        return -1;
                    }
                    CameraCaptureSession.CaptureCallback comboCaptureCallback = createCamera2CaptureCallback(captureConfig.getCameraCaptureCallbacks(), this.mCaptureCallback);
                    return this.mSynchronizedCaptureSession.setSingleRepeatingRequest(captureRequest, comboCaptureCallback);
                } catch (CameraAccessException e2) {
                    Logger.e(TAG, "Unable to access camera: " + e2.getMessage());
                    Thread.dumpStack();
                    return -1;
                }
            }
        }
    }

    void issuePendingCaptureRequest() {
        if (this.mCaptureConfigs.isEmpty()) {
            return;
        }
        try {
            issueBurstCaptureRequest(this.mCaptureConfigs);
        } finally {
            this.mCaptureConfigs.clear();
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public int issueBurstCaptureRequest(List<CaptureConfig> captureConfigs) {
        CameraBurstCaptureCallback callbackAggregator;
        List<CaptureRequest> captureRequests;
        boolean isStillCapture;
        synchronized (this.mSessionLock) {
            if (this.mState != State.OPENED) {
                Logger.d(TAG, "Skipping issueBurstCaptureRequest due to session closed");
                return -1;
            } else if (captureConfigs.isEmpty()) {
                return -1;
            } else {
                try {
                    callbackAggregator = new CameraBurstCaptureCallback();
                    captureRequests = new ArrayList<>();
                    isStillCapture = false;
                    Logger.d(TAG, "Issuing capture request.");
                    for (CaptureConfig captureConfig : captureConfigs) {
                        if (captureConfig.getSurfaces().isEmpty()) {
                            Logger.d(TAG, "Skipping issuing empty capture request.");
                        } else {
                            boolean surfacesValid = true;
                            Iterator<DeferrableSurface> it = captureConfig.getSurfaces().iterator();
                            while (true) {
                                if (!it.hasNext()) {
                                    break;
                                }
                                DeferrableSurface surface = it.next();
                                if (!this.mConfiguredSurfaceMap.containsKey(surface)) {
                                    Logger.d(TAG, "Skipping capture request with invalid surface: " + surface);
                                    surfacesValid = false;
                                    break;
                                }
                            }
                            if (surfacesValid) {
                                if (captureConfig.getTemplateType() == 2) {
                                    isStillCapture = true;
                                }
                                CaptureConfig.Builder captureConfigBuilder = CaptureConfig.Builder.from(captureConfig);
                                if (captureConfig.getTemplateType() == 5 && captureConfig.getCameraCaptureResult() != null) {
                                    captureConfigBuilder.setCameraCaptureResult(captureConfig.getCameraCaptureResult());
                                }
                                if (this.mSessionConfig != null) {
                                    captureConfigBuilder.addImplementationOptions(this.mSessionConfig.getRepeatingCaptureConfig().getImplementationOptions());
                                }
                                captureConfigBuilder.addImplementationOptions(this.mCameraEventOnRepeatingOptions);
                                captureConfigBuilder.addImplementationOptions(captureConfig.getImplementationOptions());
                                CaptureRequest captureRequest = Camera2CaptureRequestBuilder.build(captureConfigBuilder.build(), this.mSynchronizedCaptureSession.getDevice(), this.mConfiguredSurfaceMap);
                                if (captureRequest == null) {
                                    Logger.d(TAG, "Skipping issuing request without surface.");
                                    return -1;
                                }
                                List<CameraCaptureSession.CaptureCallback> cameraCallbacks = new ArrayList<>();
                                for (CameraCaptureCallback callback : captureConfig.getCameraCaptureCallbacks()) {
                                    CaptureCallbackConverter.toCaptureCallback(callback, cameraCallbacks);
                                }
                                callbackAggregator.addCamera2Callbacks(captureRequest, cameraCallbacks);
                                captureRequests.add(captureRequest);
                            }
                        }
                    }
                } catch (CameraAccessException e) {
                    Logger.e(TAG, "Unable to access camera: " + e.getMessage());
                    Thread.dumpStack();
                }
                if (!captureRequests.isEmpty()) {
                    if (this.mStillCaptureFlow.shouldStopRepeatingBeforeCapture(captureRequests, isStillCapture)) {
                        this.mSynchronizedCaptureSession.stopRepeating();
                        callbackAggregator.setCaptureSequenceCallback(new CameraBurstCaptureCallback.CaptureSequenceCallback() { // from class: androidx.camera.camera2.internal.CaptureSession$$ExternalSyntheticLambda0
                            @Override // androidx.camera.camera2.internal.CameraBurstCaptureCallback.CaptureSequenceCallback
                            public final void onCaptureSequenceCompletedOrAborted(CameraCaptureSession cameraCaptureSession, int i, boolean z) {
                                CaptureSession.this.m37xaccd0633(cameraCaptureSession, i, z);
                            }
                        });
                    }
                    if (this.mTorchStateReset.isTorchResetRequired(captureRequests, isStillCapture)) {
                        callbackAggregator.addCamera2Callbacks(captureRequests.get(captureRequests.size() - 1), Collections.singletonList(new CameraCaptureSession.CaptureCallback() { // from class: androidx.camera.camera2.internal.CaptureSession.3
                            @Override // android.hardware.camera2.CameraCaptureSession.CaptureCallback
                            public void onCaptureCompleted(CameraCaptureSession session, CaptureRequest request, TotalCaptureResult result) {
                                synchronized (CaptureSession.this.mSessionLock) {
                                    if (CaptureSession.this.mSessionConfig == null) {
                                        return;
                                    }
                                    CaptureConfig repeatingConfig = CaptureSession.this.mSessionConfig.getRepeatingCaptureConfig();
                                    Logger.d(CaptureSession.TAG, "Submit FLASH_MODE_OFF request");
                                    CaptureSession.this.issueCaptureRequests(Collections.singletonList(CaptureSession.this.mTorchStateReset.createTorchResetRequest(repeatingConfig)));
                                }
                            }
                        }));
                    }
                    return this.mSynchronizedCaptureSession.captureBurstRequests(captureRequests, callbackAggregator);
                }
                Logger.d(TAG, "Skipping issuing burst request due to no valid request elements");
                return -1;
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: lambda$issueBurstCaptureRequest$2$androidx-camera-camera2-internal-CaptureSession  reason: not valid java name */
    public /* synthetic */ void m37xaccd0633(CameraCaptureSession session, int sequenceId, boolean isAborted) {
        synchronized (this.mSessionLock) {
            if (this.mState == State.OPENED) {
                issueRepeatingCaptureRequests(this.mSessionConfig);
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void abortCaptures() {
        synchronized (this.mSessionLock) {
            if (this.mState != State.OPENED) {
                Logger.e(TAG, "Unable to abort captures. Incorrect state:" + this.mState);
                return;
            }
            try {
                this.mSynchronizedCaptureSession.abortCaptures();
            } catch (CameraAccessException e) {
                Logger.e(TAG, "Unable to abort captures.", e);
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void stopRepeating() {
        synchronized (this.mSessionLock) {
            if (this.mState != State.OPENED) {
                Logger.e(TAG, "Unable to stop repeating. Incorrect state:" + this.mState);
                return;
            }
            try {
                this.mSynchronizedCaptureSession.stopRepeating();
            } catch (CameraAccessException e) {
                Logger.e(TAG, "Unable to stop repeating.", e);
            }
        }
    }

    @Override // androidx.camera.camera2.internal.CaptureSessionInterface
    public void cancelIssuedCaptureRequests() {
        List<CaptureConfig> captureConfigs = null;
        synchronized (this.mSessionLock) {
            if (!this.mCaptureConfigs.isEmpty()) {
                captureConfigs = new ArrayList<>(this.mCaptureConfigs);
                this.mCaptureConfigs.clear();
            }
        }
        if (captureConfigs != null) {
            for (CaptureConfig captureConfig : captureConfigs) {
                for (CameraCaptureCallback cameraCaptureCallback : captureConfig.getCameraCaptureCallbacks()) {
                    cameraCaptureCallback.onCaptureCancelled();
                }
            }
        }
    }

    private CameraCaptureSession.CaptureCallback createCamera2CaptureCallback(List<CameraCaptureCallback> cameraCaptureCallbacks, CameraCaptureSession.CaptureCallback... additionalCallbacks) {
        List<CameraCaptureSession.CaptureCallback> camera2Callbacks = new ArrayList<>(cameraCaptureCallbacks.size() + additionalCallbacks.length);
        for (CameraCaptureCallback callback : cameraCaptureCallbacks) {
            camera2Callbacks.add(CaptureCallbackConverter.toCaptureCallback(callback));
        }
        Collections.addAll(camera2Callbacks, additionalCallbacks);
        return Camera2CaptureCallbacks.createComboCallback(camera2Callbacks);
    }

    private static Config mergeOptions(List<CaptureConfig> captureConfigList) {
        MutableOptionsBundle options = MutableOptionsBundle.create();
        for (CaptureConfig captureConfig : captureConfigList) {
            Config newOptions = captureConfig.getImplementationOptions();
            for (Config.Option<?> option : newOptions.listOptions()) {
                Object newValue = newOptions.retrieveOption(option, null);
                if (options.containsOption(option)) {
                    Object oldValue = options.retrieveOption(option, null);
                    if (!Objects.equals(oldValue, newValue)) {
                        Logger.d(TAG, "Detect conflicting option " + option.getId() + " : " + newValue + " != " + oldValue);
                    }
                } else {
                    options.insertOption(option, newValue);
                }
            }
        }
        return options;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes.dex */
    public final class StateCallback extends SynchronizedCaptureSession.StateCallback {
        StateCallback() {
        }

        @Override // androidx.camera.camera2.internal.SynchronizedCaptureSession.StateCallback
        public void onConfigured(SynchronizedCaptureSession session) {
            synchronized (CaptureSession.this.mSessionLock) {
                switch (CaptureSession.this.mState) {
                    case UNINITIALIZED:
                    case INITIALIZED:
                    case GET_SURFACE:
                    case OPENED:
                    case RELEASED:
                        throw new IllegalStateException("onConfigured() should not be possible in state: " + CaptureSession.this.mState);
                    case OPENING:
                        CaptureSession.this.mState = State.OPENED;
                        CaptureSession.this.mSynchronizedCaptureSession = session;
                        if (CaptureSession.this.mSessionConfig != null) {
                            List<CaptureConfig> list = CaptureSession.this.mCameraEventCallbacks.createComboCallback().onEnableSession();
                            if (!list.isEmpty()) {
                                CaptureSession.this.issueBurstCaptureRequest(CaptureSession.this.setupConfiguredSurface(list));
                            }
                        }
                        Logger.d(CaptureSession.TAG, "Attempting to send capture request onConfigured");
                        CaptureSession.this.issueRepeatingCaptureRequests(CaptureSession.this.mSessionConfig);
                        CaptureSession.this.issuePendingCaptureRequest();
                        break;
                    case CLOSED:
                        CaptureSession.this.mSynchronizedCaptureSession = session;
                        break;
                    case RELEASING:
                        session.close();
                        break;
                }
                Logger.d(CaptureSession.TAG, "CameraCaptureSession.onConfigured() mState=" + CaptureSession.this.mState);
            }
        }

        @Override // androidx.camera.camera2.internal.SynchronizedCaptureSession.StateCallback
        public void onReady(SynchronizedCaptureSession session) {
            synchronized (CaptureSession.this.mSessionLock) {
                switch (CaptureSession.this.mState) {
                    case UNINITIALIZED:
                        throw new IllegalStateException("onReady() should not be possible in state: " + CaptureSession.this.mState);
                    default:
                        Logger.d(CaptureSession.TAG, "CameraCaptureSession.onReady() " + CaptureSession.this.mState);
                        break;
                }
            }
        }

        @Override // androidx.camera.camera2.internal.SynchronizedCaptureSession.StateCallback
        public void onSessionFinished(SynchronizedCaptureSession session) {
            synchronized (CaptureSession.this.mSessionLock) {
                if (CaptureSession.this.mState == State.UNINITIALIZED) {
                    throw new IllegalStateException("onSessionFinished() should not be possible in state: " + CaptureSession.this.mState);
                }
                Logger.d(CaptureSession.TAG, "onSessionFinished()");
                CaptureSession.this.finishClose();
            }
        }

        @Override // androidx.camera.camera2.internal.SynchronizedCaptureSession.StateCallback
        public void onConfigureFailed(SynchronizedCaptureSession session) {
            synchronized (CaptureSession.this.mSessionLock) {
                switch (CaptureSession.this.mState) {
                    case UNINITIALIZED:
                    case INITIALIZED:
                    case GET_SURFACE:
                    case OPENED:
                        throw new IllegalStateException("onConfigureFailed() should not be possible in state: " + CaptureSession.this.mState);
                    case OPENING:
                    case CLOSED:
                    case RELEASING:
                        CaptureSession.this.finishClose();
                        break;
                    case RELEASED:
                        Logger.d(CaptureSession.TAG, "ConfigureFailed callback after change to RELEASED state");
                        break;
                }
                Logger.e(CaptureSession.TAG, "CameraCaptureSession.onConfigureFailed() " + CaptureSession.this.mState);
            }
        }
    }

    List<CaptureConfig> setupConfiguredSurface(List<CaptureConfig> list) {
        List<CaptureConfig> ret = new ArrayList<>();
        for (CaptureConfig c : list) {
            CaptureConfig.Builder builder = CaptureConfig.Builder.from(c);
            builder.setTemplateType(1);
            for (DeferrableSurface deferrableSurface : this.mSessionConfig.getRepeatingCaptureConfig().getSurfaces()) {
                builder.addSurface(deferrableSurface);
            }
            ret.add(builder.build());
        }
        return ret;
    }
}
