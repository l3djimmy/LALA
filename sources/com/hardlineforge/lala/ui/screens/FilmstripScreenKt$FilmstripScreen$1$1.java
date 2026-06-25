package com.hardlineforge.lala.ui.screens;

import android.content.Context;
import androidx.compose.runtime.MutableState;
import com.hardlineforge.lala.data.VideoFrame;
import com.hardlineforge.lala.ui.viewmodel.LalaViewModel;
import java.util.List;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import kotlinx.coroutines.CoroutineScope;
/* JADX INFO: Access modifiers changed from: package-private */
/* compiled from: FilmstripScreen.kt */
@Metadata(d1 = {"\u0000\n\n\u0000\n\u0002\u0010\u0002\n\u0002\u0018\u0002\u0010\u0000\u001a\u00020\u0001*\u00020\u0002H\n"}, d2 = {"<anonymous>", "", "Lkotlinx/coroutines/CoroutineScope;"}, k = 3, mv = {2, 2, 0}, xi = 48)
@DebugMetadata(c = "com.hardlineforge.lala.ui.screens.FilmstripScreenKt$FilmstripScreen$1$1", f = "FilmstripScreen.kt", i = {1, 2, 2, 2, 3, 3, 3, 3}, l = {42, 46, 50, 67}, m = "invokeSuspend", n = {"existing", "existing", "video", "outDir", "existing", "video", "outDir", "results"}, s = {"L$0", "L$0", "L$1", "L$2", "L$0", "L$1", "L$2", "L$3"})
/* loaded from: classes5.dex */
public final class FilmstripScreenKt$FilmstripScreen$1$1 extends SuspendLambda implements Function2<CoroutineScope, Continuation<? super Unit>, Object> {
    final /* synthetic */ Context $context;
    final /* synthetic */ MutableState<List<VideoFrame>> $frames$delegate;
    final /* synthetic */ MutableState<Boolean> $isExtracting$delegate;
    final /* synthetic */ String $videoId;
    final /* synthetic */ LalaViewModel $vm;
    Object L$0;
    Object L$1;
    Object L$2;
    Object L$3;
    Object L$4;
    int label;

    /* JADX INFO: Access modifiers changed from: package-private */
    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public FilmstripScreenKt$FilmstripScreen$1$1(LalaViewModel lalaViewModel, String str, Context context, MutableState<List<VideoFrame>> mutableState, MutableState<Boolean> mutableState2, Continuation<? super FilmstripScreenKt$FilmstripScreen$1$1> continuation) {
        super(2, continuation);
        this.$vm = lalaViewModel;
        this.$videoId = str;
        this.$context = context;
        this.$frames$delegate = mutableState;
        this.$isExtracting$delegate = mutableState2;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
        return new FilmstripScreenKt$FilmstripScreen$1$1(this.$vm, this.$videoId, this.$context, this.$frames$delegate, this.$isExtracting$delegate, continuation);
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(CoroutineScope coroutineScope, Continuation<? super Unit> continuation) {
        return ((FilmstripScreenKt$FilmstripScreen$1$1) create(coroutineScope, continuation)).invokeSuspend(Unit.INSTANCE);
    }

    /* JADX WARN: Removed duplicated region for block: B:15:0x0074  */
    /* JADX WARN: Removed duplicated region for block: B:16:0x007b  */
    /* JADX WARN: Removed duplicated region for block: B:21:0x0096  */
    /* JADX WARN: Removed duplicated region for block: B:27:0x0104 A[LOOP:0: B:25:0x00fe->B:27:0x0104, LOOP_END] */
    /* JADX WARN: Removed duplicated region for block: B:30:0x0159 A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:31:0x015a  */
    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object invokeSuspend(java.lang.Object r23) {
        /*
            Method dump skipped, instructions count: 380
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.hardlineforge.lala.ui.screens.FilmstripScreenKt$FilmstripScreen$1$1.invokeSuspend(java.lang.Object):java.lang.Object");
    }
}
