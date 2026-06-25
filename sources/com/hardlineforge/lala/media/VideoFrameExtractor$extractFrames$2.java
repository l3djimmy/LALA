package com.hardlineforge.lala.media;

import android.net.Uri;
import com.hardlineforge.lala.media.VideoFrameExtractor;
import java.io.File;
import java.util.List;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import kotlinx.coroutines.CoroutineScope;
/* JADX INFO: Access modifiers changed from: package-private */
/* compiled from: VideoFrameExtractor.kt */
@Metadata(d1 = {"\u0000\u000e\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\u0018\u0002\u0010\u0000\u001a\b\u0012\u0004\u0012\u00020\u00020\u0001*\u00020\u0003H\n"}, d2 = {"<anonymous>", "", "Lcom/hardlineforge/lala/media/VideoFrameExtractor$FrameResult;", "Lkotlinx/coroutines/CoroutineScope;"}, k = 3, mv = {2, 2, 0}, xi = 48)
@DebugMetadata(c = "com.hardlineforge.lala.media.VideoFrameExtractor$extractFrames$2", f = "VideoFrameExtractor.kt", i = {}, l = {}, m = "invokeSuspend", n = {}, s = {})
/* loaded from: classes6.dex */
public final class VideoFrameExtractor$extractFrames$2 extends SuspendLambda implements Function2<CoroutineScope, Continuation<? super List<? extends VideoFrameExtractor.FrameResult>>, Object> {
    final /* synthetic */ int $fps;
    final /* synthetic */ File $outputDir;
    final /* synthetic */ Uri $videoUri;
    int label;
    final /* synthetic */ VideoFrameExtractor this$0;

    /* JADX INFO: Access modifiers changed from: package-private */
    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public VideoFrameExtractor$extractFrames$2(VideoFrameExtractor videoFrameExtractor, Uri uri, int i, File file, Continuation<? super VideoFrameExtractor$extractFrames$2> continuation) {
        super(2, continuation);
        this.this$0 = videoFrameExtractor;
        this.$videoUri = uri;
        this.$fps = i;
        this.$outputDir = file;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
        return new VideoFrameExtractor$extractFrames$2(this.this$0, this.$videoUri, this.$fps, this.$outputDir, continuation);
    }

    @Override // kotlin.jvm.functions.Function2
    public /* bridge */ /* synthetic */ Object invoke(CoroutineScope coroutineScope, Continuation<? super List<? extends VideoFrameExtractor.FrameResult>> continuation) {
        return invoke2(coroutineScope, (Continuation<? super List<VideoFrameExtractor.FrameResult>>) continuation);
    }

    /* renamed from: invoke  reason: avoid collision after fix types in other method */
    public final Object invoke2(CoroutineScope coroutineScope, Continuation<? super List<VideoFrameExtractor.FrameResult>> continuation) {
        return ((VideoFrameExtractor$extractFrames$2) create(coroutineScope, continuation)).invokeSuspend(Unit.INSTANCE);
    }

    /* JADX WARN: Incorrect condition in loop: B:18:0x0071 */
    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object invokeSuspend(java.lang.Object r21) {
        /*
            Method dump skipped, instructions count: 272
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.hardlineforge.lala.media.VideoFrameExtractor$extractFrames$2.invokeSuspend(java.lang.Object):java.lang.Object");
    }
}
