package androidx.camera.core.impl;

import android.util.Range;
import android.util.Size;
import androidx.camera.core.DynamicRange;
import androidx.camera.core.impl.StreamSpec;
/* loaded from: classes.dex */
final class AutoValue_StreamSpec extends StreamSpec {
    private final DynamicRange dynamicRange;
    private final Range<Integer> expectedFrameRateRange;
    private final Config implementationOptions;
    private final Size resolution;

    private AutoValue_StreamSpec(Size resolution, DynamicRange dynamicRange, Range<Integer> expectedFrameRateRange, Config implementationOptions) {
        this.resolution = resolution;
        this.dynamicRange = dynamicRange;
        this.expectedFrameRateRange = expectedFrameRateRange;
        this.implementationOptions = implementationOptions;
    }

    @Override // androidx.camera.core.impl.StreamSpec
    public Size getResolution() {
        return this.resolution;
    }

    @Override // androidx.camera.core.impl.StreamSpec
    public DynamicRange getDynamicRange() {
        return this.dynamicRange;
    }

    @Override // androidx.camera.core.impl.StreamSpec
    public Range<Integer> getExpectedFrameRateRange() {
        return this.expectedFrameRateRange;
    }

    @Override // androidx.camera.core.impl.StreamSpec
    public Config getImplementationOptions() {
        return this.implementationOptions;
    }

    public String toString() {
        return "StreamSpec{resolution=" + this.resolution + ", dynamicRange=" + this.dynamicRange + ", expectedFrameRateRange=" + this.expectedFrameRateRange + ", implementationOptions=" + this.implementationOptions + "}";
    }

    public boolean equals(Object o) {
        if (o == this) {
            return true;
        }
        if (o instanceof StreamSpec) {
            StreamSpec that = (StreamSpec) o;
            if (this.resolution.equals(that.getResolution()) && this.dynamicRange.equals(that.getDynamicRange()) && this.expectedFrameRateRange.equals(that.getExpectedFrameRateRange())) {
                if (this.implementationOptions == null) {
                    if (that.getImplementationOptions() == null) {
                        return true;
                    }
                } else if (this.implementationOptions.equals(that.getImplementationOptions())) {
                    return true;
                }
            }
            return false;
        }
        return false;
    }

    public int hashCode() {
        int h$ = 1 * 1000003;
        return ((((((h$ ^ this.resolution.hashCode()) * 1000003) ^ this.dynamicRange.hashCode()) * 1000003) ^ this.expectedFrameRateRange.hashCode()) * 1000003) ^ (this.implementationOptions == null ? 0 : this.implementationOptions.hashCode());
    }

    @Override // androidx.camera.core.impl.StreamSpec
    public StreamSpec.Builder toBuilder() {
        return new Builder(this);
    }

    /* loaded from: classes.dex */
    static final class Builder extends StreamSpec.Builder {
        private DynamicRange dynamicRange;
        private Range<Integer> expectedFrameRateRange;
        private Config implementationOptions;
        private Size resolution;

        /* JADX INFO: Access modifiers changed from: package-private */
        public Builder() {
        }

        private Builder(StreamSpec source) {
            this.resolution = source.getResolution();
            this.dynamicRange = source.getDynamicRange();
            this.expectedFrameRateRange = source.getExpectedFrameRateRange();
            this.implementationOptions = source.getImplementationOptions();
        }

        @Override // androidx.camera.core.impl.StreamSpec.Builder
        public StreamSpec.Builder setResolution(Size resolution) {
            if (resolution == null) {
                throw new NullPointerException("Null resolution");
            }
            this.resolution = resolution;
            return this;
        }

        @Override // androidx.camera.core.impl.StreamSpec.Builder
        public StreamSpec.Builder setDynamicRange(DynamicRange dynamicRange) {
            if (dynamicRange == null) {
                throw new NullPointerException("Null dynamicRange");
            }
            this.dynamicRange = dynamicRange;
            return this;
        }

        @Override // androidx.camera.core.impl.StreamSpec.Builder
        public StreamSpec.Builder setExpectedFrameRateRange(Range<Integer> expectedFrameRateRange) {
            if (expectedFrameRateRange == null) {
                throw new NullPointerException("Null expectedFrameRateRange");
            }
            this.expectedFrameRateRange = expectedFrameRateRange;
            return this;
        }

        @Override // androidx.camera.core.impl.StreamSpec.Builder
        public StreamSpec.Builder setImplementationOptions(Config implementationOptions) {
            this.implementationOptions = implementationOptions;
            return this;
        }

        @Override // androidx.camera.core.impl.StreamSpec.Builder
        public StreamSpec build() {
            String missing = this.resolution == null ? " resolution" : "";
            if (this.dynamicRange == null) {
                missing = missing + " dynamicRange";
            }
            if (this.expectedFrameRateRange == null) {
                missing = missing + " expectedFrameRateRange";
            }
            if (!missing.isEmpty()) {
                throw new IllegalStateException("Missing required properties:" + missing);
            }
            return new AutoValue_StreamSpec(this.resolution, this.dynamicRange, this.expectedFrameRateRange, this.implementationOptions);
        }
    }
}
