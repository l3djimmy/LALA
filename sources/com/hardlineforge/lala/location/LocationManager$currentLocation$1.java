package com.hardlineforge.lala.location;

import android.location.Location;
import android.os.Looper;
import com.google.android.gms.location.FusedLocationProviderClient;
import com.google.android.gms.location.LocationCallback;
import com.google.android.gms.location.LocationRequest;
import com.google.android.gms.location.LocationResult;
import kotlin.Metadata;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.IntrinsicsKt;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.coroutines.jvm.internal.SpillingKt;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.coroutines.channels.ChannelResult;
import kotlinx.coroutines.channels.ProduceKt;
import kotlinx.coroutines.channels.ProducerScope;
/* JADX INFO: Access modifiers changed from: package-private */
/* compiled from: LocationManager.kt */
@Metadata(d1 = {"\u0000\u000e\n\u0000\n\u0002\u0010\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\u0010\u0000\u001a\u00020\u0001*\b\u0012\u0004\u0012\u00020\u00030\u0002H\n"}, d2 = {"<anonymous>", "", "Lkotlinx/coroutines/channels/ProducerScope;", "Landroid/location/Location;"}, k = 3, mv = {2, 2, 0}, xi = 48)
@DebugMetadata(c = "com.hardlineforge.lala.location.LocationManager$currentLocation$1", f = "LocationManager.kt", i = {0, 0, 0}, l = {55}, m = "invokeSuspend", n = {"$this$callbackFlow", "request", "callback"}, s = {"L$0", "L$1", "L$2"})
/* loaded from: classes8.dex */
public final class LocationManager$currentLocation$1 extends SuspendLambda implements Function2<ProducerScope<? super Location>, Continuation<? super Unit>, Object> {
    private /* synthetic */ Object L$0;
    Object L$1;
    Object L$2;
    int label;
    final /* synthetic */ LocationManager this$0;

    /* JADX INFO: Access modifiers changed from: package-private */
    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public LocationManager$currentLocation$1(LocationManager locationManager, Continuation<? super LocationManager$currentLocation$1> continuation) {
        super(2, continuation);
        this.this$0 = locationManager;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
        LocationManager$currentLocation$1 locationManager$currentLocation$1 = new LocationManager$currentLocation$1(this.this$0, continuation);
        locationManager$currentLocation$1.L$0 = obj;
        return locationManager$currentLocation$1;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(ProducerScope<? super Location> producerScope, Continuation<? super Unit> continuation) {
        return ((LocationManager$currentLocation$1) create(producerScope, continuation)).invokeSuspend(Unit.INSTANCE);
    }

    /* JADX WARN: Type inference failed for: r3v3, types: [com.hardlineforge.lala.location.LocationManager$currentLocation$1$callback$1, java.lang.Object] */
    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object $result) {
        FusedLocationProviderClient fusedLocationProviderClient;
        final ProducerScope $this$callbackFlow = (ProducerScope) this.L$0;
        Object coroutine_suspended = IntrinsicsKt.getCOROUTINE_SUSPENDED();
        switch (this.label) {
            case 0:
                ResultKt.throwOnFailure($result);
                if (!this.this$0.hasPermission()) {
                    $this$callbackFlow.close(new IllegalStateException("Location permission not granted"));
                    return Unit.INSTANCE;
                }
                LocationRequest.Builder builder = new LocationRequest.Builder(100, 5000L);
                builder.setWaitForAccurateLocation(true);
                builder.setMinUpdateIntervalMillis(2000L);
                LocationRequest request = builder.build();
                Intrinsics.checkNotNullExpressionValue(request, "build(...)");
                final ?? r3 = new LocationCallback() { // from class: com.hardlineforge.lala.location.LocationManager$currentLocation$1$callback$1
                    @Override // com.google.android.gms.location.LocationCallback
                    public void onLocationResult(LocationResult result) {
                        Intrinsics.checkNotNullParameter(result, "result");
                        Location lastLocation = result.getLastLocation();
                        if (lastLocation != null) {
                            ChannelResult.m8852boximpl($this$callbackFlow.mo8838trySendJP2dKIU(lastLocation));
                        }
                    }
                };
                fusedLocationProviderClient = this.this$0.client;
                fusedLocationProviderClient.requestLocationUpdates(request, (LocationCallback) r3, Looper.getMainLooper());
                final LocationManager locationManager = this.this$0;
                this.L$0 = SpillingKt.nullOutSpilledVariable($this$callbackFlow);
                this.L$1 = SpillingKt.nullOutSpilledVariable(request);
                this.L$2 = SpillingKt.nullOutSpilledVariable(r3);
                this.label = 1;
                if (ProduceKt.awaitClose($this$callbackFlow, new Function0() { // from class: com.hardlineforge.lala.location.LocationManager$currentLocation$1$$ExternalSyntheticLambda0
                    @Override // kotlin.jvm.functions.Function0
                    public final Object invoke() {
                        return LocationManager$currentLocation$1.invokeSuspend$lambda$1(LocationManager.this, r3);
                    }
                }, this) != coroutine_suspended) {
                    break;
                } else {
                    return coroutine_suspended;
                }
            case 1:
                LocationManager$currentLocation$1$callback$1 locationManager$currentLocation$1$callback$1 = (LocationManager$currentLocation$1$callback$1) this.L$2;
                LocationRequest locationRequest = (LocationRequest) this.L$1;
                ResultKt.throwOnFailure($result);
                break;
            default:
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
        }
        return Unit.INSTANCE;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit invokeSuspend$lambda$1(LocationManager this$0, LocationManager$currentLocation$1$callback$1 $callback) {
        FusedLocationProviderClient fusedLocationProviderClient;
        fusedLocationProviderClient = this$0.client;
        fusedLocationProviderClient.removeLocationUpdates($callback);
        return Unit.INSTANCE;
    }
}
