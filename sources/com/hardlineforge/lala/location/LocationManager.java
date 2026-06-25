package com.hardlineforge.lala.location;

import android.content.Context;
import android.location.Location;
import androidx.core.content.ContextCompat;
import com.google.android.gms.location.FusedLocationProviderClient;
import com.google.android.gms.location.LocationServices;
import com.google.android.gms.tasks.OnSuccessListener;
import com.google.android.gms.tasks.Task;
import dagger.hilt.android.qualifiers.ApplicationContext;
import javax.inject.Inject;
import javax.inject.Singleton;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.coroutines.flow.Flow;
import kotlinx.coroutines.flow.FlowKt;
/* compiled from: LocationManager.kt */
@Singleton
@Metadata(d1 = {"\u00004\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\b\u0007\u0018\u00002\u00020\u0001B\u0013\b\u0007\u0012\b\b\u0001\u0010\u0002\u001a\u00020\u0003¢\u0006\u0004\b\u0004\u0010\u0005J\u0006\u0010\b\u001a\u00020\tJ\u000e\u0010\n\u001a\b\u0012\u0004\u0012\u00020\f0\u000bH\u0007J\u001e\u0010\r\u001a\u00020\u000e2\u0014\u0010\u000f\u001a\u0010\u0012\u0006\u0012\u0004\u0018\u00010\f\u0012\u0004\u0012\u00020\u000e0\u0010H\u0007R\u000e\u0010\u0002\u001a\u00020\u0003X\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\u0006\u001a\u00020\u0007X\u0082\u0004¢\u0006\u0002\n\u0000¨\u0006\u0011"}, d2 = {"Lcom/hardlineforge/lala/location/LocationManager;", "", "context", "Landroid/content/Context;", "<init>", "(Landroid/content/Context;)V", "client", "Lcom/google/android/gms/location/FusedLocationProviderClient;", "hasPermission", "", "currentLocation", "Lkotlinx/coroutines/flow/Flow;", "Landroid/location/Location;", "lastKnownLocation", "", "onResult", "Lkotlin/Function1;", "app_debug"}, k = 1, mv = {2, 2, 0}, xi = 48)
/* loaded from: classes8.dex */
public final class LocationManager {
    public static final int $stable = 8;
    private final FusedLocationProviderClient client;
    private final Context context;

    @Inject
    public LocationManager(@ApplicationContext Context context) {
        Intrinsics.checkNotNullParameter(context, "context");
        this.context = context;
        FusedLocationProviderClient fusedLocationProviderClient = LocationServices.getFusedLocationProviderClient(this.context);
        Intrinsics.checkNotNullExpressionValue(fusedLocationProviderClient, "getFusedLocationProviderClient(...)");
        this.client = fusedLocationProviderClient;
    }

    public final boolean hasPermission() {
        return ContextCompat.checkSelfPermission(this.context, "android.permission.ACCESS_FINE_LOCATION") == 0 || ContextCompat.checkSelfPermission(this.context, "android.permission.ACCESS_COARSE_LOCATION") == 0;
    }

    public final Flow<Location> currentLocation() {
        return FlowKt.callbackFlow(new LocationManager$currentLocation$1(this, null));
    }

    public final void lastKnownLocation(final Function1<? super Location, Unit> onResult) {
        Intrinsics.checkNotNullParameter(onResult, "onResult");
        if (!hasPermission()) {
            onResult.invoke(null);
            return;
        }
        Task<Location> lastLocation = this.client.getLastLocation();
        final Function1 function1 = new Function1() { // from class: com.hardlineforge.lala.location.LocationManager$$ExternalSyntheticLambda0
            @Override // kotlin.jvm.functions.Function1
            public final Object invoke(Object obj) {
                return LocationManager.lastKnownLocation$lambda$0(Function1.this, (Location) obj);
            }
        };
        lastLocation.addOnSuccessListener(new OnSuccessListener() { // from class: com.hardlineforge.lala.location.LocationManager$$ExternalSyntheticLambda1
            @Override // com.google.android.gms.tasks.OnSuccessListener
            public final void onSuccess(Object obj) {
                Function1.this.invoke(obj);
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit lastKnownLocation$lambda$0(Function1 $onResult, Location it) {
        $onResult.invoke(it);
        return Unit.INSTANCE;
    }
}
