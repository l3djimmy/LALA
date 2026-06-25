package com.rajat.pdfviewer.util;

import android.content.Context;
import java.io.File;
import java.io.InputStream;
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
/* compiled from: FileUtils.kt */
@Metadata(d1 = {"\u0000\n\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\u0010\u0000\u001a\u00020\u0001*\u00020\u0002H\n"}, d2 = {"<anonymous>", "Ljava/io/File;", "Lkotlinx/coroutines/CoroutineScope;"}, k = 3, mv = {2, 1, 0}, xi = 48)
@DebugMetadata(c = "com.rajat.pdfviewer.util.FileUtils$fileFromAsset$2", f = "FileUtils.kt", i = {}, l = {}, m = "invokeSuspend", n = {}, s = {})
/* loaded from: classes12.dex */
final class FileUtils$fileFromAsset$2 extends SuspendLambda implements Function2<CoroutineScope, Continuation<? super File>, Object> {
    final /* synthetic */ String $assetName;
    final /* synthetic */ Context $context;
    int label;

    /* JADX INFO: Access modifiers changed from: package-private */
    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public FileUtils$fileFromAsset$2(Context context, String str, Continuation<? super FileUtils$fileFromAsset$2> continuation) {
        super(2, continuation);
        this.$context = context;
        this.$assetName = str;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
        return new FileUtils$fileFromAsset$2(this.$context, this.$assetName, continuation);
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(CoroutineScope coroutineScope, Continuation<? super File> continuation) {
        return ((FileUtils$fileFromAsset$2) create(coroutineScope, continuation)).invokeSuspend(Unit.INSTANCE);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        File parentFile;
        IntrinsicsKt.getCOROUTINE_SUSPENDED();
        switch (this.label) {
            case 0:
                ResultKt.throwOnFailure(obj);
                File outFile = new File(this.$context.getCacheDir(), this.$assetName);
                if (StringsKt.contains$default((CharSequence) this.$assetName, (CharSequence) "/", false, 2, (Object) null) && (parentFile = outFile.getParentFile()) != null) {
                    Boxing.boxBoolean(parentFile.mkdirs());
                }
                FileUtils fileUtils = FileUtils.INSTANCE;
                InputStream open = this.$context.getAssets().open(this.$assetName);
                Intrinsics.checkNotNullExpressionValue(open, "open(...)");
                fileUtils.copy(open, outFile);
                return outFile;
            default:
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
        }
    }
}
