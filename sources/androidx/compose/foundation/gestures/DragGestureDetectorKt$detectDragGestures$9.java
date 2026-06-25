package androidx.compose.foundation.gestures;

import androidx.compose.ui.geometry.Offset;
import androidx.compose.ui.input.pointer.AwaitPointerEventScope;
import androidx.compose.ui.input.pointer.PointerInputChange;
import com.itextpdf.io.codec.TIFFConstants;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.coroutines.jvm.internal.RestrictedSuspendLambda;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.functions.Function3;
import kotlin.jvm.internal.Ref;
/* JADX INFO: Access modifiers changed from: package-private */
/* compiled from: DragGestureDetector.kt */
@Metadata(d1 = {"\u0000\n\n\u0000\n\u0002\u0010\u0002\n\u0002\u0018\u0002\u0010\u0000\u001a\u00020\u0001*\u00020\u0002H\u008a@"}, d2 = {"<anonymous>", "", "Landroidx/compose/ui/input/pointer/AwaitPointerEventScope;"}, k = 3, mv = {1, 9, 0}, xi = 48)
@DebugMetadata(c = "androidx.compose.foundation.gestures.DragGestureDetectorKt$detectDragGestures$9", f = "DragGestureDetector.kt", i = {0, 1, 1, 1, 2, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3, 3, 3, 4, 4, 4, 5, 5, 5, 5, 5, 5, 6, 6, 6, 6, 6, 6, 6, 7, 7, 7, 7}, l = {245, 251, 1061, 1101, TIFFConstants.TIFFTAG_ROWSPERSTRIP, 1148, 1190, 1202}, m = "invokeSuspend", n = {"$this$awaitEachGesture", "$this$awaitEachGesture", "initialDown", "awaitTouchSlop", "$this$awaitEachGesture", "down", "$this$awaitPointerSlopOrCancellation_u2d6ksA65w_u24default$iv", "pointer$iv", "touchSlopDetector$iv", "touchSlop$iv", "$this$awaitEachGesture", "down", "$this$awaitPointerSlopOrCancellation_u2d6ksA65w_u24default$iv", "pointer$iv", "touchSlopDetector$iv", "dragEvent$iv", "touchSlop$iv", "$this$awaitEachGesture", "down", "drag", "$this$awaitEachGesture", "down", "$this$awaitPointerSlopOrCancellation_u2d6ksA65w$iv", "pointer$iv", "touchSlopDetector$iv", "touchSlop$iv", "$this$awaitEachGesture", "down", "$this$awaitPointerSlopOrCancellation_u2d6ksA65w$iv", "pointer$iv", "touchSlopDetector$iv", "dragEvent$iv", "touchSlop$iv", "$this$drag_u2dVnAYq1g$iv", "orientation$iv", "$this$awaitDragOrUp_u2djO51t88$iv$iv", "pointer$iv$iv"}, s = {"L$0", "L$0", "L$1", "Z$0", "L$0", "L$1", "L$2", "L$4", "L$5", "F$0", "L$0", "L$1", "L$2", "L$4", "L$5", "L$6", "F$0", "L$0", "L$1", "L$2", "L$0", "L$1", "L$2", "L$4", "L$5", "F$0", "L$0", "L$1", "L$2", "L$4", "L$5", "L$6", "F$0", "L$0", "L$2", "L$3", "L$4"})
/* loaded from: classes.dex */
public final class DragGestureDetectorKt$detectDragGestures$9 extends RestrictedSuspendLambda implements Function2<AwaitPointerEventScope, Continuation<? super Unit>, Object> {
    final /* synthetic */ Function2<PointerInputChange, Offset, Unit> $onDrag;
    final /* synthetic */ Function0<Unit> $onDragCancel;
    final /* synthetic */ Function1<PointerInputChange, Unit> $onDragEnd;
    final /* synthetic */ Function3<PointerInputChange, PointerInputChange, Offset, Unit> $onDragStart;
    final /* synthetic */ Orientation $orientationLock;
    final /* synthetic */ Ref.LongRef $overSlop;
    final /* synthetic */ Function0<Boolean> $shouldAwaitTouchSlop;
    float F$0;
    private /* synthetic */ Object L$0;
    Object L$1;
    Object L$2;
    Object L$3;
    Object L$4;
    Object L$5;
    Object L$6;
    boolean Z$0;
    int label;

