package androidx.room.util;

import androidx.exifinterface.media.ExifInterface;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import kotlin.text.StringsKt;
/* compiled from: KClassUtil.jvmAndroid.kt */
@Metadata(d1 = {"\u0000\u0012\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0002\u001a1\u0010\u0000\u001a\u0002H\u0001\"\u0004\b\u0000\u0010\u0001\"\u0004\b\u0001\u0010\u00022\f\u0010\u0003\u001a\b\u0012\u0004\u0012\u0002H\u00020\u00042\b\b\u0002\u0010\u0005\u001a\u00020\u0006H\u0007¢\u0006\u0002\u0010\u0007¨\u0006\b"}, d2 = {"findAndInstantiateDatabaseImpl", ExifInterface.GPS_DIRECTION_TRUE, "C", "klass", "Ljava/lang/Class;", "suffix", "", "(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Object;", "room-runtime"}, k = 2, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes12.dex */
public final class KClassUtil {
    public static /* synthetic */ Object findAndInstantiateDatabaseImpl$default(Class cls, String str, int i, Object obj) {
        if ((i & 2) != 0) {
            str = "_Impl";
        }
        return findAndInstantiateDatabaseImpl(cls, str);
    }

    public static final <T, C> T findAndInstantiateDatabaseImpl(Class<C> klass, String suffix) {
        String substring;
        String fullClassName;
        Intrinsics.checkNotNullParameter(klass, "klass");
        Intrinsics.checkNotNullParameter(suffix, "suffix");
        Package r0 = klass.getPackage();
        String fullPackage = (r0 == null || (r0 = r0.getName()) == null) ? "" : "";
        String name = klass.getCanonicalName();
        Intrinsics.checkNotNull(name);
        if (fullPackage.length() == 0) {
            substring = name;
        } else {
            substring = name.substring(fullPackage.length() + 1);
            Intrinsics.checkNotNullExpressionValue(substring, "substring(...)");
        }
        String postPackageName = substring;
        String implName = StringsKt.replace$default(postPackageName, '.', '_', false, 4, (Object) null) + suffix;
        try {
            if (fullPackage.length() == 0) {
                fullClassName = implName;
            } else {
                fullClassName = fullPackage + '.' + implName;
            }
            Class aClass = Class.forName(fullClassName, true, klass.getClassLoader());
            Intrinsics.checkNotNull(aClass, "null cannot be cast to non-null type java.lang.Class<T of androidx.room.util.KClassUtil.findAndInstantiateDatabaseImpl>");
            return aClass.getDeclaredConstructor(new Class[0]).newInstance(new Object[0]);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException("Cannot find implementation for " + klass.getCanonicalName() + ". " + implName + " does not exist. Is Room annotation processor correctly configured?", e);
        } catch (IllegalAccessException e2) {
            throw new RuntimeException("Cannot access the constructor " + klass.getCanonicalName(), e2);
        } catch (InstantiationException e3) {
            throw new RuntimeException("Failed to create an instance of " + klass.getCanonicalName(), e3);
        }
    }
}
