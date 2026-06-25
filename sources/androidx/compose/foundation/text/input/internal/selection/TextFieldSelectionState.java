package androidx.compose.foundation.text.input.internal.selection;

import androidx.compose.foundation.content.internal.ReceiveContentConfiguration;
import androidx.compose.foundation.gestures.TapGestureDetectorKt;
import androidx.compose.foundation.interaction.MutableInteractionSource;
import androidx.compose.foundation.interaction.PressInteraction;
import androidx.compose.foundation.text.Handle;
import androidx.compose.foundation.text.TextDragObserver;
import androidx.compose.foundation.text.TextFieldCursor_androidKt;
import androidx.compose.foundation.text.input.TextFieldCharSequence;
import androidx.compose.foundation.text.input.internal.IndexTransformationType;
import androidx.compose.foundation.text.input.internal.MathUtilsKt;
import androidx.compose.foundation.text.input.internal.SelectionWedgeAffinity;
import androidx.compose.foundation.text.input.internal.TextLayoutState;
import androidx.compose.foundation.text.input.internal.TextLayoutStateKt;
import androidx.compose.foundation.text.input.internal.TransformedTextFieldState;
import androidx.compose.foundation.text.input.internal.WedgeAffinity;
import androidx.compose.foundation.text.selection.MouseSelectionObserver;
import androidx.compose.foundation.text.selection.SelectionAdjustment;
import androidx.compose.foundation.text.selection.SelectionGesturesKt;
import androidx.compose.foundation.text.selection.SelectionLayout;
import androidx.compose.foundation.text.selection.SelectionLayoutKt;
import androidx.compose.foundation.text.selection.SelectionManagerKt;
import androidx.compose.foundation.text.selection.TextSelectionDelegateKt;
import androidx.compose.runtime.MutableState;
import androidx.compose.runtime.SnapshotStateKt;
import androidx.compose.runtime.SnapshotStateKt__SnapshotStateKt;
import androidx.compose.runtime.State;
import androidx.compose.runtime.snapshots.Snapshot;
import androidx.compose.ui.geometry.InlineClassHelperKt;
import androidx.compose.ui.geometry.Offset;
import androidx.compose.ui.geometry.Rect;
import androidx.compose.ui.geometry.RectKt;
import androidx.compose.ui.hapticfeedback.HapticFeedback;
import androidx.compose.ui.hapticfeedback.HapticFeedbackType;
import androidx.compose.ui.input.pointer.PointerInputScope;
import androidx.compose.ui.layout.LayoutCoordinates;
import androidx.compose.ui.layout.LayoutCoordinatesKt;
import androidx.compose.ui.platform.Clipboard;
import androidx.compose.ui.text.TextLayoutResult;
import androidx.compose.ui.text.TextRange;
import androidx.compose.ui.text.TextRangeKt;
import androidx.compose.ui.unit.Density;
import androidx.compose.ui.unit.LayoutDirection;
import androidx.constraintlayout.core.motion.utils.TypedValues;
import kotlin.Metadata;
import kotlin.NoWhenBranchMatchedException;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.IntrinsicsKt;
import kotlin.enums.EnumEntries;
import kotlin.enums.EnumEntriesKt;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Ref;
import kotlin.ranges.RangesKt;
import kotlinx.coroutines.CoroutineScopeKt;
import kotlinx.coroutines.flow.FlowCollector;
import kotlinx.coroutines.flow.FlowKt;
/* compiled from: TextFieldSelectionState.kt */
@Metadata(d1 = {"\u0000¼\u0001\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0018\u0002\n\u0002\b\f\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u0002\n\u0002\b\u000b\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0015\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u0018\n\u0002\u0018\u0002\n\u0002\b\b\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0018\u0002\n\u0002\b\u000b\b\u0000\u0018\u00002\u00020\u0001:\u0006\u00ad\u0001®\u0001¯\u0001B=\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0007\u0012\u0006\u0010\b\u001a\u00020\t\u0012\u0006\u0010\n\u001a\u00020\t\u0012\u0006\u0010\u000b\u001a\u00020\t\u0012\u0006\u0010\f\u001a\u00020\t¢\u0006\u0002\u0010\rJ\u0006\u0010[\u001a\u00020CJ\u0006\u0010\\\u001a\u00020\tJ\u0006\u0010]\u001a\u00020\tJ\u0006\u0010^\u001a\u00020\tJ\u000e\u0010_\u001a\u00020\tH\u0086@¢\u0006\u0002\u0010`J\u0006\u0010a\u001a\u00020\tJ\u0006\u0010b\u001a\u00020CJ\u0018\u0010c\u001a\u00020C2\b\b\u0002\u0010d\u001a\u00020\tH\u0086@¢\u0006\u0002\u0010eJ\u000e\u0010f\u001a\u00020CH\u0086@¢\u0006\u0002\u0010`J\u0006\u0010g\u001a\u00020CJ\u0006\u0010h\u001a\u00020CJ\b\u0010i\u001a\u00020jH\u0002J\u0015\u0010k\u001a\u00020l2\u0006\u0010m\u001a\u00020\tH\u0000¢\u0006\u0002\bnJ\u0006\u0010o\u001a\u00020jJ\u001d\u0010p\u001a\u00020\u00112\u0006\u0010q\u001a\u00020\tH\u0002ø\u0001\u0001ø\u0001\u0000¢\u0006\u0004\br\u0010sJ\u001d\u0010t\u001a\u00020l2\u0006\u0010q\u001a\u00020\t2\u0006\u0010m\u001a\u00020\tH\u0000¢\u0006\u0002\buJ<\u0010v\u001a\u00020w2\u0006\u0010x\u001a\u0002032\u0006\u0010y\u001a\u0002032\b\u0010z\u001a\u0004\u0018\u00010w2\u0006\u0010q\u001a\u00020\t2\u0006\u0010{\u001a\u00020|H\u0002ø\u0001\u0000¢\u0006\u0004\b}\u0010~J\b\u0010\u007f\u001a\u00020CH\u0002J\t\u0010\u0080\u0001\u001a\u00020\tH\u0002J\t\u0010\u0081\u0001\u001a\u00020CH\u0002J\u000f\u0010\u0082\u0001\u001a\u00020CH\u0086@¢\u0006\u0002\u0010`J\u000f\u0010\u0083\u0001\u001a\u00020CH\u0082@¢\u0006\u0002\u0010`J\u000f\u0010\u0084\u0001\u001a\u00020CH\u0082@¢\u0006\u0002\u0010`J\u000f\u0010\u0085\u0001\u001a\u00020CH\u0086@¢\u0006\u0002\u0010`J\u000f\u0010\u0086\u0001\u001a\u00020CH\u0082@¢\u0006\u0002\u0010`J\u001e\u0010\u0087\u0001\u001a\u00020\t2\u0007\u0010\u0088\u0001\u001a\u00020\u0011H\u0002ø\u0001\u0000¢\u0006\u0006\b\u0089\u0001\u0010\u008a\u0001J\u0007\u0010\u008b\u0001\u001a\u00020CJ@\u0010\u008c\u0001\u001a\u00020C2\u0006\u0010)\u001a\u00020*2\u0006\u0010\u000e\u001a\u00020\u000f2\u0007\u0010\u008d\u0001\u001a\u00020S2\u0006\u0010\u0006\u001a\u00020\u00072\u0006\u0010\b\u001a\u00020\t2\u0006\u0010\n\u001a\u00020\t2\u0006\u0010\f\u001a\u00020\tJ%\u0010\u008e\u0001\u001a\u00020C2\u0007\u0010\u008f\u0001\u001a\u00020\u001d2\u0007\u0010\u0090\u0001\u001a\u00020\u0011ø\u0001\u0000¢\u0006\u0006\b\u0091\u0001\u0010\u0092\u0001JZ\u0010\u0093\u0001\u001a\u00020w2\b\u0010\u0094\u0001\u001a\u00030\u0095\u00012\u0007\u0010\u0096\u0001\u001a\u0002032\u0007\u0010\u0097\u0001\u001a\u0002032\u0006\u0010q\u001a\u00020\t2\u0006\u0010{\u001a\u00020|2\t\b\u0002\u0010\u0098\u0001\u001a\u00020\t2\t\b\u0002\u0010\u0099\u0001\u001a\u00020\tH\u0002ø\u0001\u0001ø\u0001\u0000¢\u0006\u0006\b\u009a\u0001\u0010\u009b\u0001J\u000f\u0010\u009c\u0001\u001a\u00020C2\u0006\u0010U\u001a\u00020TJ\u0015\u0010\u009d\u0001\u001a\u00020C*\u00030\u009e\u0001H\u0086@¢\u0006\u0003\u0010\u009f\u0001J\u0015\u0010 \u0001\u001a\u00020C*\u00030\u009e\u0001H\u0082@¢\u0006\u0003\u0010\u009f\u0001J\u001d\u0010¡\u0001\u001a\u00020C*\u00030\u009e\u00012\u0006\u0010q\u001a\u00020\tH\u0082@¢\u0006\u0003\u0010¢\u0001J?\u0010£\u0001\u001a\u00020C*\u00030\u009e\u00012\n\u0010¤\u0001\u001a\u0005\u0018\u00010¥\u00012\r\u0010¦\u0001\u001a\b\u0012\u0004\u0012\u00020C0<2\r\u0010§\u0001\u001a\b\u0012\u0004\u0012\u00020C0<H\u0086@¢\u0006\u0003\u0010¨\u0001J\u0015\u0010©\u0001\u001a\u00020C*\u00030\u009e\u0001H\u0086@¢\u0006\u0003\u0010\u009f\u0001J\u001d\u0010ª\u0001\u001a\u00020C*\u00030\u009e\u00012\u0006\u0010q\u001a\u00020\tH\u0086@¢\u0006\u0003\u0010¢\u0001J$\u0010«\u0001\u001a\u00020C*\u00030\u009e\u00012\r\u0010¦\u0001\u001a\b\u0012\u0004\u0012\u00020C0<H\u0086@¢\u0006\u0003\u0010¬\u0001R\u0010\u0010\u000e\u001a\u0004\u0018\u00010\u000fX\u0082\u000e¢\u0006\u0002\n\u0000R\u001a\u0010\u0010\u001a\u00020\u00118BX\u0082\u0004ø\u0001\u0000ø\u0001\u0001¢\u0006\u0006\u001a\u0004\b\u0012\u0010\u0013R\u000e\u0010\u0006\u001a\u00020\u0007X\u0082\u000e¢\u0006\u0002\n\u0000R+\u0010\u0016\u001a\u00020\u00152\u0006\u0010\u0014\u001a\u00020\u00158F@FX\u0086\u008e\u0002¢\u0006\u0012\n\u0004\b\u001b\u0010\u001c\u001a\u0004\b\u0017\u0010\u0018\"\u0004\b\u0019\u0010\u001aR/\u0010\u001e\u001a\u0004\u0018\u00010\u001d2\b\u0010\u0014\u001a\u0004\u0018\u00010\u001d8F@FX\u0086\u008e\u0002¢\u0006\u0012\n\u0004\b#\u0010\u001c\u001a\u0004\b\u001f\u0010 \"\u0004\b!\u0010\"R\u0014\u0010$\u001a\u00020\t8BX\u0082\u0004¢\u0006\u0006\u001a\u0004\b%\u0010&R\u000e\u0010\b\u001a\u00020\tX\u0082\u000e¢\u0006\u0002\n\u0000R\u0017\u0010'\u001a\u00020\u00118Fø\u0001\u0000ø\u0001\u0001¢\u0006\u0006\u001a\u0004\b(\u0010\u0013R\u0010\u0010)\u001a\u0004\u0018\u00010*X\u0082\u000e¢\u0006\u0002\n\u0000R\u001a\u0010\u000b\u001a\u00020\tX\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b\u000b\u0010&\"\u0004\b+\u0010,R+\u0010-\u001a\u00020\t2\u0006\u0010\u0014\u001a\u00020\t8F@FX\u0086\u008e\u0002¢\u0006\u0012\n\u0004\b/\u0010\u001c\u001a\u0004\b-\u0010&\"\u0004\b.\u0010,R\u000e\u0010\f\u001a\u00020\tX\u0082\u000e¢\u0006\u0002\n\u0000R\u0010\u00100\u001a\u0004\u0018\u000101X\u0082\u000e¢\u0006\u0002\n\u0000R\u000e\u00102\u001a\u000203X\u0082\u000e¢\u0006\u0002\n\u0000R\u0010\u00104\u001a\u0004\u0018\u000105X\u0082\u000e¢\u0006\u0002\n\u0000R1\u00106\u001a\u00020\u00112\u0006\u0010\u0014\u001a\u00020\u00118B@BX\u0082\u008e\u0002ø\u0001\u0000ø\u0001\u0001¢\u0006\u0012\n\u0004\b:\u0010\u001c\u001a\u0004\b7\u0010\u0013\"\u0004\b8\u00109R\u000e\u0010\n\u001a\u00020\tX\u0082\u000e¢\u0006\u0002\n\u0000R$\u0010;\u001a\f\u0012\u0006\u0012\u0004\u0018\u00010=\u0018\u00010<X\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b>\u0010?\"\u0004\b@\u0010AR\"\u0010B\u001a\n\u0012\u0004\u0012\u00020C\u0018\u00010<X\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\bD\u0010?\"\u0004\bE\u0010AR+\u0010F\u001a\u00020\t2\u0006\u0010\u0014\u001a\u00020\t8B@BX\u0082\u008e\u0002¢\u0006\u0012\n\u0004\bI\u0010\u001c\u001a\u0004\bG\u0010&\"\u0004\bH\u0010,R1\u0010J\u001a\u00020\u00112\u0006\u0010\u0014\u001a\u00020\u00118B@BX\u0082\u008e\u0002ø\u0001\u0000ø\u0001\u0001¢\u0006\u0012\n\u0004\bM\u0010\u001c\u001a\u0004\bK\u0010\u0013\"\u0004\bL\u00109R\u000e\u0010\u0002\u001a\u00020\u0003X\u0082\u0004¢\u0006\u0002\n\u0000R\u0016\u0010N\u001a\u0004\u0018\u00010O8BX\u0082\u0004¢\u0006\u0006\u001a\u0004\bP\u0010QR\u000e\u0010\u0004\u001a\u00020\u0005X\u0082\u0004¢\u0006\u0002\n\u0000R\u0010\u0010R\u001a\u0004\u0018\u00010SX\u0082\u000e¢\u0006\u0002\n\u0000R+\u0010U\u001a\u00020T2\u0006\u0010\u0014\u001a\u00020T8B@BX\u0082\u008e\u0002¢\u0006\u0012\n\u0004\bZ\u0010\u001c\u001a\u0004\bV\u0010W\"\u0004\bX\u0010Y\u0082\u0002\u000b\n\u0005\b¡\u001e0\u0001\n\u0002\b!¨\u0006°\u0001"}, d2 = {"Landroidx/compose/foundation/text/input/internal/selection/TextFieldSelectionState;", "", "textFieldState", "Landroidx/compose/foundation/text/input/internal/TransformedTextFieldState;", "textLayoutState", "Landroidx/compose/foundation/text/input/internal/TextLayoutState;", "density", "Landroidx/compose/ui/unit/Density;", "enabled", "", "readOnly", "isFocused", "isPassword", "(Landroidx/compose/foundation/text/input/internal/TransformedTextFieldState;Landroidx/compose/foundation/text/input/internal/TextLayoutState;Landroidx/compose/ui/unit/Density;ZZZZ)V", "clipboard", "Landroidx/compose/ui/platform/Clipboard;", "currentTextLayoutPositionInWindow", "Landroidx/compose/ui/geometry/Offset;", "getCurrentTextLayoutPositionInWindow-F1C5BW0", "()J", "<set-?>", "Landroidx/compose/foundation/text/input/internal/selection/TextFieldSelectionState$InputType;", "directDragGestureInitiator", "getDirectDragGestureInitiator", "()Landroidx/compose/foundation/text/input/internal/selection/TextFieldSelectionState$InputType;", "setDirectDragGestureInitiator", "(Landroidx/compose/foundation/text/input/internal/selection/TextFieldSelectionState$InputType;)V", "directDragGestureInitiator$delegate", "Landroidx/compose/runtime/MutableState;", "Landroidx/compose/foundation/text/Handle;", "draggingHandle", "getDraggingHandle", "()Landroidx/compose/foundation/text/Handle;", "setDraggingHandle", "(Landroidx/compose/foundation/text/Handle;)V", "draggingHandle$delegate", "editable", "getEditable", "()Z", "handleDragPosition", "getHandleDragPosition-F1C5BW0", "hapticFeedBack", "Landroidx/compose/ui/hapticfeedback/HapticFeedback;", "setFocused", "(Z)V", "isInTouchMode", "setInTouchMode", "isInTouchMode$delegate", "pressInteraction", "Landroidx/compose/foundation/interaction/PressInteraction$Press;", "previousRawDragOffset", "", "previousSelectionLayout", "Landroidx/compose/foundation/text/selection/SelectionLayout;", "rawHandleDragPosition", "getRawHandleDragPosition-F1C5BW0", "setRawHandleDragPosition-k-4lQ0M", "(J)V", "rawHandleDragPosition$delegate", "receiveContentConfiguration", "Lkotlin/Function0;", "Landroidx/compose/foundation/content/internal/ReceiveContentConfiguration;", "getReceiveContentConfiguration", "()Lkotlin/jvm/functions/Function0;", "setReceiveContentConfiguration", "(Lkotlin/jvm/functions/Function0;)V", "requestAutofillAction", "", "getRequestAutofillAction", "setRequestAutofillAction", "showCursorHandle", "getShowCursorHandle", "setShowCursorHandle", "showCursorHandle$delegate", "startTextLayoutPositionInWindow", "getStartTextLayoutPositionInWindow-F1C5BW0", "setStartTextLayoutPositionInWindow-k-4lQ0M", "startTextLayoutPositionInWindow$delegate", "textLayoutCoordinates", "Landroidx/compose/ui/layout/LayoutCoordinates;", "getTextLayoutCoordinates", "()Landroidx/compose/ui/layout/LayoutCoordinates;", "textToolbarHandler", "Landroidx/compose/foundation/text/input/internal/selection/TextToolbarHandler;", "Landroidx/compose/foundation/text/input/internal/selection/TextToolbarState;", "textToolbarState", "getTextToolbarState", "()Landroidx/compose/foundation/text/input/internal/selection/TextToolbarState;", "setTextToolbarState", "(Landroidx/compose/foundation/text/input/internal/selection/TextToolbarState;)V", "textToolbarState$delegate", "autofill", "canAutofill", "canCopy", "canCut", "canPaste", "(Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "canSelectAll", "clearHandleDragging", "copy", "cancelSelection", "(ZLkotlin/coroutines/Continuation;)Ljava/lang/Object;", "cut", "deselect", "dispose", "getContentRect", "Landroidx/compose/ui/geometry/Rect;", "getCursorHandleState", "Landroidx/compose/foundation/text/input/internal/selection/TextFieldHandleState;", "includePosition", "getCursorHandleState$foundation_release", "getCursorRect", "getHandlePosition", "isStartHandle", "getHandlePosition-tuRUvjQ", "(Z)J", "getSelectionHandleState", "getSelectionHandleState$foundation_release", "getTextFieldSelection", "Landroidx/compose/ui/text/TextRange;", "rawStartOffset", "rawEndOffset", "previousSelection", "adjustment", "Landroidx/compose/foundation/text/selection/SelectionAdjustment;", "getTextFieldSelection-qeG_v_k", "(IILandroidx/compose/ui/text/TextRange;ZLandroidx/compose/foundation/text/selection/SelectionAdjustment;)J", "hideTextToolbar", "isCursorHandleInVisibleBounds", "markStartContentVisibleOffset", "observeChanges", "observeTextChanges", "observeTextToolbarVisibility", "paste", "pasteAsPlainText", "placeCursorAtNearestOffset", TypedValues.CycleType.S_WAVE_OFFSET, "placeCursorAtNearestOffset-k-4lQ0M", "(J)Z", "selectAll", "update", "showTextToolbar", "updateHandleDragging", "handle", "position", "updateHandleDragging-Uv8p0NA", "(Landroidx/compose/foundation/text/Handle;J)V", "updateSelection", "textFieldCharSequence", "Landroidx/compose/foundation/text/input/TextFieldCharSequence;", "startOffset", "endOffset", "allowPreviousSelectionCollapsed", "isStartOfSelection", "updateSelection-SsL-Rf8", "(Landroidx/compose/foundation/text/input/TextFieldCharSequence;IIZLandroidx/compose/foundation/text/selection/SelectionAdjustment;ZZ)J", "updateTextToolbarState", "cursorHandleGestures", "Landroidx/compose/ui/input/pointer/PointerInputScope;", "(Landroidx/compose/ui/input/pointer/PointerInputScope;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "detectCursorHandleDragGestures", "detectSelectionHandleDragGestures", "(Landroidx/compose/ui/input/pointer/PointerInputScope;ZLkotlin/coroutines/Continuation;)Ljava/lang/Object;", "detectTextFieldTapGestures", "interactionSource", "Landroidx/compose/foundation/interaction/MutableInteractionSource;", "requestFocus", "showKeyboard", "(Landroidx/compose/ui/input/pointer/PointerInputScope;Landroidx/compose/foundation/interaction/MutableInteractionSource;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function0;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "detectTouchMode", "selectionHandleGestures", "textFieldSelectionGestures", "(Landroidx/compose/ui/input/pointer/PointerInputScope;Lkotlin/jvm/functions/Function0;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "InputType", "TextFieldMouseSelectionObserver", "TextFieldTextDragObserver", "foundation_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes.dex */
public final class TextFieldSelectionState {
    public static final int $stable = 8;
    private Clipboard clipboard;
    private Density density;
    private final MutableState directDragGestureInitiator$delegate;
    private final MutableState draggingHandle$delegate;
    private boolean enabled;
    private HapticFeedback hapticFeedBack;
    private boolean isFocused;
    private final MutableState isInTouchMode$delegate;
    private boolean isPassword;
    private PressInteraction.Press pressInteraction;
    private int previousRawDragOffset;
    private SelectionLayout previousSelectionLayout;
    private final MutableState rawHandleDragPosition$delegate;
    private boolean readOnly;
    private Function0<? extends ReceiveContentConfiguration> receiveContentConfiguration;
    private Function0<Unit> requestAutofillAction;
    private final MutableState showCursorHandle$delegate;
    private final MutableState startTextLayoutPositionInWindow$delegate;
    private final TransformedTextFieldState textFieldState;
    private final TextLayoutState textLayoutState;
    private TextToolbarHandler textToolbarHandler;
    private final MutableState textToolbarState$delegate;

    /* compiled from: TextFieldSelectionState.kt */
    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0002\b\u0005\b\u0086\u0081\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00000\u0001B\u0007\b\u0002¢\u0006\u0002\u0010\u0002j\u0002\b\u0003j\u0002\b\u0004j\u0002\b\u0005¨\u0006\u0006"}, d2 = {"Landroidx/compose/foundation/text/input/internal/selection/TextFieldSelectionState$InputType;", "", "(Ljava/lang/String;I)V", "None", "Touch", "Mouse", "foundation_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
    /* loaded from: classes.dex */
    public enum InputType {
        None,
        Touch,
        Mouse;
        
        private static final /* synthetic */ EnumEntries $ENTRIES = EnumEntriesKt.enumEntries($VALUES);

        public static EnumEntries<InputType> getEntries() {
            return $ENTRIES;
        }
    }

    /* compiled from: TextFieldSelectionState.kt */
    @Metadata(k = 3, mv = {1, 9, 0}, xi = 48)
    /* loaded from: classes.dex */
    public /* synthetic */ class WhenMappings {
        public static final /* synthetic */ int[] $EnumSwitchMapping$0;

        static {
            int[] iArr = new int[IndexTransformationType.values().length];
            try {
                iArr[IndexTransformationType.Untransformed.ordinal()] = 1;
            } catch (NoSuchFieldError e) {
            }
            try {
                iArr[IndexTransformationType.Deletion.ordinal()] = 2;
            } catch (NoSuchFieldError e2) {
            }
            try {
                iArr[IndexTransformationType.Insertion.ordinal()] = 3;
            } catch (NoSuchFieldError e3) {
            }
            try {
                iArr[IndexTransformationType.Replacement.ordinal()] = 4;
            } catch (NoSuchFieldError e4) {
            }
            $EnumSwitchMapping$0 = iArr;
        }
    }

    public TextFieldSelectionState(TransformedTextFieldState textFieldState, TextLayoutState textLayoutState, Density density, boolean enabled, boolean readOnly, boolean isFocused, boolean isPassword) {
        MutableState mutableStateOf$default;
        MutableState mutableStateOf$default2;
        MutableState mutableStateOf$default3;
        MutableState mutableStateOf$default4;
        MutableState mutableStateOf$default5;
        MutableState mutableStateOf$default6;
        MutableState mutableStateOf$default7;
        this.textFieldState = textFieldState;
        this.textLayoutState = textLayoutState;
        this.density = density;
        this.enabled = enabled;
        this.readOnly = readOnly;
        this.isFocused = isFocused;
        this.isPassword = isPassword;
        mutableStateOf$default = SnapshotStateKt__SnapshotStateKt.mutableStateOf$default(true, null, 2, null);
        this.isInTouchMode$delegate = mutableStateOf$default;
        mutableStateOf$default2 = SnapshotStateKt__SnapshotStateKt.mutableStateOf$default(Offset.m4037boximpl(Offset.Companion.m4063getUnspecifiedF1C5BW0()), null, 2, null);
        this.startTextLayoutPositionInWindow$delegate = mutableStateOf$default2;
        mutableStateOf$default3 = SnapshotStateKt__SnapshotStateKt.mutableStateOf$default(Offset.m4037boximpl(Offset.Companion.m4063getUnspecifiedF1C5BW0()), null, 2, null);
        this.rawHandleDragPosition$delegate = mutableStateOf$default3;
        mutableStateOf$default4 = SnapshotStateKt__SnapshotStateKt.mutableStateOf$default(null, null, 2, null);
        this.draggingHandle$delegate = mutableStateOf$default4;
        mutableStateOf$default5 = SnapshotStateKt__SnapshotStateKt.mutableStateOf$default(InputType.None, null, 2, null);
        this.directDragGestureInitiator$delegate = mutableStateOf$default5;
        mutableStateOf$default6 = SnapshotStateKt__SnapshotStateKt.mutableStateOf$default(false, null, 2, null);
        this.showCursorHandle$delegate = mutableStateOf$default6;
        mutableStateOf$default7 = SnapshotStateKt__SnapshotStateKt.mutableStateOf$default(TextToolbarState.None, null, 2, null);
        this.textToolbarState$delegate = mutableStateOf$default7;
        this.previousRawDragOffset = -1;
    }

    public final boolean isFocused() {
        return this.isFocused;
    }

    public final void setFocused(boolean z) {
        this.isFocused = z;
    }

    public final boolean isInTouchMode() {
        State $this$getValue$iv = this.isInTouchMode$delegate;
        return ((Boolean) $this$getValue$iv.getValue()).booleanValue();
    }

    public final void setInTouchMode(boolean z) {
        MutableState $this$setValue$iv = this.isInTouchMode$delegate;
        $this$setValue$iv.setValue(Boolean.valueOf(z));
    }

    public final Function0<Unit> getRequestAutofillAction() {
        return this.requestAutofillAction;
    }

    public final void setRequestAutofillAction(Function0<Unit> function0) {
        this.requestAutofillAction = function0;
    }

    public final Function0<ReceiveContentConfiguration> getReceiveContentConfiguration() {
        return this.receiveContentConfiguration;
    }

    public final void setReceiveContentConfiguration(Function0<? extends ReceiveContentConfiguration> function0) {
        this.receiveContentConfiguration = function0;
    }

    /* renamed from: getStartTextLayoutPositionInWindow-F1C5BW0  reason: not valid java name */
    private final long m1626getStartTextLayoutPositionInWindowF1C5BW0() {
        State $this$getValue$iv = this.startTextLayoutPositionInWindow$delegate;
        return ((Offset) $this$getValue$iv.getValue()).m4058unboximpl();
    }

    /* renamed from: setStartTextLayoutPositionInWindow-k-4lQ0M  reason: not valid java name */
    private final void m1630setStartTextLayoutPositionInWindowk4lQ0M(long j) {
        MutableState $this$setValue$iv = this.startTextLayoutPositionInWindow$delegate;
        $this$setValue$iv.setValue(Offset.m4037boximpl(j));
    }

    /* renamed from: getCurrentTextLayoutPositionInWindow-F1C5BW0  reason: not valid java name */
    private final long m1623getCurrentTextLayoutPositionInWindowF1C5BW0() {
        LayoutCoordinates textLayoutCoordinates = getTextLayoutCoordinates();
        return textLayoutCoordinates != null ? LayoutCoordinatesKt.positionInWindow(textLayoutCoordinates) : Offset.Companion.m4063getUnspecifiedF1C5BW0();
    }

    /* renamed from: getRawHandleDragPosition-F1C5BW0  reason: not valid java name */
    private final long m1625getRawHandleDragPositionF1C5BW0() {
        State $this$getValue$iv = this.rawHandleDragPosition$delegate;
        return ((Offset) $this$getValue$iv.getValue()).m4058unboximpl();
    }

    /* renamed from: setRawHandleDragPosition-k-4lQ0M  reason: not valid java name */
    private final void m1629setRawHandleDragPositionk4lQ0M(long j) {
        MutableState $this$setValue$iv = this.rawHandleDragPosition$delegate;
        $this$setValue$iv.setValue(Offset.m4037boximpl(j));
    }

    /* renamed from: getHandleDragPosition-F1C5BW0  reason: not valid java name */
    public final long m1633getHandleDragPositionF1C5BW0() {
        long $this$isUnspecified$iv = m1625getRawHandleDragPositionF1C5BW0();
        if (($this$isUnspecified$iv & 9223372034707292159L) == InlineClassHelperKt.UnspecifiedPackedFloats) {
            return Offset.Companion.m4063getUnspecifiedF1C5BW0();
        }
        long $this$isUnspecified$iv2 = m1626getStartTextLayoutPositionInWindowF1C5BW0();
        if ((9223372034707292159L & $this$isUnspecified$iv2) == InlineClassHelperKt.UnspecifiedPackedFloats) {
            return TextLayoutStateKt.m1572fromDecorationToTextLayoutUv8p0NA(this.textLayoutState, m1625getRawHandleDragPositionF1C5BW0());
        }
        return Offset.m4053plusMKHz9U(m1625getRawHandleDragPositionF1C5BW0(), Offset.m4052minusMKHz9U(m1626getStartTextLayoutPositionInWindowF1C5BW0(), m1623getCurrentTextLayoutPositionInWindowF1C5BW0()));
    }

    public final Handle getDraggingHandle() {
        State $this$getValue$iv = this.draggingHandle$delegate;
        return (Handle) $this$getValue$iv.getValue();
    }

    public final void setDraggingHandle(Handle handle) {
        MutableState $this$setValue$iv = this.draggingHandle$delegate;
        $this$setValue$iv.setValue(handle);
    }

    public final InputType getDirectDragGestureInitiator() {
        State $this$getValue$iv = this.directDragGestureInitiator$delegate;
        return (InputType) $this$getValue$iv.getValue();
    }

    public final void setDirectDragGestureInitiator(InputType inputType) {
        MutableState $this$setValue$iv = this.directDragGestureInitiator$delegate;
        $this$setValue$iv.setValue(inputType);
    }

    private final boolean getShowCursorHandle() {
        State $this$getValue$iv = this.showCursorHandle$delegate;
        return ((Boolean) $this$getValue$iv.getValue()).booleanValue();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final void setShowCursorHandle(boolean z) {
        MutableState $this$setValue$iv = this.showCursorHandle$delegate;
        $this$setValue$iv.setValue(Boolean.valueOf(z));
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final TextToolbarState getTextToolbarState() {
        State $this$getValue$iv = this.textToolbarState$delegate;
        return (TextToolbarState) $this$getValue$iv.getValue();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final void setTextToolbarState(TextToolbarState textToolbarState) {
        MutableState $this$setValue$iv = this.textToolbarState$delegate;
        $this$setValue$iv.setValue(textToolbarState);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final LayoutCoordinates getTextLayoutCoordinates() {
        LayoutCoordinates it = this.textLayoutState.getTextLayoutNodeCoordinates();
        if (it == null || !it.isAttached()) {
            return null;
        }
        return it;
    }

    private final boolean getEditable() {
        return this.enabled && !this.readOnly;
    }

    /* JADX WARN: Code restructure failed: missing block: B:21:0x0045, code lost:
        if (isCursorHandleInVisibleBounds() != false) goto L19;
     */
    /* JADX WARN: Removed duplicated region for block: B:26:0x004c  */
    /* JADX WARN: Removed duplicated region for block: B:28:0x0053  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final androidx.compose.foundation.text.input.internal.selection.TextFieldHandleState getCursorHandleState$foundation_release(boolean r15) {
        /*
            r14 = this;
            androidx.compose.foundation.text.input.internal.TransformedTextFieldState r0 = r14.textFieldState
            androidx.compose.foundation.text.input.TextFieldCharSequence r0 = r0.getVisualText()
            boolean r1 = r14.getShowCursorHandle()
            androidx.compose.foundation.text.input.internal.selection.TextFieldSelectionState$InputType r2 = r14.getDirectDragGestureInitiator()
            androidx.compose.foundation.text.input.internal.selection.TextFieldSelectionState$InputType r3 = androidx.compose.foundation.text.input.internal.selection.TextFieldSelectionState.InputType.None
            r4 = 1
            r5 = 0
            if (r2 != r3) goto L16
            r2 = r4
            goto L17
        L16:
            r2 = r5
        L17:
            androidx.compose.foundation.text.Handle r3 = r14.getDraggingHandle()
            if (r1 == 0) goto L48
            if (r2 == 0) goto L48
            long r6 = r0.m1456getSelectiond9O1mEE()
            boolean r6 = androidx.compose.ui.text.TextRange.m6333getCollapsedimpl(r6)
            if (r6 == 0) goto L48
            boolean r6 = r0.shouldShowSelection()
            if (r6 == 0) goto L48
            r6 = r0
            java.lang.CharSequence r6 = (java.lang.CharSequence) r6
            int r6 = r6.length()
            if (r6 <= 0) goto L3a
            r6 = r4
            goto L3b
        L3a:
            r6 = r5
        L3b:
            if (r6 == 0) goto L48
            androidx.compose.foundation.text.Handle r6 = androidx.compose.foundation.text.Handle.Cursor
            if (r3 == r6) goto L49
            boolean r6 = r14.isCursorHandleInVisibleBounds()
            if (r6 == 0) goto L48
            goto L49
        L48:
            r4 = r5
        L49:
            if (r4 != 0) goto L53
            androidx.compose.foundation.text.input.internal.selection.TextFieldHandleState$Companion r5 = androidx.compose.foundation.text.input.internal.selection.TextFieldHandleState.Companion
            androidx.compose.foundation.text.input.internal.selection.TextFieldHandleState r5 = r5.getHidden()
            return r5
        L53:
            r10 = 0
            androidx.compose.foundation.text.input.internal.selection.TextFieldHandleState r6 = new androidx.compose.foundation.text.input.internal.selection.TextFieldHandleState
            if (r15 == 0) goto L62
            androidx.compose.ui.geometry.Rect r5 = r14.getCursorRect()
            long r7 = r5.m4075getBottomCenterF1C5BW0()
            goto L68
        L62:
            androidx.compose.ui.geometry.Offset$Companion r5 = androidx.compose.ui.geometry.Offset.Companion
            long r7 = r5.m4063getUnspecifiedF1C5BW0()
        L68:
            r8 = r7
            androidx.compose.ui.text.style.ResolvedTextDirection r11 = androidx.compose.ui.text.style.ResolvedTextDirection.Ltr
            r7 = 1
            r12 = 0
            r13 = 0
            r6.<init>(r7, r8, r10, r11, r12, r13)
            return r6
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.compose.foundation.text.input.internal.selection.TextFieldSelectionState.getCursorHandleState$foundation_release(boolean):androidx.compose.foundation.text.input.internal.selection.TextFieldHandleState");
    }

    private final boolean isCursorHandleInVisibleBounds() {
        Rect visibleBounds;
        Snapshot.Companion this_$iv = Snapshot.Companion;
        Snapshot previousSnapshot$iv = this_$iv.getCurrentThreadSnapshot();
        Function1 observer$iv = previousSnapshot$iv != null ? previousSnapshot$iv.getReadObserver() : null;
        Snapshot newSnapshot$iv = this_$iv.makeCurrentNonObservable(previousSnapshot$iv);
        try {
            long position = getCursorRect().m4075getBottomCenterF1C5BW0();
            this_$iv.restoreNonObservable(previousSnapshot$iv, newSnapshot$iv, observer$iv);
            LayoutCoordinates textLayoutCoordinates = getTextLayoutCoordinates();
            if (textLayoutCoordinates == null || (visibleBounds = SelectionManagerKt.visibleBounds(textLayoutCoordinates)) == null) {
                return false;
            }
            return SelectionManagerKt.m1752containsInclusiveUv8p0NA(visibleBounds, position);
        } catch (Throwable th) {
            this_$iv.restoreNonObservable(previousSnapshot$iv, newSnapshot$iv, observer$iv);
            throw th;
        }
    }

    public final Rect getCursorRect() {
        float cursorCenterX;
        float coercedCursorCenterX;
        TextLayoutResult layoutResult = this.textLayoutState.getLayoutResult();
        if (layoutResult == null) {
            return Rect.Companion.getZero();
        }
        TextFieldCharSequence value = this.textFieldState.getVisualText();
        if (TextRange.m6333getCollapsedimpl(value.m1456getSelectiond9O1mEE())) {
            Rect cursorRect = layoutResult.getCursorRect(TextRange.m6339getStartimpl(value.m1456getSelectiond9O1mEE()));
            Density $this$getCursorRect_u24lambda_u242 = this.density;
            float cursorWidth = RangesKt.coerceAtLeast((float) Math.floor($this$getCursorRect_u24lambda_u242.mo644toPx0680j_4(TextFieldCursor_androidKt.getDefaultCursorThickness())), 1.0f);
            if (layoutResult.getLayoutInput().getLayoutDirection() == LayoutDirection.Ltr) {
                cursorCenterX = cursorRect.getLeft() + (cursorWidth / 2.0f);
            } else {
                cursorCenterX = cursorRect.getRight() - (cursorWidth / 2.0f);
            }
            long arg0$iv = layoutResult.m6310getSizeYbymL2g();
            float it = RangesKt.coerceAtLeast(RangesKt.coerceAtMost(cursorCenterX, ((int) (arg0$iv >> 32)) - (cursorWidth / 2.0f)), cursorWidth / 2.0f);
            if (((int) cursorWidth) % 2 == 1) {
                coercedCursorCenterX = ((float) Math.floor(it)) + 0.5f;
            } else {
                coercedCursorCenterX = (float) Math.rint(it);
            }
            return new Rect(coercedCursorCenterX - (cursorWidth / 2.0f), cursorRect.getTop(), (cursorWidth / 2.0f) + coercedCursorCenterX, cursorRect.getBottom());
        }
        return Rect.Companion.getZero();
    }

    public final void update(HapticFeedback hapticFeedBack, Clipboard clipboard, TextToolbarHandler showTextToolbar, Density density, boolean enabled, boolean readOnly, boolean isPassword) {
        if (!enabled) {
            hideTextToolbar();
        }
        this.hapticFeedBack = hapticFeedBack;
        this.clipboard = clipboard;
        this.textToolbarHandler = showTextToolbar;
        this.density = density;
        this.enabled = enabled;
        this.readOnly = readOnly;
        this.isPassword = isPassword;
    }

    public final Object cursorHandleGestures(PointerInputScope $this$cursorHandleGestures, Continuation<? super Unit> continuation) {
        Object coroutineScope = CoroutineScopeKt.coroutineScope(new TextFieldSelectionState$cursorHandleGestures$2(this, $this$cursorHandleGestures, null), continuation);
        return coroutineScope == IntrinsicsKt.getCOROUTINE_SUSPENDED() ? coroutineScope : Unit.INSTANCE;
    }

    public final Object selectionHandleGestures(PointerInputScope $this$selectionHandleGestures, boolean isStartHandle, Continuation<? super Unit> continuation) {
        Object coroutineScope = CoroutineScopeKt.coroutineScope(new TextFieldSelectionState$selectionHandleGestures$2(this, $this$selectionHandleGestures, isStartHandle, null), continuation);
        return coroutineScope == IntrinsicsKt.getCOROUTINE_SUSPENDED() ? coroutineScope : Unit.INSTANCE;
    }

    /* JADX WARN: Removed duplicated region for block: B:10:0x0025  */
    /* JADX WARN: Removed duplicated region for block: B:12:0x002e  */
    /* JADX WARN: Removed duplicated region for block: B:17:0x0038  */
    /* JADX WARN: Removed duplicated region for block: B:24:0x005d  */
    /* JADX WARN: Removed duplicated region for block: B:31:0x0073  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object observeChanges(kotlin.coroutines.Continuation<? super kotlin.Unit> r9) {
        /*
            r8 = this;
            boolean r0 = r9 instanceof androidx.compose.foundation.text.input.internal.selection.TextFieldSelectionState$observeChanges$1
            if (r0 == 0) goto L14
            r0 = r9
            androidx.compose.foundation.text.input.internal.selection.TextFieldSelectionState$observeChanges$1 r0 = (androidx.compose.foundation.text.input.internal.selection.TextFieldSelectionState$observeChanges$1) r0
            int r1 = r0.label
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r1 = r1 & r2
            if (r1 == 0) goto L14
            int r1 = r0.label
            int r1 = r1 - r2
            r0.label = r1
            goto L19
        L14:
            androidx.compose.foundation.text.input.internal.selection.TextFieldSelectionState$observeChanges$1 r0 = new androidx.compose.foundation.text.input.internal.selection.TextFieldSelectionState$observeChanges$1
            r0.<init>(r8, r9)
        L19:
            java.lang.Object r1 = r0.result
            java.lang.Object r2 = kotlin.coroutines.intrinsics.IntrinsicsKt.getCOROUTINE_SUSPENDED()
            int r3 = r0.label
            r4 = 0
            switch(r3) {
                case 0: goto L38;
                case 1: goto L2e;
                default: goto L25;
            }
        L25:
            java.lang.IllegalStateException r0 = new java.lang.IllegalStateException
            java.lang.String r1 = "call to 'resume' before 'invoke' with coroutine"
            r0.<init>(r1)
            throw r0
        L2e:
            java.lang.Object r2 = r0.L$0
            androidx.compose.foundation.text.input.internal.selection.TextFieldSelectionState r2 = (androidx.compose.foundation.text.input.internal.selection.TextFieldSelectionState) r2
            kotlin.ResultKt.throwOnFailure(r1)     // Catch: java.lang.Throwable -> L36
            goto L52
        L36:
            r3 = move-exception
            goto L68
        L38:
            kotlin.ResultKt.throwOnFailure(r1)
            r3 = r8
            androidx.compose.foundation.text.input.internal.selection.TextFieldSelectionState$observeChanges$2 r5 = new androidx.compose.foundation.text.input.internal.selection.TextFieldSelectionState$observeChanges$2     // Catch: java.lang.Throwable -> L64
            r6 = 0
            r5.<init>(r3, r6)     // Catch: java.lang.Throwable -> L64
            kotlin.jvm.functions.Function2 r5 = (kotlin.jvm.functions.Function2) r5     // Catch: java.lang.Throwable -> L64
            r0.L$0 = r3     // Catch: java.lang.Throwable -> L64
            r6 = 1
            r0.label = r6     // Catch: java.lang.Throwable -> L64
            java.lang.Object r5 = kotlinx.coroutines.CoroutineScopeKt.coroutineScope(r5, r0)     // Catch: java.lang.Throwable -> L64
            if (r5 != r2) goto L51
            return r2
        L51:
            r2 = r3
        L52:
            r2.setShowCursorHandle(r4)
            androidx.compose.foundation.text.input.internal.selection.TextToolbarState r3 = r2.getTextToolbarState()
            androidx.compose.foundation.text.input.internal.selection.TextToolbarState r4 = androidx.compose.foundation.text.input.internal.selection.TextToolbarState.None
            if (r3 == r4) goto L60
            r2.hideTextToolbar()
        L60:
            kotlin.Unit r2 = kotlin.Unit.INSTANCE
            return r2
        L64:
            r2 = move-exception
            r7 = r3
            r3 = r2
            r2 = r7
        L68:
            r2.setShowCursorHandle(r4)
            androidx.compose.foundation.text.input.internal.selection.TextToolbarState r4 = r2.getTextToolbarState()
            androidx.compose.foundation.text.input.internal.selection.TextToolbarState r5 = androidx.compose.foundation.text.input.internal.selection.TextToolbarState.None
            if (r4 == r5) goto L76
            r2.hideTextToolbar()
        L76:
            throw r3
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.compose.foundation.text.input.internal.selection.TextFieldSelectionState.observeChanges(kotlin.coroutines.Continuation):java.lang.Object");
    }

    public final void updateTextToolbarState(TextToolbarState textToolbarState) {
        setTextToolbarState(textToolbarState);
    }

    public final void dispose() {
        hideTextToolbar();
        this.clipboard = null;
        this.hapticFeedBack = null;
    }

    public final Object detectTouchMode(PointerInputScope $this$detectTouchMode, Continuation<? super Unit> continuation) {
        Object awaitPointerEventScope = $this$detectTouchMode.awaitPointerEventScope(new TextFieldSelectionState$detectTouchMode$2(this, null), continuation);
        return awaitPointerEventScope == IntrinsicsKt.getCOROUTINE_SUSPENDED() ? awaitPointerEventScope : Unit.INSTANCE;
    }

    public final Object detectTextFieldTapGestures(PointerInputScope $this$detectTextFieldTapGestures, MutableInteractionSource interactionSource, final Function0<Unit> function0, final Function0<Unit> function02, Continuation<? super Unit> continuation) {
        Object detectTapAndPress = TapGestureDetectorKt.detectTapAndPress($this$detectTextFieldTapGestures, new TextFieldSelectionState$detectTextFieldTapGestures$2(interactionSource, this, null), new Function1<Offset, Unit>() { // from class: androidx.compose.foundation.text.input.internal.selection.TextFieldSelectionState$detectTextFieldTapGestures$3
            /* JADX INFO: Access modifiers changed from: package-private */
            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            {
                super(1);
            }

            @Override // kotlin.jvm.functions.Function1
            public /* bridge */ /* synthetic */ Unit invoke(Offset offset) {
                m1646invokek4lQ0M(offset.m4058unboximpl());
                return Unit.INSTANCE;
            }

            /* renamed from: invoke-k-4lQ0M  reason: not valid java name */
            public final void m1646invokek4lQ0M(long offset) {
                boolean z;
                TextFieldSelectionStateKt.logDebug(new Function0<String>() { // from class: androidx.compose.foundation.text.input.internal.selection.TextFieldSelectionState$detectTextFieldTapGestures$3.1
                    @Override // kotlin.jvm.functions.Function0
                    public final String invoke() {
                        return "onTapTextField";
                    }
                });
                function0.invoke();
                if (this.enabled && this.isFocused()) {
                    z = this.readOnly;
                    if (!z) {
                        function02.invoke();
                        if (this.textFieldState.getVisualText().length() > 0) {
                            this.setShowCursorHandle(true);
                        }
                    }
                    this.updateTextToolbarState(TextToolbarState.None);
                    long coercedOffset = this.textLayoutState.m1565coercedInVisibleBoundsOfInputTextMKHz9U$foundation_release(offset);
                    this.m1628placeCursorAtNearestOffsetk4lQ0M(TextLayoutStateKt.m1572fromDecorationToTextLayoutUv8p0NA(this.textLayoutState, coercedOffset));
                }
            }
        }, continuation);
        return detectTapAndPress == IntrinsicsKt.getCOROUTINE_SUSPENDED() ? detectTapAndPress : Unit.INSTANCE;
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* renamed from: placeCursorAtNearestOffset-k-4lQ0M  reason: not valid java name */
    public final boolean m1628placeCursorAtNearestOffsetk4lQ0M(long offset) {
        int index;
        IndexTransformationType type$iv;
        boolean z;
        int untransformedCursor;
        SelectionWedgeAffinity selectionWedgeAffinity;
        TextLayoutResult layoutResult = this.textLayoutState.getLayoutResult();
        if (layoutResult == null || (index = layoutResult.m6309getOffsetForPositionk4lQ0M(offset)) == -1) {
            return false;
        }
        SelectionWedgeAffinity selectionWedgeAffinity2 = null;
        TransformedTextFieldState $this$getIndexTransformationType$iv = this.textFieldState;
        long untransformed$iv = $this$getIndexTransformationType$iv.m1579mapFromTransformedjx7JFs(index);
        long retransformed$iv = $this$getIndexTransformationType$iv.m1582mapToTransformedGEjPoXI(untransformed$iv);
        if (TextRange.m6333getCollapsedimpl(untransformed$iv) && TextRange.m6333getCollapsedimpl(retransformed$iv)) {
            type$iv = IndexTransformationType.Untransformed;
        } else if (!TextRange.m6333getCollapsedimpl(untransformed$iv) && !TextRange.m6333getCollapsedimpl(retransformed$iv)) {
            type$iv = IndexTransformationType.Replacement;
        } else if (TextRange.m6333getCollapsedimpl(untransformed$iv) && !TextRange.m6333getCollapsedimpl(retransformed$iv)) {
            type$iv = IndexTransformationType.Insertion;
        } else {
            type$iv = IndexTransformationType.Deletion;
        }
        IndexTransformationType type = type$iv;
        switch (WhenMappings.$EnumSwitchMapping$0[type.ordinal()]) {
            case 1:
                z = false;
                untransformedCursor = TextRange.m6339getStartimpl(untransformed$iv);
                break;
            case 2:
                z = false;
                untransformedCursor = TextRange.m6339getStartimpl(untransformed$iv);
                break;
            case 3:
                z = false;
                Rect wedgeStartCursorRect = layoutResult.getCursorRect(TextRange.m6339getStartimpl(retransformed$iv));
                Rect wedgeEndCursorRect = layoutResult.getCursorRect(TextRange.m6334getEndimpl(retransformed$iv));
                if (MathUtilsKt.m1526findClosestRect9KIMszo(offset, wedgeStartCursorRect, wedgeEndCursorRect) < 0) {
                    selectionWedgeAffinity = new SelectionWedgeAffinity(WedgeAffinity.Start);
                } else {
                    selectionWedgeAffinity = new SelectionWedgeAffinity(WedgeAffinity.End);
                }
                selectionWedgeAffinity2 = selectionWedgeAffinity;
                untransformedCursor = TextRange.m6339getStartimpl(untransformed$iv);
                break;
            case 4:
                z = false;
                Rect wedgeStartCursorRect2 = layoutResult.getCursorRect(TextRange.m6339getStartimpl(retransformed$iv));
                Rect wedgeEndCursorRect2 = layoutResult.getCursorRect(TextRange.m6334getEndimpl(retransformed$iv));
                if (MathUtilsKt.m1526findClosestRect9KIMszo(offset, wedgeStartCursorRect2, wedgeEndCursorRect2) < 0) {
                    untransformedCursor = TextRange.m6339getStartimpl(untransformed$iv);
                    break;
                } else {
                    untransformedCursor = TextRange.m6334getEndimpl(untransformed$iv);
                    break;
                }
            default:
                throw new NoWhenBranchMatchedException();
        }
        long untransformedCursorRange = TextRangeKt.TextRange(untransformedCursor);
        if (TextRange.m6332equalsimpl0(untransformedCursorRange, this.textFieldState.getUntransformedText().m1456getSelectiond9O1mEE()) && (selectionWedgeAffinity2 == null || Intrinsics.areEqual(selectionWedgeAffinity2, this.textFieldState.getSelectionWedgeAffinity()))) {
            return z;
        }
        this.textFieldState.m1585selectUntransformedCharsIn5zctL8(untransformedCursorRange);
        if (selectionWedgeAffinity2 != null) {
            SelectionWedgeAffinity it = selectionWedgeAffinity2;
            this.textFieldState.setSelectionWedgeAffinity(it);
            return true;
        }
        return true;
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* JADX WARN: Removed duplicated region for block: B:10:0x0025  */
    /* JADX WARN: Removed duplicated region for block: B:12:0x002e  */
    /* JADX WARN: Removed duplicated region for block: B:17:0x0042  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object detectCursorHandleDragGestures(androidx.compose.ui.input.pointer.PointerInputScope r12, kotlin.coroutines.Continuation<? super kotlin.Unit> r13) {
        /*
            r11 = this;
            boolean r0 = r13 instanceof androidx.compose.foundation.text.input.internal.selection.TextFieldSelectionState$detectCursorHandleDragGestures$1
            if (r0 == 0) goto L14
            r0 = r13
            androidx.compose.foundation.text.input.internal.selection.TextFieldSelectionState$detectCursorHandleDragGestures$1 r0 = (androidx.compose.foundation.text.input.internal.selection.TextFieldSelectionState$detectCursorHandleDragGestures$1) r0
            int r1 = r0.label
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r1 = r1 & r2
            if (r1 == 0) goto L14
            int r1 = r0.label
            int r1 = r1 - r2
            r0.label = r1
            goto L19
        L14:
            androidx.compose.foundation.text.input.internal.selection.TextFieldSelectionState$detectCursorHandleDragGestures$1 r0 = new androidx.compose.foundation.text.input.internal.selection.TextFieldSelectionState$detectCursorHandleDragGestures$1
            r0.<init>(r11, r13)
        L19:
            r6 = r0
            java.lang.Object r7 = r6.result
            java.lang.Object r0 = kotlin.coroutines.intrinsics.IntrinsicsKt.getCOROUTINE_SUSPENDED()
            int r1 = r6.label
            switch(r1) {
                case 0: goto L42;
                case 1: goto L2e;
                default: goto L25;
            }
        L25:
            java.lang.IllegalStateException r12 = new java.lang.IllegalStateException
            java.lang.String r0 = "call to 'resume' before 'invoke' with coroutine"
            r12.<init>(r0)
            throw r12
        L2e:
            java.lang.Object r12 = r6.L$2
            kotlin.jvm.internal.Ref$LongRef r12 = (kotlin.jvm.internal.Ref.LongRef) r12
            java.lang.Object r0 = r6.L$1
            r1 = r0
            kotlin.jvm.internal.Ref$LongRef r1 = (kotlin.jvm.internal.Ref.LongRef) r1
            java.lang.Object r0 = r6.L$0
            r2 = r0
            androidx.compose.foundation.text.input.internal.selection.TextFieldSelectionState r2 = (androidx.compose.foundation.text.input.internal.selection.TextFieldSelectionState) r2
            kotlin.ResultKt.throwOnFailure(r7)     // Catch: java.lang.Throwable -> L40
            goto L92
        L40:
            r0 = move-exception
            goto L9d
        L42:
            kotlin.ResultKt.throwOnFailure(r7)
            r8 = r11
            r1 = r12
            kotlin.jvm.internal.Ref$LongRef r12 = new kotlin.jvm.internal.Ref$LongRef
            r12.<init>()
            androidx.compose.ui.geometry.Offset$Companion r2 = androidx.compose.ui.geometry.Offset.Companion
            long r2 = r2.m4063getUnspecifiedF1C5BW0()
            r12.element = r2
            kotlin.jvm.internal.Ref$LongRef r2 = new kotlin.jvm.internal.Ref$LongRef
            r2.<init>()
            r9 = r2
            androidx.compose.ui.geometry.Offset$Companion r2 = androidx.compose.ui.geometry.Offset.Companion
            long r2 = r2.m4063getUnspecifiedF1C5BW0()
            r9.element = r2
            androidx.compose.foundation.text.input.internal.selection.TextFieldSelectionState$detectCursorHandleDragGestures$2 r2 = new androidx.compose.foundation.text.input.internal.selection.TextFieldSelectionState$detectCursorHandleDragGestures$2     // Catch: java.lang.Throwable -> L99
            r2.<init>()     // Catch: java.lang.Throwable -> L99
            kotlin.jvm.functions.Function1 r2 = (kotlin.jvm.functions.Function1) r2     // Catch: java.lang.Throwable -> L99
            androidx.compose.foundation.text.input.internal.selection.TextFieldSelectionState$detectCursorHandleDragGestures$3 r3 = new androidx.compose.foundation.text.input.internal.selection.TextFieldSelectionState$detectCursorHandleDragGestures$3     // Catch: java.lang.Throwable -> L99
            r3.<init>()     // Catch: java.lang.Throwable -> L99
            kotlin.jvm.functions.Function0 r3 = (kotlin.jvm.functions.Function0) r3     // Catch: java.lang.Throwable -> L99
            androidx.compose.foundation.text.input.internal.selection.TextFieldSelectionState$detectCursorHandleDragGestures$4 r4 = new androidx.compose.foundation.text.input.internal.selection.TextFieldSelectionState$detectCursorHandleDragGestures$4     // Catch: java.lang.Throwable -> L99
            r4.<init>()     // Catch: java.lang.Throwable -> L99
            kotlin.jvm.functions.Function0 r4 = (kotlin.jvm.functions.Function0) r4     // Catch: java.lang.Throwable -> L99
            androidx.compose.foundation.text.input.internal.selection.TextFieldSelectionState$detectCursorHandleDragGestures$5 r5 = new androidx.compose.foundation.text.input.internal.selection.TextFieldSelectionState$detectCursorHandleDragGestures$5     // Catch: java.lang.Throwable -> L99
            r5.<init>()     // Catch: java.lang.Throwable -> L99
            kotlin.jvm.functions.Function2 r5 = (kotlin.jvm.functions.Function2) r5     // Catch: java.lang.Throwable -> L99
            r6.L$0 = r8     // Catch: java.lang.Throwable -> L99
            r6.L$1 = r12     // Catch: java.lang.Throwable -> L99
            r6.L$2 = r9     // Catch: java.lang.Throwable -> L99
            r10 = 1
            r6.label = r10     // Catch: java.lang.Throwable -> L99
            java.lang.Object r2 = androidx.compose.foundation.gestures.DragGestureDetectorKt.detectDragGestures(r1, r2, r3, r4, r5, r6)     // Catch: java.lang.Throwable -> L99
            if (r2 != r0) goto L8f
            return r0
        L8f:
            r1 = r12
            r2 = r8
            r12 = r9
        L92:
            detectCursorHandleDragGestures$onDragStop(r1, r12, r2)
            kotlin.Unit r0 = kotlin.Unit.INSTANCE
            return r0
        L99:
            r0 = move-exception
            r1 = r12
            r2 = r8
            r12 = r9
        L9d:
            detectCursorHandleDragGestures$onDragStop(r1, r12, r2)
            throw r0
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.compose.foundation.text.input.internal.selection.TextFieldSelectionState.detectCursorHandleDragGestures(androidx.compose.ui.input.pointer.PointerInputScope, kotlin.coroutines.Continuation):java.lang.Object");
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final void detectCursorHandleDragGestures$onDragStop(Ref.LongRef cursorDragStart, Ref.LongRef cursorDragDelta, TextFieldSelectionState this$0) {
        long $this$isSpecified$iv = cursorDragStart.element;
        if ((9223372034707292159L & $this$isSpecified$iv) != InlineClassHelperKt.UnspecifiedPackedFloats) {
            cursorDragStart.element = Offset.Companion.m4063getUnspecifiedF1C5BW0();
            cursorDragDelta.element = Offset.Companion.m4063getUnspecifiedF1C5BW0();
            this$0.clearHandleDragging();
        }
    }

    public final Object textFieldSelectionGestures(PointerInputScope $this$textFieldSelectionGestures, Function0<Unit> function0, Continuation<? super Unit> continuation) {
        Object selectionGesturePointerInputBtf2 = SelectionGesturesKt.selectionGesturePointerInputBtf2($this$textFieldSelectionGestures, new TextFieldMouseSelectionObserver(function0), new TextFieldTextDragObserver(function0), continuation);
        return selectionGesturePointerInputBtf2 == IntrinsicsKt.getCOROUTINE_SUSPENDED() ? selectionGesturePointerInputBtf2 : Unit.INSTANCE;
    }

    /* compiled from: TextFieldSelectionState.kt */
    @Metadata(d1 = {"\u0000<\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\b\u0002\n\u0002\u0010\b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\f\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0082\u0004\u0018\u00002\u00020\u0001B\u0013\u0012\f\u0010\u0002\u001a\b\u0012\u0004\u0012\u00020\u00040\u0003¢\u0006\u0002\u0010\u0005J\"\u0010\u000b\u001a\u00020\f2\u0006\u0010\r\u001a\u00020\t2\u0006\u0010\u000e\u001a\u00020\u000fH\u0016ø\u0001\u0000¢\u0006\u0004\b\u0010\u0010\u0011J\b\u0010\u0012\u001a\u00020\u0004H\u0016J\u001a\u0010\u0013\u001a\u00020\f2\u0006\u0010\u0014\u001a\u00020\tH\u0016ø\u0001\u0000¢\u0006\u0004\b\u0015\u0010\u0016J\u001a\u0010\u0017\u001a\u00020\f2\u0006\u0010\r\u001a\u00020\tH\u0016ø\u0001\u0000¢\u0006\u0004\b\u0018\u0010\u0016J\"\u0010\u0019\u001a\u00020\f2\u0006\u0010\u0014\u001a\u00020\t2\u0006\u0010\u000e\u001a\u00020\u000fH\u0016ø\u0001\u0000¢\u0006\u0004\b\u001a\u0010\u0011J*\u0010\u001b\u001a\u00020\u001c2\u0006\u0010\r\u001a\u00020\t2\u0006\u0010\u000e\u001a\u00020\u000f2\u0006\u0010\u001d\u001a\u00020\fH\u0002ø\u0001\u0000¢\u0006\u0004\b\u001e\u0010\u001fR\u000e\u0010\u0006\u001a\u00020\u0007X\u0082\u000e¢\u0006\u0002\n\u0000R\u0016\u0010\b\u001a\u00020\tX\u0082\u000eø\u0001\u0000ø\u0001\u0001¢\u0006\u0004\n\u0002\u0010\nR\u0014\u0010\u0002\u001a\b\u0012\u0004\u0012\u00020\u00040\u0003X\u0082\u0004¢\u0006\u0002\n\u0000\u0082\u0002\u000b\n\u0005\b¡\u001e0\u0001\n\u0002\b!¨\u0006 "}, d2 = {"Landroidx/compose/foundation/text/input/internal/selection/TextFieldSelectionState$TextFieldMouseSelectionObserver;", "Landroidx/compose/foundation/text/selection/MouseSelectionObserver;", "requestFocus", "Lkotlin/Function0;", "", "(Landroidx/compose/foundation/text/input/internal/selection/TextFieldSelectionState;Lkotlin/jvm/functions/Function0;)V", "dragBeginOffsetInText", "", "dragBeginPosition", "Landroidx/compose/ui/geometry/Offset;", "J", "onDrag", "", "dragPosition", "adjustment", "Landroidx/compose/foundation/text/selection/SelectionAdjustment;", "onDrag-3MmeM6k", "(JLandroidx/compose/foundation/text/selection/SelectionAdjustment;)Z", "onDragDone", "onExtend", "downPosition", "onExtend-k-4lQ0M", "(J)Z", "onExtendDrag", "onExtendDrag-k-4lQ0M", "onStart", "onStart-3MmeM6k", "updateSelection", "Landroidx/compose/ui/text/TextRange;", "isStartOfSelection", "updateSelection-r1Wruf4", "(JLandroidx/compose/foundation/text/selection/SelectionAdjustment;Z)J", "foundation_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
    /* loaded from: classes.dex */
    private final class TextFieldMouseSelectionObserver implements MouseSelectionObserver {
        private int dragBeginOffsetInText = -1;
        private long dragBeginPosition = Offset.Companion.m4063getUnspecifiedF1C5BW0();
        private final Function0<Unit> requestFocus;

        public TextFieldMouseSelectionObserver(Function0<Unit> function0) {
            this.requestFocus = function0;
        }

        @Override // androidx.compose.foundation.text.selection.MouseSelectionObserver
        /* renamed from: onStart-3MmeM6k  reason: not valid java name */
        public boolean mo1639onStart3MmeM6k(long downPosition, SelectionAdjustment adjustment) {
            if (TextFieldSelectionState.this.enabled) {
                if (!(TextFieldSelectionState.this.textFieldState.getVisualText().length() == 0)) {
                    TextFieldSelectionStateKt.logDebug(new Function0<String>() { // from class: androidx.compose.foundation.text.input.internal.selection.TextFieldSelectionState$TextFieldMouseSelectionObserver$onStart$1
                        @Override // kotlin.jvm.functions.Function0
                        public final String invoke() {
                            return "Mouse.onStart";
                        }
                    });
                    TextFieldSelectionState.this.setDirectDragGestureInitiator(InputType.Mouse);
                    this.requestFocus.invoke();
                    TextFieldSelectionState.this.previousRawDragOffset = -1;
                    this.dragBeginOffsetInText = -1;
                    this.dragBeginPosition = downPosition;
                    long newSelection = m1635updateSelectionr1Wruf4(downPosition, adjustment, true);
                    this.dragBeginOffsetInText = TextRange.m6339getStartimpl(newSelection);
                    return true;
                }
            }
            return false;
        }

        @Override // androidx.compose.foundation.text.selection.MouseSelectionObserver
        /* renamed from: onDrag-3MmeM6k  reason: not valid java name */
        public boolean mo1636onDrag3MmeM6k(final long dragPosition, SelectionAdjustment adjustment) {
            if (TextFieldSelectionState.this.enabled) {
                if (!(TextFieldSelectionState.this.textFieldState.getVisualText().length() == 0)) {
                    TextFieldSelectionStateKt.logDebug(new Function0<String>() { // from class: androidx.compose.foundation.text.input.internal.selection.TextFieldSelectionState$TextFieldMouseSelectionObserver$onDrag$1
                        /* JADX INFO: Access modifiers changed from: package-private */
                        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                        {
                            super(0);
                        }

                        @Override // kotlin.jvm.functions.Function0
                        public final String invoke() {
                            return "Mouse.onDrag " + ((Object) Offset.m4056toStringimpl(dragPosition));
                        }
                    });
                    m1635updateSelectionr1Wruf4(dragPosition, adjustment, false);
                    return true;
                }
            }
            return false;
        }

        /* renamed from: updateSelection-r1Wruf4  reason: not valid java name */
        private final long m1635updateSelectionr1Wruf4(long dragPosition, SelectionAdjustment adjustment, boolean isStartOfSelection) {
            Integer valueOf = Integer.valueOf(this.dragBeginOffsetInText);
            int it = valueOf.intValue();
            if (!(it >= 0)) {
                valueOf = null;
            }
            int startOffset = valueOf != null ? valueOf.intValue() : TextFieldSelectionState.this.textLayoutState.m1567getOffsetForPosition3MmeM6k(this.dragBeginPosition, false);
            int endOffset = TextFieldSelectionState.this.textLayoutState.m1567getOffsetForPosition3MmeM6k(dragPosition, false);
            long newSelection = TextFieldSelectionState.this.m1631updateSelectionSsLRf8(TextFieldSelectionState.this.textFieldState.getVisualText(), startOffset, endOffset, false, adjustment, false, isStartOfSelection);
            if (this.dragBeginOffsetInText == -1 && !TextRange.m6333getCollapsedimpl(newSelection)) {
                this.dragBeginOffsetInText = TextRange.m6339getStartimpl(newSelection);
            }
            if (TextRange.m6338getReversedimpl(newSelection)) {
                newSelection = TextFieldSelectionStateKt.m1648reverse5zctL8(newSelection);
            }
            TextFieldSelectionState.this.textFieldState.m1584selectCharsIn5zctL8(newSelection);
            TextFieldSelectionState.this.updateTextToolbarState(TextToolbarState.Selection);
            return newSelection;
        }

        @Override // androidx.compose.foundation.text.selection.MouseSelectionObserver
        public void onDragDone() {
            TextFieldSelectionStateKt.logDebug(new Function0<String>() { // from class: androidx.compose.foundation.text.input.internal.selection.TextFieldSelectionState$TextFieldMouseSelectionObserver$onDragDone$1
                @Override // kotlin.jvm.functions.Function0
                public final String invoke() {
                    return "Mouse.onDragDone";
                }
            });
            TextFieldSelectionState.this.setDirectDragGestureInitiator(InputType.None);
        }

        @Override // androidx.compose.foundation.text.selection.MouseSelectionObserver
        /* renamed from: onExtend-k-4lQ0M  reason: not valid java name */
        public boolean mo1637onExtendk4lQ0M(long downPosition) {
            TextFieldSelectionStateKt.logDebug(new Function0<String>() { // from class: androidx.compose.foundation.text.input.internal.selection.TextFieldSelectionState$TextFieldMouseSelectionObserver$onExtend$1
                @Override // kotlin.jvm.functions.Function0
                public final String invoke() {
                    return "Mouse.onExtend";
                }
            });
            return true;
        }

        @Override // androidx.compose.foundation.text.selection.MouseSelectionObserver
        /* renamed from: onExtendDrag-k-4lQ0M  reason: not valid java name */
        public boolean mo1638onExtendDragk4lQ0M(long dragPosition) {
            TextFieldSelectionStateKt.logDebug(new Function0<String>() { // from class: androidx.compose.foundation.text.input.internal.selection.TextFieldSelectionState$TextFieldMouseSelectionObserver$onExtendDrag$1
                @Override // kotlin.jvm.functions.Function0
                public final String invoke() {
                    return "Mouse.onExtendDrag";
                }
            });
            return true;
        }
    }

    /* compiled from: TextFieldSelectionState.kt */
    @Metadata(d1 = {"\u0000*\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0011\b\u0082\u0004\u0018\u00002\u00020\u0001B\u0013\u0012\f\u0010\u0002\u001a\b\u0012\u0004\u0012\u00020\u00040\u0003¢\u0006\u0002\u0010\u0005J\b\u0010\u000e\u001a\u00020\u0004H\u0016J\u001a\u0010\u000f\u001a\u00020\u00042\u0006\u0010\u0010\u001a\u00020\u000bH\u0016ø\u0001\u0000¢\u0006\u0004\b\u0011\u0010\u0012J\u001a\u0010\u0013\u001a\u00020\u00042\u0006\u0010\u0014\u001a\u00020\u000bH\u0016ø\u0001\u0000¢\u0006\u0004\b\u0015\u0010\u0012J\b\u0010\u0016\u001a\u00020\u0004H\u0002J\u001a\u0010\u0017\u001a\u00020\u00042\u0006\u0010\u0018\u001a\u00020\u000bH\u0016ø\u0001\u0000¢\u0006\u0004\b\u0019\u0010\u0012J\b\u0010\u001a\u001a\u00020\u0004H\u0016J\b\u0010\u001b\u001a\u00020\u0004H\u0016R\u000e\u0010\u0006\u001a\u00020\u0007X\u0082\u000e¢\u0006\u0002\n\u0000R\u000e\u0010\b\u001a\u00020\tX\u0082\u000e¢\u0006\u0002\n\u0000R\u0016\u0010\n\u001a\u00020\u000bX\u0082\u000eø\u0001\u0000ø\u0001\u0001¢\u0006\u0004\n\u0002\u0010\fR\u0016\u0010\r\u001a\u00020\u000bX\u0082\u000eø\u0001\u0000ø\u0001\u0001¢\u0006\u0004\n\u0002\u0010\fR\u0014\u0010\u0002\u001a\b\u0012\u0004\u0012\u00020\u00040\u0003X\u0082\u0004¢\u0006\u0002\n\u0000\u0082\u0002\u000b\n\u0005\b¡\u001e0\u0001\n\u0002\b!¨\u0006\u001c"}, d2 = {"Landroidx/compose/foundation/text/input/internal/selection/TextFieldSelectionState$TextFieldTextDragObserver;", "Landroidx/compose/foundation/text/TextDragObserver;", "requestFocus", "Lkotlin/Function0;", "", "(Landroidx/compose/foundation/text/input/internal/selection/TextFieldSelectionState;Lkotlin/jvm/functions/Function0;)V", "actingHandle", "Landroidx/compose/foundation/text/Handle;", "dragBeginOffsetInText", "", "dragBeginPosition", "Landroidx/compose/ui/geometry/Offset;", "J", "dragTotalDistance", "onCancel", "onDown", "point", "onDown-k-4lQ0M", "(J)V", "onDrag", "delta", "onDrag-k-4lQ0M", "onDragStop", "onStart", "startPoint", "onStart-k-4lQ0M", "onStop", "onUp", "foundation_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
    /* loaded from: classes.dex */
    private final class TextFieldTextDragObserver implements TextDragObserver {
        private final Function0<Unit> requestFocus;
        private int dragBeginOffsetInText = -1;
        private long dragBeginPosition = Offset.Companion.m4063getUnspecifiedF1C5BW0();
        private long dragTotalDistance = Offset.Companion.m4064getZeroF1C5BW0();
        private Handle actingHandle = Handle.SelectionEnd;

        public TextFieldTextDragObserver(Function0<Unit> function0) {
            this.requestFocus = function0;
        }

        private final void onDragStop() {
            long $this$isSpecified$iv = this.dragBeginPosition;
            if ((9223372034707292159L & $this$isSpecified$iv) != InlineClassHelperKt.UnspecifiedPackedFloats) {
                TextFieldSelectionStateKt.logDebug(new Function0<String>() { // from class: androidx.compose.foundation.text.input.internal.selection.TextFieldSelectionState$TextFieldTextDragObserver$onDragStop$1
                    @Override // kotlin.jvm.functions.Function0
                    public final String invoke() {
                        return "Touch.onDragStop";
                    }
                });
                TextFieldSelectionState.this.clearHandleDragging();
                this.dragBeginOffsetInText = -1;
                this.dragBeginPosition = Offset.Companion.m4063getUnspecifiedF1C5BW0();
                this.dragTotalDistance = Offset.Companion.m4064getZeroF1C5BW0();
                TextFieldSelectionState.this.previousRawDragOffset = -1;
                TextFieldSelectionState.this.setDirectDragGestureInitiator(InputType.None);
                this.requestFocus.invoke();
            }
        }

        @Override // androidx.compose.foundation.text.TextDragObserver
        /* renamed from: onDown-k-4lQ0M */
        public void mo1399onDownk4lQ0M(long point) {
        }

        @Override // androidx.compose.foundation.text.TextDragObserver
        public void onUp() {
        }

        @Override // androidx.compose.foundation.text.TextDragObserver
        public void onStop() {
            onDragStop();
        }

        @Override // androidx.compose.foundation.text.TextDragObserver
        public void onCancel() {
            onDragStop();
        }

        @Override // androidx.compose.foundation.text.TextDragObserver
        /* renamed from: onStart-k-4lQ0M */
        public void mo1401onStartk4lQ0M(final long startPoint) {
            if (TextFieldSelectionState.this.enabled) {
                TextFieldSelectionStateKt.logDebug(new Function0<String>() { // from class: androidx.compose.foundation.text.input.internal.selection.TextFieldSelectionState$TextFieldTextDragObserver$onStart$1
                    /* JADX INFO: Access modifiers changed from: package-private */
                    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                    {
                        super(0);
                    }

                    @Override // kotlin.jvm.functions.Function0
                    public final String invoke() {
                        return "Touch.onDragStart after longPress at " + ((Object) Offset.m4056toStringimpl(startPoint));
                    }
                });
                TextFieldSelectionState.this.m1634updateHandleDraggingUv8p0NA(this.actingHandle, startPoint);
                TextFieldSelectionState.this.setShowCursorHandle(false);
                TextFieldSelectionState.this.setDirectDragGestureInitiator(InputType.Touch);
                this.dragBeginPosition = startPoint;
                this.dragTotalDistance = Offset.Companion.m4064getZeroF1C5BW0();
                TextFieldSelectionState.this.previousRawDragOffset = -1;
                boolean m1568isPositionOnTextk4lQ0M = TextFieldSelectionState.this.textLayoutState.m1568isPositionOnTextk4lQ0M(startPoint);
                TextFieldSelectionState textFieldSelectionState = TextFieldSelectionState.this;
                if (!m1568isPositionOnTextk4lQ0M) {
                    int offset = TextLayoutState.m1564getOffsetForPosition3MmeM6k$default(textFieldSelectionState.textLayoutState, startPoint, false, 2, null);
                    HapticFeedback hapticFeedback = TextFieldSelectionState.this.hapticFeedBack;
                    if (hapticFeedback != null) {
                        hapticFeedback.mo5011performHapticFeedbackCdsT49E(HapticFeedbackType.Companion.m5027getTextHandleMove5zf0vsI());
                    }
                    TextFieldSelectionState.this.textFieldState.placeCursorBeforeCharAt(offset);
                    TextFieldSelectionState.this.setShowCursorHandle(true);
                    TextFieldSelectionState.this.updateTextToolbarState(TextToolbarState.Cursor);
                    return;
                }
                if (textFieldSelectionState.textFieldState.getVisualText().length() == 0) {
                    return;
                }
                int offset2 = TextLayoutState.m1564getOffsetForPosition3MmeM6k$default(TextFieldSelectionState.this.textLayoutState, startPoint, false, 2, null);
                long newSelection = TextFieldSelectionState.m1632updateSelectionSsLRf8$default(TextFieldSelectionState.this, new TextFieldCharSequence(TextFieldSelectionState.this.textFieldState.getVisualText(), TextRange.Companion.m6344getZerod9O1mEE(), null, null, null, 28, null), offset2, offset2, false, SelectionAdjustment.Companion.getWord(), false, false, 96, null);
                TextFieldSelectionState.this.textFieldState.m1584selectCharsIn5zctL8(newSelection);
                TextFieldSelectionState.this.updateTextToolbarState(TextToolbarState.Selection);
                this.dragBeginOffsetInText = TextRange.m6339getStartimpl(newSelection);
            }
        }

        @Override // androidx.compose.foundation.text.TextDragObserver
        /* renamed from: onDrag-k-4lQ0M */
        public void mo1400onDragk4lQ0M(long delta) {
            int startOffset;
            int endOffset;
            SelectionAdjustment adjustment;
            Handle handle;
            SelectionAdjustment word;
            if (TextFieldSelectionState.this.enabled) {
                if (TextFieldSelectionState.this.textFieldState.getVisualText().length() == 0) {
                    return;
                }
                this.dragTotalDistance = Offset.m4053plusMKHz9U(this.dragTotalDistance, delta);
                final long currentDragPosition = Offset.m4053plusMKHz9U(this.dragBeginPosition, this.dragTotalDistance);
                TextFieldSelectionStateKt.logDebug(new Function0<String>() { // from class: androidx.compose.foundation.text.input.internal.selection.TextFieldSelectionState$TextFieldTextDragObserver$onDrag$1
                    /* JADX INFO: Access modifiers changed from: package-private */
                    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                    {
                        super(0);
                    }

                    @Override // kotlin.jvm.functions.Function0
                    public final String invoke() {
                        return "Touch.onDrag at " + ((Object) Offset.m4056toStringimpl(currentDragPosition));
                    }
                });
                if (this.dragBeginOffsetInText < 0 && !TextFieldSelectionState.this.textLayoutState.m1568isPositionOnTextk4lQ0M(currentDragPosition)) {
                    int startOffset2 = TextLayoutState.m1564getOffsetForPosition3MmeM6k$default(TextFieldSelectionState.this.textLayoutState, this.dragBeginPosition, false, 2, null);
                    int endOffset2 = TextLayoutState.m1564getOffsetForPosition3MmeM6k$default(TextFieldSelectionState.this.textLayoutState, currentDragPosition, false, 2, null);
                    if (startOffset2 == endOffset2) {
                        word = SelectionAdjustment.Companion.getNone();
                    } else {
                        word = SelectionAdjustment.Companion.getWord();
                    }
                    startOffset = startOffset2;
                    endOffset = endOffset2;
                    adjustment = word;
                } else {
                    Integer valueOf = Integer.valueOf(this.dragBeginOffsetInText);
                    int it = valueOf.intValue();
                    if (!(it >= 0)) {
                        valueOf = null;
                    }
                    int startOffset3 = valueOf != null ? valueOf.intValue() : TextFieldSelectionState.this.textLayoutState.m1567getOffsetForPosition3MmeM6k(this.dragBeginPosition, false);
                    int endOffset3 = TextFieldSelectionState.this.textLayoutState.m1567getOffsetForPosition3MmeM6k(currentDragPosition, false);
                    if (this.dragBeginOffsetInText < 0 && startOffset3 == endOffset3) {
                        return;
                    }
                    SelectionAdjustment adjustment2 = SelectionAdjustment.Companion.getWord();
                    TextFieldSelectionState.this.updateTextToolbarState(TextToolbarState.Selection);
                    startOffset = startOffset3;
                    endOffset = endOffset3;
                    adjustment = adjustment2;
                }
                long prevSelection = TextFieldSelectionState.this.textFieldState.getVisualText().m1456getSelectiond9O1mEE();
                long newSelection = TextFieldSelectionState.m1632updateSelectionSsLRf8$default(TextFieldSelectionState.this, TextFieldSelectionState.this.textFieldState.getVisualText(), startOffset, endOffset, false, adjustment, false, false, 64, null);
                if (this.dragBeginOffsetInText == -1 && !TextRange.m6333getCollapsedimpl(newSelection)) {
                    this.dragBeginOffsetInText = TextRange.m6339getStartimpl(newSelection);
                }
                if (TextRange.m6338getReversedimpl(newSelection)) {
                    newSelection = TextFieldSelectionStateKt.m1648reverse5zctL8(newSelection);
                }
                if (!TextRange.m6332equalsimpl0(newSelection, prevSelection)) {
                    if (TextRange.m6339getStartimpl(newSelection) != TextRange.m6339getStartimpl(prevSelection) && TextRange.m6334getEndimpl(newSelection) == TextRange.m6334getEndimpl(prevSelection)) {
                        handle = Handle.SelectionStart;
                    } else if (TextRange.m6339getStartimpl(newSelection) != TextRange.m6339getStartimpl(prevSelection) || TextRange.m6334getEndimpl(newSelection) == TextRange.m6334getEndimpl(prevSelection)) {
                        float newMiddle = (TextRange.m6339getStartimpl(newSelection) + TextRange.m6334getEndimpl(newSelection)) / 2.0f;
                        float prevMiddle = (TextRange.m6339getStartimpl(prevSelection) + TextRange.m6334getEndimpl(prevSelection)) / 2.0f;
                        if (newMiddle > prevMiddle) {
                            handle = Handle.SelectionEnd;
                        } else {
                            handle = Handle.SelectionStart;
                        }
                    } else {
                        handle = Handle.SelectionEnd;
                    }
                    this.actingHandle = handle;
                }
                if (TextRange.m6333getCollapsedimpl(prevSelection) || !TextRange.m6333getCollapsedimpl(newSelection)) {
                    TextFieldSelectionState.this.textFieldState.m1584selectCharsIn5zctL8(newSelection);
                }
                TextFieldSelectionState.this.m1634updateHandleDraggingUv8p0NA(this.actingHandle, currentDragPosition);
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* JADX WARN: Removed duplicated region for block: B:10:0x002b  */
    /* JADX WARN: Removed duplicated region for block: B:12:0x0034  */
    /* JADX WARN: Removed duplicated region for block: B:17:0x0050  */
    /* JADX WARN: Removed duplicated region for block: B:39:0x00df  */
    /* JADX WARN: Removed duplicated region for block: B:50:0x010c  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object detectSelectionHandleDragGestures(androidx.compose.ui.input.pointer.PointerInputScope r19, boolean r20, kotlin.coroutines.Continuation<? super kotlin.Unit> r21) {
        /*
            Method dump skipped, instructions count: 280
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.compose.foundation.text.input.internal.selection.TextFieldSelectionState.detectSelectionHandleDragGestures(androidx.compose.ui.input.pointer.PointerInputScope, boolean, kotlin.coroutines.Continuation):java.lang.Object");
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final void detectSelectionHandleDragGestures$onDragStop$6(Ref.LongRef dragBeginPosition, TextFieldSelectionState this$0, Ref.LongRef dragTotalDistance) {
        long $this$isSpecified$iv = dragBeginPosition.element;
        if ((9223372034707292159L & $this$isSpecified$iv) != InlineClassHelperKt.UnspecifiedPackedFloats) {
            this$0.clearHandleDragging();
            dragBeginPosition.element = Offset.Companion.m4063getUnspecifiedF1C5BW0();
            dragTotalDistance.element = Offset.Companion.m4064getZeroF1C5BW0();
            this$0.previousRawDragOffset = -1;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final Object observeTextChanges(Continuation<? super Unit> continuation) {
        Object collect = FlowKt.drop(FlowKt.distinctUntilChanged(SnapshotStateKt.snapshotFlow(new Function0<TextFieldCharSequence>() { // from class: androidx.compose.foundation.text.input.internal.selection.TextFieldSelectionState$observeTextChanges$2
            /* JADX INFO: Access modifiers changed from: package-private */
            {
                super(0);
            }

            /* JADX WARN: Can't rename method to resolve collision */
            @Override // kotlin.jvm.functions.Function0
            public final TextFieldCharSequence invoke() {
                return TextFieldSelectionState.this.textFieldState.getVisualText();
            }
        }), TextFieldSelectionState$observeTextChanges$3.INSTANCE), 1).collect(new FlowCollector() { // from class: androidx.compose.foundation.text.input.internal.selection.TextFieldSelectionState$observeTextChanges$4
            @Override // kotlinx.coroutines.flow.FlowCollector
            public /* bridge */ /* synthetic */ Object emit(Object value, Continuation $completion) {
                return emit((TextFieldCharSequence) value, (Continuation<? super Unit>) $completion);
            }

            public final Object emit(TextFieldCharSequence it, Continuation<? super Unit> continuation2) {
                TextFieldSelectionState.this.setShowCursorHandle(false);
                TextFieldSelectionState.this.updateTextToolbarState(TextToolbarState.None);
                return Unit.INSTANCE;
            }
        }, continuation);
        return collect == IntrinsicsKt.getCOROUTINE_SUSPENDED() ? collect : Unit.INSTANCE;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final Object observeTextToolbarVisibility(Continuation<? super Unit> continuation) {
        Object collect = SnapshotStateKt.snapshotFlow(new Function0<Rect>() { // from class: androidx.compose.foundation.text.input.internal.selection.TextFieldSelectionState$observeTextToolbarVisibility$2
            /* JADX INFO: Access modifiers changed from: package-private */
            {
                super(0);
            }

            /* JADX WARN: Can't rename method to resolve collision */
            /* JADX WARN: Code restructure failed: missing block: B:5:0x001e, code lost:
                if (r3 != androidx.compose.foundation.text.input.internal.selection.TextToolbarState.Cursor) goto L37;
             */
            /* JADX WARN: Code restructure failed: missing block: B:8:0x002a, code lost:
                if (r3 == androidx.compose.foundation.text.input.internal.selection.TextToolbarState.Selection) goto L5;
             */
            /* JADX WARN: Code restructure failed: missing block: B:9:0x002c, code lost:
                r3 = true;
             */
            @Override // kotlin.jvm.functions.Function0
            /*
                Code decompiled incorrectly, please refer to instructions dump.
                To view partially-correct add '--show-bad-code' argument
            */
            public final androidx.compose.ui.geometry.Rect invoke() {
                /*
                    r10 = this;
                    androidx.compose.foundation.text.input.internal.selection.TextFieldSelectionState r0 = androidx.compose.foundation.text.input.internal.selection.TextFieldSelectionState.this
                    androidx.compose.foundation.text.input.internal.TransformedTextFieldState r0 = androidx.compose.foundation.text.input.internal.selection.TextFieldSelectionState.access$getTextFieldState$p(r0)
                    androidx.compose.foundation.text.input.TextFieldCharSequence r0 = r0.getVisualText()
                    long r0 = r0.m1456getSelectiond9O1mEE()
                    boolean r0 = androidx.compose.ui.text.TextRange.m6333getCollapsedimpl(r0)
                    r1 = 1
                    r2 = 0
                    if (r0 == 0) goto L20
                    androidx.compose.foundation.text.input.internal.selection.TextFieldSelectionState r3 = androidx.compose.foundation.text.input.internal.selection.TextFieldSelectionState.this
                    androidx.compose.foundation.text.input.internal.selection.TextToolbarState r3 = androidx.compose.foundation.text.input.internal.selection.TextFieldSelectionState.access$getTextToolbarState(r3)
                    androidx.compose.foundation.text.input.internal.selection.TextToolbarState r4 = androidx.compose.foundation.text.input.internal.selection.TextToolbarState.Cursor
                    if (r3 == r4) goto L2c
                L20:
                    if (r0 != 0) goto L2e
                    androidx.compose.foundation.text.input.internal.selection.TextFieldSelectionState r3 = androidx.compose.foundation.text.input.internal.selection.TextFieldSelectionState.this
                    androidx.compose.foundation.text.input.internal.selection.TextToolbarState r3 = androidx.compose.foundation.text.input.internal.selection.TextFieldSelectionState.access$getTextToolbarState(r3)
                    androidx.compose.foundation.text.input.internal.selection.TextToolbarState r4 = androidx.compose.foundation.text.input.internal.selection.TextToolbarState.Selection
                    if (r3 != r4) goto L2e
                L2c:
                    r3 = r1
                    goto L2f
                L2e:
                    r3 = r2
                L2f:
                    if (r3 == 0) goto L43
                    androidx.compose.foundation.text.input.internal.selection.TextFieldSelectionState r4 = androidx.compose.foundation.text.input.internal.selection.TextFieldSelectionState.this
                    androidx.compose.foundation.text.Handle r4 = r4.getDraggingHandle()
                    if (r4 != 0) goto L43
                    androidx.compose.foundation.text.input.internal.selection.TextFieldSelectionState r4 = androidx.compose.foundation.text.input.internal.selection.TextFieldSelectionState.this
                    boolean r4 = r4.isInTouchMode()
                    if (r4 == 0) goto L43
                    goto L44
                L43:
                    r1 = r2
                L44:
                    if (r1 != 0) goto L4f
                    androidx.compose.ui.geometry.Rect$Companion r2 = androidx.compose.ui.geometry.Rect.Companion
                    androidx.compose.ui.geometry.Rect r2 = r2.getZero()
                    goto Lb0
                L4f:
                    androidx.compose.foundation.text.input.internal.selection.TextFieldSelectionState r2 = androidx.compose.foundation.text.input.internal.selection.TextFieldSelectionState.this
                    androidx.compose.ui.layout.LayoutCoordinates r2 = androidx.compose.foundation.text.input.internal.selection.TextFieldSelectionState.access$getTextLayoutCoordinates(r2)
                    r4 = 0
                    if (r2 == 0) goto L5d
                    androidx.compose.ui.geometry.Rect r2 = androidx.compose.foundation.text.selection.SelectionManagerKt.visibleBounds(r2)
                    goto L5e
                L5d:
                    r2 = r4
                L5e:
                    if (r2 == 0) goto La9
                    androidx.compose.foundation.text.input.internal.selection.TextFieldSelectionState r5 = androidx.compose.foundation.text.input.internal.selection.TextFieldSelectionState.this
                    androidx.compose.ui.layout.LayoutCoordinates r5 = androidx.compose.foundation.text.input.internal.selection.TextFieldSelectionState.access$getTextLayoutCoordinates(r5)
                    if (r5 == 0) goto L75
                    long r6 = r2.m4083getTopLeftF1C5BW0()
                    long r5 = r5.mo5648localToRootMKHz9U(r6)
                    androidx.compose.ui.geometry.Offset r5 = androidx.compose.ui.geometry.Offset.m4037boximpl(r5)
                    goto L76
                L75:
                    r5 = r4
                L76:
                    kotlin.jvm.internal.Intrinsics.checkNotNull(r5)
                    long r6 = r5.m4058unboximpl()
                    long r8 = r2.m4081getSizeNHjbRc()
                    androidx.compose.ui.geometry.Rect r6 = androidx.compose.ui.geometry.RectKt.m4088Recttz77jQw(r6, r8)
                    androidx.compose.foundation.text.input.internal.selection.TextFieldSelectionState r7 = androidx.compose.foundation.text.input.internal.selection.TextFieldSelectionState.this
                    androidx.compose.ui.geometry.Rect r7 = androidx.compose.foundation.text.input.internal.selection.TextFieldSelectionState.access$getContentRect(r7)
                    r8 = r7
                    r9 = 0
                    boolean r8 = r6.overlaps(r8)
                    if (r8 == 0) goto L96
                    r4 = r7
                L96:
                    if (r4 == 0) goto La1
                L99:
                    androidx.compose.ui.geometry.Rect r4 = r4.intersect(r6)
                    if (r4 == 0) goto La1
                    r2 = r4
                    goto Lb0
                La1:
                    androidx.compose.ui.geometry.Rect$Companion r4 = androidx.compose.ui.geometry.Rect.Companion
                    androidx.compose.ui.geometry.Rect r4 = r4.getZero()
                    r2 = r4
                    goto Lb0
                La9:
                    androidx.compose.ui.geometry.Rect$Companion r4 = androidx.compose.ui.geometry.Rect.Companion
                    androidx.compose.ui.geometry.Rect r4 = r4.getZero()
                    r2 = r4
                Lb0:
                    return r2
                */
                throw new UnsupportedOperationException("Method not decompiled: androidx.compose.foundation.text.input.internal.selection.TextFieldSelectionState$observeTextToolbarVisibility$2.invoke():androidx.compose.ui.geometry.Rect");
            }
        }).collect(new FlowCollector() { // from class: androidx.compose.foundation.text.input.internal.selection.TextFieldSelectionState$observeTextToolbarVisibility$3
            @Override // kotlinx.coroutines.flow.FlowCollector
            public /* bridge */ /* synthetic */ Object emit(Object value, Continuation $completion) {
                return emit((Rect) value, (Continuation<? super Unit>) $completion);
            }

            public final Object emit(Rect rect, Continuation<? super Unit> continuation2) {
                TextToolbarHandler textToolbarHandler;
                boolean areEqual = Intrinsics.areEqual(rect, Rect.Companion.getZero());
                TextFieldSelectionState textFieldSelectionState = TextFieldSelectionState.this;
                if (areEqual) {
                    textFieldSelectionState.hideTextToolbar();
                } else {
                    textToolbarHandler = textFieldSelectionState.textToolbarHandler;
                    if (textToolbarHandler != null) {
                        Object showTextToolbar = textToolbarHandler.showTextToolbar(TextFieldSelectionState.this, rect, continuation2);
                        return showTextToolbar == IntrinsicsKt.getCOROUTINE_SUSPENDED() ? showTextToolbar : Unit.INSTANCE;
                    }
                }
                return Unit.INSTANCE;
            }
        }, continuation);
        return collect == IntrinsicsKt.getCOROUTINE_SUSPENDED() ? collect : Unit.INSTANCE;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final Rect getContentRect() {
        float x$iv;
        long j;
        char c;
        Rect cursorRect;
        Rect cursorRect2;
        TextFieldCharSequence text = this.textFieldState.getVisualText();
        if (TextRange.m6333getCollapsedimpl(text.m1456getSelectiond9O1mEE())) {
            Rect cursorRect3 = getCursorRect();
            LayoutCoordinates textLayoutCoordinates = getTextLayoutCoordinates();
            long topLeft = textLayoutCoordinates != null ? textLayoutCoordinates.mo5648localToRootMKHz9U(cursorRect3.m4083getTopLeftF1C5BW0()) : Offset.Companion.m4064getZeroF1C5BW0();
            return RectKt.m4088Recttz77jQw(topLeft, cursorRect3.m4081getSizeNHjbRc());
        }
        LayoutCoordinates textLayoutCoordinates2 = getTextLayoutCoordinates();
        long startOffset = textLayoutCoordinates2 != null ? textLayoutCoordinates2.mo5648localToRootMKHz9U(m1624getHandlePositiontuRUvjQ(true)) : Offset.Companion.m4064getZeroF1C5BW0();
        LayoutCoordinates textLayoutCoordinates3 = getTextLayoutCoordinates();
        long endOffset = textLayoutCoordinates3 != null ? textLayoutCoordinates3.mo5648localToRootMKHz9U(m1624getHandlePositiontuRUvjQ(false)) : Offset.Companion.m4064getZeroF1C5BW0();
        LayoutCoordinates textLayoutCoordinates4 = getTextLayoutCoordinates();
        float startTop = 0.0f;
        if (textLayoutCoordinates4 != null) {
            TextLayoutResult layoutResult = this.textLayoutState.getLayoutResult();
            float y$iv = (layoutResult == null || (cursorRect2 = layoutResult.getCursorRect(TextRange.m6339getStartimpl(text.m1456getSelectiond9O1mEE()))) == null) ? 0.0f : cursorRect2.getTop();
            j = 4294967295L;
            long v1$iv$iv = Float.floatToRawIntBits(0.0f);
            x$iv = 0.0f;
            c = ' ';
            long v2$iv$iv = Float.floatToRawIntBits(y$iv);
            long value$iv$iv = textLayoutCoordinates4.mo5648localToRootMKHz9U(Offset.m4040constructorimpl((v1$iv$iv << 32) | (v2$iv$iv & 4294967295L)));
            int bits$iv$iv$iv = (int) (value$iv$iv & 4294967295L);
            startTop = Float.intBitsToFloat(bits$iv$iv$iv);
        } else {
            x$iv = 0.0f;
            j = 4294967295L;
            c = ' ';
        }
        LayoutCoordinates textLayoutCoordinates5 = getTextLayoutCoordinates();
        if (textLayoutCoordinates5 != null) {
            TextLayoutResult layoutResult2 = this.textLayoutState.getLayoutResult();
            float y$iv2 = (layoutResult2 == null || (cursorRect = layoutResult2.getCursorRect(TextRange.m6334getEndimpl(text.m1456getSelectiond9O1mEE()))) == null) ? x$iv : cursorRect.getTop();
            long v1$iv$iv2 = Float.floatToRawIntBits(x$iv);
            long v2$iv$iv2 = Float.floatToRawIntBits(y$iv2);
            long value$iv$iv2 = textLayoutCoordinates5.mo5648localToRootMKHz9U(Offset.m4040constructorimpl((v1$iv$iv2 << c) | (v2$iv$iv2 & j)));
            int bits$iv$iv$iv2 = (int) (value$iv$iv2 & j);
            x$iv = Float.intBitsToFloat(bits$iv$iv$iv2);
        }
        float endTop = x$iv;
        long value$iv$iv3 = startOffset;
        int bits$iv$iv$iv3 = (int) (value$iv$iv3 >> c);
        long value$iv$iv4 = endOffset;
        int bits$iv$iv$iv4 = (int) (value$iv$iv4 >> c);
        float min = Math.min(Float.intBitsToFloat(bits$iv$iv$iv3), Float.intBitsToFloat(bits$iv$iv$iv4));
        long value$iv$iv5 = startOffset;
        int bits$iv$iv$iv5 = (int) (value$iv$iv5 >> c);
        long value$iv$iv6 = endOffset;
        int bits$iv$iv$iv6 = (int) (value$iv$iv6 >> c);
        long value$iv$iv7 = startOffset;
        int bits$iv$iv$iv7 = (int) (value$iv$iv7 & j);
        long value$iv$iv8 = endOffset;
        int bits$iv$iv$iv8 = (int) (value$iv$iv8 & j);
        return new Rect(min, Math.min(startTop, endTop), Math.max(Float.intBitsToFloat(bits$iv$iv$iv5), Float.intBitsToFloat(bits$iv$iv$iv6)), Math.max(Float.intBitsToFloat(bits$iv$iv$iv7), Float.intBitsToFloat(bits$iv$iv$iv8)));
    }

    /* JADX WARN: Code restructure failed: missing block: B:24:0x0055, code lost:
        if (((r7 == null || (r7 = androidx.compose.foundation.text.selection.SelectionManagerKt.visibleBounds(r7)) == null) ? false : androidx.compose.foundation.text.selection.SelectionManagerKt.m1752containsInclusiveUv8p0NA(r7, r5)) != false) goto L24;
     */
    /* JADX WARN: Removed duplicated region for block: B:36:0x0079  */
    /* JADX WARN: Removed duplicated region for block: B:37:0x007e  */
    /* JADX WARN: Removed duplicated region for block: B:40:0x0091  */
    /* JADX WARN: Removed duplicated region for block: B:46:0x00a6  */
    /* JADX WARN: Removed duplicated region for block: B:49:0x00b1  */
    /* JADX WARN: Removed duplicated region for block: B:50:0x00b6  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final androidx.compose.foundation.text.input.internal.selection.TextFieldHandleState getSelectionHandleState$foundation_release(boolean r19, boolean r20) {
        /*
            r18 = this;
            r0 = r18
            if (r19 == 0) goto L7
            androidx.compose.foundation.text.Handle r1 = androidx.compose.foundation.text.Handle.SelectionStart
            goto L9
        L7:
            androidx.compose.foundation.text.Handle r1 = androidx.compose.foundation.text.Handle.SelectionEnd
        L9:
            androidx.compose.foundation.text.input.internal.TextLayoutState r2 = r0.textLayoutState
            androidx.compose.ui.text.TextLayoutResult r2 = r2.getLayoutResult()
            if (r2 != 0) goto L18
            androidx.compose.foundation.text.input.internal.selection.TextFieldHandleState$Companion r2 = androidx.compose.foundation.text.input.internal.selection.TextFieldHandleState.Companion
            androidx.compose.foundation.text.input.internal.selection.TextFieldHandleState r2 = r2.getHidden()
            return r2
        L18:
            androidx.compose.foundation.text.input.internal.TransformedTextFieldState r3 = r0.textFieldState
            androidx.compose.foundation.text.input.TextFieldCharSequence r3 = r3.getVisualText()
            long r3 = r3.m1456getSelectiond9O1mEE()
            boolean r5 = androidx.compose.ui.text.TextRange.m6333getCollapsedimpl(r3)
            if (r5 == 0) goto L2f
            androidx.compose.foundation.text.input.internal.selection.TextFieldHandleState$Companion r5 = androidx.compose.foundation.text.input.internal.selection.TextFieldHandleState.Companion
            androidx.compose.foundation.text.input.internal.selection.TextFieldHandleState r5 = r5.getHidden()
            return r5
        L2f:
            long r5 = r18.m1624getHandlePositiontuRUvjQ(r19)
            androidx.compose.foundation.text.input.internal.selection.TextFieldSelectionState$InputType r7 = r0.getDirectDragGestureInitiator()
            androidx.compose.foundation.text.input.internal.selection.TextFieldSelectionState$InputType r8 = androidx.compose.foundation.text.input.internal.selection.TextFieldSelectionState.InputType.None
            r9 = 1
            r10 = 0
            if (r7 != r8) goto L59
            androidx.compose.foundation.text.Handle r7 = r0.getDraggingHandle()
            if (r7 == r1) goto L57
            androidx.compose.ui.layout.LayoutCoordinates r7 = r0.getTextLayoutCoordinates()
            if (r7 == 0) goto L54
            androidx.compose.ui.geometry.Rect r7 = androidx.compose.foundation.text.selection.SelectionManagerKt.visibleBounds(r7)
            if (r7 == 0) goto L54
            boolean r7 = androidx.compose.foundation.text.selection.SelectionManagerKt.m1752containsInclusiveUv8p0NA(r7, r5)
            goto L55
        L54:
            r7 = r10
        L55:
            if (r7 == 0) goto L59
        L57:
            r7 = r9
            goto L5a
        L59:
            r7 = r10
        L5a:
            if (r7 != 0) goto L64
            androidx.compose.foundation.text.input.internal.selection.TextFieldHandleState$Companion r8 = androidx.compose.foundation.text.input.internal.selection.TextFieldHandleState.Companion
            androidx.compose.foundation.text.input.internal.selection.TextFieldHandleState r8 = r8.getHidden()
            return r8
        L64:
            androidx.compose.foundation.text.input.internal.TransformedTextFieldState r8 = r0.textFieldState
            androidx.compose.foundation.text.input.TextFieldCharSequence r8 = r8.getVisualText()
            boolean r8 = r8.shouldShowSelection()
            if (r8 != 0) goto L77
            androidx.compose.foundation.text.input.internal.selection.TextFieldHandleState$Companion r8 = androidx.compose.foundation.text.input.internal.selection.TextFieldHandleState.Companion
            androidx.compose.foundation.text.input.internal.selection.TextFieldHandleState r8 = r8.getHidden()
            return r8
        L77:
            if (r19 == 0) goto L7e
            int r8 = androidx.compose.ui.text.TextRange.m6339getStartimpl(r3)
            goto L87
        L7e:
            int r8 = androidx.compose.ui.text.TextRange.m6334getEndimpl(r3)
            int r8 = r8 - r9
            int r8 = java.lang.Math.max(r8, r10)
        L87:
            androidx.compose.ui.text.style.ResolvedTextDirection r14 = r2.getBidiRunDirection(r8)
            boolean r15 = androidx.compose.ui.text.TextRange.m6338getReversedimpl(r3)
            if (r20 == 0) goto La6
            androidx.compose.ui.layout.LayoutCoordinates r9 = r0.getTextLayoutCoordinates()
            if (r9 == 0) goto La4
            androidx.compose.ui.geometry.Rect r9 = androidx.compose.foundation.text.selection.SelectionManagerKt.visibleBounds(r9)
            if (r9 == 0) goto La4
            r10 = 0
            long r9 = androidx.compose.foundation.text.input.internal.TextLayoutStateKt.m1571coerceIn3MmeM6k(r5, r9)
            r11 = r9
            goto Lad
        La4:
            r11 = r5
            goto Lad
        La6:
            androidx.compose.ui.geometry.Offset$Companion r9 = androidx.compose.ui.geometry.Offset.Companion
            long r9 = r9.m4063getUnspecifiedF1C5BW0()
            r11 = r9
        Lad:
            if (r19 == 0) goto Lb6
            int r9 = androidx.compose.ui.text.TextRange.m6339getStartimpl(r3)
            goto Lba
        Lb6:
            int r9 = androidx.compose.ui.text.TextRange.m6334getEndimpl(r3)
        Lba:
            androidx.compose.foundation.text.input.internal.selection.TextFieldHandleState r10 = new androidx.compose.foundation.text.input.internal.selection.TextFieldHandleState
            float r13 = androidx.compose.foundation.text.TextLayoutHelperKt.getLineHeight(r2, r9)
            r16 = r9
            r9 = r10
            r10 = 1
            r17 = r16
            r16 = 0
            r9.<init>(r10, r11, r13, r14, r15, r16)
            return r9
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.compose.foundation.text.input.internal.selection.TextFieldSelectionState.getSelectionHandleState$foundation_release(boolean, boolean):androidx.compose.foundation.text.input.internal.selection.TextFieldHandleState");
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* renamed from: getHandlePosition-tuRUvjQ  reason: not valid java name */
    public final long m1624getHandlePositiontuRUvjQ(boolean isStartHandle) {
        int offset;
        TextLayoutResult layoutResult = this.textLayoutState.getLayoutResult();
        if (layoutResult == null) {
            return Offset.Companion.m4064getZeroF1C5BW0();
        }
        long selection = this.textFieldState.getVisualText().m1456getSelectiond9O1mEE();
        if (isStartHandle) {
            offset = TextRange.m6339getStartimpl(selection);
        } else {
            offset = TextRange.m6334getEndimpl(selection);
        }
        return TextSelectionDelegateKt.getSelectionHandleCoordinates(layoutResult, offset, isStartHandle, TextRange.m6338getReversedimpl(selection));
    }

    /* renamed from: updateHandleDragging-Uv8p0NA  reason: not valid java name */
    public final void m1634updateHandleDraggingUv8p0NA(Handle handle, long position) {
        setDraggingHandle(handle);
        m1629setRawHandleDragPositionk4lQ0M(position);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final void markStartContentVisibleOffset() {
        m1630setStartTextLayoutPositionInWindowk4lQ0M(m1623getCurrentTextLayoutPositionInWindowF1C5BW0());
    }

    public final void clearHandleDragging() {
        setDraggingHandle(null);
        m1629setRawHandleDragPositionk4lQ0M(Offset.Companion.m4063getUnspecifiedF1C5BW0());
        m1630setStartTextLayoutPositionInWindowk4lQ0M(Offset.Companion.m4063getUnspecifiedF1C5BW0());
    }

    public final boolean canCut() {
        return (TextRange.m6333getCollapsedimpl(this.textFieldState.getVisualText().m1456getSelectiond9O1mEE()) || !getEditable() || this.isPassword) ? false : true;
    }

    /* JADX WARN: Removed duplicated region for block: B:10:0x0024  */
    /* JADX WARN: Removed duplicated region for block: B:12:0x002d  */
    /* JADX WARN: Removed duplicated region for block: B:13:0x0035  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object cut(kotlin.coroutines.Continuation<? super kotlin.Unit> r10) {
        /*
            r9 = this;
            boolean r0 = r10 instanceof androidx.compose.foundation.text.input.internal.selection.TextFieldSelectionState$cut$1
            if (r0 == 0) goto L14
            r0 = r10
            androidx.compose.foundation.text.input.internal.selection.TextFieldSelectionState$cut$1 r0 = (androidx.compose.foundation.text.input.internal.selection.TextFieldSelectionState$cut$1) r0
            int r1 = r0.label
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r1 = r1 & r2
            if (r1 == 0) goto L14
            int r1 = r0.label
            int r1 = r1 - r2
            r0.label = r1
            goto L19
        L14:
            androidx.compose.foundation.text.input.internal.selection.TextFieldSelectionState$cut$1 r0 = new androidx.compose.foundation.text.input.internal.selection.TextFieldSelectionState$cut$1
            r0.<init>(r9, r10)
        L19:
            java.lang.Object r1 = r0.result
            java.lang.Object r2 = kotlin.coroutines.intrinsics.IntrinsicsKt.getCOROUTINE_SUSPENDED()
            int r3 = r0.label
            switch(r3) {
                case 0: goto L35;
                case 1: goto L2d;
                default: goto L24;
            }
        L24:
            java.lang.IllegalStateException r0 = new java.lang.IllegalStateException
            java.lang.String r1 = "call to 'resume' before 'invoke' with coroutine"
            r0.<init>(r1)
            throw r0
        L2d:
            java.lang.Object r2 = r0.L$0
            androidx.compose.foundation.text.input.internal.selection.TextFieldSelectionState r2 = (androidx.compose.foundation.text.input.internal.selection.TextFieldSelectionState) r2
            kotlin.ResultKt.throwOnFailure(r1)
            goto L70
        L35:
            kotlin.ResultKt.throwOnFailure(r1)
            r3 = r9
            androidx.compose.foundation.text.input.internal.TransformedTextFieldState r4 = r3.textFieldState
            androidx.compose.foundation.text.input.TextFieldCharSequence r4 = r4.getVisualText()
            long r5 = r4.m1456getSelectiond9O1mEE()
            boolean r5 = androidx.compose.ui.text.TextRange.m6333getCollapsedimpl(r5)
            if (r5 == 0) goto L4c
            kotlin.Unit r2 = kotlin.Unit.INSTANCE
            return r2
        L4c:
            androidx.compose.ui.text.AnnotatedString r5 = new androidx.compose.ui.text.AnnotatedString
            java.lang.CharSequence r6 = androidx.compose.foundation.text.input.TextFieldCharSequenceKt.getSelectedText(r4)
            java.lang.String r6 = r6.toString()
            r7 = 2
            r8 = 0
            r5.<init>(r6, r8, r7, r8)
            androidx.compose.ui.platform.Clipboard r4 = r3.clipboard
            if (r4 == 0) goto L72
            androidx.compose.ui.platform.ClipEntry r6 = androidx.compose.foundation.internal.ClipboardUtils_androidKt.toClipEntry(r5)
            r0.L$0 = r3
            r7 = 1
            r0.label = r7
            java.lang.Object r4 = r4.setClipEntry(r6, r0)
            if (r4 != r2) goto L6f
            return r2
        L6f:
            r2 = r3
        L70:
            r3 = r2
        L72:
            androidx.compose.foundation.text.input.internal.TransformedTextFieldState r2 = r3.textFieldState
            r2.deleteSelectedText()
            kotlin.Unit r2 = kotlin.Unit.INSTANCE
            return r2
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.compose.foundation.text.input.internal.selection.TextFieldSelectionState.cut(kotlin.coroutines.Continuation):java.lang.Object");
    }

    public final boolean canCopy() {
        return (TextRange.m6333getCollapsedimpl(this.textFieldState.getVisualText().m1456getSelectiond9O1mEE()) || this.isPassword) ? false : true;
    }

    public static /* synthetic */ Object copy$default(TextFieldSelectionState textFieldSelectionState, boolean z, Continuation continuation, int i, Object obj) {
        if ((i & 1) != 0) {
            z = true;
        }
        return textFieldSelectionState.copy(z, continuation);
    }

    /* JADX WARN: Removed duplicated region for block: B:10:0x0024  */
    /* JADX WARN: Removed duplicated region for block: B:12:0x002d  */
    /* JADX WARN: Removed duplicated region for block: B:13:0x0037  */
    /* JADX WARN: Removed duplicated region for block: B:25:0x0078  */
    /* JADX WARN: Removed duplicated region for block: B:27:0x007b  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object copy(boolean r10, kotlin.coroutines.Continuation<? super kotlin.Unit> r11) {
        /*
            r9 = this;
            boolean r0 = r11 instanceof androidx.compose.foundation.text.input.internal.selection.TextFieldSelectionState$copy$1
            if (r0 == 0) goto L14
            r0 = r11
            androidx.compose.foundation.text.input.internal.selection.TextFieldSelectionState$copy$1 r0 = (androidx.compose.foundation.text.input.internal.selection.TextFieldSelectionState$copy$1) r0
            int r1 = r0.label
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r1 = r1 & r2
            if (r1 == 0) goto L14
            int r1 = r0.label
            int r1 = r1 - r2
            r0.label = r1
            goto L19
        L14:
            androidx.compose.foundation.text.input.internal.selection.TextFieldSelectionState$copy$1 r0 = new androidx.compose.foundation.text.input.internal.selection.TextFieldSelectionState$copy$1
            r0.<init>(r9, r11)
        L19:
            java.lang.Object r1 = r0.result
            java.lang.Object r2 = kotlin.coroutines.intrinsics.IntrinsicsKt.getCOROUTINE_SUSPENDED()
            int r3 = r0.label
            switch(r3) {
                case 0: goto L37;
                case 1: goto L2d;
                default: goto L24;
            }
        L24:
            java.lang.IllegalStateException r10 = new java.lang.IllegalStateException
            java.lang.String r0 = "call to 'resume' before 'invoke' with coroutine"
            r10.<init>(r0)
            throw r10
        L2d:
            boolean r10 = r0.Z$0
            java.lang.Object r2 = r0.L$0
            androidx.compose.foundation.text.input.internal.selection.TextFieldSelectionState r2 = (androidx.compose.foundation.text.input.internal.selection.TextFieldSelectionState) r2
            kotlin.ResultKt.throwOnFailure(r1)
            goto L74
        L37:
            kotlin.ResultKt.throwOnFailure(r1)
            r3 = r9
            androidx.compose.foundation.text.input.internal.TransformedTextFieldState r4 = r3.textFieldState
            androidx.compose.foundation.text.input.TextFieldCharSequence r4 = r4.getVisualText()
            long r5 = r4.m1456getSelectiond9O1mEE()
            boolean r5 = androidx.compose.ui.text.TextRange.m6333getCollapsedimpl(r5)
            if (r5 == 0) goto L4e
            kotlin.Unit r2 = kotlin.Unit.INSTANCE
            return r2
        L4e:
            androidx.compose.ui.text.AnnotatedString r5 = new androidx.compose.ui.text.AnnotatedString
            java.lang.CharSequence r6 = androidx.compose.foundation.text.input.TextFieldCharSequenceKt.getSelectedText(r4)
            java.lang.String r6 = r6.toString()
            r7 = 2
            r8 = 0
            r5.<init>(r6, r8, r7, r8)
            androidx.compose.ui.platform.Clipboard r4 = r3.clipboard
            if (r4 == 0) goto L76
            androidx.compose.ui.platform.ClipEntry r6 = androidx.compose.foundation.internal.ClipboardUtils_androidKt.toClipEntry(r5)
            r0.L$0 = r3
            r0.Z$0 = r10
            r7 = 1
            r0.label = r7
            java.lang.Object r4 = r4.setClipEntry(r6, r0)
            if (r4 != r2) goto L73
            return r2
        L73:
            r2 = r3
        L74:
            r3 = r2
        L76:
            if (r10 != 0) goto L7b
            kotlin.Unit r2 = kotlin.Unit.INSTANCE
            return r2
        L7b:
            androidx.compose.foundation.text.input.internal.TransformedTextFieldState r2 = r3.textFieldState
            r2.collapseSelectionToMax()
            kotlin.Unit r2 = kotlin.Unit.INSTANCE
            return r2
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.compose.foundation.text.input.internal.selection.TextFieldSelectionState.copy(boolean, kotlin.coroutines.Continuation):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:10:0x0026  */
    /* JADX WARN: Removed duplicated region for block: B:12:0x002f  */
    /* JADX WARN: Removed duplicated region for block: B:13:0x0034  */
    /* JADX WARN: Removed duplicated region for block: B:14:0x003d  */
    /* JADX WARN: Removed duplicated region for block: B:30:0x006a  */
    /* JADX WARN: Removed duplicated region for block: B:32:0x006f  */
    /* JADX WARN: Removed duplicated region for block: B:44:0x0093  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object canPaste(kotlin.coroutines.Continuation<? super java.lang.Boolean> r9) {
        /*
            r8 = this;
            boolean r0 = r9 instanceof androidx.compose.foundation.text.input.internal.selection.TextFieldSelectionState$canPaste$1
            if (r0 == 0) goto L14
            r0 = r9
            androidx.compose.foundation.text.input.internal.selection.TextFieldSelectionState$canPaste$1 r0 = (androidx.compose.foundation.text.input.internal.selection.TextFieldSelectionState$canPaste$1) r0
            int r1 = r0.label
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r1 = r1 & r2
            if (r1 == 0) goto L14
            int r1 = r0.label
            int r1 = r1 - r2
            r0.label = r1
            goto L19
        L14:
            androidx.compose.foundation.text.input.internal.selection.TextFieldSelectionState$canPaste$1 r0 = new androidx.compose.foundation.text.input.internal.selection.TextFieldSelectionState$canPaste$1
            r0.<init>(r8, r9)
        L19:
            java.lang.Object r1 = r0.result
            java.lang.Object r2 = kotlin.coroutines.intrinsics.IntrinsicsKt.getCOROUTINE_SUSPENDED()
            int r3 = r0.label
            r4 = 0
            r5 = 1
            switch(r3) {
                case 0: goto L3d;
                case 1: goto L34;
                case 2: goto L2f;
                default: goto L26;
            }
        L26:
            java.lang.IllegalStateException r0 = new java.lang.IllegalStateException
            java.lang.String r1 = "call to 'resume' before 'invoke' with coroutine"
            r0.<init>(r1)
            throw r0
        L2f:
            kotlin.ResultKt.throwOnFailure(r1)
            r3 = r1
            goto L8e
        L34:
            java.lang.Object r3 = r0.L$0
            androidx.compose.foundation.text.input.internal.selection.TextFieldSelectionState r3 = (androidx.compose.foundation.text.input.internal.selection.TextFieldSelectionState) r3
            kotlin.ResultKt.throwOnFailure(r1)
            r6 = r1
            goto L5b
        L3d:
            kotlin.ResultKt.throwOnFailure(r1)
            r3 = r8
            boolean r6 = r3.getEditable()
            if (r6 != 0) goto L4c
            java.lang.Boolean r2 = kotlin.coroutines.jvm.internal.Boxing.boxBoolean(r4)
            return r2
        L4c:
            androidx.compose.ui.platform.Clipboard r6 = r3.clipboard
            if (r6 == 0) goto L67
            r0.L$0 = r3
            r0.label = r5
            java.lang.Object r6 = r6.getClipEntry(r0)
            if (r6 != r2) goto L5b
            return r2
        L5b:
            androidx.compose.ui.platform.ClipEntry r6 = (androidx.compose.ui.platform.ClipEntry) r6
            if (r6 == 0) goto L67
            boolean r6 = androidx.compose.foundation.internal.ClipboardUtils_androidKt.hasText(r6)
            if (r6 != r5) goto L67
            r6 = r5
            goto L68
        L67:
            r6 = r4
        L68:
            if (r6 == 0) goto L6f
            java.lang.Boolean r2 = kotlin.coroutines.jvm.internal.Boxing.boxBoolean(r5)
            return r2
        L6f:
            kotlin.jvm.functions.Function0<? extends androidx.compose.foundation.content.internal.ReceiveContentConfiguration> r6 = r3.receiveContentConfiguration
            r7 = 0
            if (r6 == 0) goto L7b
            java.lang.Object r6 = r6.invoke()
            androidx.compose.foundation.content.internal.ReceiveContentConfiguration r6 = (androidx.compose.foundation.content.internal.ReceiveContentConfiguration) r6
            goto L7c
        L7b:
            r6 = r7
        L7c:
            if (r6 == 0) goto L94
            androidx.compose.ui.platform.Clipboard r3 = r3.clipboard
            if (r3 == 0) goto L91
            r0.L$0 = r7
            r6 = 2
            r0.label = r6
            java.lang.Object r3 = r3.getClipEntry(r0)
            if (r3 != r2) goto L8e
            return r2
        L8e:
            r7 = r3
            androidx.compose.ui.platform.ClipEntry r7 = (androidx.compose.ui.platform.ClipEntry) r7
        L91:
            if (r7 == 0) goto L94
            r4 = r5
        L94:
            java.lang.Boolean r2 = kotlin.coroutines.jvm.internal.Boxing.boxBoolean(r4)
            return r2
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.compose.foundation.text.input.internal.selection.TextFieldSelectionState.canPaste(kotlin.coroutines.Continuation):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:10:0x0024  */
    /* JADX WARN: Removed duplicated region for block: B:12:0x002d  */
    /* JADX WARN: Removed duplicated region for block: B:13:0x0032  */
    /* JADX WARN: Removed duplicated region for block: B:14:0x003f  */
    /* JADX WARN: Removed duplicated region for block: B:15:0x0044  */
    /* JADX WARN: Removed duplicated region for block: B:28:0x006d  */
    /* JADX WARN: Removed duplicated region for block: B:39:0x00bf A[RETURN] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object paste(kotlin.coroutines.Continuation<? super kotlin.Unit> r14) {
        /*
            r13 = this;
            boolean r0 = r14 instanceof androidx.compose.foundation.text.input.internal.selection.TextFieldSelectionState$paste$1
            if (r0 == 0) goto L14
            r0 = r14
            androidx.compose.foundation.text.input.internal.selection.TextFieldSelectionState$paste$1 r0 = (androidx.compose.foundation.text.input.internal.selection.TextFieldSelectionState$paste$1) r0
            int r1 = r0.label
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r1 = r1 & r2
            if (r1 == 0) goto L14
            int r1 = r0.label
            int r1 = r1 - r2
            r0.label = r1
            goto L19
        L14:
            androidx.compose.foundation.text.input.internal.selection.TextFieldSelectionState$paste$1 r0 = new androidx.compose.foundation.text.input.internal.selection.TextFieldSelectionState$paste$1
            r0.<init>(r13, r14)
        L19:
            java.lang.Object r1 = r0.result
            java.lang.Object r2 = kotlin.coroutines.intrinsics.IntrinsicsKt.getCOROUTINE_SUSPENDED()
            int r3 = r0.label
            switch(r3) {
                case 0: goto L44;
                case 1: goto L3f;
                case 2: goto L32;
                case 3: goto L2d;
                default: goto L24;
            }
        L24:
            java.lang.IllegalStateException r0 = new java.lang.IllegalStateException
            java.lang.String r1 = "call to 'resume' before 'invoke' with coroutine"
            r0.<init>(r1)
            throw r0
        L2d:
            kotlin.ResultKt.throwOnFailure(r1)
            goto Lc0
        L32:
            java.lang.Object r3 = r0.L$1
            androidx.compose.foundation.content.internal.ReceiveContentConfiguration r3 = (androidx.compose.foundation.content.internal.ReceiveContentConfiguration) r3
            java.lang.Object r4 = r0.L$0
            androidx.compose.foundation.text.input.internal.selection.TextFieldSelectionState r4 = (androidx.compose.foundation.text.input.internal.selection.TextFieldSelectionState) r4
            kotlin.ResultKt.throwOnFailure(r1)
            r5 = r1
            goto L68
        L3f:
            kotlin.ResultKt.throwOnFailure(r1)
            goto Lcd
        L44:
            kotlin.ResultKt.throwOnFailure(r1)
            r4 = r13
            kotlin.jvm.functions.Function0<? extends androidx.compose.foundation.content.internal.ReceiveContentConfiguration> r3 = r4.receiveContentConfiguration
            if (r3 == 0) goto Lc3
            java.lang.Object r3 = r3.invoke()
            androidx.compose.foundation.content.internal.ReceiveContentConfiguration r3 = (androidx.compose.foundation.content.internal.ReceiveContentConfiguration) r3
            if (r3 != 0) goto L55
            goto Lc3
        L55:
            androidx.compose.ui.platform.Clipboard r5 = r4.clipboard
            if (r5 == 0) goto L6c
            r0.L$0 = r4
            r0.L$1 = r3
            r6 = 2
            r0.label = r6
            java.lang.Object r5 = r5.getClipEntry(r0)
            if (r5 != r2) goto L68
            return r2
        L68:
            androidx.compose.ui.platform.ClipEntry r5 = (androidx.compose.ui.platform.ClipEntry) r5
            if (r5 != 0) goto L6d
        L6c:
            goto Lb1
        L6d:
            r7 = r5
            androidx.compose.ui.platform.ClipMetadata r8 = r7.getClipMetadata()
            androidx.compose.foundation.content.ReceiveContentListener r2 = r3.getReceiveContentListener()
            androidx.compose.foundation.content.TransferableContent$Source$Companion r3 = androidx.compose.foundation.content.TransferableContent.Source.Companion
            int r9 = r3.m603getClipboardkB6V9T0()
            androidx.compose.foundation.content.TransferableContent r6 = new androidx.compose.foundation.content.TransferableContent
            r11 = 8
            r12 = 0
            r10 = 0
            r6.<init>(r7, r8, r9, r10, r11, r12)
            androidx.compose.foundation.content.TransferableContent r2 = r2.onReceive(r6)
            if (r2 == 0) goto Lad
            androidx.compose.ui.platform.ClipEntry r2 = r2.getClipEntry()
            if (r2 == 0) goto Lad
            java.lang.String r2 = androidx.compose.foundation.content.TransferableContent_androidKt.readPlainText(r2)
            if (r2 == 0) goto Lad
            r3 = 0
            androidx.compose.foundation.text.input.internal.TransformedTextFieldState r5 = r4.textFieldState
            r6 = r2
            java.lang.CharSequence r6 = (java.lang.CharSequence) r6
            androidx.compose.foundation.text.input.internal.undo.TextFieldEditUndoBehavior r8 = androidx.compose.foundation.text.input.internal.undo.TextFieldEditUndoBehavior.NeverMerge
            r10 = 10
            r11 = 0
            r7 = 0
            r9 = 0
            androidx.compose.foundation.text.input.internal.TransformedTextFieldState.replaceSelectedText$default(r5, r6, r7, r8, r9, r10, r11)
        Lad:
            kotlin.Unit r2 = kotlin.Unit.INSTANCE
            return r2
        Lb1:
            r3 = 0
            r0.L$0 = r3
            r0.L$1 = r3
            r3 = 3
            r0.label = r3
            java.lang.Object r3 = r4.pasteAsPlainText(r0)
            if (r3 != r2) goto Lc0
            return r2
        Lc0:
            kotlin.Unit r2 = kotlin.Unit.INSTANCE
            return r2
        Lc3:
            r3 = 1
            r0.label = r3
            java.lang.Object r3 = r4.pasteAsPlainText(r0)
            if (r3 != r2) goto Lcd
            return r2
        Lcd:
            kotlin.Unit r2 = kotlin.Unit.INSTANCE
            return r2
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.compose.foundation.text.input.internal.selection.TextFieldSelectionState.paste(kotlin.coroutines.Continuation):java.lang.Object");
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* JADX WARN: Removed duplicated region for block: B:10:0x0024  */
    /* JADX WARN: Removed duplicated region for block: B:12:0x002d  */
    /* JADX WARN: Removed duplicated region for block: B:13:0x0036  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object pasteAsPlainText(kotlin.coroutines.Continuation<? super kotlin.Unit> r12) {
        /*
            r11 = this;
            boolean r0 = r12 instanceof androidx.compose.foundation.text.input.internal.selection.TextFieldSelectionState$pasteAsPlainText$1
            if (r0 == 0) goto L14
            r0 = r12
            androidx.compose.foundation.text.input.internal.selection.TextFieldSelectionState$pasteAsPlainText$1 r0 = (androidx.compose.foundation.text.input.internal.selection.TextFieldSelectionState$pasteAsPlainText$1) r0
            int r1 = r0.label
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r1 = r1 & r2
            if (r1 == 0) goto L14
            int r1 = r0.label
            int r1 = r1 - r2
            r0.label = r1
            goto L19
        L14:
            androidx.compose.foundation.text.input.internal.selection.TextFieldSelectionState$pasteAsPlainText$1 r0 = new androidx.compose.foundation.text.input.internal.selection.TextFieldSelectionState$pasteAsPlainText$1
            r0.<init>(r11, r12)
        L19:
            java.lang.Object r1 = r0.result
            java.lang.Object r2 = kotlin.coroutines.intrinsics.IntrinsicsKt.getCOROUTINE_SUSPENDED()
            int r3 = r0.label
            switch(r3) {
                case 0: goto L36;
                case 1: goto L2d;
                default: goto L24;
            }
        L24:
            java.lang.IllegalStateException r0 = new java.lang.IllegalStateException
            java.lang.String r1 = "call to 'resume' before 'invoke' with coroutine"
            r0.<init>(r1)
            throw r0
        L2d:
            java.lang.Object r2 = r0.L$0
            androidx.compose.foundation.text.input.internal.selection.TextFieldSelectionState r2 = (androidx.compose.foundation.text.input.internal.selection.TextFieldSelectionState) r2
            kotlin.ResultKt.throwOnFailure(r1)
            r4 = r1
            goto L4b
        L36:
            kotlin.ResultKt.throwOnFailure(r1)
            r3 = r11
            androidx.compose.ui.platform.Clipboard r4 = r3.clipboard
            if (r4 == 0) goto L69
            r0.L$0 = r3
            r5 = 1
            r0.label = r5
            java.lang.Object r4 = r4.getClipEntry(r0)
            if (r4 != r2) goto L4a
            return r2
        L4a:
            r2 = r3
        L4b:
            androidx.compose.ui.platform.ClipEntry r4 = (androidx.compose.ui.platform.ClipEntry) r4
            if (r4 == 0) goto L69
            java.lang.String r3 = androidx.compose.foundation.internal.ClipboardUtils_androidKt.readText(r4)
            if (r3 != 0) goto L56
            goto L69
        L56:
            androidx.compose.foundation.text.input.internal.TransformedTextFieldState r4 = r2.textFieldState
            r5 = r3
            java.lang.CharSequence r5 = (java.lang.CharSequence) r5
            androidx.compose.foundation.text.input.internal.undo.TextFieldEditUndoBehavior r7 = androidx.compose.foundation.text.input.internal.undo.TextFieldEditUndoBehavior.NeverMerge
            r9 = 10
            r10 = 0
            r6 = 0
            r8 = 0
            androidx.compose.foundation.text.input.internal.TransformedTextFieldState.replaceSelectedText$default(r4, r5, r6, r7, r8, r9, r10)
            kotlin.Unit r4 = kotlin.Unit.INSTANCE
            return r4
        L69:
            kotlin.Unit r2 = kotlin.Unit.INSTANCE
            return r2
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.compose.foundation.text.input.internal.selection.TextFieldSelectionState.pasteAsPlainText(kotlin.coroutines.Continuation):java.lang.Object");
    }

    public final boolean canSelectAll() {
        return TextRange.m6335getLengthimpl(this.textFieldState.getVisualText().m1456getSelectiond9O1mEE()) != this.textFieldState.getVisualText().length();
    }

    public final void selectAll() {
        this.textFieldState.selectAll();
    }

    public final boolean canAutofill() {
        return getEditable() && TextRange.m6333getCollapsedimpl(this.textFieldState.getVisualText().m1456getSelectiond9O1mEE());
    }

    public final void autofill() {
        Function0<Unit> function0 = this.requestAutofillAction;
        if (function0 != null) {
            function0.invoke();
        }
    }

    public final void deselect() {
        if (!TextRange.m6333getCollapsedimpl(this.textFieldState.getVisualText().m1456getSelectiond9O1mEE())) {
            this.textFieldState.collapseSelectionToEnd();
        }
        setShowCursorHandle(false);
        updateTextToolbarState(TextToolbarState.None);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final void hideTextToolbar() {
        TextToolbarHandler textToolbarHandler = this.textToolbarHandler;
        if (textToolbarHandler != null) {
            textToolbarHandler.hideTextToolbar();
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: updateSelection-SsL-Rf8$default  reason: not valid java name */
    public static /* synthetic */ long m1632updateSelectionSsLRf8$default(TextFieldSelectionState textFieldSelectionState, TextFieldCharSequence textFieldCharSequence, int i, int i2, boolean z, SelectionAdjustment selectionAdjustment, boolean z2, boolean z3, int i3, Object obj) {
        if ((i3 & 32) != 0) {
            z2 = false;
        }
        if ((i3 & 64) != 0) {
            z3 = false;
        }
        return textFieldSelectionState.m1631updateSelectionSsLRf8(textFieldCharSequence, i, i2, z, selectionAdjustment, z2, z3);
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* JADX WARN: Code restructure failed: missing block: B:18:0x0061, code lost:
        if (androidx.compose.ui.text.TextRange.m6332equalsimpl0(r2, r13.m1456getSelectiond9O1mEE()) != false) goto L17;
     */
    /* renamed from: updateSelection-SsL-Rf8  reason: not valid java name */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final long m1631updateSelectionSsLRf8(androidx.compose.foundation.text.input.TextFieldCharSequence r13, int r14, int r15, boolean r16, androidx.compose.foundation.text.selection.SelectionAdjustment r17, boolean r18, boolean r19) {
        /*
            r12 = this;
            long r0 = r13.m1456getSelectiond9O1mEE()
            androidx.compose.ui.text.TextRange r0 = androidx.compose.ui.text.TextRange.m6327boximpl(r0)
            long r1 = r0.m6343unboximpl()
            r3 = 0
            r4 = 1
            r5 = 0
            if (r19 != 0) goto L1e
            if (r18 != 0) goto L1c
            boolean r6 = androidx.compose.ui.text.TextRange.m6333getCollapsedimpl(r1)
            if (r6 != 0) goto L1e
        L1c:
            r1 = r4
            goto L1f
        L1e:
            r1 = r5
        L1f:
            if (r1 == 0) goto L22
            goto L23
        L22:
            r0 = 0
        L23:
            r9 = r0
            r6 = r12
            r7 = r14
            r8 = r15
            r10 = r16
            r11 = r17
            long r0 = r6.m1627getTextFieldSelectionqeG_v_k(r7, r8, r9, r10, r11)
            long r2 = r13.m1456getSelectiond9O1mEE()
            boolean r2 = androidx.compose.ui.text.TextRange.m6332equalsimpl0(r0, r2)
            if (r2 == 0) goto L3d
            return r0
        L3d:
            boolean r2 = androidx.compose.ui.text.TextRange.m6338getReversedimpl(r0)
            long r7 = r13.m1456getSelectiond9O1mEE()
            boolean r3 = androidx.compose.ui.text.TextRange.m6338getReversedimpl(r7)
            if (r2 == r3) goto L64
            r2 = r0
            r7 = 0
            int r8 = androidx.compose.ui.text.TextRange.m6334getEndimpl(r2)
            int r9 = androidx.compose.ui.text.TextRange.m6339getStartimpl(r2)
            long r2 = androidx.compose.ui.text.TextRangeKt.TextRange(r8, r9)
            long r7 = r13.m1456getSelectiond9O1mEE()
            boolean r2 = androidx.compose.ui.text.TextRange.m6332equalsimpl0(r2, r7)
            if (r2 == 0) goto L64
            goto L65
        L64:
            r4 = r5
        L65:
            boolean r2 = r12.isInTouchMode()
            if (r2 == 0) goto L7b
            if (r4 != 0) goto L7b
            androidx.compose.ui.hapticfeedback.HapticFeedback r2 = r12.hapticFeedBack
            if (r2 == 0) goto L7b
            androidx.compose.ui.hapticfeedback.HapticFeedbackType$Companion r3 = androidx.compose.ui.hapticfeedback.HapticFeedbackType.Companion
            int r3 = r3.m5027getTextHandleMove5zf0vsI()
            r2.mo5011performHapticFeedbackCdsT49E(r3)
        L7b:
            return r0
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.compose.foundation.text.input.internal.selection.TextFieldSelectionState.m1631updateSelectionSsLRf8(androidx.compose.foundation.text.input.TextFieldCharSequence, int, int, boolean, androidx.compose.foundation.text.selection.SelectionAdjustment, boolean, boolean):long");
    }

    /* renamed from: getTextFieldSelection-qeG_v_k  reason: not valid java name */
    private final long m1627getTextFieldSelectionqeG_v_k(int rawStartOffset, int rawEndOffset, TextRange previousSelection, boolean isStartHandle, SelectionAdjustment adjustment) {
        TextLayoutResult layoutResult = this.textLayoutState.getLayoutResult();
        if (layoutResult == null) {
            return TextRange.Companion.m6344getZerod9O1mEE();
        }
        if (previousSelection == null && Intrinsics.areEqual(adjustment, SelectionAdjustment.Companion.getCharacter())) {
            return TextRangeKt.TextRange(rawStartOffset, rawEndOffset);
        }
        SelectionLayout selectionLayout = SelectionLayoutKt.m1719getTextFieldSelectionLayoutRcvTLA(layoutResult, rawStartOffset, rawEndOffset, this.previousRawDragOffset, previousSelection != null ? previousSelection.m6343unboximpl() : TextRange.Companion.m6344getZerod9O1mEE(), previousSelection == null, isStartHandle);
        if (previousSelection != null && !selectionLayout.shouldRecomputeSelection(this.previousSelectionLayout)) {
            return previousSelection.m6343unboximpl();
        }
        long result = adjustment.adjust(selectionLayout).m1708toTextRanged9O1mEE();
        this.previousSelectionLayout = selectionLayout;
        this.previousRawDragOffset = isStartHandle ? rawStartOffset : rawEndOffset;
        return result;
    }
}
