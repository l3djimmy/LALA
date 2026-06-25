package androidx.camera.core.impl;

import android.util.Range;
import androidx.camera.core.impl.Config;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Objects;
import java.util.Set;
/* loaded from: classes.dex */
public final class CaptureConfig {
    public static final int TEMPLATE_TYPE_NONE = -1;
    final List<CameraCaptureCallback> mCameraCaptureCallbacks;
    private final CameraCaptureResult mCameraCaptureResult;
    final Range<Integer> mExpectedFrameRateRange;
    final Config mImplementationOptions;
    final List<DeferrableSurface> mSurfaces;
    private final TagBundle mTagBundle;
    final int mTemplateType;
    private final boolean mUseRepeatingSurface;
    public static final Config.Option<Integer> OPTION_ROTATION = Config.Option.create("camerax.core.captureConfig.rotation", Integer.TYPE);
    public static final Config.Option<Integer> OPTION_JPEG_QUALITY = Config.Option.create("camerax.core.captureConfig.jpegQuality", Integer.class);
    private static final Config.Option<Range<Integer>> OPTION_RESOLVED_FRAME_RATE = Config.Option.create("camerax.core.captureConfig.resolvedFrameRate", Range.class);

    /* loaded from: classes.dex */
    public interface OptionUnpacker {
        void unpack(UseCaseConfig<?> useCaseConfig, Builder builder);
    }

    CaptureConfig(List<DeferrableSurface> surfaces, Config implementationOptions, int templateType, Range<Integer> expectedFrameRateRange, List<CameraCaptureCallback> cameraCaptureCallbacks, boolean useRepeatingSurface, TagBundle tagBundle, CameraCaptureResult cameraCaptureResult) {
        this.mSurfaces = surfaces;
        this.mImplementationOptions = implementationOptions;
        this.mTemplateType = templateType;
        this.mExpectedFrameRateRange = expectedFrameRateRange;
        this.mCameraCaptureCallbacks = Collections.unmodifiableList(cameraCaptureCallbacks);
        this.mUseRepeatingSurface = useRepeatingSurface;
        this.mTagBundle = tagBundle;
        this.mCameraCaptureResult = cameraCaptureResult;
    }

    public static CaptureConfig defaultEmptyCaptureConfig() {
        return new Builder().build();
    }

    public CameraCaptureResult getCameraCaptureResult() {
        return this.mCameraCaptureResult;
    }

    public List<DeferrableSurface> getSurfaces() {
        return Collections.unmodifiableList(this.mSurfaces);
    }

    public Config getImplementationOptions() {
        return this.mImplementationOptions;
    }

    public int getTemplateType() {
        return this.mTemplateType;
    }

    public Range<Integer> getExpectedFrameRateRange() {
        return (Range) Objects.requireNonNull((Range) this.mImplementationOptions.retrieveOption(OPTION_RESOLVED_FRAME_RATE, StreamSpec.FRAME_RATE_RANGE_UNSPECIFIED));
    }

    public boolean isUseRepeatingSurface() {
        return this.mUseRepeatingSurface;
    }

    public List<CameraCaptureCallback> getCameraCaptureCallbacks() {
        return this.mCameraCaptureCallbacks;
    }

    public TagBundle getTagBundle() {
        return this.mTagBundle;
    }

    /* loaded from: classes.dex */
    public static final class Builder {
        private List<CameraCaptureCallback> mCameraCaptureCallbacks;
        private CameraCaptureResult mCameraCaptureResult;
        private Range<Integer> mExpectedFrameRateRange;
        private MutableConfig mImplementationOptions;
        private MutableTagBundle mMutableTagBundle;
        private final Set<DeferrableSurface> mSurfaces;
        private int mTemplateType;
        private boolean mUseRepeatingSurface;

        public Builder() {
            this.mSurfaces = new HashSet();
            this.mImplementationOptions = MutableOptionsBundle.create();
            this.mTemplateType = -1;
            this.mExpectedFrameRateRange = StreamSpec.FRAME_RATE_RANGE_UNSPECIFIED;
            this.mCameraCaptureCallbacks = new ArrayList();
            this.mUseRepeatingSurface = false;
            this.mMutableTagBundle = MutableTagBundle.create();
        }

        private Builder(CaptureConfig base) {
            this.mSurfaces = new HashSet();
            this.mImplementationOptions = MutableOptionsBundle.create();
            this.mTemplateType = -1;
            this.mExpectedFrameRateRange = StreamSpec.FRAME_RATE_RANGE_UNSPECIFIED;
            this.mCameraCaptureCallbacks = new ArrayList();
            this.mUseRepeatingSurface = false;
            this.mMutableTagBundle = MutableTagBundle.create();
            this.mSurfaces.addAll(base.mSurfaces);
            this.mImplementationOptions = MutableOptionsBundle.from(base.mImplementationOptions);
            this.mTemplateType = base.mTemplateType;
            this.mExpectedFrameRateRange = base.mExpectedFrameRateRange;
            this.mCameraCaptureCallbacks.addAll(base.getCameraCaptureCallbacks());
            this.mUseRepeatingSurface = base.isUseRepeatingSurface();
            this.mMutableTagBundle = MutableTagBundle.from(base.getTagBundle());
        }

