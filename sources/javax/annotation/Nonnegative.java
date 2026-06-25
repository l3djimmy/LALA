package javax.annotation;

import androidx.camera.video.AudioStats;
import java.lang.annotation.Documented;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import javax.annotation.meta.TypeQualifier;
import javax.annotation.meta.TypeQualifierValidator;
import javax.annotation.meta.When;
@TypeQualifier(applicableTo = Number.class)
@Documented
@Retention(RetentionPolicy.RUNTIME)
/* loaded from: classes12.dex */
public @interface Nonnegative {
    When when() default When.ALWAYS;

    /* loaded from: classes12.dex */
    public static class Checker implements TypeQualifierValidator<Nonnegative> {
        @Override // javax.annotation.meta.TypeQualifierValidator
        public When forConstantValue(Nonnegative annotation, Object v) {
            if (!(v instanceof Number)) {
                return When.NEVER;
            }
            Number value = (Number) v;
            boolean isNegative = true;
            if (value instanceof Long) {
                if (value.longValue() >= 0) {
                    isNegative = false;
                }
            } else if (value instanceof Double) {
                if (value.doubleValue() >= AudioStats.AUDIO_AMPLITUDE_NONE) {
                    isNegative = false;
                }
            } else if (value instanceof Float) {
                if (value.floatValue() >= 0.0f) {
                    isNegative = false;
                }
            } else if (value.intValue() >= 0) {
                isNegative = false;
            }
            if (isNegative) {
                return When.NEVER;
            }
            return When.ALWAYS;
        }
    }
}
