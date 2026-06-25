package com.rajat.pdfviewer.compose;

import android.content.Context;
import androidx.compose.runtime.Composer;
import androidx.compose.runtime.MutableState;
import androidx.compose.runtime.RecomposeScopeImplKt;
import androidx.compose.ui.Modifier;
import androidx.lifecycle.LifecycleOwner;
import androidx.lifecycle.LifecycleOwnerKt;
import com.itextpdf.kernel.xmp.PdfConst;
import com.rajat.pdfviewer.HeaderData;
import com.rajat.pdfviewer.PdfRendererView;
import com.rajat.pdfviewer.util.CacheStrategy;
import com.rajat.pdfviewer.util.PdfSource;
import java.io.File;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
/* compiled from: PdfRendererCompose.kt */
@Metadata(d1 = {"\u0000T\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0007\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\u001a\u0083\u0001\u0010\u0000\u001a\u00020\u00012\u0006\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00052\b\b\u0002\u0010\u0006\u001a\u00020\u00072\b\b\u0002\u0010\b\u001a\u00020\t2\b\b\u0002\u0010\n\u001a\u00020\u000b2\b\b\u0002\u0010\f\u001a\u00020\r2\n\b\u0002\u0010\u000e\u001a\u0004\u0018\u00010\u000f2\n\b\u0002\u0010\u0010\u001a\u0004\u0018\u00010\u00112\n\b\u0002\u0010\u0012\u001a\u0004\u0018\u00010\u00132\u0016\b\u0002\u0010\u0014\u001a\u0010\u0012\u0004\u0012\u00020\u0016\u0012\u0004\u0012\u00020\u0001\u0018\u00010\u0015H\u0007¢\u0006\u0002\u0010\u0017¨\u0006\u0018²\u0006\f\u0010\u0019\u001a\u0004\u0018\u00010\u001aX\u008a\u008e\u0002²\u0006\n\u0010\u001b\u001a\u00020\u001cX\u008a\u008e\u0002"}, d2 = {"PdfRendererViewCompose", "", PdfConst.Source, "Lcom/rajat/pdfviewer/util/PdfSource;", "modifier", "Landroidx/compose/ui/Modifier;", "headers", "Lcom/rajat/pdfviewer/HeaderData;", "cacheStrategy", "Lcom/rajat/pdfviewer/util/CacheStrategy;", "maxZoomScale", "", "lifecycleOwner", "Landroidx/lifecycle/LifecycleOwner;", "jumpToPage", "", "statusCallBack", "Lcom/rajat/pdfviewer/PdfRendererView$StatusCallBack;", "zoomListener", "Lcom/rajat/pdfviewer/PdfRendererView$ZoomListener;", "onReady", "Lkotlin/Function1;", "Lcom/rajat/pdfviewer/PdfRendererView;", "(Lcom/rajat/pdfviewer/util/PdfSource;Landroidx/compose/ui/Modifier;Lcom/rajat/pdfviewer/HeaderData;Lcom/rajat/pdfviewer/util/CacheStrategy;FLandroidx/lifecycle/LifecycleOwner;Ljava/lang/Integer;Lcom/rajat/pdfviewer/PdfRendererView$StatusCallBack;Lcom/rajat/pdfviewer/PdfRendererView$ZoomListener;Lkotlin/jvm/functions/Function1;Landroidx/compose/runtime/Composer;II)V", "pdfViewer_release", "resolvedFile", "Ljava/io/File;", "hasInit", ""}, k = 2, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes12.dex */
public final class PdfRendererComposeKt {
    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit PdfRendererViewCompose$lambda$14(PdfSource pdfSource, Modifier modifier, HeaderData headerData, CacheStrategy cacheStrategy, float f, LifecycleOwner lifecycleOwner, Integer num, PdfRendererView.StatusCallBack statusCallBack, PdfRendererView.ZoomListener zoomListener, Function1 function1, int i, int i2, Composer composer, int i3) {
        PdfRendererViewCompose(pdfSource, modifier, headerData, cacheStrategy, f, lifecycleOwner, num, statusCallBack, zoomListener, function1, composer, RecomposeScopeImplKt.updateChangedFlags(i | 1), i2);
        return Unit.INSTANCE;
    }

    /* JADX WARN: Code restructure failed: missing block: B:182:0x02de, code lost:
        if (r13 == androidx.compose.runtime.Composer.Companion.getEmpty()) goto L79;
     */
    /* JADX WARN: Code restructure failed: missing block: B:199:0x0338, code lost:
        if (r13 == androidx.compose.runtime.Composer.Companion.getEmpty()) goto L91;
     */
    /* JADX WARN: Code restructure failed: missing block: B:241:0x0400, code lost:
        if (r10 == androidx.compose.runtime.Composer.Companion.getEmpty()) goto L121;
     */
    /* JADX WARN: Code restructure failed: missing block: B:262:0x046c, code lost:
        if (r2 == androidx.compose.runtime.Composer.Companion.getEmpty()) goto L136;
     */
    /* JADX WARN: Removed duplicated region for block: B:109:0x0148  */
    /* JADX WARN: Removed duplicated region for block: B:110:0x014f  */
    /* JADX WARN: Removed duplicated region for block: B:120:0x0173  */
    /* JADX WARN: Removed duplicated region for block: B:126:0x019b  */
    /* JADX WARN: Removed duplicated region for block: B:137:0x01cd  */
    /* JADX WARN: Removed duplicated region for block: B:140:0x01d6  */
    /* JADX WARN: Removed duplicated region for block: B:142:0x01e1  */
    /* JADX WARN: Removed duplicated region for block: B:143:0x01e4  */
    /* JADX WARN: Removed duplicated region for block: B:145:0x01e8  */
    /* JADX WARN: Removed duplicated region for block: B:146:0x01eb  */
    /* JADX WARN: Removed duplicated region for block: B:149:0x01f0  */
    /* JADX WARN: Removed duplicated region for block: B:150:0x0211  */
    /* JADX WARN: Removed duplicated region for block: B:152:0x0215  */
    /* JADX WARN: Removed duplicated region for block: B:154:0x0219  */
    /* JADX WARN: Removed duplicated region for block: B:155:0x021b  */
    /* JADX WARN: Removed duplicated region for block: B:157:0x021f  */
    /* JADX WARN: Removed duplicated region for block: B:158:0x0221  */
    /* JADX WARN: Removed duplicated region for block: B:160:0x0225  */
    /* JADX WARN: Removed duplicated region for block: B:161:0x022c  */
    /* JADX WARN: Removed duplicated region for block: B:164:0x023c  */
    /* JADX WARN: Removed duplicated region for block: B:165:0x0248  */
    /* JADX WARN: Removed duplicated region for block: B:168:0x028c  */
    /* JADX WARN: Removed duplicated region for block: B:169:0x02a0  */
    /* JADX WARN: Removed duplicated region for block: B:172:0x02ba  */
    /* JADX WARN: Removed duplicated region for block: B:181:0x02d6  */
    /* JADX WARN: Removed duplicated region for block: B:185:0x02e2  */
    /* JADX WARN: Removed duplicated region for block: B:189:0x030a  */
    /* JADX WARN: Removed duplicated region for block: B:198:0x0330  */
    /* JADX WARN: Removed duplicated region for block: B:202:0x033c  */
    /* JADX WARN: Removed duplicated region for block: B:206:0x0369  */
    /* JADX WARN: Removed duplicated region for block: B:215:0x0384  */
    /* JADX WARN: Removed duplicated region for block: B:219:0x0392 A[ADDED_TO_REGION] */
    /* JADX WARN: Removed duplicated region for block: B:223:0x03c1  */
    /* JADX WARN: Removed duplicated region for block: B:232:0x03da  */
    /* JADX WARN: Removed duplicated region for block: B:233:0x03dc  */
    /* JADX WARN: Removed duplicated region for block: B:236:0x03e7  */
    /* JADX WARN: Removed duplicated region for block: B:237:0x03e9  */
    /* JADX WARN: Removed duplicated region for block: B:240:0x03f8  */
    /* JADX WARN: Removed duplicated region for block: B:244:0x0404  */
    /* JADX WARN: Removed duplicated region for block: B:248:0x0439  */
    /* JADX WARN: Removed duplicated region for block: B:257:0x0452  */
    /* JADX WARN: Removed duplicated region for block: B:258:0x0454  */
    /* JADX WARN: Removed duplicated region for block: B:261:0x0464  */
    /* JADX WARN: Removed duplicated region for block: B:265:0x0470  */
    /* JADX WARN: Removed duplicated region for block: B:269:0x049a  */
    /* JADX WARN: Removed duplicated region for block: B:278:0x04b3  */
    /* JADX WARN: Removed duplicated region for block: B:279:0x04b5  */
    /* JADX WARN: Removed duplicated region for block: B:282:0x04c2  */
    /* JADX WARN: Removed duplicated region for block: B:291:0x04ea  */
    /* JADX WARN: Removed duplicated region for block: B:292:0x04ed  */
    /* JADX WARN: Removed duplicated region for block: B:295:0x0503  */
    /* JADX WARN: Removed duplicated region for block: B:299:0x0519  */
    /* JADX WARN: Removed duplicated region for block: B:303:0x0566  */
    /* JADX WARN: Removed duplicated region for block: B:307:0x057c  */
    /* JADX WARN: Removed duplicated region for block: B:309:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:98:0x0129  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void PdfRendererViewCompose(final com.rajat.pdfviewer.util.PdfSource r28, androidx.compose.ui.Modifier r29, com.rajat.pdfviewer.HeaderData r30, com.rajat.pdfviewer.util.CacheStrategy r31, float r32, androidx.lifecycle.LifecycleOwner r33, java.lang.Integer r34, com.rajat.pdfviewer.PdfRendererView.StatusCallBack r35, com.rajat.pdfviewer.PdfRendererView.ZoomListener r36, kotlin.jvm.functions.Function1<? super com.rajat.pdfviewer.PdfRendererView, kotlin.Unit> r37, androidx.compose.runtime.Composer r38, final int r39, final int r40) {
        /*
            Method dump skipped, instructions count: 1419
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.rajat.pdfviewer.compose.PdfRendererComposeKt.PdfRendererViewCompose(com.rajat.pdfviewer.util.PdfSource, androidx.compose.ui.Modifier, com.rajat.pdfviewer.HeaderData, com.rajat.pdfviewer.util.CacheStrategy, float, androidx.lifecycle.LifecycleOwner, java.lang.Integer, com.rajat.pdfviewer.PdfRendererView$StatusCallBack, com.rajat.pdfviewer.PdfRendererView$ZoomListener, kotlin.jvm.functions.Function1, androidx.compose.runtime.Composer, int, int):void");
    }

    private static final File PdfRendererViewCompose$lambda$2(MutableState<File> mutableState) {
        MutableState<File> $this$getValue$iv = mutableState;
        return $this$getValue$iv.getValue();
    }

    private static final boolean PdfRendererViewCompose$lambda$6(MutableState<Boolean> mutableState) {
        MutableState<Boolean> $this$getValue$iv = mutableState;
        return $this$getValue$iv.getValue().booleanValue();
    }

    private static final void PdfRendererViewCompose$lambda$7(MutableState<Boolean> mutableState, boolean z) {
        mutableState.setValue(Boolean.valueOf(z));
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final PdfRendererView PdfRendererViewCompose$lambda$11$lambda$10(PdfRendererComposeKt$PdfRendererViewCompose$combinedCallback$1$1 $combinedCallback, PdfRendererView.ZoomListener $zoomListener, float $maxZoomScale, MutableState $pdfViewRef, Context ctx) {
        Intrinsics.checkNotNullParameter(ctx, "ctx");
        PdfRendererView view = new PdfRendererView(ctx, null, 0, 6, null);
        view.setStatusListener($combinedCallback);
        view.setZoomListener($zoomListener);
        view.setMaxZoomScale($maxZoomScale);
        $pdfViewRef.setValue(view);
        return view;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final Unit PdfRendererViewCompose$lambda$13$lambda$12(PdfRendererComposeKt$PdfRendererViewCompose$combinedCallback$1$1 $combinedCallback, PdfRendererView.ZoomListener $zoomListener, float $maxZoomScale, PdfSource $source, HeaderData $headers, LifecycleOwner $lifecycleOwner, CacheStrategy $cacheStrategy, MutableState $hasInit$delegate, MutableState $resolvedFile$delegate, PdfRendererView view) {
        Intrinsics.checkNotNullParameter(view, "view");
        view.setStatusListener($combinedCallback);
        view.setZoomListener($zoomListener);
        view.setMaxZoomScale($maxZoomScale);
        if (!PdfRendererViewCompose$lambda$6($hasInit$delegate)) {
            if ($source instanceof PdfSource.Remote) {
                view.initWithUrl(((PdfSource.Remote) $source).getUrl(), $headers, LifecycleOwnerKt.getLifecycleScope($lifecycleOwner), $lifecycleOwner.getLifecycle(), $cacheStrategy);
                PdfRendererViewCompose$lambda$7($hasInit$delegate, true);
            } else if ($source instanceof PdfSource.LocalFile) {
                view.initWithFile(((PdfSource.LocalFile) $source).getFile(), $cacheStrategy);
                PdfRendererViewCompose$lambda$7($hasInit$delegate, true);
            } else if ($source instanceof PdfSource.LocalUri) {
                view.initWithUri(((PdfSource.LocalUri) $source).getUri());
                PdfRendererViewCompose$lambda$7($hasInit$delegate, true);
            } else if (($source instanceof PdfSource.PdfSourceFromAsset) && PdfRendererViewCompose$lambda$2($resolvedFile$delegate) != null) {
                File PdfRendererViewCompose$lambda$2 = PdfRendererViewCompose$lambda$2($resolvedFile$delegate);
                Intrinsics.checkNotNull(PdfRendererViewCompose$lambda$2);
                view.initWithFile(PdfRendererViewCompose$lambda$2, $cacheStrategy);
                PdfRendererViewCompose$lambda$7($hasInit$delegate, true);
            }
        }
        return Unit.INSTANCE;
    }
}
