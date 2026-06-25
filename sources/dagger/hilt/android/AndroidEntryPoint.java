package dagger.hilt.android;

import java.lang.annotation.ElementType;
import java.lang.annotation.Target;
@Target({ElementType.TYPE})
/* loaded from: classes12.dex */
public @interface AndroidEntryPoint {
    Class<?> value() default Void.class;
}
