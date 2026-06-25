package androidx.camera.core.impl;

import android.hardware.camera2.CameraCaptureSession;
import android.hardware.camera2.CameraDevice;
import android.hardware.camera2.params.InputConfiguration;
import android.util.Range;
import android.util.Size;
import androidx.camera.core.DynamicRange;
import androidx.camera.core.Logger;
import androidx.camera.core.impl.AutoValue_SessionConfig_OutputConfig;
import androidx.camera.core.impl.CaptureConfig;
import androidx.camera.core.impl.Config;
import androidx.camera.core.internal.compat.workaround.SurfaceSorter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Collections;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;
/* loaded from: classes.dex */
public final class SessionConfig {
    private final List<CameraDevice.StateCallback> mDeviceStateCallbacks;
    private final List<ErrorListener> mErrorListeners;
    private InputConfiguration mInputConfiguration;
    private final List<OutputConfig> mOutputConfigs;
    private final CaptureConfig mRepeatingCaptureConfig;
    private final List<CameraCaptureSession.StateCallback> mSessionStateCallbacks;
    private final List<CameraCaptureCallback> mSingleCameraCaptureCallbacks;

    /* loaded from: classes.dex */
    public interface ErrorListener {
        void onError(SessionConfig sessionConfig, SessionError sessionError);
    }

    /* loaded from: classes.dex */
    public interface OptionUnpacker {
        void unpack(Size size, UseCaseConfig<?> useCaseConfig, Builder builder);
    }

    /* loaded from: classes.dex */
    public enum SessionError {
        SESSION_ERROR_SURFACE_NEEDS_RESET,
        SESSION_ERROR_UNKNOWN
    }

    /* loaded from: classes.dex */
    public static abstract class OutputConfig {
        public static final int SURFACE_GROUP_ID_NONE = -1;

        /* loaded from: classes.dex */
        public static abstract class Builder {
            public abstract OutputConfig build();

            public abstract Builder setDynamicRange(DynamicRange dynamicRange);

            public abstract Builder setPhysicalCameraId(String str);

            public abstract Builder setSharedSurfaces(List<DeferrableSurface> list);

            public abstract Builder setSurface(DeferrableSurface deferrableSurface);

            public abstract Builder setSurfaceGroupId(int i);
        }

        public abstract DynamicRange getDynamicRange();

        public abstract String getPhysicalCameraId();

        public abstract List<DeferrableSurface> getSharedSurfaces();

        public abstract DeferrableSurface getSurface();

        public abstract int getSurfaceGroupId();

        public static Builder builder(DeferrableSurface surface) {
            return new AutoValue_SessionConfig_OutputConfig.Builder().setSurface(surface).setSharedSurfaces(Collections.emptyList()).setPhysicalCameraId(null).setSurfaceGroupId(-1).setDynamicRange(DynamicRange.SDR);
        }
    }

    SessionConfig(List<OutputConfig> outputConfigs, List<CameraDevice.StateCallback> deviceStateCallbacks, List<CameraCaptureSession.StateCallback> sessionStateCallbacks, List<CameraCaptureCallback> singleCameraCaptureCallbacks, List<ErrorListener> errorListeners, CaptureConfig repeatingCaptureConfig, InputConfiguration inputConfiguration) {
        this.mOutputConfigs = outputConfigs;
        this.mDeviceStateCallbacks = Collections.unmodifiableList(deviceStateCallbacks);
        this.mSessionStateCallbacks = Collections.unmodifiableList(sessionStateCallbacks);
        this.mSingleCameraCaptureCallbacks = Collections.unmodifiableList(singleCameraCaptureCallbacks);
        this.mErrorListeners = Collections.unmodifiableList(errorListeners);
        this.mRepeatingCaptureConfig = repeatingCaptureConfig;
        this.mInputConfiguration = inputConfiguration;
    }

    public static SessionConfig defaultEmptySessionConfig() {
        return new SessionConfig(new ArrayList(), new ArrayList(0), new ArrayList(0), new ArrayList(0), new ArrayList(0), new CaptureConfig.Builder().build(), null);
    }

    public InputConfiguration getInputConfiguration() {
        return this.mInputConfiguration;
    }

    public List<DeferrableSurface> getSurfaces() {
        List<DeferrableSurface> deferrableSurfaces = new ArrayList<>();
        for (OutputConfig outputConfig : this.mOutputConfigs) {
            deferrableSurfaces.add(outputConfig.getSurface());
            for (DeferrableSurface sharedSurface : outputConfig.getSharedSurfaces()) {
                deferrableSurfaces.add(sharedSurface);
            }
        }
        return Collections.unmodifiableList(deferrableSurfaces);
    }

