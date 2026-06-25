package com.hardlineforge.lala.ui.screens;

import android.location.Location;
import androidx.compose.runtime.MutableState;
import com.hardlineforge.lala.ui.viewmodel.LalaViewModel;
import java.util.Arrays;
import kotlin.Metadata;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.IntrinsicsKt;
import kotlin.coroutines.jvm.internal.Boxing;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
import kotlin.text.StringsKt;
import kotlinx.coroutines.CoroutineScope;
/* JADX INFO: Access modifiers changed from: package-private */
/* compiled from: AddEditScreen.kt */
@Metadata(d1 = {"\u0000\n\n\u0000\n\u0002\u0010\u0002\n\u0002\u0018\u0002\u0010\u0000\u001a\u00020\u0001*\u00020\u0002H\n"}, d2 = {"<anonymous>", "", "Lkotlinx/coroutines/CoroutineScope;"}, k = 3, mv = {2, 2, 0}, xi = 48)
@DebugMetadata(c = "com.hardlineforge.lala.ui.screens.AddEditScreenKt$AddEditScreen$4$1$6$1$1$1", f = "AddEditScreen.kt", i = {}, l = {185}, m = "invokeSuspend", n = {}, s = {})
/* loaded from: classes5.dex */
public final class AddEditScreenKt$AddEditScreen$4$1$6$1$1$1 extends SuspendLambda implements Function2<CoroutineScope, Continuation<? super Unit>, Object> {
    final /* synthetic */ MutableState<Double> $gpsLat$delegate;
    final /* synthetic */ MutableState<Boolean> $gpsLoading$delegate;
    final /* synthetic */ MutableState<Double> $gpsLon$delegate;
    final /* synthetic */ MutableState<String> $locationName$delegate;
    final /* synthetic */ LalaViewModel $vm;
    int label;

    /* JADX INFO: Access modifiers changed from: package-private */
    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public AddEditScreenKt$AddEditScreen$4$1$6$1$1$1(LalaViewModel lalaViewModel, MutableState<Double> mutableState, MutableState<Double> mutableState2, MutableState<String> mutableState3, MutableState<Boolean> mutableState4, Continuation<? super AddEditScreenKt$AddEditScreen$4$1$6$1$1$1> continuation) {
        super(2, continuation);
        this.$vm = lalaViewModel;
        this.$gpsLat$delegate = mutableState;
        this.$gpsLon$delegate = mutableState2;
        this.$locationName$delegate = mutableState3;
        this.$gpsLoading$delegate = mutableState4;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
        return new AddEditScreenKt$AddEditScreen$4$1$6$1$1$1(this.$vm, this.$gpsLat$delegate, this.$gpsLon$delegate, this.$locationName$delegate, this.$gpsLoading$delegate, continuation);
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(CoroutineScope coroutineScope, Continuation<? super Unit> continuation) {
        return ((AddEditScreenKt$AddEditScreen$4$1$6$1$1$1) create(coroutineScope, continuation)).invokeSuspend(Unit.INSTANCE);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object $result) {
        Object captureLocation;
        String AddEditScreen$lambda$19;
        Object coroutine_suspended = IntrinsicsKt.getCOROUTINE_SUSPENDED();
        switch (this.label) {
            case 0:
                ResultKt.throwOnFailure($result);
                this.label = 1;
                captureLocation = this.$vm.captureLocation(this);
                if (captureLocation == coroutine_suspended) {
                    return coroutine_suspended;
                }
                break;
            case 1:
                ResultKt.throwOnFailure($result);
                captureLocation = $result;
                break;
            default:
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
        }
        Location loc = (Location) captureLocation;
        if (loc != null) {
            MutableState<Double> mutableState = this.$gpsLat$delegate;
            MutableState<Double> mutableState2 = this.$gpsLon$delegate;
            MutableState<String> mutableState3 = this.$locationName$delegate;
            mutableState.setValue(Boxing.boxDouble(loc.getLatitude()));
            mutableState2.setValue(Boxing.boxDouble(loc.getLongitude()));
            AddEditScreen$lambda$19 = AddEditScreenKt.AddEditScreen$lambda$19(mutableState3);
            if (StringsKt.isBlank(AddEditScreen$lambda$19)) {
                String format = String.format("%.5f, %.5f", Arrays.copyOf(new Object[]{Boxing.boxDouble(loc.getLatitude()), Boxing.boxDouble(loc.getLongitude())}, 2));
                Intrinsics.checkNotNullExpressionValue(format, "format(...)");
                mutableState3.setValue(format);
            }
        }
        AddEditScreenKt.AddEditScreen$lambda$44(this.$gpsLoading$delegate, false);
        return Unit.INSTANCE;
    }
}
