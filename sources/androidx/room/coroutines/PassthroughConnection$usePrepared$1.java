package androidx.room.coroutines;

import com.itextpdf.layout.properties.Property;
import kotlin.Metadata;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.coroutines.jvm.internal.DebugMetadata;
/* JADX INFO: Access modifiers changed from: package-private */
/* compiled from: PassthroughConnectionPool.kt */
@Metadata(k = 3, mv = {2, 1, 0}, xi = 48)
@DebugMetadata(c = "androidx.room.coroutines.PassthroughConnection", f = "PassthroughConnectionPool.kt", i = {0, 0}, l = {Property.COLLAPSING_MARGINS, Property.FONT_PROVIDER}, m = "usePrepared", n = {"sql", "block"}, s = {"L$0", "L$1"})
/* loaded from: classes12.dex */
public final class PassthroughConnection$usePrepared$1<R> extends ContinuationImpl {
    Object L$0;
    Object L$1;
    int label;
    /* synthetic */ Object result;
    final /* synthetic */ PassthroughConnection this$0;

    /* JADX INFO: Access modifiers changed from: package-private */
    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public PassthroughConnection$usePrepared$1(PassthroughConnection passthroughConnection, Continuation<? super PassthroughConnection$usePrepared$1> continuation) {
        super(continuation);
        this.this$0 = passthroughConnection;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.result = obj;
        this.label |= Integer.MIN_VALUE;
        return this.this$0.usePrepared(null, null, this);
    }
}
