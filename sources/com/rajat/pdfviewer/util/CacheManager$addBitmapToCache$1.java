package com.rajat.pdfviewer.util;

import com.itextpdf.layout.properties.Property;
import kotlin.Metadata;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.coroutines.jvm.internal.DebugMetadata;
/* JADX INFO: Access modifiers changed from: package-private */
/* compiled from: CacheManager.kt */
@Metadata(k = 3, mv = {2, 1, 0}, xi = 48)
@DebugMetadata(c = "com.rajat.pdfviewer.util.CacheManager", f = "CacheManager.kt", i = {}, l = {Property.COLLAPSING_MARGINS}, m = "addBitmapToCache", n = {}, s = {})
/* loaded from: classes12.dex */
public final class CacheManager$addBitmapToCache$1 extends ContinuationImpl {
    int label;
    /* synthetic */ Object result;
    final /* synthetic */ CacheManager this$0;

    /* JADX INFO: Access modifiers changed from: package-private */
    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public CacheManager$addBitmapToCache$1(CacheManager cacheManager, Continuation<? super CacheManager$addBitmapToCache$1> continuation) {
        super(continuation);
        this.this$0 = cacheManager;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.result = obj;
        this.label |= Integer.MIN_VALUE;
        return this.this$0.addBitmapToCache(0, null, this);
    }
}
