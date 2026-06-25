package androidx.camera.core.streamsharing;

import androidx.camera.core.CameraSelector;
import androidx.camera.core.UseCase;
import androidx.camera.core.impl.CaptureConfig;
import androidx.camera.core.impl.MutableConfig;
import androidx.camera.core.impl.MutableOptionsBundle;
import androidx.camera.core.impl.OptionsBundle;
import androidx.camera.core.impl.SessionConfig;
import androidx.camera.core.impl.UseCaseConfig;
import androidx.camera.core.impl.UseCaseConfigFactory;
import androidx.camera.core.internal.TargetConfig;
import java.util.UUID;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public class StreamSharingBuilder implements UseCaseConfig.Builder<StreamSharing, StreamSharingConfig, StreamSharingBuilder> {
    private static final String UNSUPPORTED_MESSAGE = "Operation not supported by StreamSharingBuilder.";
    private final MutableOptionsBundle mMutableConfig;

    @Override // androidx.camera.core.internal.TargetConfig.Builder
    public /* bridge */ /* synthetic */ Object setTargetClass(Class cls) {
        return setTargetClass((Class<StreamSharing>) cls);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public StreamSharingBuilder() {
        this(MutableOptionsBundle.create());
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public StreamSharingBuilder(MutableOptionsBundle mutableConfig) {
        this.mMutableConfig = mutableConfig;
        Class<?> oldConfigClass = (Class) mutableConfig.retrieveOption(TargetConfig.OPTION_TARGET_CLASS, null);
        if (oldConfigClass != null && !oldConfigClass.equals(StreamSharing.class)) {
            throw new IllegalArgumentException("Invalid target class configuration for " + this + ": " + oldConfigClass);
        }
        setTargetClass(StreamSharing.class);
    }

    @Override // androidx.camera.core.ExtendableBuilder
    public MutableConfig getMutableConfig() {
        return this.mMutableConfig;
    }

    @Override // androidx.camera.core.ExtendableBuilder
    public StreamSharing build() {
        throw new UnsupportedOperationException(UNSUPPORTED_MESSAGE);
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // androidx.camera.core.impl.UseCaseConfig.Builder
    public StreamSharingBuilder setDefaultSessionConfig(SessionConfig sessionConfig) {
        throw new UnsupportedOperationException(UNSUPPORTED_MESSAGE);
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // androidx.camera.core.impl.UseCaseConfig.Builder
    public StreamSharingBuilder setDefaultCaptureConfig(CaptureConfig captureConfig) {
        throw new UnsupportedOperationException(UNSUPPORTED_MESSAGE);
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // androidx.camera.core.impl.UseCaseConfig.Builder
    public StreamSharingBuilder setSessionOptionUnpacker(SessionConfig.OptionUnpacker optionUnpacker) {
        throw new UnsupportedOperationException(UNSUPPORTED_MESSAGE);
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // androidx.camera.core.impl.UseCaseConfig.Builder
    public StreamSharingBuilder setCaptureOptionUnpacker(CaptureConfig.OptionUnpacker optionUnpacker) {
        throw new UnsupportedOperationException(UNSUPPORTED_MESSAGE);
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // androidx.camera.core.impl.UseCaseConfig.Builder
    public StreamSharingBuilder setSurfaceOccupancyPriority(int priority) {
        throw new UnsupportedOperationException(UNSUPPORTED_MESSAGE);
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // androidx.camera.core.impl.UseCaseConfig.Builder
    public StreamSharingBuilder setCameraSelector(CameraSelector cameraSelector) {
        throw new UnsupportedOperationException(UNSUPPORTED_MESSAGE);
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // androidx.camera.core.impl.UseCaseConfig.Builder
    public StreamSharingBuilder setZslDisabled(boolean disabled) {
        throw new UnsupportedOperationException(UNSUPPORTED_MESSAGE);
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // androidx.camera.core.impl.UseCaseConfig.Builder
    public StreamSharingBuilder setHighResolutionDisabled(boolean disabled) {
        throw new UnsupportedOperationException(UNSUPPORTED_MESSAGE);
    }

    @Override // androidx.camera.core.impl.UseCaseConfig.Builder
    public StreamSharingConfig getUseCaseConfig() {
        return new StreamSharingConfig(OptionsBundle.from(this.mMutableConfig));
    }

    @Override // androidx.camera.core.internal.TargetConfig.Builder
    public StreamSharingBuilder setTargetClass(Class<StreamSharing> targetClass) {
        getMutableConfig().insertOption(TargetConfig.OPTION_TARGET_CLASS, targetClass);
        if (getMutableConfig().retrieveOption(TargetConfig.OPTION_TARGET_NAME, null) == null) {
            String targetName = targetClass.getCanonicalName() + "-" + UUID.randomUUID();
            setTargetName(targetName);
        }
        return this;
    }

    @Override // androidx.camera.core.internal.TargetConfig.Builder
    public StreamSharingBuilder setTargetName(String targetName) {
        getMutableConfig().insertOption(TargetConfig.OPTION_TARGET_NAME, targetName);
        return this;
    }

    @Override // androidx.camera.core.internal.UseCaseEventConfig.Builder
    public StreamSharingBuilder setUseCaseEventCallback(UseCase.EventCallback eventCallback) {
        throw new UnsupportedOperationException(UNSUPPORTED_MESSAGE);
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // androidx.camera.core.impl.UseCaseConfig.Builder
    public StreamSharingBuilder setCaptureType(UseCaseConfigFactory.CaptureType captureType) {
        getMutableConfig().insertOption(UseCaseConfig.OPTION_CAPTURE_TYPE, captureType);
        return this;
    }
}
