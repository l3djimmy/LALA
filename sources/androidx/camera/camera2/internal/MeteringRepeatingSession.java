package androidx.camera.camera2.internal;

import android.graphics.SurfaceTexture;
import android.util.Size;
import android.view.Surface;
import androidx.camera.camera2.internal.compat.CameraCharacteristicsCompat;
import androidx.camera.camera2.internal.compat.StreamConfigurationMapCompat;
import androidx.camera.camera2.internal.compat.workaround.SupportedRepeatingSurfaceSize;
import androidx.camera.core.Logger;
import androidx.camera.core.UseCase;
import androidx.camera.core.impl.Config;
import androidx.camera.core.impl.DeferrableSurface;
import androidx.camera.core.impl.ImmediateSurface;
import androidx.camera.core.impl.MutableOptionsBundle;
import androidx.camera.core.impl.SessionConfig;
import androidx.camera.core.impl.UseCaseConfig;
import androidx.camera.core.impl.UseCaseConfigFactory;
import androidx.camera.core.impl.utils.executor.CameraXExecutors;
import androidx.camera.core.impl.utils.futures.FutureCallback;
import androidx.camera.core.impl.utils.futures.Futures;
import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public class MeteringRepeatingSession {
    private static final String TAG = "MeteringRepeating";
    private DeferrableSurface mDeferrableSurface;
    private final Size mMeteringRepeatingSize;
    private SessionConfig mSessionConfig;
    private final SurfaceResetCallback mSurfaceResetCallback;
    private final SupportedRepeatingSurfaceSize mSupportedRepeatingSurfaceSize = new SupportedRepeatingSurfaceSize();
    private final MeteringRepeatingConfig mConfigWithDefaults = new MeteringRepeatingConfig();

    /* loaded from: classes.dex */
    interface SurfaceResetCallback {
        void onSurfaceReset();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public MeteringRepeatingSession(CameraCharacteristicsCompat cameraCharacteristicsCompat, DisplayInfoManager displayInfoManager, SurfaceResetCallback surfaceResetCallback) {
        this.mSurfaceResetCallback = surfaceResetCallback;
        this.mMeteringRepeatingSize = getProperPreviewSize(cameraCharacteristicsCompat, displayInfoManager);
        Logger.d(TAG, "MeteringSession SurfaceTexture size: " + this.mMeteringRepeatingSize);
        this.mSessionConfig = createSessionConfig();
    }

    SessionConfig createSessionConfig() {
        final SurfaceTexture surfaceTexture = new SurfaceTexture(0);
        surfaceTexture.setDefaultBufferSize(this.mMeteringRepeatingSize.getWidth(), this.mMeteringRepeatingSize.getHeight());
        final Surface surface = new Surface(surfaceTexture);
        SessionConfig.Builder builder = SessionConfig.Builder.createFrom(this.mConfigWithDefaults, this.mMeteringRepeatingSize);
        builder.setTemplateType(1);
        this.mDeferrableSurface = new ImmediateSurface(surface);
        Futures.addCallback(this.mDeferrableSurface.getTerminationFuture(), new FutureCallback<Void>() { // from class: androidx.camera.camera2.internal.MeteringRepeatingSession.1
            @Override // androidx.camera.core.impl.utils.futures.FutureCallback
            public void onSuccess(Void result) {
                surface.release();
                surfaceTexture.release();
            }

            @Override // androidx.camera.core.impl.utils.futures.FutureCallback
            public void onFailure(Throwable t) {
                throw new IllegalStateException("Future should never fail. Did it get completed by GC?", t);
            }
        }, CameraXExecutors.directExecutor());
        builder.addSurface(this.mDeferrableSurface);
        builder.addErrorListener(new SessionConfig.ErrorListener() { // from class: androidx.camera.camera2.internal.MeteringRepeatingSession$$ExternalSyntheticLambda0
            @Override // androidx.camera.core.impl.SessionConfig.ErrorListener
            public final void onError(SessionConfig sessionConfig, SessionConfig.SessionError sessionError) {
                MeteringRepeatingSession.this.m52x1b0a2abb(sessionConfig, sessionError);
            }
        });
        return builder.build();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: lambda$createSessionConfig$0$androidx-camera-camera2-internal-MeteringRepeatingSession  reason: not valid java name */
    public /* synthetic */ void m52x1b0a2abb(SessionConfig sessionConfig, SessionConfig.SessionError error) {
        this.mSessionConfig = createSessionConfig();
        if (this.mSurfaceResetCallback != null) {
            this.mSurfaceResetCallback.onSurfaceReset();
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public UseCaseConfig<?> getUseCaseConfig() {
        return this.mConfigWithDefaults;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public SessionConfig getSessionConfig() {
        return this.mSessionConfig;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public String getName() {
        return TAG;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void clear() {
        Logger.d(TAG, "MeteringRepeating clear!");
        if (this.mDeferrableSurface != null) {
            this.mDeferrableSurface.close();
        }
        this.mDeferrableSurface = null;
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes.dex */
    public static class MeteringRepeatingConfig implements UseCaseConfig<UseCase> {
        private final Config mConfig;

        MeteringRepeatingConfig() {
            MutableOptionsBundle mutableOptionsBundle = MutableOptionsBundle.create();
            mutableOptionsBundle.insertOption(UseCaseConfig.OPTION_SESSION_CONFIG_UNPACKER, new Camera2SessionOptionUnpacker());
            this.mConfig = mutableOptionsBundle;
        }

        @Override // androidx.camera.core.impl.ReadableConfig
        public Config getConfig() {
            return this.mConfig;
        }

        @Override // androidx.camera.core.impl.UseCaseConfig
        public UseCaseConfigFactory.CaptureType getCaptureType() {
            return UseCaseConfigFactory.CaptureType.METERING_REPEATING;
        }
    }

    private Size getProperPreviewSize(CameraCharacteristicsCompat cameraCharacteristicsCompat, DisplayInfoManager displayInfoManager) {
        StreamConfigurationMapCompat mapCompat = cameraCharacteristicsCompat.getStreamConfigurationMapCompat();
        Size[] outputSizes = mapCompat.getOutputSizes(34);
        if (outputSizes == null) {
            Logger.e(TAG, "Can not get output size list.");
            return new Size(0, 0);
        }
        Size[] outputSizes2 = this.mSupportedRepeatingSurfaceSize.getSupportedSizes(outputSizes);
        List<Size> outSizesList = Arrays.asList(outputSizes2);
        Collections.sort(outSizesList, new Comparator() { // from class: androidx.camera.camera2.internal.MeteringRepeatingSession$$ExternalSyntheticLambda1
            @Override // java.util.Comparator
            public final int compare(Object obj, Object obj2) {
                return MeteringRepeatingSession.lambda$getProperPreviewSize$1((Size) obj, (Size) obj2);
            }
        });
        Size previewMaxSize = displayInfoManager.getPreviewSize();
        long maxSizeProduct = Math.min(previewMaxSize.getWidth() * previewMaxSize.getHeight(), 307200L);
        Size previousSize = null;
        int length = outputSizes2.length;
        int i = 0;
        while (true) {
            if (i >= length) {
                break;
            }
            Size outputSize = outputSizes2[i];
            long product = outputSize.getWidth() * outputSize.getHeight();
            if (product == maxSizeProduct) {
                return outputSize;
            }
            if (product > maxSizeProduct) {
                if (previousSize != null) {
                    return previousSize;
                }
            } else {
                previousSize = outputSize;
                i++;
            }
        }
        return outSizesList.get(0);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static /* synthetic */ int lambda$getProperPreviewSize$1(Size o1, Size o2) {
        int result = Long.signum((o1.getWidth() * o1.getHeight()) - (o2.getWidth() * o2.getHeight()));
        return result;
    }
}
