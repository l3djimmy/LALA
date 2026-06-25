package com.rajat.pdfviewer.util;

import com.itextpdf.layout.properties.Property;
import kotlin.Metadata;
import kotlin.Result;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.IntrinsicsKt;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.coroutines.jvm.internal.DebugMetadata;
/* JADX INFO: Access modifiers changed from: package-private */
/* compiled from: CacheManager.kt */
@Metadata(k = 3, mv = {2, 1, 0}, xi = 48)
@DebugMetadata(c = "com.rajat.pdfviewer.util.CacheManager", f = "CacheManager.kt", i = {}, l = {Property.TABLE_LAYOUT}, m = "writeBitmapToCache-0E7RQCE", n = {}, s = {})
/* loaded from: classes12.dex */
public final class CacheManager$writeBitmapToCache$1 extends ContinuationImpl {
    int label;
    /* synthetic */ Object result;
    final /* synthetic */ CacheManager this$0;

    /* JADX INFO: Access modifiers changed from: package-private */
    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public CacheManager$writeBitmapToCache$1(CacheManager cacheManager, Continuation<? super CacheManager$writeBitmapToCache$1> continuation) {
        super(continuation);
        this.this$0 = cacheManager;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        Object m7336writeBitmapToCache0E7RQCE;
        this.result = obj;
        this.label |= Integer.MIN_VALUE;
        m7336writeBitmapToCache0E7RQCE = this.this$0.m7336writeBitmapToCache0E7RQCE(0, null, this);
        return m7336writeBitmapToCache0E7RQCE == IntrinsicsKt.getCOROUTINE_SUSPENDED() ? m7336writeBitmapToCache0E7RQCE : Result.m7340boximpl(m7336writeBitmapToCache0E7RQCE);
    }
}