        public static Builder createFrom(UseCaseConfig<?> config) {
            OptionUnpacker unpacker = config.getCaptureOptionUnpacker(null);
            if (unpacker == null) {
                throw new IllegalStateException("Implementation is missing option unpacker for " + config.getTargetName(config.toString()));
            }
            Builder builder = new Builder();
            unpacker.unpack(config, builder);
            return builder;
        }

        public static Builder from(CaptureConfig base) {
            return new Builder(base);
        }

        public void setCameraCaptureResult(CameraCaptureResult cameraCaptureResult) {
            this.mCameraCaptureResult = cameraCaptureResult;
        }

        public int getTemplateType() {
            return this.mTemplateType;
        }

        public Range<Integer> getExpectedFrameRateRange() {
            return (Range) this.mImplementationOptions.retrieveOption(CaptureConfig.OPTION_RESOLVED_FRAME_RATE, StreamSpec.FRAME_RATE_RANGE_UNSPECIFIED);
        }

        public void setTemplateType(int templateType) {
            this.mTemplateType = templateType;
        }

        public void setExpectedFrameRateRange(Range<Integer> expectedFrameRateRange) {
            addImplementationOption(CaptureConfig.OPTION_RESOLVED_FRAME_RATE, expectedFrameRateRange);
        }

        public void addCameraCaptureCallback(CameraCaptureCallback cameraCaptureCallback) {
            if (this.mCameraCaptureCallbacks.contains(cameraCaptureCallback)) {
                return;
            }
            this.mCameraCaptureCallbacks.add(cameraCaptureCallback);
        }

        public void addAllCameraCaptureCallbacks(Collection<CameraCaptureCallback> cameraCaptureCallbacks) {
            for (CameraCaptureCallback c : cameraCaptureCallbacks) {
                addCameraCaptureCallback(c);
            }
        }

        public boolean removeCameraCaptureCallback(CameraCaptureCallback cameraCaptureCallback) {
            return this.mCameraCaptureCallbacks.remove(cameraCaptureCallback);
        }

        public void addSurface(DeferrableSurface surface) {
            this.mSurfaces.add(surface);
        }

        public void removeSurface(DeferrableSurface surface) {
            this.mSurfaces.remove(surface);
        }

        public void clearSurfaces() {
            this.mSurfaces.clear();
        }

        public Set<DeferrableSurface> getSurfaces() {
            return this.mSurfaces;
        }

        public void setImplementationOptions(Config config) {
            this.mImplementationOptions = MutableOptionsBundle.from(config);
        }

        public void addImplementationOptions(Config config) {
            for (Config.Option<?> option : config.listOptions()) {
                Object existValue = this.mImplementationOptions.retrieveOption(option, null);
                Object newValue = config.retrieveOption(option);
                if (existValue instanceof MultiValueSet) {
                    ((MultiValueSet) existValue).addAll(((MultiValueSet) newValue).getAllItems());
                } else {
                    if (newValue instanceof MultiValueSet) {
                        newValue = ((MultiValueSet) newValue).mo3clone();
                    }
                    this.mImplementationOptions.insertOption(option, config.getOptionPriority(option), newValue);
                }
            }
        }

        public <T> void addImplementationOption(Config.Option<T> option, T value) {
            this.mImplementationOptions.insertOption(option, value);
        }

        public Config getImplementationOptions() {
            return this.mImplementationOptions;
        }

        public boolean isUseRepeatingSurface() {
            return this.mUseRepeatingSurface;
        }

        public void setUseRepeatingSurface(boolean useRepeatingSurface) {
            this.mUseRepeatingSurface = useRepeatingSurface;
        }

        public Object getTag(String key) {
            return this.mMutableTagBundle.getTag(key);
        }

        public void addTag(String key, Object tag) {
            this.mMutableTagBundle.putTag(key, tag);
        }

        public void addAllTags(TagBundle bundle) {
            this.mMutableTagBundle.addTagBundle(bundle);
        }

        public CaptureConfig build() {
            return new CaptureConfig(new ArrayList(this.mSurfaces), OptionsBundle.from(this.mImplementationOptions), this.mTemplateType, this.mExpectedFrameRateRange, new ArrayList(this.mCameraCaptureCallbacks), this.mUseRepeatingSurface, TagBundle.from(this.mMutableTagBundle), this.mCameraCaptureResult);
        }
    }
}
