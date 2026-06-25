package dagger.hilt.android;

import android.app.Application;
import android.content.Context;
import dagger.hilt.EntryPoints;
import dagger.hilt.android.internal.Contexts;
import dagger.hilt.internal.GeneratedComponentManagerHolder;
import dagger.hilt.internal.Preconditions;
import dagger.hilt.internal.TestSingletonComponentManager;
import java.lang.annotation.Annotation;
import javax.annotation.Nonnull;
/* loaded from: classes12.dex */
public final class EarlyEntryPoints {
    @Nonnull
    public static <T> T get(Context applicationContext, Class<T> entryPoint) {
        Application application = Contexts.getApplication(applicationContext);
        Preconditions.checkState(application instanceof GeneratedComponentManagerHolder, "Expected application to implement GeneratedComponentManagerHolder. Check that you're passing in an application context that uses Hilt. Application class found: %s", application.getClass());
        Object componentManager = ((GeneratedComponentManagerHolder) application).componentManager();
        if (componentManager instanceof TestSingletonComponentManager) {
            Preconditions.checkState(hasAnnotationReflection(entryPoint, EarlyEntryPoint.class), "%s should be called with EntryPoints.get() rather than EarlyEntryPoints.get()", entryPoint.getCanonicalName());
            Object earlyComponent = ((TestSingletonComponentManager) componentManager).earlySingletonComponent();
            return entryPoint.cast(earlyComponent);
        }
        Object earlyComponent2 = EntryPoints.get(application, entryPoint);
        return (T) earlyComponent2;
    }

    private static boolean hasAnnotationReflection(Class<?> clazz, Class<? extends Annotation> annotationClazz) {
        Annotation[] annotations;
        for (Annotation annotation : clazz.getAnnotations()) {
            if (annotation.annotationType().equals(annotationClazz)) {
                return true;
            }
        }
        return false;
    }

    private EarlyEntryPoints() {
    }
}