    public List<OutputConfig> getOutputConfigs() {
        return this.mOutputConfigs;
    }

    public Config getImplementationOptions() {
        return this.mRepeatingCaptureConfig.getImplementationOptions();
    }

    public int getTemplateType() {
        return this.mRepeatingCaptureConfig.getTemplateType();
    }

    public Range<Integer> getExpectedFrameRateRange() {
        return this.mRepeatingCaptureConfig.getExpectedFrameRateRange();
    }

    public List<CameraDevice.StateCallback> getDeviceStateCallbacks() {
        return this.mDeviceStateCallbacks;
    }

    public List<CameraCaptureSession.StateCallback> getSessionStateCallbacks() {
        return this.mSessionStateCallbacks;
    }

    public List<CameraCaptureCallback> getRepeatingCameraCaptureCallbacks() {
        return this.mRepeatingCaptureConfig.getCameraCaptureCallbacks();
    }

    public List<ErrorListener> getErrorListeners() {
        return this.mErrorListeners;
    }

    public List<CameraCaptureCallback> getSingleCameraCaptureCallbacks() {
        return this.mSingleCameraCaptureCallbacks;
    }

    public CaptureConfig getRepeatingCaptureConfig() {
        return this.mRepeatingCaptureConfig;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes.dex */
    public static class BaseBuilder {
        InputConfiguration mInputConfiguration;
        final Set<OutputConfig> mOutputConfigs = new LinkedHashSet();
        final CaptureConfig.Builder mCaptureConfigBuilder = new CaptureConfig.Builder();
        final List<CameraDevice.StateCallback> mDeviceStateCallbacks = new ArrayList();
        final List<CameraCaptureSession.StateCallback> mSessionStateCallbacks = new ArrayList();
        final List<ErrorListener> mErrorListeners = new ArrayList();
        final List<CameraCaptureCallback> mSingleCameraCaptureCallbacks = new ArrayList();

        BaseBuilder() {
        }
    }

    /* loaded from: classes.dex */
    public static class Builder extends BaseBuilder {
        public static Builder createFrom(UseCaseConfig<?> config, Size resolution) {
            OptionUnpacker unpacker = config.getSessionOptionUnpacker(null);
            if (unpacker == null) {
                throw new IllegalStateException("Implementation is missing option unpacker for " + config.getTargetName(config.toString()));
            }
            Builder builder = new Builder();
            unpacker.unpack(resolution, config, builder);
            return builder;
        }

        public Builder setInputConfiguration(InputConfiguration inputConfiguration) {
            this.mInputConfiguration = inputConfiguration;
            return this;
        }

        public Builder setTemplateType(int templateType) {
            this.mCaptureConfigBuilder.setTemplateType(templateType);
            return this;
        }

        public Builder setExpectedFrameRateRange(Range<Integer> expectedFrameRateRange) {
            this.mCaptureConfigBuilder.setExpectedFrameRateRange(expectedFrameRateRange);
            return this;
        }

        public Builder addTag(String key, Object tag) {
            this.mCaptureConfigBuilder.addTag(key, tag);
            return this;
        }

        public Builder addDeviceStateCallback(CameraDevice.StateCallback deviceStateCallback) {
            if (this.mDeviceStateCallbacks.contains(deviceStateCallback)) {
                return this;
            }
            this.mDeviceStateCallbacks.add(deviceStateCallback);
            return this;
        }

        public Builder addAllDeviceStateCallbacks(Collection<CameraDevice.StateCallback> deviceStateCallbacks) {
            for (CameraDevice.StateCallback callback : deviceStateCallbacks) {
                addDeviceStateCallback(callback);
            }
            return this;
        }

        public Builder addSessionStateCallback(CameraCaptureSession.StateCallback sessionStateCallback) {
            if (this.mSessionStateCallbacks.contains(sessionStateCallback)) {
                return this;
            }
            this.mSessionStateCallbacks.add(sessionStateCallback);
            return this;
        }

        public Builder addAllSessionStateCallbacks(List<CameraCaptureSession.StateCallback> sessionStateCallbacks) {
            for (CameraCaptureSession.StateCallback callback : sessionStateCallbacks) {
                addSessionStateCallback(callback);
            }
            return this;
        }

        public Builder addRepeatingCameraCaptureCallback(CameraCaptureCallback cameraCaptureCallback) {
            this.mCaptureConfigBuilder.addCameraCaptureCallback(cameraCaptureCallback);
            return this;
        }

        public Builder addAllRepeatingCameraCaptureCallbacks(Collection<CameraCaptureCallback> cameraCaptureCallbacks) {
            this.mCaptureConfigBuilder.addAllCameraCaptureCallbacks(cameraCaptureCallbacks);
            return this;
        }

        public Builder addCameraCaptureCallback(CameraCaptureCallback cameraCaptureCallback) {
            this.mCaptureConfigBuilder.addCameraCaptureCallback(cameraCaptureCallback);
            if (!this.mSingleCameraCaptureCallbacks.contains(cameraCaptureCallback)) {
                this.mSingleCameraCaptureCallbacks.add(cameraCaptureCallback);
            }
            return this;
        }

        public Builder addAllCameraCaptureCallbacks(Collection<CameraCaptureCallback> cameraCaptureCallbacks) {
            for (CameraCaptureCallback c : cameraCaptureCallbacks) {
                this.mCaptureConfigBuilder.addCameraCaptureCallback(c);
                if (!this.mSingleCameraCaptureCallbacks.contains(c)) {
                    this.mSingleCameraCaptureCallbacks.add(c);
                }
            }
            return this;
        }

        public boolean removeCameraCaptureCallback(CameraCaptureCallback cameraCaptureCallback) {
            boolean removedFromRepeating = this.mCaptureConfigBuilder.removeCameraCaptureCallback(cameraCaptureCallback);
            boolean removedFromSingle = this.mSingleCameraCaptureCallbacks.remove(cameraCaptureCallback);
            return removedFromRepeating || removedFromSingle;
        }

        public List<CameraCaptureCallback> getSingleCameraCaptureCallbacks() {
            return Collections.unmodifiableList(this.mSingleCameraCaptureCallbacks);
        }

        public Builder addErrorListener(ErrorListener errorListener) {
            this.mErrorListeners.add(errorListener);
            return this;
        }

        public Builder addSurface(DeferrableSurface surface) {
            return addSurface(surface, DynamicRange.SDR);
        }

        public Builder addSurface(DeferrableSurface surface, DynamicRange dynamicRange) {
            OutputConfig outputConfig = OutputConfig.builder(surface).setDynamicRange(dynamicRange).build();
            this.mOutputConfigs.add(outputConfig);
            this.mCaptureConfigBuilder.addSurface(surface);
            return this;
        }

        public Builder addOutputConfig(OutputConfig outputConfig) {
            this.mOutputConfigs.add(outputConfig);
            this.mCaptureConfigBuilder.addSurface(outputConfig.getSurface());
            for (DeferrableSurface sharedSurface : outputConfig.getSharedSurfaces()) {
                this.mCaptureConfigBuilder.addSurface(sharedSurface);
            }
            return this;
        }

        public Builder addNonRepeatingSurface(DeferrableSurface surface) {
            return addNonRepeatingSurface(surface, DynamicRange.SDR);
        }

        public Builder addNonRepeatingSurface(DeferrableSurface surface, DynamicRange dynamicRange) {
            OutputConfig outputConfig = OutputConfig.builder(surface).setDynamicRange(dynamicRange).build();
            this.mOutputConfigs.add(outputConfig);
            return this;
        }

        public Builder removeSurface(DeferrableSurface surface) {
            OutputConfig outputConfigToRemove = null;
            Iterator<OutputConfig> it = this.mOutputConfigs.iterator();
            while (true) {
                if (!it.hasNext()) {
                    break;
                }
                OutputConfig config = it.next();
                if (config.getSurface().equals(surface)) {
                    outputConfigToRemove = config;
                    break;
                }
            }
            if (outputConfigToRemove != null) {
                this.mOutputConfigs.remove(outputConfigToRemove);
            }
            this.mCaptureConfigBuilder.removeSurface(surface);
            return this;
        }

        public Builder clearSurfaces() {
            this.mOutputConfigs.clear();
            this.mCaptureConfigBuilder.clearSurfaces();
            return this;
        }

        public Builder setImplementationOptions(Config config) {
            this.mCaptureConfigBuilder.setImplementationOptions(config);
            return this;
        }

        public Builder addImplementationOptions(Config config) {
            this.mCaptureConfigBuilder.addImplementationOptions(config);
            return this;
        }

        public SessionConfig build() {
            return new SessionConfig(new ArrayList(this.mOutputConfigs), new ArrayList(this.mDeviceStateCallbacks), new ArrayList(this.mSessionStateCallbacks), new ArrayList(this.mSingleCameraCaptureCallbacks), new ArrayList(this.mErrorListeners), this.mCaptureConfigBuilder.build(), this.mInputConfiguration);
        }
    }

    /* loaded from: classes.dex */
    public static final class ValidatingBuilder extends BaseBuilder {
        private static final List<Integer> SUPPORTED_TEMPLATE_PRIORITY = Arrays.asList(1, 5, 3);
        private static final String TAG = "ValidatingBuilder";
        private final SurfaceSorter mSurfaceSorter = new SurfaceSorter();
        private boolean mValid = true;
        private boolean mTemplateSet = false;

        public <T> void addImplementationOption(Config.Option<T> option, T value) {
            this.mCaptureConfigBuilder.addImplementationOption(option, value);
        }

        public void add(SessionConfig sessionConfig) {
            CaptureConfig captureConfig = sessionConfig.getRepeatingCaptureConfig();
            if (captureConfig.getTemplateType() != -1) {
                this.mTemplateSet = true;
                this.mCaptureConfigBuilder.setTemplateType(selectTemplateType(captureConfig.getTemplateType(), this.mCaptureConfigBuilder.getTemplateType()));
            }
            setOrVerifyExpectFrameRateRange(captureConfig.getExpectedFrameRateRange());
            TagBundle tagBundle = sessionConfig.getRepeatingCaptureConfig().getTagBundle();
            this.mCaptureConfigBuilder.addAllTags(tagBundle);
            this.mDeviceStateCallbacks.addAll(sessionConfig.getDeviceStateCallbacks());
            this.mSessionStateCallbacks.addAll(sessionConfig.getSessionStateCallbacks());
            this.mCaptureConfigBuilder.addAllCameraCaptureCallbacks(sessionConfig.getRepeatingCameraCaptureCallbacks());
            this.mSingleCameraCaptureCallbacks.addAll(sessionConfig.getSingleCameraCaptureCallbacks());
            this.mErrorListeners.addAll(sessionConfig.getErrorListeners());
            if (sessionConfig.getInputConfiguration() != null) {
                this.mInputConfiguration = sessionConfig.getInputConfiguration();
            }
            this.mOutputConfigs.addAll(sessionConfig.getOutputConfigs());
            this.mCaptureConfigBuilder.getSurfaces().addAll(captureConfig.getSurfaces());
            if (!getSurfaces().containsAll(this.mCaptureConfigBuilder.getSurfaces())) {
                Logger.d(TAG, "Invalid configuration due to capture request surfaces are not a subset of surfaces");
                this.mValid = false;
            }
            this.mCaptureConfigBuilder.addImplementationOptions(captureConfig.getImplementationOptions());
        }

        private void setOrVerifyExpectFrameRateRange(Range<Integer> expectedFrameRateRange) {
            if (expectedFrameRateRange.equals(StreamSpec.FRAME_RATE_RANGE_UNSPECIFIED)) {
                return;
            }
            if (this.mCaptureConfigBuilder.getExpectedFrameRateRange().equals(StreamSpec.FRAME_RATE_RANGE_UNSPECIFIED)) {
                this.mCaptureConfigBuilder.setExpectedFrameRateRange(expectedFrameRateRange);
            } else if (!this.mCaptureConfigBuilder.getExpectedFrameRateRange().equals(expectedFrameRateRange)) {
                this.mValid = false;
                Logger.d(TAG, "Different ExpectedFrameRateRange values");
            }
        }

        private List<DeferrableSurface> getSurfaces() {
            List<DeferrableSurface> surfaces = new ArrayList<>();
            for (OutputConfig outputConfig : this.mOutputConfigs) {
                surfaces.add(outputConfig.getSurface());
                for (DeferrableSurface sharedSurface : outputConfig.getSharedSurfaces()) {
                    surfaces.add(sharedSurface);
                }
            }
            return surfaces;
        }

        public void clearSurfaces() {
            this.mOutputConfigs.clear();
            this.mCaptureConfigBuilder.clearSurfaces();
        }

        public boolean isValid() {
            return this.mTemplateSet && this.mValid;
        }

        public SessionConfig build() {
            if (!this.mValid) {
                throw new IllegalArgumentException("Unsupported session configuration combination");
            }
            List<OutputConfig> outputConfigs = new ArrayList<>(this.mOutputConfigs);
            this.mSurfaceSorter.sort(outputConfigs);
            return new SessionConfig(outputConfigs, new ArrayList(this.mDeviceStateCallbacks), new ArrayList(this.mSessionStateCallbacks), new ArrayList(this.mSingleCameraCaptureCallbacks), new ArrayList(this.mErrorListeners), this.mCaptureConfigBuilder.build(), this.mInputConfiguration);
        }

        private int selectTemplateType(int type1, int type2) {
            return SUPPORTED_TEMPLATE_PRIORITY.indexOf(Integer.valueOf(type1)) >= SUPPORTED_TEMPLATE_PRIORITY.indexOf(Integer.valueOf(type2)) ? type1 : type2;
        }
    }
}
