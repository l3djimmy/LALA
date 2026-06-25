package com.rajat.pdfviewer;

import android.graphics.Bitmap;
import android.util.Size;
import com.itextpdf.layout.properties.Property;
import com.rajat.pdfviewer.PdfViewAdapter;
import com.rajat.pdfviewer.databinding.ListItemPdfPageBinding;
import kotlin.Metadata;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.IntrinsicsKt;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
import kotlinx.coroutines.BuildersKt;
import kotlinx.coroutines.CoroutineScope;
import kotlinx.coroutines.Dispatchers;
/* JADX INFO: Access modifiers changed from: package-private */
/* compiled from: PdfViewAdapter.kt */
@Metadata(d1 = {"\u0000\n\n\u0000\n\u0002\u0010\u0002\n\u0002\u0018\u0002\u0010\u0000\u001a\u00020\u0001*\u00020\u0002H\n"}, d2 = {"<anonymous>", "", "Lkotlinx/coroutines/CoroutineScope;"}, k = 3, mv = {2, 1, 0}, xi = 48)
@DebugMetadata(c = "com.rajat.pdfviewer.PdfViewAdapter$PdfPageViewHolder$bind$2", f = "PdfViewAdapter.kt", i = {}, l = {Property.BACKGROUND_IMAGE}, m = "invokeSuspend", n = {}, s = {})
/* loaded from: classes12.dex */
public final class PdfViewAdapter$PdfPageViewHolder$bind$2 extends SuspendLambda implements Function2<CoroutineScope, Continuation<? super Unit>, Object> {
    final /* synthetic */ int $displayWidth;
    final /* synthetic */ int $position;
    int label;
    final /* synthetic */ PdfViewAdapter.PdfPageViewHolder this$0;
    final /* synthetic */ PdfViewAdapter this$1;

    /* JADX INFO: Access modifiers changed from: package-private */
    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public PdfViewAdapter$PdfPageViewHolder$bind$2(PdfViewAdapter.PdfPageViewHolder pdfPageViewHolder, int i, int i2, PdfViewAdapter pdfViewAdapter, Continuation<? super PdfViewAdapter$PdfPageViewHolder$bind$2> continuation) {
        super(2, continuation);
        this.this$0 = pdfPageViewHolder;
        this.$position = i;
        this.$displayWidth = i2;
        this.this$1 = pdfViewAdapter;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
        return new PdfViewAdapter$PdfPageViewHolder$bind$2(this.this$0, this.$position, this.$displayWidth, this.this$1, continuation);
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(CoroutineScope coroutineScope, Continuation<? super Unit> continuation) {
        return ((PdfViewAdapter$PdfPageViewHolder$bind$2) create(coroutineScope, continuation)).invokeSuspend(Unit.INSTANCE);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object $result) {
        int i;
        boolean applyCachedBitmap;
        Object coroutine_suspended = IntrinsicsKt.getCOROUTINE_SUSPENDED();
        switch (this.label) {
            case 0:
                ResultKt.throwOnFailure($result);
                this.label = 1;
                Object withContext = BuildersKt.withContext(Dispatchers.getIO(), new PdfViewAdapter$PdfPageViewHolder$bind$2$cached$1(this.this$1, this.$position, null), this);
                if (withContext != coroutine_suspended) {
                    $result = withContext;
                    break;
                } else {
                    return coroutine_suspended;
                }
            case 1:
                ResultKt.throwOnFailure($result);
                break;
            default:
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
        }
        Bitmap cached = (Bitmap) $result;
        if (cached != null) {
            i = this.this$0.currentBoundPage;
            if (i == this.$position) {
                applyCachedBitmap = this.this$0.applyCachedBitmap(cached, this.$displayWidth);
                if (applyCachedBitmap) {
                    return Unit.INSTANCE;
                }
            }
        }
        PdfRendererCore pdfRendererCore = this.this$1.renderer;
        int i2 = this.$position;
        final PdfViewAdapter.PdfPageViewHolder pdfPageViewHolder = this.this$0;
        final int i3 = this.$position;
        final int i4 = this.$displayWidth;
        pdfRendererCore.getPageDimensionsAsync(i2, new Function1() { // from class: com.rajat.pdfviewer.PdfViewAdapter$PdfPageViewHolder$bind$2$$ExternalSyntheticLambda0
            @Override // kotlin.jvm.functions.Function1
            public final Object invoke(Object obj) {
                return PdfViewAdapter$PdfPageViewHolder$bind$2.invokeSuspend$lambda$0(PdfViewAdapter.PdfPageViewHolder.this, i3, i4, (Size) obj);
            }
        });
        return Unit.INSTANCE;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit invokeSuspend$lambda$0(PdfViewAdapter.PdfPageViewHolder this$0, int $position, int $displayWidth, Size size) {
        int i;
        ListItemPdfPageBinding listItemPdfPageBinding;
        i = this$0.currentBoundPage;
        if (i != $position) {
            return Unit.INSTANCE;
        }
        float aspectRatio = size.getWidth() / size.getHeight();
        int height = (int) ($displayWidth / aspectRatio);
        listItemPdfPageBinding = this$0.itemBinding;
        this$0.updateLayoutParams(listItemPdfPageBinding, height);
        this$0.renderAndApplyBitmap($position, $displayWidth, height);
        return Unit.INSTANCE;
    }
}
