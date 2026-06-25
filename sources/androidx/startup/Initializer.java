package androidx.startup;

import android.content.Context;
import java.util.List;
/* loaded from: classes12.dex */
public interface Initializer<T> {
    T create(Context context);

    List<Class<? extends Initializer<?>>> dependencies();
}
