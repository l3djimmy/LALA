package androidx.compose.foundation.text.selection;

import androidx.collection.LongIntMapKt;
import androidx.collection.LongObjectMap;
import androidx.collection.LongObjectMapKt;
import androidx.collection.MutableLongIntMap;
import androidx.collection.MutableLongObjectMap;
import androidx.compose.foundation.FocusableKt;
import androidx.compose.foundation.gestures.ForEachGestureKt;
import androidx.compose.foundation.text.Handle;
import androidx.compose.foundation.text.TextDragObserver;
import androidx.compose.foundation.text.TextLayoutHelperKt;
import androidx.compose.foundation.text.input.internal.TextLayoutStateKt;
import androidx.compose.foundation.text.selection.Selection;
import androidx.compose.runtime.MutableState;
import androidx.compose.runtime.SnapshotStateKt__SnapshotStateKt;
import androidx.compose.runtime.State;
import androidx.compose.ui.Modifier;
import androidx.compose.ui.focus.FocusChangedModifierKt;
import androidx.compose.ui.focus.FocusRequester;
import androidx.compose.ui.focus.FocusRequesterModifierKt;
import androidx.compose.ui.focus.FocusState;
import androidx.compose.ui.geometry.InlineClassHelperKt;
import androidx.compose.ui.geometry.Offset;
import androidx.compose.ui.geometry.Rect;
import androidx.compose.ui.hapticfeedback.HapticFeedback;
import androidx.compose.ui.hapticfeedback.HapticFeedbackType;
import androidx.compose.ui.input.key.KeyEvent;
import androidx.compose.ui.input.key.KeyInputModifierKt;
import androidx.compose.ui.input.pointer.AwaitPointerEventScope;
import androidx.compose.ui.input.pointer.PointerInputEventHandler;
import androidx.compose.ui.input.pointer.PointerInputScope;
import androidx.compose.ui.input.pointer.SuspendingPointerInputFilterKt;
import androidx.compose.ui.layout.LayoutCoordinates;
import androidx.compose.ui.layout.LayoutCoordinatesKt;
import androidx.compose.ui.layout.OnGloballyPositionedModifierKt;
import androidx.compose.ui.platform.TextToolbar;
import androidx.compose.ui.platform.TextToolbarStatus;
import androidx.compose.ui.text.AnnotatedString;
import androidx.compose.ui.text.TextLayoutResult;
import androidx.compose.ui.text.TextRange;
import androidx.constraintlayout.core.motion.utils.TypedValues;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import kotlin.KotlinNothingValueException;
import kotlin.Metadata;
import kotlin.Pair;
import kotlin.TuplesKt;
import kotlin.Unit;
import kotlin.comparisons.ComparisonsKt;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.IntrinsicsKt;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.coroutines.jvm.internal.RestrictedSuspendLambda;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.functions.Function4;
import kotlin.jvm.functions.Function6;
import kotlin.jvm.internal.Intrinsics;
/* compiled from: SelectionManager.kt */
@Metadata(d1 = {"\u0000¸\u0001\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0018\u0002\n\u0002\b\u0011\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0010\u0007\n\u0002\b\u0007\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\b\u000e\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\b\n\n\u0002\u0018\u0002\n\u0002\b\u0017\n\u0002\u0018\u0002\n\u0002\b\f\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\t\n\u0002\u0018\u0002\n\u0002\b\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\t\n\u0002\b\u000b\n\u0002\u0018\u0002\n\u0002\b\r\n\u0002\u0018\u0002\n\u0000\b\u0000\u0018\u00002\u00020\u0001B\r\u0012\u0006\u0010\u0002\u001a\u00020\u0003¢\u0006\u0002\u0010\u0004J\"\u0010w\u001a\u00020\u00122\u0006\u0010x\u001a\u00020\u000b2\u0006\u0010y\u001a\u00020\u0012H\u0002ø\u0001\u0000¢\u0006\u0004\bz\u0010{J\r\u0010|\u001a\u00020OH\u0000¢\u0006\u0002\b}J\u001a\u0010~\u001a\u0004\u0018\u00010\u007f2\b\u0010\u0080\u0001\u001a\u00030\u0081\u0001H\u0000¢\u0006\u0003\b\u0082\u0001J\f\u0010\u0083\u0001\u001a\u0005\u0018\u00010\u0084\u0001H\u0002J\u0011\u0010\u0085\u0001\u001a\u0004\u0018\u00010NH\u0000¢\u0006\u0003\b\u0086\u0001J2\u0010\u0087\u0001\u001a\u0004\u0018\u00010Z2\u0007\u0010\u0088\u0001\u001a\u00020\u00122\u0007\u0010\u0089\u0001\u001a\u00020\u00122\u0007\u0010\u008a\u0001\u001a\u00020\u0007H\u0002ø\u0001\u0000¢\u0006\u0006\b\u008b\u0001\u0010\u008c\u0001J\u0011\u0010\u008d\u0001\u001a\u00030\u008e\u00012\u0007\u0010\u008a\u0001\u001a\u00020\u0007J\u000f\u0010\u008f\u0001\u001a\u00020\u0007H\u0000¢\u0006\u0003\b\u0090\u0001J\u000f\u0010\u0091\u0001\u001a\u00020\u0007H\u0000¢\u0006\u0003\b\u0092\u0001J\u000f\u0010\u0093\u0001\u001a\u00020\u0007H\u0000¢\u0006\u0003\b\u0094\u0001J\u0007\u0010\u0095\u0001\u001a\u00020OJ\u000f\u0010\u0096\u0001\u001a\u00020\u000bH\u0000¢\u0006\u0003\b\u0097\u0001J\u000f\u0010\u0098\u0001\u001a\u00020OH\u0000¢\u0006\u0003\b\u0099\u0001J:\u0010\u009a\u0001\u001a\u0018\u0012\u0006\u0012\u0004\u0018\u00010\t\u0012\u000b\u0012\t\u0012\u0004\u0012\u00020\t0\u009c\u00010\u009b\u00012\b\u0010\u009d\u0001\u001a\u00030\u009e\u00012\t\u0010\u009f\u0001\u001a\u0004\u0018\u00010\tH\u0000¢\u0006\u0003\b \u0001J\u001b\u0010¡\u0001\u001a\u00020O2\u0007\u0010\u0088\u0001\u001a\u00020\u0012ø\u0001\u0000¢\u0006\u0005\b¢\u0001\u0010\u001eJ\u001b\u0010£\u0001\u001a\u00020O2\u0007\u0010¤\u0001\u001a\u00020Z2\u0007\u0010¥\u0001\u001a\u00020\tH\u0002J\u000f\u0010¦\u0001\u001a\u00020\u0007H\u0001¢\u0006\u0003\b§\u0001J1\u0010¨\u0001\u001a\u00020O2\u0007\u0010\u0088\u0001\u001a\u00020\u00122\u0007\u0010\u008a\u0001\u001a\u00020\u00072\b\u0010©\u0001\u001a\u00030ª\u0001H\u0002ø\u0001\u0000¢\u0006\u0006\b«\u0001\u0010¬\u0001J\t\u0010\u00ad\u0001\u001a\u00020OH\u0002J\t\u0010®\u0001\u001a\u00020OH\u0002J:\u0010¯\u0001\u001a\u00020\u00072\u0007\u0010\u0088\u0001\u001a\u00020\u00122\u0007\u0010\u0089\u0001\u001a\u00020\u00122\u0007\u0010\u008a\u0001\u001a\u00020\u00072\b\u0010©\u0001\u001a\u00030ª\u0001H\u0000ø\u0001\u0000¢\u0006\u0006\b°\u0001\u0010±\u0001J;\u0010¯\u0001\u001a\u00020\u00072\t\u0010²\u0001\u001a\u0004\u0018\u00010\u00122\u0006\u0010X\u001a\u00020\u00122\u0007\u0010\u008a\u0001\u001a\u00020\u00072\b\u0010©\u0001\u001a\u00030ª\u0001H\u0000ø\u0001\u0000¢\u0006\u0006\b³\u0001\u0010´\u0001J\t\u0010µ\u0001\u001a\u00020OH\u0002J\u001d\u0010¶\u0001\u001a\u00020I*\u00020I2\u000e\u0010·\u0001\u001a\t\u0012\u0004\u0012\u00020O0¸\u0001H\u0002R\u0014\u0010\u0005\u001a\b\u0012\u0004\u0012\u00020\u00070\u0006X\u0082\u0004¢\u0006\u0002\n\u0000R\u0016\u0010\b\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\t0\u0006X\u0082\u0004¢\u0006\u0002\n\u0000R(\u0010\f\u001a\u0004\u0018\u00010\u000b2\b\u0010\n\u001a\u0004\u0018\u00010\u000b@FX\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b\r\u0010\u000e\"\u0004\b\u000f\u0010\u0010R5\u0010\u0013\u001a\u0004\u0018\u00010\u00122\b\u0010\u0011\u001a\u0004\u0018\u00010\u00128F@BX\u0086\u008e\u0002ø\u0001\u0000ø\u0001\u0001¢\u0006\u0012\n\u0004\b\u0018\u0010\u0019\u001a\u0004\b\u0014\u0010\u0015\"\u0004\b\u0016\u0010\u0017R1\u0010\u001a\u001a\u00020\u00122\u0006\u0010\u0011\u001a\u00020\u00128@@BX\u0080\u008e\u0002ø\u0001\u0000ø\u0001\u0001¢\u0006\u0012\n\u0004\b\u001f\u0010\u0019\u001a\u0004\b\u001b\u0010\u001c\"\u0004\b\u001d\u0010\u001eR1\u0010 \u001a\u00020\u00122\u0006\u0010\u0011\u001a\u00020\u00128@@BX\u0080\u008e\u0002ø\u0001\u0000ø\u0001\u0001¢\u0006\u0012\n\u0004\b#\u0010\u0019\u001a\u0004\b!\u0010\u001c\"\u0004\b\"\u0010\u001eR/\u0010%\u001a\u0004\u0018\u00010$2\b\u0010\u0011\u001a\u0004\u0018\u00010$8F@BX\u0086\u008e\u0002¢\u0006\u0012\n\u0004\b*\u0010\u0019\u001a\u0004\b&\u0010'\"\u0004\b(\u0010)R\u0011\u0010+\u001a\u00020,8F¢\u0006\u0006\u001a\u0004\b-\u0010.R5\u0010/\u001a\u0004\u0018\u00010\u00122\b\u0010\u0011\u001a\u0004\u0018\u00010\u00128F@BX\u0086\u008e\u0002ø\u0001\u0000ø\u0001\u0001¢\u0006\u0012\n\u0004\b2\u0010\u0019\u001a\u0004\b0\u0010\u0015\"\u0004\b1\u0010\u0017R\u001a\u00103\u001a\u000204X\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b5\u00106\"\u0004\b7\u00108R\u001c\u00109\u001a\u0004\u0018\u00010:X\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b;\u0010<\"\u0004\b=\u0010>R+\u0010?\u001a\u00020\u00072\u0006\u0010\u0011\u001a\u00020\u00078F@FX\u0086\u008e\u0002¢\u0006\u0012\n\u0004\bD\u0010\u0019\u001a\u0004\b@\u0010A\"\u0004\bB\u0010CR\u0014\u0010E\u001a\u00020\u00078BX\u0082\u0004¢\u0006\u0006\u001a\u0004\bE\u0010AR$\u0010F\u001a\u00020\u00072\u0006\u0010\n\u001a\u00020\u00078F@FX\u0086\u000e¢\u0006\f\u001a\u0004\bF\u0010A\"\u0004\bG\u0010CR\u0011\u0010H\u001a\u00020I8F¢\u0006\u0006\u001a\u0004\bJ\u0010KR(\u0010L\u001a\u0010\u0012\u0004\u0012\u00020N\u0012\u0004\u0012\u00020O\u0018\u00010MX\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\bP\u0010Q\"\u0004\bR\u0010SR@\u0010U\u001a\u0010\u0012\u0006\u0012\u0004\u0018\u00010\t\u0012\u0004\u0012\u00020O0M2\u0014\u0010T\u001a\u0010\u0012\u0006\u0012\u0004\u0018\u00010\t\u0012\u0004\u0012\u00020O0M@FX\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\bV\u0010Q\"\u0004\bW\u0010SR\u0016\u0010X\u001a\u0004\u0018\u00010\u0012X\u0082\u000eø\u0001\u0000ø\u0001\u0001¢\u0006\u0002\n\u0000R&\u0010Y\u001a\u0004\u0018\u00010Z8\u0000@\u0000X\u0081\u000e¢\u0006\u0014\n\u0000\u0012\u0004\b[\u0010\\\u001a\u0004\b]\u0010^\"\u0004\b_\u0010`R(\u0010a\u001a\u0004\u0018\u00010\t2\b\u0010\n\u001a\u0004\u0018\u00010\t8F@FX\u0086\u000e¢\u0006\f\u001a\u0004\bb\u0010c\"\u0004\bd\u0010eR\u000e\u0010\u0002\u001a\u00020\u0003X\u0082\u0004¢\u0006\u0002\n\u0000R\u0014\u0010f\u001a\u00020\u00078BX\u0082\u0004¢\u0006\u0006\u001a\u0004\bg\u0010AR$\u0010h\u001a\u00020\u00072\u0006\u0010\n\u001a\u00020\u0007@@X\u0080\u000e¢\u0006\u000e\n\u0000\u001a\u0004\bi\u0010A\"\u0004\bj\u0010CR\u0011\u0010k\u001a\u00020,8F¢\u0006\u0006\u001a\u0004\bl\u0010.R5\u0010m\u001a\u0004\u0018\u00010\u00122\b\u0010\u0011\u001a\u0004\u0018\u00010\u00128F@BX\u0086\u008e\u0002ø\u0001\u0000ø\u0001\u0001¢\u0006\u0012\n\u0004\bp\u0010\u0019\u001a\u0004\bn\u0010\u0015\"\u0004\bo\u0010\u0017R\u001c\u0010q\u001a\u0004\u0018\u00010rX\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\bs\u0010t\"\u0004\bu\u0010v\u0082\u0002\u000b\n\u0005\b¡\u001e0\u0001\n\u0002\b!¨\u0006¹\u0001"}, d2 = {"Landroidx/compose/foundation/text/selection/SelectionManager;", "", "selectionRegistrar", "Landroidx/compose/foundation/text/selection/SelectionRegistrarImpl;", "(Landroidx/compose/foundation/text/selection/SelectionRegistrarImpl;)V", "_isInTouchMode", "Landroidx/compose/runtime/MutableState;", "", "_selection", "Landroidx/compose/foundation/text/selection/Selection;", "value", "Landroidx/compose/ui/layout/LayoutCoordinates;", "containerLayoutCoordinates", "getContainerLayoutCoordinates", "()Landroidx/compose/ui/layout/LayoutCoordinates;", "setContainerLayoutCoordinates", "(Landroidx/compose/ui/layout/LayoutCoordinates;)V", "<set-?>", "Landroidx/compose/ui/geometry/Offset;", "currentDragPosition", "getCurrentDragPosition-_m7T9-E", "()Landroidx/compose/ui/geometry/Offset;", "setCurrentDragPosition-_kEHs6E", "(Landroidx/compose/ui/geometry/Offset;)V", "currentDragPosition$delegate", "Landroidx/compose/runtime/MutableState;", "dragBeginPosition", "getDragBeginPosition-F1C5BW0$foundation_release", "()J", "setDragBeginPosition-k-4lQ0M", "(J)V", "dragBeginPosition$delegate", "dragTotalDistance", "getDragTotalDistance-F1C5BW0$foundation_release", "setDragTotalDistance-k-4lQ0M", "dragTotalDistance$delegate", "Landroidx/compose/foundation/text/Handle;", "draggingHandle", "getDraggingHandle", "()Landroidx/compose/foundation/text/Handle;", "setDraggingHandle", "(Landroidx/compose/foundation/text/Handle;)V", "draggingHandle$delegate", "endHandleLineHeight", "", "getEndHandleLineHeight", "()F", "endHandlePosition", "getEndHandlePosition-_m7T9-E", "setEndHandlePosition-_kEHs6E", "endHandlePosition$delegate", "focusRequester", "Landroidx/compose/ui/focus/FocusRequester;", "getFocusRequester", "()Landroidx/compose/ui/focus/FocusRequester;", "setFocusRequester", "(Landroidx/compose/ui/focus/FocusRequester;)V", "hapticFeedBack", "Landroidx/compose/ui/hapticfeedback/HapticFeedback;", "getHapticFeedBack", "()Landroidx/compose/ui/hapticfeedback/HapticFeedback;", "setHapticFeedBack", "(Landroidx/compose/ui/hapticfeedback/HapticFeedback;)V", "hasFocus", "getHasFocus", "()Z", "setHasFocus", "(Z)V", "hasFocus$delegate", "isDraggingInProgress", "isInTouchMode", "setInTouchMode", "modifier", "Landroidx/compose/ui/Modifier;", "getModifier", "()Landroidx/compose/ui/Modifier;", "onCopyHandler", "Lkotlin/Function1;", "Landroidx/compose/ui/text/AnnotatedString;", "", "getOnCopyHandler", "()Lkotlin/jvm/functions/Function1;", "setOnCopyHandler", "(Lkotlin/jvm/functions/Function1;)V", "newOnSelectionChange", "onSelectionChange", "getOnSelectionChange", "setOnSelectionChange", "previousPosition", "previousSelectionLayout", "Landroidx/compose/foundation/text/selection/SelectionLayout;", "getPreviousSelectionLayout$foundation_release$annotations", "()V", "getPreviousSelectionLayout$foundation_release", "()Landroidx/compose/foundation/text/selection/SelectionLayout;", "setPreviousSelectionLayout$foundation_release", "(Landroidx/compose/foundation/text/selection/SelectionLayout;)V", "selection", "getSelection", "()Landroidx/compose/foundation/text/selection/Selection;", "setSelection", "(Landroidx/compose/foundation/text/selection/Selection;)V", "shouldShowMagnifier", "getShouldShowMagnifier", "showToolbar", "getShowToolbar$foundation_release", "setShowToolbar$foundation_release", "startHandleLineHeight", "getStartHandleLineHeight", "startHandlePosition", "getStartHandlePosition-_m7T9-E", "setStartHandlePosition-_kEHs6E", "startHandlePosition$delegate", "textToolbar", "Landroidx/compose/ui/platform/TextToolbar;", "getTextToolbar", "()Landroidx/compose/ui/platform/TextToolbar;", "setTextToolbar", "(Landroidx/compose/ui/platform/TextToolbar;)V", "convertToContainerCoordinates", "layoutCoordinates", TypedValues.CycleType.S_WAVE_OFFSET, "convertToContainerCoordinates-R5De75A", "(Landroidx/compose/ui/layout/LayoutCoordinates;J)J", "copy", "copy$foundation_release", "getAnchorSelectable", "Landroidx/compose/foundation/text/selection/Selectable;", "anchor", "Landroidx/compose/foundation/text/selection/Selection$AnchorInfo;", "getAnchorSelectable$foundation_release", "getContentRect", "Landroidx/compose/ui/geometry/Rect;", "getSelectedText", "getSelectedText$foundation_release", "getSelectionLayout", "position", "previousHandlePosition", "isStartHandle", "getSelectionLayout-Wko1d7g", "(JJZ)Landroidx/compose/foundation/text/selection/SelectionLayout;", "handleDragObserver", "Landroidx/compose/foundation/text/TextDragObserver;", "isEntireContainerSelected", "isEntireContainerSelected$foundation_release", "isNonEmptySelection", "isNonEmptySelection$foundation_release", "isTriviallyCollapsedSelection", "isTriviallyCollapsedSelection$foundation_release", "onRelease", "requireContainerCoordinates", "requireContainerCoordinates$foundation_release", "selectAll", "selectAll$foundation_release", "selectAllInSelectable", "Lkotlin/Pair;", "Landroidx/collection/LongObjectMap;", "selectableId", "", "previousSelection", "selectAllInSelectable$foundation_release", "selectWordAtPositionIfNotAlreadySelected", "selectWordAtPositionIfNotAlreadySelected-k-4lQ0M", "selectionChanged", "selectionLayout", "newSelection", "shouldPerformHaptics", "shouldPerformHaptics$foundation_release", "startSelection", "adjustment", "Landroidx/compose/foundation/text/selection/SelectionAdjustment;", "startSelection-9KIMszo", "(JZLandroidx/compose/foundation/text/selection/SelectionAdjustment;)V", "toolbarCopy", "updateHandleOffsets", "updateSelection", "updateSelection-jyLRC_s$foundation_release", "(JJZLandroidx/compose/foundation/text/selection/SelectionAdjustment;)Z", "newPosition", "updateSelection-qNKwrvQ$foundation_release", "(Landroidx/compose/ui/geometry/Offset;JZLandroidx/compose/foundation/text/selection/SelectionAdjustment;)Z", "updateSelectionToolbar", "onClearSelectionRequested", "block", "Lkotlin/Function0;", "foundation_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes.dex */
public final class SelectionManager {
    public static final int $stable = 8;
    private final MutableState<Boolean> _isInTouchMode;
    private final MutableState<Selection> _selection;
    private LayoutCoordinates containerLayoutCoordinates;
    private final MutableState currentDragPosition$delegate;
    private final MutableState dragBeginPosition$delegate;
    private final MutableState dragTotalDistance$delegate;
    private final MutableState draggingHandle$delegate;
    private final MutableState endHandlePosition$delegate;
    private FocusRequester focusRequester;
    private HapticFeedback hapticFeedBack;
    private final MutableState hasFocus$delegate;
    private Function1<? super AnnotatedString, Unit> onCopyHandler;
    private Function1<? super Selection, Unit> onSelectionChange;
    private Offset previousPosition;
    private SelectionLayout previousSelectionLayout;
    private final SelectionRegistrarImpl selectionRegistrar;
    private boolean showToolbar;
    private final MutableState startHandlePosition$delegate;
    private TextToolbar textToolbar;

    public static /* synthetic */ void getPreviousSelectionLayout$foundation_release$annotations() {
    }

    public SelectionManager(SelectionRegistrarImpl selectionRegistrar) {
        MutableState<Selection> mutableStateOf$default;
        MutableState<Boolean> mutableStateOf$default2;
        MutableState mutableStateOf$default3;
        MutableState mutableStateOf$default4;
        MutableState mutableStateOf$default5;
        MutableState mutableStateOf$default6;
        MutableState mutableStateOf$default7;
        MutableState mutableStateOf$default8;
        MutableState mutableStateOf$default9;
        this.selectionRegistrar = selectionRegistrar;
        mutableStateOf$default = SnapshotStateKt__SnapshotStateKt.mutableStateOf$default(null, null, 2, null);
        this._selection = mutableStateOf$default;
        mutableStateOf$default2 = SnapshotStateKt__SnapshotStateKt.mutableStateOf$default(true, null, 2, null);
        this._isInTouchMode = mutableStateOf$default2;
        this.onSelectionChange = new Function1<Selection, Unit>() { // from class: androidx.compose.foundation.text.selection.SelectionManager$onSelectionChange$1
            /* JADX INFO: Access modifiers changed from: package-private */
            {
                super(1);
            }

            @Override // kotlin.jvm.functions.Function1
            public /* bridge */ /* synthetic */ Unit invoke(Selection selection) {
                invoke2(selection);
                return Unit.INSTANCE;
            }

            /* renamed from: invoke  reason: avoid collision after fix types in other method */
            public final void invoke2(Selection it) {
                SelectionManager.this.setSelection(it);
            }
        };
        this.focusRequester = new FocusRequester();
        mutableStateOf$default3 = SnapshotStateKt__SnapshotStateKt.mutableStateOf$default(false, null, 2, null);
        this.hasFocus$delegate = mutableStateOf$default3;
        mutableStateOf$default4 = SnapshotStateKt__SnapshotStateKt.mutableStateOf$default(Offset.m4037boximpl(Offset.Companion.m4064getZeroF1C5BW0()), null, 2, null);
        this.dragBeginPosition$delegate = mutableStateOf$default4;
        mutableStateOf$default5 = SnapshotStateKt__SnapshotStateKt.mutableStateOf$default(Offset.m4037boximpl(Offset.Companion.m4064getZeroF1C5BW0()), null, 2, null);
        this.dragTotalDistance$delegate = mutableStateOf$default5;
        mutableStateOf$default6 = SnapshotStateKt__SnapshotStateKt.mutableStateOf$default(null, null, 2, null);
        this.startHandlePosition$delegate = mutableStateOf$default6;
        mutableStateOf$default7 = SnapshotStateKt__SnapshotStateKt.mutableStateOf$default(null, null, 2, null);
        this.endHandlePosition$delegate = mutableStateOf$default7;
        mutableStateOf$default8 = SnapshotStateKt__SnapshotStateKt.mutableStateOf$default(null, null, 2, null);
        this.draggingHandle$delegate = mutableStateOf$default8;
        mutableStateOf$default9 = SnapshotStateKt__SnapshotStateKt.mutableStateOf$default(null, null, 2, null);
        this.currentDragPosition$delegate = mutableStateOf$default9;
        this.selectionRegistrar.setOnPositionChangeCallback$foundation_release(new Function1<Long, Unit>() { // from class: androidx.compose.foundation.text.selection.SelectionManager.1
            {
                super(1);
            }

            @Override // kotlin.jvm.functions.Function1
            public /* bridge */ /* synthetic */ Unit invoke(Long l) {
                invoke(l.longValue());
                return Unit.INSTANCE;
            }

            public final void invoke(long selectableId) {
                LongObjectMap this_$iv = SelectionManager.this.selectionRegistrar.getSubselections();
                if (this_$iv.containsKey(selectableId)) {
                    SelectionManager.this.updateHandleOffsets();
                    SelectionManager.this.updateSelectionToolbar();
                }
            }
        });
        this.selectionRegistrar.setOnSelectionUpdateStartCallback$foundation_release(new Function4<Boolean, LayoutCoordinates, Offset, SelectionAdjustment, Unit>() { // from class: androidx.compose.foundation.text.selection.SelectionManager.2
            {
                super(4);
            }

            @Override // kotlin.jvm.functions.Function4
            public /* bridge */ /* synthetic */ Unit invoke(Boolean bool, LayoutCoordinates layoutCoordinates, Offset offset, SelectionAdjustment selectionAdjustment) {
                m1748invokeRg1IO4c(bool.booleanValue(), layoutCoordinates, offset.m4058unboximpl(), selectionAdjustment);
                return Unit.INSTANCE;
            }

            /* renamed from: invoke-Rg1IO4c  reason: not valid java name */
            public final void m1748invokeRg1IO4c(boolean isInTouchMode, LayoutCoordinates layoutCoordinates, long rawPosition, SelectionAdjustment selectionMode) {
                long $this$invoke_Rg1IO4c_u24lambda_u240 = layoutCoordinates.mo5645getSizeYbymL2g();
                Rect textRect = new Rect(0.0f, 0.0f, (int) ($this$invoke_Rg1IO4c_u24lambda_u240 >> 32), (int) (4294967295L & $this$invoke_Rg1IO4c_u24lambda_u240));
                long position = SelectionManagerKt.m1752containsInclusiveUv8p0NA(textRect, rawPosition) ? rawPosition : TextLayoutStateKt.m1571coerceIn3MmeM6k(rawPosition, textRect);
                long positionInContainer = SelectionManager.this.m1732convertToContainerCoordinatesR5De75A(layoutCoordinates, position);
                if (((9223372034707292159L & positionInContainer) != InlineClassHelperKt.UnspecifiedPackedFloats ? 1 : 0) != 0) {
                    SelectionManager.this.setInTouchMode(isInTouchMode);
                    SelectionManager.this.m1739startSelection9KIMszo(positionInContainer, false, selectionMode);
                    FocusRequester.m3959requestFocus3ESFkO8$default(SelectionManager.this.getFocusRequester(), 0, 1, null);
                    SelectionManager.this.setShowToolbar$foundation_release(false);
                }
            }
        });
        this.selectionRegistrar.setOnSelectionUpdateSelectAll$foundation_release(new Function2<Boolean, Long, Unit>() { // from class: androidx.compose.foundation.text.selection.SelectionManager.3
            {
                super(2);
            }

            @Override // kotlin.jvm.functions.Function2
            public /* bridge */ /* synthetic */ Unit invoke(Boolean bool, Long l) {
                invoke(bool.booleanValue(), l.longValue());
                return Unit.INSTANCE;
            }

            public final void invoke(boolean isInTouchMode, long selectableId) {
                Pair<Selection, LongObjectMap<Selection>> selectAllInSelectable$foundation_release = SelectionManager.this.selectAllInSelectable$foundation_release(selectableId, SelectionManager.this.getSelection());
                Selection newSelection = selectAllInSelectable$foundation_release.component1();
                LongObjectMap newSubselection = selectAllInSelectable$foundation_release.component2();
                if (!Intrinsics.areEqual(newSelection, SelectionManager.this.getSelection())) {
                    SelectionManager.this.selectionRegistrar.setSubselections(newSubselection);
                    SelectionManager.this.getOnSelectionChange().invoke(newSelection);
                }
                SelectionManager.this.setInTouchMode(isInTouchMode);
                FocusRequester.m3959requestFocus3ESFkO8$default(SelectionManager.this.getFocusRequester(), 0, 1, null);
                SelectionManager.this.setShowToolbar$foundation_release(false);
            }
        });
        this.selectionRegistrar.setOnSelectionUpdateCallback$foundation_release(new Function6<Boolean, LayoutCoordinates, Offset, Offset, Boolean, SelectionAdjustment, Boolean>() { // from class: androidx.compose.foundation.text.selection.SelectionManager.4
            {
                super(6);
            }

            @Override // kotlin.jvm.functions.Function6
            public /* bridge */ /* synthetic */ Boolean invoke(Boolean bool, LayoutCoordinates layoutCoordinates, Offset offset, Offset offset2, Boolean bool2, SelectionAdjustment selectionAdjustment) {
                return m1749invokepGV3PM0(bool.booleanValue(), layoutCoordinates, offset.m4058unboximpl(), offset2.m4058unboximpl(), bool2.booleanValue(), selectionAdjustment);
            }

            /* renamed from: invoke-pGV3PM0  reason: not valid java name */
            public final Boolean m1749invokepGV3PM0(boolean isInTouchMode, LayoutCoordinates layoutCoordinates, long newPosition, long previousPosition, boolean isStartHandle, SelectionAdjustment selectionMode) {
                long newPositionInContainer = SelectionManager.this.m1732convertToContainerCoordinatesR5De75A(layoutCoordinates, newPosition);
                long previousPositionInContainer = SelectionManager.this.m1732convertToContainerCoordinatesR5De75A(layoutCoordinates, previousPosition);
                SelectionManager.this.setInTouchMode(isInTouchMode);
                return Boolean.valueOf(SelectionManager.this.m1747updateSelectionqNKwrvQ$foundation_release(Offset.m4037boximpl(newPositionInContainer), previousPositionInContainer, isStartHandle, selectionMode));
            }
        });
        this.selectionRegistrar.setOnSelectionUpdateEndCallback$foundation_release(new Function0<Unit>() { // from class: androidx.compose.foundation.text.selection.SelectionManager.5
            {
                super(0);
            }

            @Override // kotlin.jvm.functions.Function0
            public /* bridge */ /* synthetic */ Unit invoke() {
                invoke2();
                return Unit.INSTANCE;
            }

            /* renamed from: invoke  reason: avoid collision after fix types in other method */
            public final void invoke2() {
                SelectionManager.this.setShowToolbar$foundation_release(true);
                SelectionManager.this.setDraggingHandle(null);
                SelectionManager.this.m1734setCurrentDragPosition_kEHs6E(null);
            }
        });
        this.selectionRegistrar.setOnSelectableChangeCallback$foundation_release(new Function1<Long, Unit>() { // from class: androidx.compose.foundation.text.selection.SelectionManager.6
            {
                super(1);
            }

            @Override // kotlin.jvm.functions.Function1
            public /* bridge */ /* synthetic */ Unit invoke(Long l) {
                invoke(l.longValue());
                return Unit.INSTANCE;
            }

            public final void invoke(long selectableKey) {
                LongObjectMap this_$iv = SelectionManager.this.selectionRegistrar.getSubselections();
                if (this_$iv.containsKey(selectableKey)) {
                    SelectionManager.this.onRelease();
                    SelectionManager.this.setSelection(null);
                }
            }
        });
        this.selectionRegistrar.setAfterSelectableUnsubscribe$foundation_release(new Function1<Long, Unit>() { // from class: androidx.compose.foundation.text.selection.SelectionManager.7
            {
                super(1);
            }

            @Override // kotlin.jvm.functions.Function1
            public /* bridge */ /* synthetic */ Unit invoke(Long l) {
                invoke(l.longValue());
                return Unit.INSTANCE;
            }

            public final void invoke(long selectableId) {
                Selection.AnchorInfo end;
                Selection.AnchorInfo start;
                Selection selection = SelectionManager.this.getSelection();
                boolean z = true;
                if ((selection == null || (start = selection.getStart()) == null || selectableId != start.getSelectableId()) ? false : true) {
                    SelectionManager.this.m1738setStartHandlePosition_kEHs6E(null);
                }
                Selection selection2 = SelectionManager.this.getSelection();
                if (selection2 == null || (end = selection2.getEnd()) == null || selectableId != end.getSelectableId()) {
                    z = false;
                }
                if (z) {
                    SelectionManager.this.m1737setEndHandlePosition_kEHs6E(null);
                }
                LongObjectMap this_$iv = SelectionManager.this.selectionRegistrar.getSubselections();
                if (this_$iv.containsKey(selectableId)) {
                    SelectionManager.this.updateSelectionToolbar();
                }
            }
        });
    }

    public final Selection getSelection() {
        return this._selection.getValue();
    }

    public final void setSelection(Selection value) {
        this._selection.setValue(value);
        if (value != null) {
            updateHandleOffsets();
        }
    }

    public final boolean isInTouchMode() {
        return this._isInTouchMode.getValue().booleanValue();
    }

    public final void setInTouchMode(boolean value) {
        if (this._isInTouchMode.getValue().booleanValue() != value) {
            this._isInTouchMode.setValue(Boolean.valueOf(value));
            updateSelectionToolbar();
        }
    }

    public final Function1<Selection, Unit> getOnSelectionChange() {
        return this.onSelectionChange;
    }

    public final void setOnSelectionChange(final Function1<? super Selection, Unit> function1) {
        this.onSelectionChange = new Function1<Selection, Unit>() { // from class: androidx.compose.foundation.text.selection.SelectionManager$onSelectionChange$2
            /* JADX INFO: Access modifiers changed from: package-private */
            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            /* JADX WARN: Multi-variable type inference failed */
            {
                super(1);
            }

            @Override // kotlin.jvm.functions.Function1
            public /* bridge */ /* synthetic */ Unit invoke(Selection selection) {
                invoke2(selection);
                return Unit.INSTANCE;
            }

            /* renamed from: invoke  reason: avoid collision after fix types in other method */
            public final void invoke2(Selection newSelection) {
                SelectionManager.this.setSelection(newSelection);
                function1.invoke(newSelection);
            }
        };
    }

    public final HapticFeedback getHapticFeedBack() {
        return this.hapticFeedBack;
    }

    public final void setHapticFeedBack(HapticFeedback hapticFeedback) {
        this.hapticFeedBack = hapticFeedback;
    }

    public final Function1<AnnotatedString, Unit> getOnCopyHandler() {
        return this.onCopyHandler;
    }

    public final void setOnCopyHandler(Function1<? super AnnotatedString, Unit> function1) {
        this.onCopyHandler = function1;
    }

    public final TextToolbar getTextToolbar() {
        return this.textToolbar;
    }

    public final void setTextToolbar(TextToolbar textToolbar) {
        this.textToolbar = textToolbar;
    }

    public final FocusRequester getFocusRequester() {
        return this.focusRequester;
    }

    public final void setFocusRequester(FocusRequester focusRequester) {
        this.focusRequester = focusRequester;
    }

    public final boolean getHasFocus() {
        State $this$getValue$iv = this.hasFocus$delegate;
        return ((Boolean) $this$getValue$iv.getValue()).booleanValue();
    }

    public final void setHasFocus(boolean z) {
        MutableState $this$setValue$iv = this.hasFocus$delegate;
        $this$setValue$iv.setValue(Boolean.valueOf(z));
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final boolean isDraggingInProgress() {
        return getDraggingHandle() != null;
    }

    public final Modifier getModifier() {
        return KeyInputModifierKt.onKeyEvent(SelectionGesturesKt.updateSelectionTouchMode(FocusableKt.focusable$default(FocusChangedModifierKt.onFocusChanged(FocusRequesterModifierKt.focusRequester(OnGloballyPositionedModifierKt.onGloballyPositioned(onClearSelectionRequested(Modifier.Companion, new Function0<Unit>() { // from class: androidx.compose.foundation.text.selection.SelectionManager$modifier$1
            /* JADX INFO: Access modifiers changed from: package-private */
            {
                super(0);
            }

            @Override // kotlin.jvm.functions.Function0
            public /* bridge */ /* synthetic */ Unit invoke() {
                invoke2();
                return Unit.INSTANCE;
            }

            /* renamed from: invoke  reason: avoid collision after fix types in other method */
            public final void invoke2() {
                SelectionManager.this.onRelease();
            }
        }), new Function1<LayoutCoordinates, Unit>() { // from class: androidx.compose.foundation.text.selection.SelectionManager$modifier$2
            /* JADX INFO: Access modifiers changed from: package-private */
            {
                super(1);
            }

            @Override // kotlin.jvm.functions.Function1
            public /* bridge */ /* synthetic */ Unit invoke(LayoutCoordinates layoutCoordinates) {
                invoke2(layoutCoordinates);
                return Unit.INSTANCE;
            }

            /* renamed from: invoke  reason: avoid collision after fix types in other method */
            public final void invoke2(LayoutCoordinates it) {
                SelectionManager.this.setContainerLayoutCoordinates(it);
            }
        }), this.focusRequester), new Function1<FocusState, Unit>() { // from class: androidx.compose.foundation.text.selection.SelectionManager$modifier$3
            /* JADX INFO: Access modifiers changed from: package-private */
            {
                super(1);
            }

            @Override // kotlin.jvm.functions.Function1
            public /* bridge */ /* synthetic */ Unit invoke(FocusState focusState) {
                invoke2(focusState);
                return Unit.INSTANCE;
            }

            /* renamed from: invoke  reason: avoid collision after fix types in other method */
            public final void invoke2(FocusState focusState) {
                if (!focusState.getHasFocus() && SelectionManager.this.getHasFocus()) {
                    SelectionManager.this.onRelease();
                }
                SelectionManager.this.setHasFocus(focusState.getHasFocus());
            }
        }), false, null, 3, null), new Function1<Boolean, Unit>() { // from class: androidx.compose.foundation.text.selection.SelectionManager$modifier$4
            /* JADX INFO: Access modifiers changed from: package-private */
            {
                super(1);
            }

            @Override // kotlin.jvm.functions.Function1
            public /* bridge */ /* synthetic */ Unit invoke(Boolean bool) {
                invoke(bool.booleanValue());
                return Unit.INSTANCE;
            }

            public final void invoke(boolean it) {
                SelectionManager.this.setInTouchMode(it);
            }
        }), new Function1<KeyEvent, Boolean>() { // from class: androidx.compose.foundation.text.selection.SelectionManager$modifier$5
            /* JADX INFO: Access modifiers changed from: package-private */
            {
                super(1);
            }

            @Override // kotlin.jvm.functions.Function1
            public /* bridge */ /* synthetic */ Boolean invoke(KeyEvent keyEvent) {
                return m1750invokeZmokQxo(keyEvent.m5357unboximpl());
            }

            /* renamed from: invoke-ZmokQxo  reason: not valid java name */
            public final Boolean m1750invokeZmokQxo(android.view.KeyEvent it) {
                boolean z;
                if (SelectionManager_androidKt.m1754isCopyKeyEventZmokQxo(it)) {
                    SelectionManager.this.copy$foundation_release();
                    z = true;
                } else {
                    z = false;
                }
                return Boolean.valueOf(z);
            }
        }).then(getShouldShowMagnifier() ? SelectionManager_androidKt.selectionMagnifier(Modifier.Companion, this) : Modifier.Companion);
    }

    public final LayoutCoordinates getContainerLayoutCoordinates() {
        return this.containerLayoutCoordinates;
    }

    public final void setContainerLayoutCoordinates(LayoutCoordinates value) {
        this.containerLayoutCoordinates = value;
        if (getHasFocus() && getSelection() != null) {
            Offset positionInWindow = value != null ? Offset.m4037boximpl(LayoutCoordinatesKt.positionInWindow(value)) : null;
            if (!Intrinsics.areEqual(this.previousPosition, positionInWindow)) {
                this.previousPosition = positionInWindow;
                updateHandleOffsets();
                updateSelectionToolbar();
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* renamed from: setDragBeginPosition-k-4lQ0M  reason: not valid java name */
    public final void m1735setDragBeginPositionk4lQ0M(long j) {
        MutableState $this$setValue$iv = this.dragBeginPosition$delegate;
        $this$setValue$iv.setValue(Offset.m4037boximpl(j));
    }

    /* renamed from: getDragBeginPosition-F1C5BW0$foundation_release  reason: not valid java name */
    public final long m1741getDragBeginPositionF1C5BW0$foundation_release() {
        State $this$getValue$iv = this.dragBeginPosition$delegate;
        return ((Offset) $this$getValue$iv.getValue()).m4058unboximpl();
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* renamed from: setDragTotalDistance-k-4lQ0M  reason: not valid java name */
    public final void m1736setDragTotalDistancek4lQ0M(long j) {
        MutableState $this$setValue$iv = this.dragTotalDistance$delegate;
        $this$setValue$iv.setValue(Offset.m4037boximpl(j));
    }

    /* renamed from: getDragTotalDistance-F1C5BW0$foundation_release  reason: not valid java name */
    public final long m1742getDragTotalDistanceF1C5BW0$foundation_release() {
        State $this$getValue$iv = this.dragTotalDistance$delegate;
        return ((Offset) $this$getValue$iv.getValue()).m4058unboximpl();
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* renamed from: setStartHandlePosition-_kEHs6E  reason: not valid java name */
    public final void m1738setStartHandlePosition_kEHs6E(Offset offset) {
        MutableState $this$setValue$iv = this.startHandlePosition$delegate;
        $this$setValue$iv.setValue(offset);
    }

    /* renamed from: getStartHandlePosition-_m7T9-E  reason: not valid java name */
    public final Offset m1744getStartHandlePosition_m7T9E() {
        State $this$getValue$iv = this.startHandlePosition$delegate;
        return (Offset) $this$getValue$iv.getValue();
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* renamed from: setEndHandlePosition-_kEHs6E  reason: not valid java name */
    public final void m1737setEndHandlePosition_kEHs6E(Offset offset) {
        MutableState $this$setValue$iv = this.endHandlePosition$delegate;
        $this$setValue$iv.setValue(offset);
    }

    /* renamed from: getEndHandlePosition-_m7T9-E  reason: not valid java name */
    public final Offset m1743getEndHandlePosition_m7T9E() {
        State $this$getValue$iv = this.endHandlePosition$delegate;
        return (Offset) $this$getValue$iv.getValue();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final void setDraggingHandle(Handle handle) {
        MutableState $this$setValue$iv = this.draggingHandle$delegate;
        $this$setValue$iv.setValue(handle);
    }

    public final Handle getDraggingHandle() {
        State $this$getValue$iv = this.draggingHandle$delegate;
        return (Handle) $this$getValue$iv.getValue();
    }

    public final float getStartHandleLineHeight() {
        Selection selection = getSelection();
        if (selection == null) {
            return 0.0f;
        }
        Selection.AnchorInfo p0 = selection.getStart();
        Selectable selectable = getAnchorSelectable$foundation_release(p0);
        if (selectable == null) {
            return 0.0f;
        }
        return selectable.getLineHeight(selection.getStart().getOffset());
    }

    public final float getEndHandleLineHeight() {
        Selection selection = getSelection();
        if (selection == null) {
            return 0.0f;
        }
        Selection.AnchorInfo p0 = selection.getEnd();
        Selectable selectable = getAnchorSelectable$foundation_release(p0);
        if (selectable == null) {
            return 0.0f;
        }
        return selectable.getLineHeight(selection.getEnd().getOffset());
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* renamed from: setCurrentDragPosition-_kEHs6E  reason: not valid java name */
    public final void m1734setCurrentDragPosition_kEHs6E(Offset offset) {
        MutableState $this$setValue$iv = this.currentDragPosition$delegate;
        $this$setValue$iv.setValue(offset);
    }

    /* renamed from: getCurrentDragPosition-_m7T9-E  reason: not valid java name */
    public final Offset m1740getCurrentDragPosition_m7T9E() {
        State $this$getValue$iv = this.currentDragPosition$delegate;
        return (Offset) $this$getValue$iv.getValue();
    }

    private final boolean getShouldShowMagnifier() {
        return isDraggingInProgress() && isInTouchMode() && !isTriviallyCollapsedSelection$foundation_release();
    }

    public final SelectionLayout getPreviousSelectionLayout$foundation_release() {
        return this.previousSelectionLayout;
    }

    public final void setPreviousSelectionLayout$foundation_release(SelectionLayout selectionLayout) {
        this.previousSelectionLayout = selectionLayout;
    }

    public final Selectable getAnchorSelectable$foundation_release(Selection.AnchorInfo anchor) {
        return this.selectionRegistrar.getSelectableMap$foundation_release().get(anchor.getSelectableId());
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final void updateHandleOffsets() {
        long j;
        long j2;
        Offset offset;
        Offset offset2;
        Offset m4037boximpl;
        Selection.AnchorInfo p0;
        Selection.AnchorInfo p02;
        Selection selection = getSelection();
        LayoutCoordinates containerCoordinates = this.containerLayoutCoordinates;
        Selectable startSelectable = (selection == null || (p02 = selection.getStart()) == null) ? null : getAnchorSelectable$foundation_release(p02);
        Selectable endSelectable = (selection == null || (p0 = selection.getEnd()) == null) ? null : getAnchorSelectable$foundation_release(p0);
        LayoutCoordinates startLayoutCoordinates = startSelectable != null ? startSelectable.getLayoutCoordinates() : null;
        LayoutCoordinates endLayoutCoordinates = endSelectable != null ? endSelectable.getLayoutCoordinates() : null;
        if (selection != null && containerCoordinates != null && containerCoordinates.isAttached() && (startLayoutCoordinates != null || endLayoutCoordinates != null)) {
            Rect visibleBounds = SelectionManagerKt.visibleBounds(containerCoordinates);
            if (startLayoutCoordinates == null) {
                j = 9205357640488583168L;
                j2 = 9223372034707292159L;
                offset = null;
            } else {
                LayoutCoordinates handleCoordinates = startLayoutCoordinates;
                long $this$isUnspecified$iv = startSelectable.mo1702getHandlePositiondBAh8RU(selection, true);
                if (($this$isUnspecified$iv & 9223372034707292159L) == InlineClassHelperKt.UnspecifiedPackedFloats) {
                    j = 9205357640488583168L;
                    j2 = 9223372034707292159L;
                    m4037boximpl = null;
                } else {
                    j = 9205357640488583168L;
                    long position = containerCoordinates.mo5646localPositionOfR5De75A(handleCoordinates, $this$isUnspecified$iv);
                    m4037boximpl = Offset.m4037boximpl(position);
                    j2 = 9223372034707292159L;
                    long it = m4037boximpl.m4058unboximpl();
                    if (!(getDraggingHandle() == Handle.SelectionStart || SelectionManagerKt.m1752containsInclusiveUv8p0NA(visibleBounds, it))) {
                        m4037boximpl = null;
                    }
                }
                offset = m4037boximpl;
            }
            m1738setStartHandlePosition_kEHs6E(offset);
            if (endLayoutCoordinates != null) {
                LayoutCoordinates handleCoordinates2 = endLayoutCoordinates;
                long handlePosition = endSelectable.mo1702getHandlePositiondBAh8RU(selection, false);
                if (((handlePosition & j2) == j ? 1 : 0) != 0) {
                    offset2 = null;
                } else {
                    long position2 = containerCoordinates.mo5646localPositionOfR5De75A(handleCoordinates2, handlePosition);
                    Offset m4037boximpl2 = Offset.m4037boximpl(position2);
                    long it2 = m4037boximpl2.m4058unboximpl();
                    offset2 = getDraggingHandle() == Handle.SelectionEnd || SelectionManagerKt.m1752containsInclusiveUv8p0NA(visibleBounds, it2) ? m4037boximpl2 : null;
                }
            } else {
                offset2 = null;
            }
            m1737setEndHandlePosition_kEHs6E(offset2);
            return;
        }
        m1738setStartHandlePosition_kEHs6E(null);
        m1737setEndHandlePosition_kEHs6E(null);
    }

    public final LayoutCoordinates requireContainerCoordinates$foundation_release() {
        LayoutCoordinates coordinates = this.containerLayoutCoordinates;
        if (coordinates != null) {
            boolean value$iv = coordinates.isAttached();
            if (!value$iv) {
                androidx.compose.foundation.internal.InlineClassHelperKt.throwIllegalArgumentException("unattached coordinates");
            }
            return coordinates;
        }
        androidx.compose.foundation.internal.InlineClassHelperKt.throwIllegalArgumentExceptionForNullCheck("null coordinates");
        throw new KotlinNothingValueException();
    }

    public final Pair<Selection, LongObjectMap<Selection>> selectAllInSelectable$foundation_release(long selectableId, Selection previousSelection) {
        HapticFeedback hapticFeedback;
        List $this$fastFold$iv;
        Object initial$iv;
        boolean z;
        MutableLongObjectMap subselections = LongObjectMapKt.mutableLongObjectMapOf();
        List $this$fastFold$iv2 = this.selectionRegistrar.sort(requireContainerCoordinates$foundation_release());
        Object initial$iv2 = null;
        boolean z2 = false;
        Selection newSelection = null;
        int index$iv$iv = 0;
        int size = $this$fastFold$iv2.size();
        while (index$iv$iv < size) {
            Object item$iv$iv = $this$fastFold$iv2.get(index$iv$iv);
            Selectable selectable = (Selectable) item$iv$iv;
            Selection mergedSelection = newSelection;
            Selection selection = selectable.getSelectableId() == selectableId ? selectable.getSelectAllSelection() : null;
            if (selection != null) {
                $this$fastFold$iv = $this$fastFold$iv2;
                initial$iv = initial$iv2;
                z = z2;
                subselections.set(selectable.getSelectableId(), selection);
            } else {
                $this$fastFold$iv = $this$fastFold$iv2;
                initial$iv = initial$iv2;
                z = z2;
            }
            newSelection = SelectionManagerKt.merge(mergedSelection, selection);
            index$iv$iv++;
            $this$fastFold$iv2 = $this$fastFold$iv;
            initial$iv2 = initial$iv;
            z2 = z;
        }
        if (isInTouchMode() && !Intrinsics.areEqual(newSelection, previousSelection) && (hapticFeedback = this.hapticFeedBack) != null) {
            hapticFeedback.mo5011performHapticFeedbackCdsT49E(HapticFeedbackType.Companion.m5027getTextHandleMove5zf0vsI());
        }
        return new Pair<>(newSelection, subselections);
    }

    public final boolean isEntireContainerSelected$foundation_release() {
        boolean z;
        List selectables;
        SelectionManager selectionManager = this;
        List selectables2 = selectionManager.selectionRegistrar.sort(selectionManager.requireContainerCoordinates$foundation_release());
        boolean z2 = true;
        if (selectables2.isEmpty()) {
            return true;
        }
        boolean z3 = false;
        int index$iv$iv = 0;
        int size = selectables2.size();
        while (index$iv$iv < size) {
            Object item$iv$iv = selectables2.get(index$iv$iv);
            Selectable it = (Selectable) item$iv$iv;
            AnnotatedString text = it.getText();
            if (text.length() == 0 ? z2 : false) {
                selectables = selectables2;
                z = z3;
            } else {
                z = z3;
                Selection subSelection = selectionManager.selectionRegistrar.getSubselections().get(it.getSelectableId());
                if (subSelection == null) {
                    selectables = selectables2;
                    z2 = false;
                } else {
                    int selectionStart = subSelection.getStart().getOffset();
                    int selectionEnd = subSelection.getEnd().getOffset();
                    selectables = selectables2;
                    z2 = Math.abs(selectionStart - selectionEnd) == text.length();
                }
            }
            if (!z2) {
                return false;
            }
            index$iv$iv++;
            z2 = true;
            selectionManager = this;
            z3 = z;
            selectables2 = selectables;
        }
        return true;
    }

    public final void selectAll$foundation_release() {
        Selection newSelection;
        List selectables;
        List selectables2 = this.selectionRegistrar.sort(requireContainerCoordinates$foundation_release());
        if (selectables2.isEmpty()) {
            return;
        }
        Selection selection = null;
        Selection selection2 = null;
        MutableLongObjectMap newSubSelections = LongObjectMapKt.mutableLongObjectMapOf();
        int index$iv = 0;
        int size = selectables2.size();
        while (index$iv < size) {
            Object item$iv = selectables2.get(index$iv);
            Selectable selectable = (Selectable) item$iv;
            Selection subSelection = selectable.getSelectAllSelection();
            if (subSelection == null) {
                selectables = selectables2;
            } else {
                if (selection == null) {
                    selection = subSelection;
                }
                selection2 = subSelection;
                selectables = selectables2;
                newSubSelections.put(selectable.getSelectableId(), subSelection);
                selection = selection;
            }
            index$iv++;
            selectables2 = selectables;
        }
        if (newSubSelections.isEmpty()) {
            return;
        }
        if (selection == selection2) {
            newSelection = selection;
        } else {
            Intrinsics.checkNotNull(selection);
            Selection.AnchorInfo start = selection.getStart();
            Intrinsics.checkNotNull(selection2);
            newSelection = new Selection(start, selection2.getEnd(), false);
        }
        this.selectionRegistrar.setSubselections(newSubSelections);
        this.onSelectionChange.invoke(newSelection);
        this.previousSelectionLayout = null;
    }

    public final boolean isTriviallyCollapsedSelection$foundation_release() {
        Selection selection = getSelection();
        if (selection == null) {
            return true;
        }
        return Intrinsics.areEqual(selection.getStart(), selection.getEnd());
    }

    public final boolean isNonEmptySelection$foundation_release() {
        boolean z;
        Selection selection = getSelection();
        if (selection == null || Intrinsics.areEqual(selection.getStart(), selection.getEnd())) {
            return false;
        }
        if (selection.getStart().getSelectableId() == selection.getEnd().getSelectableId()) {
            return true;
        }
        List $this$fastAny$iv = this.selectionRegistrar.sort(requireContainerCoordinates$foundation_release());
        int index$iv$iv = 0;
        int size = $this$fastAny$iv.size();
        while (index$iv$iv < size) {
            Object item$iv$iv = $this$fastAny$iv.get(index$iv$iv);
            Selectable selectable = (Selectable) item$iv$iv;
            List $this$fastAny$iv2 = $this$fastAny$iv;
            Selection $this$isNonEmptySelection_u24lambda_u2415_u24lambda_u2414 = this.selectionRegistrar.getSubselections().get(selectable.getSelectableId());
            if ($this$isNonEmptySelection_u24lambda_u2415_u24lambda_u2414 != null) {
                z = $this$isNonEmptySelection_u24lambda_u2415_u24lambda_u2414.getStart().getOffset() != $this$isNonEmptySelection_u24lambda_u2415_u24lambda_u2414.getEnd().getOffset();
            } else {
                z = false;
            }
            if (z) {
                return true;
            }
            index$iv$iv++;
            $this$fastAny$iv = $this$fastAny$iv2;
        }
        return false;
    }

    public final AnnotatedString getSelectedText$foundation_release() {
        AnnotatedString currentSelectedText;
        SelectionManager selectionManager = this;
        if (selectionManager.getSelection() == null || selectionManager.selectionRegistrar.getSubselections().isEmpty()) {
            return null;
        }
        AnnotatedString.Builder $this$getSelectedText_u24lambda_u2418 = new AnnotatedString.Builder(0, 1, null);
        List $this$fastForEach$iv = selectionManager.selectionRegistrar.sort(selectionManager.requireContainerCoordinates$foundation_release());
        int index$iv = 0;
        int size = $this$fastForEach$iv.size();
        while (index$iv < size) {
            Object item$iv = $this$fastForEach$iv.get(index$iv);
            Selectable selectable = (Selectable) item$iv;
            Selection subSelection = selectionManager.selectionRegistrar.getSubselections().get(selectable.getSelectableId());
            if (subSelection != null) {
                AnnotatedString currentText = selectable.getText();
                if (subSelection.getHandlesCrossed()) {
                    currentSelectedText = currentText.subSequence(subSelection.getEnd().getOffset(), subSelection.getStart().getOffset());
                } else {
                    currentSelectedText = currentText.subSequence(subSelection.getStart().getOffset(), subSelection.getEnd().getOffset());
                }
                $this$getSelectedText_u24lambda_u2418.append(currentSelectedText);
            }
            index$iv++;
            selectionManager = this;
        }
        return $this$getSelectedText_u24lambda_u2418.toAnnotatedString();
    }

    public final void copy$foundation_release() {
        Function1<? super AnnotatedString, Unit> function1;
        AnnotatedString textToCopy = getSelectedText$foundation_release();
        if (textToCopy != null) {
            if (!(textToCopy.length() > 0)) {
                textToCopy = null;
            }
            if (textToCopy == null || (function1 = this.onCopyHandler) == null) {
                return;
            }
            function1.invoke(textToCopy);
        }
    }

    public final boolean getShowToolbar$foundation_release() {
        return this.showToolbar;
    }

    public final void setShowToolbar$foundation_release(boolean value) {
        this.showToolbar = value;
        updateSelectionToolbar();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final void toolbarCopy() {
        copy$foundation_release();
        onRelease();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final void updateSelectionToolbar() {
        TextToolbar textToolbar;
        if (getHasFocus() && (textToolbar = this.textToolbar) != null) {
            if (this.showToolbar && isInTouchMode()) {
                Rect rect = getContentRect();
                if (rect == null) {
                    return;
                }
                TextToolbar.showMenu$default(textToolbar, rect, (Function0) (isNonEmptySelection$foundation_release() ? new SelectionManager$updateSelectionToolbar$1(this) : null), null, null, isEntireContainerSelected$foundation_release() ? null : new SelectionManager$updateSelectionToolbar$2(this), null, 12, null);
            } else if (textToolbar.getStatus() == TextToolbarStatus.Shown) {
                textToolbar.hide();
            }
        }
    }

    private final Rect getContentRect() {
        LayoutCoordinates containerCoordinates;
        List selectableSubSelections;
        Rect rect;
        Object obj = null;
        if (getSelection() == null || (containerCoordinates = this.containerLayoutCoordinates) == null || !containerCoordinates.isAttached()) {
            return null;
        }
        List $this$fastMapNotNull$iv = this.selectionRegistrar.sort(requireContainerCoordinates$foundation_release());
        ArrayList target$iv = new ArrayList($this$fastMapNotNull$iv.size());
        int index$iv$iv = 0;
        int size = $this$fastMapNotNull$iv.size();
        while (index$iv$iv < size) {
            Object item$iv$iv = $this$fastMapNotNull$iv.get(index$iv$iv);
            Selectable selectable = (Selectable) item$iv$iv;
            Object obj2 = obj;
            List $this$fastMapNotNull$iv2 = $this$fastMapNotNull$iv;
            Selection it = this.selectionRegistrar.getSubselections().get(selectable.getSelectableId());
            Object it$iv = it != null ? TuplesKt.to(selectable, it) : obj2;
            if (it$iv != null) {
                target$iv.add(it$iv);
            }
            index$iv$iv++;
            obj = obj2;
            $this$fastMapNotNull$iv = $this$fastMapNotNull$iv2;
        }
        Rect rect2 = obj;
        selectableSubSelections = SelectionManagerKt.firstAndLast(target$iv);
        if (selectableSubSelections.isEmpty()) {
            return rect2;
        }
        Rect selectedRegionRect = SelectionManagerKt.getSelectedRegionRect(selectableSubSelections, containerCoordinates);
        rect = SelectionManagerKt.invertedInfiniteRect;
        if (Intrinsics.areEqual(selectedRegionRect, rect)) {
            return rect2;
        }
        Rect visibleRect = SelectionManagerKt.visibleBounds(containerCoordinates).intersect(selectedRegionRect);
        if (visibleRect.getRight() - visibleRect.getLeft() < 0.0f || visibleRect.getBottom() - visibleRect.getTop() < 0.0f) {
            return rect2;
        }
        Rect rootRect = visibleRect.m4085translatek4lQ0M(LayoutCoordinatesKt.positionInRoot(containerCoordinates));
        return Rect.copy$default(rootRect, 0.0f, 0.0f, 0.0f, rootRect.getBottom() + (SelectionHandlesKt.getHandleHeight() * 4.0f), 7, null);
    }

    public final void onRelease() {
        HapticFeedback hapticFeedback;
        this.selectionRegistrar.setSubselections(LongObjectMapKt.emptyLongObjectMap());
        setShowToolbar$foundation_release(false);
        if (getSelection() != null) {
            this.onSelectionChange.invoke(null);
            if (!isInTouchMode() || (hapticFeedback = this.hapticFeedBack) == null) {
                return;
            }
            hapticFeedback.mo5011performHapticFeedbackCdsT49E(HapticFeedbackType.Companion.m5027getTextHandleMove5zf0vsI());
        }
    }

    public final TextDragObserver handleDragObserver(final boolean isStartHandle) {
        return new TextDragObserver() { // from class: androidx.compose.foundation.text.selection.SelectionManager$handleDragObserver$1
            @Override // androidx.compose.foundation.text.TextDragObserver
            /* renamed from: onDown-k-4lQ0M */
            public void mo1399onDownk4lQ0M(long point) {
                LayoutCoordinates beginLayoutCoordinates;
                boolean z = isStartHandle;
                SelectionManager selectionManager = this;
                Offset m1744getStartHandlePosition_m7T9E = z ? selectionManager.m1744getStartHandlePosition_m7T9E() : selectionManager.m1743getEndHandlePosition_m7T9E();
                if (m1744getStartHandlePosition_m7T9E == null) {
                    return;
                }
                m1744getStartHandlePosition_m7T9E.m4058unboximpl();
                Selection selection = this.getSelection();
                if (selection == null) {
                    return;
                }
                Selection.AnchorInfo anchor = isStartHandle ? selection.getStart() : selection.getEnd();
                Selectable selectable = this.getAnchorSelectable$foundation_release(anchor);
                if (selectable == null || (beginLayoutCoordinates = selectable.getLayoutCoordinates()) == null) {
                    return;
                }
                long handlePosition = selectable.mo1702getHandlePositiondBAh8RU(selection, isStartHandle);
                if ((9223372034707292159L & handlePosition) == InlineClassHelperKt.UnspecifiedPackedFloats) {
                    return;
                }
                long beginCoordinates = SelectionHandlesKt.m1716getAdjustedCoordinatesk4lQ0M(handlePosition);
                this.m1734setCurrentDragPosition_kEHs6E(Offset.m4037boximpl(this.requireContainerCoordinates$foundation_release().mo5646localPositionOfR5De75A(beginLayoutCoordinates, beginCoordinates)));
                this.setDraggingHandle(isStartHandle ? Handle.SelectionStart : Handle.SelectionEnd);
                this.setShowToolbar$foundation_release(false);
            }

            @Override // androidx.compose.foundation.text.TextDragObserver
            /* renamed from: onStart-k-4lQ0M */
            public void mo1401onStartk4lQ0M(long startPoint) {
                if (this.getDraggingHandle() == null) {
                    return;
                }
                Selection selection = this.getSelection();
                Intrinsics.checkNotNull(selection);
                Selection.AnchorInfo anchor = isStartHandle ? selection.getStart() : selection.getEnd();
                Object value$iv = this.selectionRegistrar.getSelectableMap$foundation_release().get(anchor.getSelectableId());
                if (value$iv != null) {
                    Selectable selectable = (Selectable) value$iv;
                    LayoutCoordinates beginLayoutCoordinates = selectable.getLayoutCoordinates();
                    if (beginLayoutCoordinates != null) {
                        long handlePosition = selectable.mo1702getHandlePositiondBAh8RU(selection, isStartHandle);
                        if ((9223372034707292159L & handlePosition) == InlineClassHelperKt.UnspecifiedPackedFloats) {
                            return;
                        }
                        long beginCoordinates = SelectionHandlesKt.m1716getAdjustedCoordinatesk4lQ0M(handlePosition);
                        this.m1735setDragBeginPositionk4lQ0M(this.requireContainerCoordinates$foundation_release().mo5646localPositionOfR5De75A(beginLayoutCoordinates, beginCoordinates));
                        this.m1736setDragTotalDistancek4lQ0M(Offset.Companion.m4064getZeroF1C5BW0());
                        return;
                    }
                    androidx.compose.foundation.internal.InlineClassHelperKt.throwIllegalStateExceptionForNullCheck("Current selectable should have layout coordinates.");
                    throw new KotlinNothingValueException();
                }
                androidx.compose.foundation.internal.InlineClassHelperKt.throwIllegalStateExceptionForNullCheck("SelectionRegistrar should contain the current selection's selectableIds");
                throw new KotlinNothingValueException();
            }

            @Override // androidx.compose.foundation.text.TextDragObserver
            /* renamed from: onDrag-k-4lQ0M */
            public void mo1400onDragk4lQ0M(long delta) {
                if (this.getDraggingHandle() == null) {
                    return;
                }
                SelectionManager selectionManager = this;
                selectionManager.m1736setDragTotalDistancek4lQ0M(Offset.m4053plusMKHz9U(selectionManager.m1742getDragTotalDistanceF1C5BW0$foundation_release(), delta));
                long endPosition = Offset.m4053plusMKHz9U(this.m1741getDragBeginPositionF1C5BW0$foundation_release(), this.m1742getDragTotalDistanceF1C5BW0$foundation_release());
                boolean consumed = this.m1747updateSelectionqNKwrvQ$foundation_release(Offset.m4037boximpl(endPosition), this.m1741getDragBeginPositionF1C5BW0$foundation_release(), isStartHandle, SelectionAdjustment.Companion.getCharacterWithWordAccelerate());
                if (consumed) {
                    this.m1735setDragBeginPositionk4lQ0M(endPosition);
                    this.m1736setDragTotalDistancek4lQ0M(Offset.Companion.m4064getZeroF1C5BW0());
                }
            }

            private final void done() {
                this.setShowToolbar$foundation_release(true);
                this.setDraggingHandle(null);
                this.m1734setCurrentDragPosition_kEHs6E(null);
            }

            @Override // androidx.compose.foundation.text.TextDragObserver
            public void onUp() {
                done();
            }

            @Override // androidx.compose.foundation.text.TextDragObserver
            public void onStop() {
                done();
            }

            @Override // androidx.compose.foundation.text.TextDragObserver
            public void onCancel() {
                done();
            }
        };
    }

    private final Modifier onClearSelectionRequested(Modifier $this$onClearSelectionRequested, final Function0<Unit> function0) {
        return SuspendingPointerInputFilterKt.pointerInput($this$onClearSelectionRequested, Unit.INSTANCE, new PointerInputEventHandler() { // from class: androidx.compose.foundation.text.selection.SelectionManager$onClearSelectionRequested$1

            /* compiled from: SelectionManager.kt */
            @Metadata(d1 = {"\u0000\n\n\u0000\n\u0002\u0010\u0002\n\u0002\u0018\u0002\u0010\u0000\u001a\u00020\u0001*\u00020\u0002H\u008a@"}, d2 = {"<anonymous>", "", "Landroidx/compose/ui/input/pointer/AwaitPointerEventScope;"}, k = 3, mv = {1, 9, 0}, xi = 48)
            @DebugMetadata(c = "androidx.compose.foundation.text.selection.SelectionManager$onClearSelectionRequested$1$1", f = "SelectionManager.kt", i = {0}, l = {754, 760}, m = "invokeSuspend", n = {"$this$awaitEachGesture"}, s = {"L$0"})
            /* renamed from: androidx.compose.foundation.text.selection.SelectionManager$onClearSelectionRequested$1$1  reason: invalid class name */
            /* loaded from: classes.dex */
            static final class AnonymousClass1 extends RestrictedSuspendLambda implements Function2<AwaitPointerEventScope, Continuation<? super Unit>, Object> {
                final /* synthetic */ Function0<Unit> $block;
                private /* synthetic */ Object L$0;
                int label;
                final /* synthetic */ SelectionManager this$0;

                /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                AnonymousClass1(SelectionManager selectionManager, Function0<Unit> function0, Continuation<? super AnonymousClass1> continuation) {
                    super(2, continuation);
                    this.this$0 = selectionManager;
                    this.$block = function0;
                }

                @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
                public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
                    AnonymousClass1 anonymousClass1 = new AnonymousClass1(this.this$0, this.$block, continuation);
                    anonymousClass1.L$0 = obj;
                    return anonymousClass1;
                }

                @Override // kotlin.jvm.functions.Function2
                public final Object invoke(AwaitPointerEventScope awaitPointerEventScope, Continuation<? super Unit> continuation) {
                    return ((AnonymousClass1) create(awaitPointerEventScope, continuation)).invokeSuspend(Unit.INSTANCE);
                }

                /* JADX WARN: Removed duplicated region for block: B:14:0x0052 A[RETURN] */
                /* JADX WARN: Removed duplicated region for block: B:17:0x005c  */
                @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
                /*
                    Code decompiled incorrectly, please refer to instructions dump.
                    To view partially-correct add '--show-bad-code' argument
                */
                public final java.lang.Object invokeSuspend(java.lang.Object r10) {
                    /*
                        r9 = this;
                        java.lang.Object r0 = kotlin.coroutines.intrinsics.IntrinsicsKt.getCOROUTINE_SUSPENDED()
                        int r1 = r9.label
                        switch(r1) {
                            case 0: goto L21;
                            case 1: goto L17;
                            case 2: goto L12;
                            default: goto L9;
                        }
                    L9:
                        java.lang.IllegalStateException r10 = new java.lang.IllegalStateException
                        java.lang.String r0 = "call to 'resume' before 'invoke' with coroutine"
                        r10.<init>(r0)
                        throw r10
                    L12:
                        kotlin.ResultKt.throwOnFailure(r10)
                        r1 = r10
                        goto L53
                    L17:
                        java.lang.Object r1 = r9.L$0
                        androidx.compose.ui.input.pointer.AwaitPointerEventScope r1 = (androidx.compose.ui.input.pointer.AwaitPointerEventScope) r1
                        kotlin.ResultKt.throwOnFailure(r10)
                        r2 = r1
                        r1 = r10
                        goto L3f
                    L21:
                        kotlin.ResultKt.throwOnFailure(r10)
                        java.lang.Object r1 = r9.L$0
                        r2 = r1
                        androidx.compose.ui.input.pointer.AwaitPointerEventScope r2 = (androidx.compose.ui.input.pointer.AwaitPointerEventScope) r2
                        r5 = r9
                        kotlin.coroutines.Continuation r5 = (kotlin.coroutines.Continuation) r5
                        r9.L$0 = r2
                        r1 = 1
                        r9.label = r1
                        r3 = 0
                        r4 = 0
                        r6 = 2
                        r7 = 0
                        java.lang.Object r1 = androidx.compose.foundation.gestures.TapGestureDetectorKt.awaitPrimaryFirstDown$default(r2, r3, r4, r5, r6, r7)
                        if (r1 != r0) goto L3c
                        return r0
                    L3c:
                        r8 = r1
                        r1 = r10
                        r10 = r8
                    L3f:
                        androidx.compose.ui.input.pointer.PointerInputChange r10 = (androidx.compose.ui.input.pointer.PointerInputChange) r10
                        androidx.compose.ui.input.pointer.PointerEventPass r3 = androidx.compose.ui.input.pointer.PointerEventPass.Initial
                        r4 = r9
                        kotlin.coroutines.Continuation r4 = (kotlin.coroutines.Continuation) r4
                        r5 = 0
                        r9.L$0 = r5
                        r5 = 2
                        r9.label = r5
                        java.lang.Object r10 = androidx.compose.foundation.gestures.DragGestureDetectorKt.awaitAllPointersUpWithSlopDetection(r2, r10, r3, r4)
                        if (r10 != r0) goto L53
                        return r0
                    L53:
                        java.lang.Boolean r10 = (java.lang.Boolean) r10
                        boolean r10 = r10.booleanValue()
                        if (r10 != 0) goto L69
                        androidx.compose.foundation.text.selection.SelectionManager r0 = r9.this$0
                        boolean r0 = androidx.compose.foundation.text.selection.SelectionManager.access$isDraggingInProgress(r0)
                        if (r0 != 0) goto L69
                        kotlin.jvm.functions.Function0<kotlin.Unit> r10 = r9.$block
                        r10.invoke()
                    L69:
                        kotlin.Unit r10 = kotlin.Unit.INSTANCE
                        return r10
                    */
                    throw new UnsupportedOperationException("Method not decompiled: androidx.compose.foundation.text.selection.SelectionManager$onClearSelectionRequested$1.AnonymousClass1.invokeSuspend(java.lang.Object):java.lang.Object");
                }
            }

            @Override // androidx.compose.ui.input.pointer.PointerInputEventHandler
            public final Object invoke(PointerInputScope $this$pointerInput, Continuation<? super Unit> continuation) {
                Object awaitEachGesture = ForEachGestureKt.awaitEachGesture($this$pointerInput, new AnonymousClass1(SelectionManager.this, function0, null), continuation);
                return awaitEachGesture == IntrinsicsKt.getCOROUTINE_SUSPENDED() ? awaitEachGesture : Unit.INSTANCE;
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* renamed from: convertToContainerCoordinates-R5De75A  reason: not valid java name */
    public final long m1732convertToContainerCoordinatesR5De75A(LayoutCoordinates layoutCoordinates, long offset) {
        LayoutCoordinates coordinates = this.containerLayoutCoordinates;
        if (coordinates == null || !coordinates.isAttached()) {
            return Offset.Companion.m4063getUnspecifiedF1C5BW0();
        }
        return requireContainerCoordinates$foundation_release().mo5646localPositionOfR5De75A(layoutCoordinates, offset);
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* renamed from: startSelection-9KIMszo  reason: not valid java name */
    public final void m1739startSelection9KIMszo(long position, boolean isStartHandle, SelectionAdjustment adjustment) {
        this.previousSelectionLayout = null;
        m1746updateSelectionjyLRC_s$foundation_release(position, Offset.Companion.m4063getUnspecifiedF1C5BW0(), isStartHandle, adjustment);
    }

    /* renamed from: updateSelection-qNKwrvQ$foundation_release  reason: not valid java name */
    public final boolean m1747updateSelectionqNKwrvQ$foundation_release(Offset newPosition, long previousPosition, boolean isStartHandle, SelectionAdjustment adjustment) {
        if (newPosition == null) {
            return false;
        }
        return m1746updateSelectionjyLRC_s$foundation_release(newPosition.m4058unboximpl(), previousPosition, isStartHandle, adjustment);
    }

    /* renamed from: updateSelection-jyLRC_s$foundation_release  reason: not valid java name */
    public final boolean m1746updateSelectionjyLRC_s$foundation_release(long position, long previousHandlePosition, boolean isStartHandle, SelectionAdjustment adjustment) {
        setDraggingHandle(isStartHandle ? Handle.SelectionStart : Handle.SelectionEnd);
        m1734setCurrentDragPosition_kEHs6E(Offset.m4037boximpl(position));
        SelectionLayout selectionLayout = m1733getSelectionLayoutWko1d7g(position, previousHandlePosition, isStartHandle);
        if (selectionLayout != null && selectionLayout.shouldRecomputeSelection(this.previousSelectionLayout)) {
            Selection newSelection = adjustment.adjust(selectionLayout);
            if (!Intrinsics.areEqual(newSelection, getSelection())) {
                selectionChanged(selectionLayout, newSelection);
            }
            this.previousSelectionLayout = selectionLayout;
            return true;
        }
        return false;
    }

    /* renamed from: getSelectionLayout-Wko1d7g  reason: not valid java name */
    private final SelectionLayout m1733getSelectionLayoutWko1d7g(long position, long previousHandlePosition, boolean isStartHandle) {
        LayoutCoordinates containerCoordinates = requireContainerCoordinates$foundation_release();
        List sortedSelectables = this.selectionRegistrar.sort(containerCoordinates);
        final MutableLongIntMap idToIndexMap = LongIntMapKt.mutableLongIntMapOf();
        int size = sortedSelectables.size();
        for (int index$iv = 0; index$iv < size; index$iv++) {
            Object item$iv = sortedSelectables.get(index$iv);
            Selectable selectable = (Selectable) item$iv;
            int index = index$iv;
            idToIndexMap.set(selectable.getSelectableId(), index);
        }
        Comparator selectableIdOrderingComparator = new Comparator() { // from class: androidx.compose.foundation.text.selection.SelectionManager$getSelectionLayout-Wko1d7g$$inlined$compareBy$1
            @Override // java.util.Comparator
            public final int compare(T t, T t2) {
                long it = ((Number) t).longValue();
                long it2 = ((Number) t2).longValue();
                return ComparisonsKt.compareValues(Integer.valueOf(MutableLongIntMap.this.get(it)), Integer.valueOf(MutableLongIntMap.this.get(it2)));
            }
        };
        Selection previousSelection = ((9223372034707292159L & previousHandlePosition) > InlineClassHelperKt.UnspecifiedPackedFloats ? 1 : ((9223372034707292159L & previousHandlePosition) == InlineClassHelperKt.UnspecifiedPackedFloats ? 0 : -1)) == 0 ? null : getSelection();
        SelectionLayoutBuilder builder = new SelectionLayoutBuilder(position, previousHandlePosition, containerCoordinates, isStartHandle, previousSelection, selectableIdOrderingComparator, null);
        int size2 = sortedSelectables.size();
        for (int index$iv2 = 0; index$iv2 < size2; index$iv2++) {
            Object item$iv2 = sortedSelectables.get(index$iv2);
            Selectable it = (Selectable) item$iv2;
            it.appendSelectableInfoToBuilder(builder);
        }
        return builder.build();
    }

    private final void selectionChanged(SelectionLayout selectionLayout, Selection newSelection) {
        HapticFeedback hapticFeedback;
        if (shouldPerformHaptics$foundation_release() && (hapticFeedback = this.hapticFeedBack) != null) {
            hapticFeedback.mo5011performHapticFeedbackCdsT49E(HapticFeedbackType.Companion.m5027getTextHandleMove5zf0vsI());
        }
        this.selectionRegistrar.setSubselections(selectionLayout.createSubSelections(newSelection));
        this.onSelectionChange.invoke(newSelection);
    }

    public final boolean shouldPerformHaptics$foundation_release() {
        List $this$fastAny$iv;
        if (isInTouchMode()) {
            List $this$fastAny$iv2 = this.selectionRegistrar.getSelectables$foundation_release();
            int index$iv$iv = 0;
            int size = $this$fastAny$iv2.size();
            while (true) {
                if (index$iv$iv < size) {
                    Object item$iv$iv = $this$fastAny$iv2.get(index$iv$iv);
                    Selectable it = (Selectable) item$iv$iv;
                    if (it.getText().length() > 0) {
                        $this$fastAny$iv = 1;
                        break;
                    }
                    index$iv$iv++;
                } else {
                    $this$fastAny$iv = null;
                    break;
                }
            }
            return $this$fastAny$iv != null;
        }
        return false;
    }

    /* renamed from: selectWordAtPositionIfNotAlreadySelected-k-4lQ0M  reason: not valid java name */
    public final void m1745selectWordAtPositionIfNotAlreadySelectedk4lQ0M(long position) {
        boolean isClickedPositionInsideSelection;
        LayoutCoordinates containerCoordinates;
        boolean m1430isPositionInsideSelectionuaM50fQ;
        LayoutCoordinates containerCoordinates2 = this.containerLayoutCoordinates;
        if (containerCoordinates2 != null && containerCoordinates2.isAttached()) {
            List $this$fastAny$iv = this.selectionRegistrar.getSelectables$foundation_release();
            boolean z = false;
            int index$iv$iv = 0;
            int size = $this$fastAny$iv.size();
            while (true) {
                if (index$iv$iv < size) {
                    Object item$iv$iv = $this$fastAny$iv.get(index$iv$iv);
                    Selectable selectable = (Selectable) item$iv$iv;
                    List $this$fastAny$iv2 = $this$fastAny$iv;
                    boolean z2 = z;
                    Selection selection = this.selectionRegistrar.getSubselections().get(selectable.getSelectableId());
                    if (selection == null) {
                        containerCoordinates = containerCoordinates2;
                        m1430isPositionInsideSelectionuaM50fQ = false;
                    } else {
                        LayoutCoordinates selectableLayoutCoords = selectable.getLayoutCoordinates();
                        if (selectableLayoutCoords == null) {
                            containerCoordinates = containerCoordinates2;
                            m1430isPositionInsideSelectionuaM50fQ = false;
                        } else {
                            long positionInSelectable = selectableLayoutCoords.mo5646localPositionOfR5De75A(containerCoordinates2, position);
                            TextLayoutResult textLayoutResult = selectable.textLayoutResult();
                            if (textLayoutResult == null) {
                                containerCoordinates = containerCoordinates2;
                                m1430isPositionInsideSelectionuaM50fQ = false;
                            } else {
                                containerCoordinates = containerCoordinates2;
                                m1430isPositionInsideSelectionuaM50fQ = TextLayoutHelperKt.m1430isPositionInsideSelectionuaM50fQ(textLayoutResult, positionInSelectable, TextRange.m6327boximpl(selection.m1708toTextRanged9O1mEE()));
                            }
                        }
                    }
                    if (m1430isPositionInsideSelectionuaM50fQ) {
                        isClickedPositionInsideSelection = true;
                        break;
                    }
                    index$iv$iv++;
                    $this$fastAny$iv = $this$fastAny$iv2;
                    z = z2;
                    containerCoordinates2 = containerCoordinates;
                } else {
                    isClickedPositionInsideSelection = false;
                    break;
                }
            }
            if (!isClickedPositionInsideSelection) {
                m1739startSelection9KIMszo(position, true, SelectionAdjustment.Companion.getWord());
            }
        }
    }
}