    /* JADX INFO: Access modifiers changed from: package-private */
    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    /* JADX WARN: Multi-variable type inference failed */
    public DragGestureDetectorKt$detectDragGestures$9(Function0<Boolean> function0, Ref.LongRef longRef, Orientation orientation, Function3<? super PointerInputChange, ? super PointerInputChange, ? super Offset, Unit> function3, Function2<? super PointerInputChange, ? super Offset, Unit> function2, Function0<Unit> function02, Function1<? super PointerInputChange, Unit> function1, Continuation<? super DragGestureDetectorKt$detectDragGestures$9> continuation) {
        super(2, continuation);
        this.$shouldAwaitTouchSlop = function0;
        this.$overSlop = longRef;
        this.$orientationLock = orientation;
        this.$onDragStart = function3;
        this.$onDrag = function2;
        this.$onDragCancel = function02;
        this.$onDragEnd = function1;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
        DragGestureDetectorKt$detectDragGestures$9 dragGestureDetectorKt$detectDragGestures$9 = new DragGestureDetectorKt$detectDragGestures$9(this.$shouldAwaitTouchSlop, this.$overSlop, this.$orientationLock, this.$onDragStart, this.$onDrag, this.$onDragCancel, this.$onDragEnd, continuation);
        dragGestureDetectorKt$detectDragGestures$9.L$0 = obj;
        return dragGestureDetectorKt$detectDragGestures$9;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(AwaitPointerEventScope awaitPointerEventScope, Continuation<? super Unit> continuation) {
        return ((DragGestureDetectorKt$detectDragGestures$9) create(awaitPointerEventScope, continuation)).invokeSuspend(Unit.INSTANCE);
    }

    /* JADX WARN: Code restructure failed: missing block: B:231:0x0728, code lost:
        if (r8 == false) goto L16;
     */
    /* JADX WARN: Path cross not found for [B:156:0x052f, B:167:0x0573], limit reached: 257 */
    /* JADX WARN: Path cross not found for [B:209:0x06b2, B:220:0x06eb], limit reached: 257 */
    /* JADX WARN: Path cross not found for [B:51:0x02a0, B:62:0x02e2], limit reached: 257 */
    /* JADX WARN: Removed duplicated region for block: B:101:0x03ac A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:102:0x03ad  */
    /* JADX WARN: Removed duplicated region for block: B:105:0x03ca  */
    /* JADX WARN: Removed duplicated region for block: B:111:0x03e5  */
    /* JADX WARN: Removed duplicated region for block: B:123:0x042d  */
    /* JADX WARN: Removed duplicated region for block: B:129:0x0448  */
    /* JADX WARN: Removed duplicated region for block: B:139:0x04ba A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:140:0x04bb  */
    /* JADX WARN: Removed duplicated region for block: B:143:0x04d5  */
    /* JADX WARN: Removed duplicated region for block: B:150:0x0511  */
    /* JADX WARN: Removed duplicated region for block: B:151:0x0519  */
    /* JADX WARN: Removed duplicated region for block: B:183:0x05d3  */
    /* JADX WARN: Removed duplicated region for block: B:185:0x05da  */
    /* JADX WARN: Removed duplicated region for block: B:186:0x05dd  */
    /* JADX WARN: Removed duplicated region for block: B:188:0x05e5  */
    /* JADX WARN: Removed duplicated region for block: B:195:0x0647 A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:196:0x0648  */
    /* JADX WARN: Removed duplicated region for block: B:199:0x066a  */
    /* JADX WARN: Removed duplicated region for block: B:206:0x06a8  */
    /* JADX WARN: Removed duplicated region for block: B:207:0x06ac  */
    /* JADX WARN: Removed duplicated region for block: B:20:0x01a6  */
    /* JADX WARN: Removed duplicated region for block: B:233:0x072d  */
    /* JADX WARN: Removed duplicated region for block: B:234:0x0732  */
    /* JADX WARN: Removed duplicated region for block: B:23:0x01bf A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:242:0x0750  */
    /* JADX WARN: Removed duplicated region for block: B:243:0x0756  */
    /* JADX WARN: Removed duplicated region for block: B:248:0x0699 A[SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:24:0x01c0  */
    /* JADX WARN: Removed duplicated region for block: B:252:0x0386 A[SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:254:0x03e1 A[SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:258:0x0444 A[SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:260:0x0504 A[SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:264:0x0277 A[SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:27:0x01d5  */
    /* JADX WARN: Removed duplicated region for block: B:30:0x01f5  */
    /* JADX WARN: Removed duplicated region for block: B:31:0x01f8  */
    /* JADX WARN: Removed duplicated region for block: B:34:0x022c A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:35:0x022d  */
    /* JADX WARN: Removed duplicated region for block: B:38:0x024a  */
    /* JADX WARN: Removed duplicated region for block: B:45:0x0286  */
    /* JADX WARN: Removed duplicated region for block: B:46:0x028c  */
    /* JADX WARN: Removed duplicated region for block: B:78:0x033a  */
    /* JADX WARN: Removed duplicated region for block: B:81:0x033e  */
    /* JADX WARN: Removed duplicated region for block: B:85:0x034b  */
    /* JADX WARN: Removed duplicated region for block: B:86:0x0350  */
    /* JADX WARN: Removed duplicated region for block: B:89:0x0357 A[ADDED_TO_REGION] */
    /* JADX WARN: Removed duplicated region for block: B:92:0x0370  */
    /* JADX WARN: Removed duplicated region for block: B:98:0x038a  */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:120:0x0414 -> B:99:0x038f). Please submit an issue!!! */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:135:0x0480 -> B:184:0x05d7). Please submit an issue!!! */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:150:0x0511 -> B:184:0x05d7). Please submit an issue!!! */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:153:0x0521 -> B:184:0x05d7). Please submit an issue!!! */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:165:0x0564 -> B:184:0x05d7). Please submit an issue!!! */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:174:0x059a -> B:184:0x05d7). Please submit an issue!!! */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:176:0x05a4 -> B:137:0x049b). Please submit an issue!!! */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:180:0x05c8 -> B:181:0x05cd). Please submit an issue!!! */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:186:0x05dd -> B:87:0x0353). Please submit an issue!!! */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:196:0x0648 -> B:197:0x0651). Please submit an issue!!! */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:30:0x01f5 -> B:80:0x033c). Please submit an issue!!! */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:45:0x0286 -> B:80:0x033c). Please submit an issue!!! */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:48:0x0294 -> B:80:0x033c). Please submit an issue!!! */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:60:0x02d5 -> B:80:0x033c). Please submit an issue!!! */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:69:0x0302 -> B:80:0x033c). Please submit an issue!!! */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:71:0x0309 -> B:32:0x020d). Please submit an issue!!! */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:75:0x032f -> B:76:0x0334). Please submit an issue!!! */
    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object invokeSuspend(java.lang.Object r31) {
        /*
            Method dump skipped, instructions count: 1956
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.compose.foundation.gestures.DragGestureDetectorKt$detectDragGestures$9.invokeSuspend(java.lang.Object):java.lang.Object");
    }
}
