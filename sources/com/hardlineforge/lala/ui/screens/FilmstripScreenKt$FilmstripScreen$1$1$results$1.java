package com.hardlineforge.lala.ui.screens;

import android.net.Uri;
import com.hardlineforge.lala.data.Video;
import com.hardlineforge.lala.media.VideoFrameExtractor;
import com.hardlineforge.lala.ui.viewmodel.LalaViewModel;
import java.io.File;
import java.util.List;
import kotlin.Metadata;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.IntrinsicsKt;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.coroutines.CoroutineScope;
/* compiled from: FilmstripScreen.kt */
@Metadata(d1 = {"\u0000\u000e\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\u0018\u0002\u0010\u0000\u001a\b\u0012\u0004\u0012\u00020\u00020\u0001*\u00020\u0003H\n"}, d2 = {"<anonymous>", "", "Lcom/hardlineforge/lala/media/VideoFrameExtractor$FrameResult;", "Lkotlinx/coroutines/CoroutineScope;"}, k = 3, mv = {2, 2, 0}, xi = 48)
@DebugMetadata(c = "com.hardlineforge.lala.ui.screens.FilmstripScreenKt$FilmstripScreen$1$1$results$1", f = "FilmstripScreen.kt", i = {}, l = {51}, m = "invokeSuspend", n = {}, s = {})
/* loaded from: classes5.dex */
final class FilmstripScreenKt$FilmstripScreen$1$1$results$1 extends SuspendLambda implements Function2<CoroutineScope, Continuation<? super List<? extends VideoFrameExtractor.FrameResult>>, Object> {
    final /* synthetic */ File $outDir;
    final /* synthetic */ Video $video;
    final /* synthetic */ LalaViewModel $vm;
    int label;

    /* JADX INFO: Access modifiers changed from: package-private */
    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public FilmstripScreenKt$FilmstripScreen$1$1$results$1(LalaViewModel lalaViewModel, Video video, File file, Continuation<? super FilmstripScreenKt$FilmstripScreen$1$1$results$1> continuation) {
        super(2, continuation);
        this.$vm = lalaViewModel;
        this.$video = video;
        this.$outDir = file;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
        return new FilmstripScreenKt$FilmstripScreen$1$1$results$1(this.$vm, this.$video, this.$outDir, continuation);
    }

    @Override // kotlin.jvm.functions.Function2
    public /* bridge */ /* synthetic */ Object invoke(CoroutineScope coroutineScope, Continuation<? super List<? extends VideoFrameExtractor.FrameResult>> continuation) {
        return invoke2(coroutineScope, (Continuation<? super List<VideoFrameExtractor.FrameResult>>) continuation);
    }

    /* renamed from: invoke  reason: avoid collision after fix types in other method */
    public final Object invoke2(CoroutineScope coroutineScope, Continuation<? super List<VideoFrameExtractor.FrameResult>> continuation) {
        return ((FilmstripScreenKt$FilmstripScreen$1$1$results$1) create(coroutineScope, continuation)).invokeSuspend(Unit.INSTANCE);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object $result) {
        Object coroutine_suspended = IntrinsicsKt.getCOROUTINE_SUSPENDED();
        switch (this.label) {
            case 0:
                ResultKt.throwOnFailure($result);
                VideoFrameExtractor frameExtractor = this.$vm.getFrameExtractor();
                Uri fromFile = Uri.fromFile(new File(this.$video.getUri()));
                Intrinsics.checkNotNullExpressionValue(fromFile, "fromFile(...)");
                this.label = 1;
                Object extractFrames = frameExtractor.extractFrames(fromFile, this.$outDir, 2, this);
                if (extractFrames == coroutine_suspended) {
                    return coroutine_suspended;
                }
                return extractFrames;
            case 1:
                ResultKt.throwOnFailure($result);
                return $result;
            default:
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
        }
    }
}
