package com.hardlineforge.lala.ui.screens;

import androidx.compose.runtime.MutableState;
import androidx.compose.runtime.State;
import com.hardlineforge.lala.data.LogEntry;
import java.time.LocalDateTime;
import java.time.ZoneId;
import kotlin.Metadata;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.IntrinsicsKt;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import kotlinx.coroutines.CoroutineScope;
/* JADX INFO: Access modifiers changed from: package-private */
/* compiled from: AddEditScreen.kt */
@Metadata(d1 = {"\u0000\n\n\u0000\n\u0002\u0010\u0002\n\u0002\u0018\u0002\u0010\u0000\u001a\u00020\u0001*\u00020\u0002H\n"}, d2 = {"<anonymous>", "", "Lkotlinx/coroutines/CoroutineScope;"}, k = 3, mv = {2, 2, 0}, xi = 48)
@DebugMetadata(c = "com.hardlineforge.lala.ui.screens.AddEditScreenKt$AddEditScreen$2$1", f = "AddEditScreen.kt", i = {}, l = {}, m = "invokeSuspend", n = {}, s = {})
/* loaded from: classes5.dex */
public final class AddEditScreenKt$AddEditScreen$2$1 extends SuspendLambda implements Function2<CoroutineScope, Continuation<? super Unit>, Object> {
    final /* synthetic */ MutableState<String> $category$delegate;
    final /* synthetic */ MutableState<String> $comment$delegate;
    final /* synthetic */ State<LogEntry> $existing$delegate;
    final /* synthetic */ MutableState<Double> $gpsLat$delegate;
    final /* synthetic */ MutableState<Double> $gpsLon$delegate;
    final /* synthetic */ MutableState<String> $locationName$delegate;
    final /* synthetic */ MutableState<String> $tags$delegate;
    final /* synthetic */ MutableState<LocalDateTime> $timestamp$delegate;
    final /* synthetic */ MutableState<String> $timezone$delegate;
    int label;

    /* JADX INFO: Access modifiers changed from: package-private */
    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public AddEditScreenKt$AddEditScreen$2$1(State<LogEntry> state, MutableState<LocalDateTime> mutableState, MutableState<String> mutableState2, MutableState<Double> mutableState3, MutableState<Double> mutableState4, MutableState<String> mutableState5, MutableState<String> mutableState6, MutableState<String> mutableState7, MutableState<String> mutableState8, Continuation<? super AddEditScreenKt$AddEditScreen$2$1> continuation) {
        super(2, continuation);
        this.$existing$delegate = state;
        this.$timestamp$delegate = mutableState;
        this.$timezone$delegate = mutableState2;
        this.$gpsLat$delegate = mutableState3;
        this.$gpsLon$delegate = mutableState4;
        this.$category$delegate = mutableState5;
        this.$locationName$delegate = mutableState6;
        this.$comment$delegate = mutableState7;
        this.$tags$delegate = mutableState8;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
        return new AddEditScreenKt$AddEditScreen$2$1(this.$existing$delegate, this.$timestamp$delegate, this.$timezone$delegate, this.$gpsLat$delegate, this.$gpsLon$delegate, this.$category$delegate, this.$locationName$delegate, this.$comment$delegate, this.$tags$delegate, continuation);
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(CoroutineScope coroutineScope, Continuation<? super Unit> continuation) {
        return ((AddEditScreenKt$AddEditScreen$2$1) create(coroutineScope, continuation)).invokeSuspend(Unit.INSTANCE);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object $result) {
        LogEntry AddEditScreen$lambda$0;
        IntrinsicsKt.getCOROUTINE_SUSPENDED();
        switch (this.label) {
            case 0:
                ResultKt.throwOnFailure($result);
                AddEditScreen$lambda$0 = AddEditScreenKt.AddEditScreen$lambda$0(this.$existing$delegate);
                if (AddEditScreen$lambda$0 != null) {
                    MutableState<LocalDateTime> mutableState = this.$timestamp$delegate;
                    MutableState<String> mutableState2 = this.$timezone$delegate;
                    MutableState<Double> mutableState3 = this.$gpsLat$delegate;
                    MutableState<Double> mutableState4 = this.$gpsLon$delegate;
                    MutableState<String> mutableState5 = this.$category$delegate;
                    MutableState<String> mutableState6 = this.$locationName$delegate;
                    MutableState<String> mutableState7 = this.$comment$delegate;
                    MutableState<String> mutableState8 = this.$tags$delegate;
                    mutableState.setValue(AddEditScreen$lambda$0.getTimestamp().atZone(ZoneId.of(AddEditScreen$lambda$0.getTimezone())).toLocalDateTime());
                    mutableState2.setValue(AddEditScreen$lambda$0.getTimezone());
                    mutableState3.setValue(AddEditScreen$lambda$0.getGpsLat());
                    mutableState4.setValue(AddEditScreen$lambda$0.getGpsLon());
                    mutableState5.setValue(AddEditScreen$lambda$0.getCategory());
                    String locationName = AddEditScreen$lambda$0.getLocationName();
                    if (locationName == null) {
                        locationName = "";
                    }
                    mutableState6.setValue(locationName);
                    mutableState7.setValue(AddEditScreen$lambda$0.getComment());
                    mutableState8.setValue(AddEditScreen$lambda$0.getTags());
                }
                return Unit.INSTANCE;
            default:
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
        }
    }
}
