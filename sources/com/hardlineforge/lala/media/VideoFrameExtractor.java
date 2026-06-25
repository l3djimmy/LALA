package com.hardlineforge.lala.media;

import android.content.Context;
import android.net.Uri;
import dagger.hilt.android.qualifiers.ApplicationContext;
import java.io.File;
import java.util.List;
import javax.inject.Inject;
import javax.inject.Singleton;
import kotlin.Metadata;
import kotlin.coroutines.Continuation;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.coroutines.BuildersKt;
import kotlinx.coroutines.Dispatchers;
/* compiled from: VideoFrameExtractor.kt */
@Singleton
@Metadata(d1 = {"\u00000\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\b\n\u0002\b\u0003\b\u0007\u0018\u00002\u00020\u0001:\u0001\u0010B\u0013\b\u0007\u0012\b\b\u0001\u0010\u0002\u001a\u00020\u0003¢\u0006\u0004\b\u0004\u0010\u0005J,\u0010\u0006\u001a\b\u0012\u0004\u0012\u00020\b0\u00072\u0006\u0010\t\u001a\u00020\n2\u0006\u0010\u000b\u001a\u00020\f2\u0006\u0010\r\u001a\u00020\u000eH\u0086@¢\u0006\u0002\u0010\u000fR\u000e\u0010\u0002\u001a\u00020\u0003X\u0082\u0004¢\u0006\u0002\n\u0000¨\u0006\u0011"}, d2 = {"Lcom/hardlineforge/lala/media/VideoFrameExtractor;", "", "context", "Landroid/content/Context;", "<init>", "(Landroid/content/Context;)V", "extractFrames", "", "Lcom/hardlineforge/lala/media/VideoFrameExtractor$FrameResult;", "videoUri", "Landroid/net/Uri;", "outputDir", "Ljava/io/File;", "fps", "", "(Landroid/net/Uri;Ljava/io/File;ILkotlin/coroutines/Continuation;)Ljava/lang/Object;", "FrameResult", "app_debug"}, k = 1, mv = {2, 2, 0}, xi = 48)
/* loaded from: classes6.dex */
public final class VideoFrameExtractor {
    public static final int $stable = 8;
    private final Context context;

    @Inject
    public VideoFrameExtractor(@ApplicationContext Context context) {
        Intrinsics.checkNotNullParameter(context, "context");
        this.context = context;
    }

    public final Object extractFrames(Uri videoUri, File outputDir, int fps, Continuation<? super List<FrameResult>> continuation) {
        return BuildersKt.withContext(Dispatchers.getIO(), new VideoFrameExtractor$extractFrames$2(this, videoUri, fps, outputDir, null), continuation);
    }

    /* compiled from: VideoFrameExtractor.kt */
    @Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u000e\n\u0002\b\f\n\u0002\u0010\u000b\n\u0002\b\u0004\b\u0087\b\u0018\u00002\u00020\u0001B\u001f\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0005\u001a\u00020\u0006¢\u0006\u0004\b\u0007\u0010\bJ\t\u0010\u000e\u001a\u00020\u0003HÆ\u0003J\t\u0010\u000f\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0010\u001a\u00020\u0006HÆ\u0003J'\u0010\u0011\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00032\b\b\u0002\u0010\u0005\u001a\u00020\u0006HÆ\u0001J\u0013\u0010\u0012\u001a\u00020\u00132\b\u0010\u0014\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u0015\u001a\u00020\u0003HÖ\u0001J\t\u0010\u0016\u001a\u00020\u0006HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\nR\u0011\u0010\u0005\u001a\u00020\u0006¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\r¨\u0006\u0017"}, d2 = {"Lcom/hardlineforge/lala/media/VideoFrameExtractor$FrameResult;", "", "frameNumber", "", "timeOffsetMs", "filePath", "", "<init>", "(IILjava/lang/String;)V", "getFrameNumber", "()I", "getTimeOffsetMs", "getFilePath", "()Ljava/lang/String;", "component1", "component2", "component3", "copy", "equals", "", "other", "hashCode", "toString", "app_debug"}, k = 1, mv = {2, 2, 0}, xi = 48)
    /* loaded from: classes6.dex */
    public static final class FrameResult {
        public static final int $stable = 0;
        private final String filePath;
        private final int frameNumber;
        private final int timeOffsetMs;

        public static /* synthetic */ FrameResult copy$default(FrameResult frameResult, int i, int i2, String str, int i3, Object obj) {
            if ((i3 & 1) != 0) {
                i = frameResult.frameNumber;
            }
            if ((i3 & 2) != 0) {
                i2 = frameResult.timeOffsetMs;
            }
            if ((i3 & 4) != 0) {
                str = frameResult.filePath;
            }
            return frameResult.copy(i, i2, str);
        }

        public final int component1() {
            return this.frameNumber;
        }

        public final int component2() {
            return this.timeOffsetMs;
        }

        public final String component3() {
            return this.filePath;
        }

        public final FrameResult copy(int i, int i2, String filePath) {
            Intrinsics.checkNotNullParameter(filePath, "filePath");
            return new FrameResult(i, i2, filePath);
        }

        public boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            if (obj instanceof FrameResult) {
                FrameResult frameResult = (FrameResult) obj;
                return this.frameNumber == frameResult.frameNumber && this.timeOffsetMs == frameResult.timeOffsetMs && Intrinsics.areEqual(this.filePath, frameResult.filePath);
            }
            return false;
        }

        public int hashCode() {
            return (((Integer.hashCode(this.frameNumber) * 31) + Integer.hashCode(this.timeOffsetMs)) * 31) + this.filePath.hashCode();
        }

        public String toString() {
            int i = this.frameNumber;
            int i2 = this.timeOffsetMs;
            return "FrameResult(frameNumber=" + i + ", timeOffsetMs=" + i2 + ", filePath=" + this.filePath + ")";
        }

        public FrameResult(int frameNumber, int timeOffsetMs, String filePath) {
            Intrinsics.checkNotNullParameter(filePath, "filePath");
            this.frameNumber = frameNumber;
            this.timeOffsetMs = timeOffsetMs;
            this.filePath = filePath;
        }

        public final int getFrameNumber() {
            return this.frameNumber;
        }

        public final int getTimeOffsetMs() {
            return this.timeOffsetMs;
        }

        public final String getFilePath() {
            return this.filePath;
        }
    }
}
