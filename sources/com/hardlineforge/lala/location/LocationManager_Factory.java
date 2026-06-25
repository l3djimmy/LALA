package com.hardlineforge.lala.location;

import android.content.Context;
import dagger.internal.Factory;
import dagger.internal.Provider;
/* loaded from: classes8.dex */
public final class LocationManager_Factory implements Factory<LocationManager> {
    private final Provider<Context> contextProvider;

    private LocationManager_Factory(Provider<Context> contextProvider) {
        this.contextProvider = contextProvider;
    }

    @Override // javax.inject.Provider, jakarta.inject.Provider
    public LocationManager get() {
        return newInstance(this.contextProvider.get());
    }

    public static LocationManager_Factory create(Provider<Context> contextProvider) {
        return new LocationManager_Factory(contextProvider);
    }

    public static LocationManager newInstance(Context context) {
        return new LocationManager(context);
    }
}
