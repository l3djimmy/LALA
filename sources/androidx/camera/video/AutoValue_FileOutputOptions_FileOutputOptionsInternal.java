package androidx.camera.video;

import android.location.Location;
import androidx.camera.video.FileOutputOptions;
import java.io.File;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final class AutoValue_FileOutputOptions_FileOutputOptionsInternal extends FileOutputOptions.FileOutputOptionsInternal {
    private final long durationLimitMillis;
    private final File file;
    private final long fileSizeLimit;
    private final Location location;

    private AutoValue_FileOutputOptions_FileOutputOptionsInternal(long fileSizeLimit, long durationLimitMillis, Location location, File file) {
        this.fileSizeLimit = fileSizeLimit;
        this.durationLimitMillis = durationLimitMillis;
        this.location = location;
        this.file = file;
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

    @Override // androidx.camera.video.FileOutputOptions.FileOutputOptionsInternal
    File getFile() {
        return this.file;
    }

    public String toString() {
        return "FileOutputOptionsInternal{fileSizeLimit=" + this.fileSizeLimit + ", durationLimitMillis=" + this.durationLimitMillis + ", location=" + this.location + ", file=" + this.file + "}";
    }

    public boolean equals(Object o) {
        if (o == this) {
            return true;
        }
        if (o instanceof FileOutputOptions.FileOutputOptionsInternal) {
            FileOutputOptions.FileOutputOptionsInternal that = (FileOutputOptions.FileOutputOptionsInternal) o;
            return this.fileSizeLimit == that.getFileSizeLimit() && this.durationLimitMillis == that.getDurationLimitMillis() && (this.location != null ? this.location.equals(that.getLocation()) : that.getLocation() == null) && this.file.equals(that.getFile());
        }
        return false;
    }

    public int hashCode() {
        int h$ = 1 * 1000003;
        return ((((((h$ ^ ((int) ((this.fileSizeLimit >>> 32) ^ this.fileSizeLimit))) * 1000003) ^ ((int) ((this.durationLimitMillis >>> 32) ^ this.durationLimitMillis))) * 1000003) ^ (this.location == null ? 0 : this.location.hashCode())) * 1000003) ^ this.file.hashCode();
    }

    /* loaded from: classes.dex */
    static final class Builder extends FileOutputOptions.FileOutputOptionsInternal.Builder {
        private Long durationLimitMillis;
        private File file;
        private Long fileSizeLimit;
        private Location location;

        /* JADX INFO: Access modifiers changed from: package-private */
        /* JADX WARN: Can't rename method to resolve collision */
        @Override // androidx.camera.video.OutputOptions.OutputOptionsInternal.Builder
        public FileOutputOptions.FileOutputOptionsInternal.Builder setFileSizeLimit(long fileSizeLimit) {
            this.fileSizeLimit = Long.valueOf(fileSizeLimit);
            return this;
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        /* JADX WARN: Can't rename method to resolve collision */
        @Override // androidx.camera.video.OutputOptions.OutputOptionsInternal.Builder
        public FileOutputOptions.FileOutputOptionsInternal.Builder setDurationLimitMillis(long durationLimitMillis) {
            this.durationLimitMillis = Long.valueOf(durationLimitMillis);
            return this;
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        /* JADX WARN: Can't rename method to resolve collision */
        @Override // androidx.camera.video.OutputOptions.OutputOptionsInternal.Builder
        public FileOutputOptions.FileOutputOptionsInternal.Builder setLocation(Location location) {
            this.location = location;
            return this;
        }

        @Override // androidx.camera.video.FileOutputOptions.FileOutputOptionsInternal.Builder
        FileOutputOptions.FileOutputOptionsInternal.Builder setFile(File file) {
            if (file == null) {
                throw new NullPointerException("Null file");
            }
            this.file = file;
            return this;
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        @Override // androidx.camera.video.FileOutputOptions.FileOutputOptionsInternal.Builder, androidx.camera.video.OutputOptions.OutputOptionsInternal.Builder
        public FileOutputOptions.FileOutputOptionsInternal build() {
            String missing = this.fileSizeLimit == null ? " fileSizeLimit" : "";
            if (this.durationLimitMillis == null) {
                missing = missing + " durationLimitMillis";
            }
            if (this.file == null) {
                missing = missing + " file";
            }
            if (!missing.isEmpty()) {
                throw new IllegalStateException("Missing required properties:" + missing);
            }
            return new AutoValue_FileOutputOptions_FileOutputOptionsInternal(this.fileSizeLimit.longValue(), this.durationLimitMillis.longValue(), this.location, this.file);
        }
    }
}
