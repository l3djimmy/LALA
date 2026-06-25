package androidx.camera.video;

import android.content.ContentResolver;
import android.content.ContentValues;
import android.location.Location;
import android.net.Uri;
import androidx.camera.video.MediaStoreOutputOptions;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final class AutoValue_MediaStoreOutputOptions_MediaStoreOutputOptionsInternal extends MediaStoreOutputOptions.MediaStoreOutputOptionsInternal {
    private final Uri collectionUri;
    private final ContentResolver contentResolver;
    private final ContentValues contentValues;
    private final long durationLimitMillis;
    private final long fileSizeLimit;
    private final Location location;

    private AutoValue_MediaStoreOutputOptions_MediaStoreOutputOptionsInternal(long fileSizeLimit, long durationLimitMillis, Location location, ContentResolver contentResolver, Uri collectionUri, ContentValues contentValues) {
        this.fileSizeLimit = fileSizeLimit;
        this.durationLimitMillis = durationLimitMillis;
        this.location = location;
        this.contentResolver = contentResolver;
        this.collectionUri = collectionUri;
        this.contentValues = contentValues;
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

    @Override // androidx.camera.video.MediaStoreOutputOptions.MediaStoreOutputOptionsInternal
    ContentResolver getContentResolver() {
        return this.contentResolver;
    }

    @Override // androidx.camera.video.MediaStoreOutputOptions.MediaStoreOutputOptionsInternal
    Uri getCollectionUri() {
        return this.collectionUri;
    }

    @Override // androidx.camera.video.MediaStoreOutputOptions.MediaStoreOutputOptionsInternal
    ContentValues getContentValues() {
        return this.contentValues;
    }

    public String toString() {
        return "MediaStoreOutputOptionsInternal{fileSizeLimit=" + this.fileSizeLimit + ", durationLimitMillis=" + this.durationLimitMillis + ", location=" + this.location + ", contentResolver=" + this.contentResolver + ", collectionUri=" + this.collectionUri + ", contentValues=" + this.contentValues + "}";
    }

    public boolean equals(Object o) {
        if (o == this) {
            return true;
        }
        if (o instanceof MediaStoreOutputOptions.MediaStoreOutputOptionsInternal) {
            MediaStoreOutputOptions.MediaStoreOutputOptionsInternal that = (MediaStoreOutputOptions.MediaStoreOutputOptionsInternal) o;
            return this.fileSizeLimit == that.getFileSizeLimit() && this.durationLimitMillis == that.getDurationLimitMillis() && (this.location != null ? this.location.equals(that.getLocation()) : that.getLocation() == null) && this.contentResolver.equals(that.getContentResolver()) && this.collectionUri.equals(that.getCollectionUri()) && this.contentValues.equals(that.getContentValues());
        }
        return false;
    }

    public int hashCode() {
        int h$ = 1 * 1000003;
        return ((((((((((h$ ^ ((int) ((this.fileSizeLimit >>> 32) ^ this.fileSizeLimit))) * 1000003) ^ ((int) ((this.durationLimitMillis >>> 32) ^ this.durationLimitMillis))) * 1000003) ^ (this.location == null ? 0 : this.location.hashCode())) * 1000003) ^ this.contentResolver.hashCode()) * 1000003) ^ this.collectionUri.hashCode()) * 1000003) ^ this.contentValues.hashCode();
    }

    /* loaded from: classes.dex */
    static final class Builder extends MediaStoreOutputOptions.MediaStoreOutputOptionsInternal.Builder {
        private Uri collectionUri;
        private ContentResolver contentResolver;
        private ContentValues contentValues;
        private Long durationLimitMillis;
        private Long fileSizeLimit;
        private Location location;

        /* JADX INFO: Access modifiers changed from: package-private */
        /* JADX WARN: Can't rename method to resolve collision */
        @Override // androidx.camera.video.OutputOptions.OutputOptionsInternal.Builder
        public MediaStoreOutputOptions.MediaStoreOutputOptionsInternal.Builder setFileSizeLimit(long fileSizeLimit) {
            this.fileSizeLimit = Long.valueOf(fileSizeLimit);
            return this;
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        /* JADX WARN: Can't rename method to resolve collision */
        @Override // androidx.camera.video.OutputOptions.OutputOptionsInternal.Builder
        public MediaStoreOutputOptions.MediaStoreOutputOptionsInternal.Builder setDurationLimitMillis(long durationLimitMillis) {
            this.durationLimitMillis = Long.valueOf(durationLimitMillis);
            return this;
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        /* JADX WARN: Can't rename method to resolve collision */
        @Override // androidx.camera.video.OutputOptions.OutputOptionsInternal.Builder
        public MediaStoreOutputOptions.MediaStoreOutputOptionsInternal.Builder setLocation(Location location) {
            this.location = location;
            return this;
        }

        @Override // androidx.camera.video.MediaStoreOutputOptions.MediaStoreOutputOptionsInternal.Builder
        MediaStoreOutputOptions.MediaStoreOutputOptionsInternal.Builder setContentResolver(ContentResolver contentResolver) {
            if (contentResolver == null) {
                throw new NullPointerException("Null contentResolver");
            }
            this.contentResolver = contentResolver;
            return this;
        }

        @Override // androidx.camera.video.MediaStoreOutputOptions.MediaStoreOutputOptionsInternal.Builder
        MediaStoreOutputOptions.MediaStoreOutputOptionsInternal.Builder setCollectionUri(Uri collectionUri) {
            if (collectionUri == null) {
                throw new NullPointerException("Null collectionUri");
            }
            this.collectionUri = collectionUri;
            return this;
        }

        @Override // androidx.camera.video.MediaStoreOutputOptions.MediaStoreOutputOptionsInternal.Builder
        MediaStoreOutputOptions.MediaStoreOutputOptionsInternal.Builder setContentValues(ContentValues contentValues) {
            if (contentValues == null) {
                throw new NullPointerException("Null contentValues");
            }
            this.contentValues = contentValues;
            return this;
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        @Override // androidx.camera.video.MediaStoreOutputOptions.MediaStoreOutputOptionsInternal.Builder, androidx.camera.video.OutputOptions.OutputOptionsInternal.Builder
        public MediaStoreOutputOptions.MediaStoreOutputOptionsInternal build() {
            String missing = this.fileSizeLimit == null ? " fileSizeLimit" : "";
            if (this.durationLimitMillis == null) {
                missing = missing + " durationLimitMillis";
            }
            if (this.contentResolver == null) {
                missing = missing + " contentResolver";
            }
            if (this.collectionUri == null) {
                missing = missing + " collectionUri";
            }
            if (this.contentValues == null) {
                missing = missing + " contentValues";
            }
            if (!missing.isEmpty()) {
                throw new IllegalStateException("Missing required properties:" + missing);
            }
            return new AutoValue_MediaStoreOutputOptions_MediaStoreOutputOptionsInternal(this.fileSizeLimit.longValue(), this.durationLimitMillis.longValue(), this.location, this.contentResolver, this.collectionUri, this.contentValues);
        }
    }
}
