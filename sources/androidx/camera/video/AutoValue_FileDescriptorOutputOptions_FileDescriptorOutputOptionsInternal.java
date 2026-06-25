package androidx.camera.video;

import android.location.Location;
import android.os.ParcelFileDescriptor;
import androidx.camera.video.FileDescriptorOutputOptions;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final class AutoValue_FileDescriptorOutputOptions_FileDescriptorOutputOptionsInternal extends FileDescriptorOutputOptions.FileDescriptorOutputOptionsInternal {
    private final long durationLimitMillis;
    private final long fileSizeLimit;
    private final Location location;
    private final ParcelFileDescriptor parcelFileDescriptor;

    private AutoValue_FileDescriptorOutputOptions_FileDescriptorOutputOptionsInternal(long fileSizeLimit, long durationLimitMillis, Location location, ParcelFileDescriptor parcelFileDescriptor) {
        this.fileSizeLimit = fileSizeLimit;
        this.durationLimitMillis = durationLimitMillis;
        this.location = location;
        this.parcelFileDescriptor = parcelFileDescriptor;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    @Override // androidx.camera.video.OutputOptions.OutputOptionsInternal
    public long getFileSizeLimit() {
        return this.fileSizeLimit;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    @Override // androidx.camera.video.OutputOptions.OutputOptionsInternal
    public long getDurationLimitMillis() {
        return this.durationLimitMillis;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    @Override // androidx.camera.video.OutputOptions.OutputOptionsInternal
    public Location getLocation() {
        return this.location;
    }

    @Override // androidx.camera.video.FileDescriptorOutputOptions.FileDescriptorOutputOptionsInternal
    ParcelFileDescriptor getParcelFileDescriptor() {
        return this.parcelFileDescriptor;
    }

    public String toString() {
        return "FileDescriptorOutputOptionsInternal{fileSizeLimit=" + this.fileSizeLimit + ", durationLimitMillis=" + this.durationLimitMillis + ", location=" + this.location + ", parcelFileDescriptor=" + this.parcelFileDescriptor + "}";
    }

    public boolean equals(Object o) {
        if (o == this) {
            return true;
        }
        if (o instanceof FileDescriptorOutputOptions.FileDescriptorOutputOptionsInternal) {
            FileDescriptorOutputOptions.FileDescriptorOutputOptionsInternal that = (FileDescriptorOutputOptions.FileDescriptorOutputOptionsInternal) o;
            return this.fileSizeLimit == that.getFileSizeLimit() && this.durationLimitMillis == that.getDurationLimitMillis() && (this.location != null ? this.location.equals(that.getLocation()) : that.getLocation() == null) && this.parcelFileDescriptor.equals(that.getParcelFileDescriptor());
        }
        return false;
    }

    public int hashCode() {
        int h$ = 1 * 1000003;
        return ((((((h$ ^ ((int) ((this.fileSizeLimit >>> 32) ^ this.fileSizeLimit))) * 1000003) ^ ((int) ((this.durationLimitMillis >>> 32) ^ this.durationLimitMillis))) * 1000003) ^ (this.location == null ? 0 : this.location.hashCode())) * 1000003) ^ this.parcelFileDescriptor.hashCode();
    }

    /* loaded from: classes.dex */
    static final class Builder extends FileDescriptorOutputOptions.FileDescriptorOutputOptionsInternal.Builder {
        private Long durationLimitMillis;
        private Long fileSizeLimit;
        private Location location;
        private ParcelFileDescriptor parcelFileDescriptor;

        /* JADX INFO: Access modifiers changed from: package-private */
        /* JADX WARN: Can't rename method to resolve collision */
        @Override // androidx.camera.video.OutputOptions.OutputOptionsInternal.Builder
        public FileDescriptorOutputOptions.FileDescriptorOutputOptionsInternal.Builder setFileSizeLimit(long fileSizeLimit) {
            this.fileSizeLimit = Long.valueOf(fileSizeLimit);
            return this;
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        /* JADX WARN: Can't rename method to resolve collision */
        @Override // androidx.camera.video.OutputOptions.OutputOptionsInternal.Builder
        public FileDescriptorOutputOptions.FileDescriptorOutputOptionsInternal.Builder setDurationLimitMillis(long durationLimitMillis) {
            this.durationLimitMillis = Long.valueOf(durationLimitMillis);
            return this;
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        /* JADX WARN: Can't rename method to resolve collision */
        @Override // androidx.camera.video.OutputOptions.OutputOptionsInternal.Builder
        public FileDescriptorOutputOptions.FileDescriptorOutputOptionsInternal.Builder setLocation(Location location) {
            this.location = location;
            return this;
        }

        @Override // androidx.camera.video.FileDescriptorOutputOptions.FileDescriptorOutputOptionsInternal.Builder
        FileDescriptorOutputOptions.FileDescriptorOutputOptionsInternal.Builder setParcelFileDescriptor(ParcelFileDescriptor parcelFileDescriptor) {
            if (parcelFileDescriptor == null) {
                throw new NullPointerException("Null parcelFileDescriptor");
            }
            this.parcelFileDescriptor = parcelFileDescriptor;
            return this;
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        @Override // androidx.camera.video.FileDescriptorOutputOptions.FileDescriptorOutputOptionsInternal.Builder, androidx.camera.video.OutputOptions.OutputOptionsInternal.Builder
        public FileDescriptorOutputOptions.FileDescriptorOutputOptionsInternal build() {
            String missing = this.fileSizeLimit == null ? " fileSizeLimit" : "";
            if (this.durationLimitMillis == null) {
                missing = missing + " durationLimitMillis";
            }
            if (this.parcelFileDescriptor == null) {
                missing = missing + " parcelFileDescriptor";
            }
            if (!missing.isEmpty()) {
                throw new IllegalStateException("Missing required properties:" + missing);
            }
            return new AutoValue_FileDescriptorOutputOptions_FileDescriptorOutputOptionsInternal(this.fileSizeLimit.longValue(), this.durationLimitMillis.longValue(), this.location, this.parcelFileDescriptor);
        }
    }
}
