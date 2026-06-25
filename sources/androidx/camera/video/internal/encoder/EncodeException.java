package androidx.camera.video.internal.encoder;

import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
/* loaded from: classes.dex */
public class EncodeException extends Exception {
    public static final int ERROR_CODEC = 1;
    public static final int ERROR_UNKNOWN = 0;
    private final int mErrorType;

    @Retention(RetentionPolicy.SOURCE)
    /* loaded from: classes.dex */
    public @interface ErrorType {
    }

    public EncodeException(int errorType, String message, Throwable cause) {
        super(message, cause);
        this.mErrorType = errorType;
    }

    public int getErrorType() {
        return this.mErrorType;
    }
}
