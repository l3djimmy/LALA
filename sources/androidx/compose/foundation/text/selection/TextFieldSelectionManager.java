package androidx.compose.foundation.text.selection;

import androidx.compose.foundation.text.Handle;
import androidx.compose.foundation.text.HandleState;
import androidx.compose.foundation.text.LegacyTextFieldState;
import androidx.compose.foundation.text.TextDelegate;
import androidx.compose.foundation.text.TextDragObserver;
import androidx.compose.foundation.text.TextFieldCursor_androidKt;
import androidx.compose.foundation.text.TextLayoutHelperKt;
import androidx.compose.foundation.text.TextLayoutResultProxy;
import androidx.compose.foundation.text.UndoManager;
import androidx.compose.foundation.text.ValidatingOffsetMappingKt;
import androidx.compose.runtime.MutableState;
import androidx.compose.runtime.SnapshotStateKt__SnapshotStateKt;
import androidx.compose.runtime.State;
import androidx.compose.ui.focus.FocusRequester;
import androidx.compose.ui.geometry.Offset;
import androidx.compose.ui.geometry.Rect;
import androidx.compose.ui.hapticfeedback.HapticFeedback;
import androidx.compose.ui.hapticfeedback.HapticFeedbackType;
import androidx.compose.ui.platform.Clipboard;
import androidx.compose.ui.platform.TextToolbar;
import androidx.compose.ui.platform.TextToolbarStatus;
import androidx.compose.ui.text.AnnotatedString;
import androidx.compose.ui.text.TextLayoutResult;
import androidx.compose.ui.text.TextRange;
import androidx.compose.ui.text.TextRangeKt;
import androidx.compose.ui.text.input.OffsetMapping;
import androidx.compose.ui.text.input.TextFieldValue;
import androidx.compose.ui.text.input.VisualTransformation;
import androidx.compose.ui.unit.Density;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import kotlin.ranges.RangesKt;
import kotlinx.coroutines.BuildersKt__Builders_commonKt;
import kotlinx.coroutines.CoroutineScope;
import kotlinx.coroutines.CoroutineStart;
import kotlinx.coroutines.Job;
/* compiled from: TextFieldSelectionManager.kt */
@Metadata(d1 = {"\u0000â\u0001\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\b\b\n\u0002\u0010\b\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0010\u000b\n\u0002\b\u000b\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\b\u0006\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u000b\n\u0002\u0018\u0002\n\u0002\b\t\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\b\u000f\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u0007\n\u0002\b\u0017\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0000\u0018\u00002\u00020\u0001B\u0011\u0012\n\b\u0002\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\u0002\u0010\u0004J\r\u0010|\u001a\u00020LH\u0000¢\u0006\u0002\b}J\r\u0010~\u001a\u00020LH\u0000¢\u0006\u0002\b\u007fJ\u001d\u0010\u0080\u0001\u001a\u0005\u0018\u00010\u0081\u00012\t\b\u0002\u0010\u0082\u0001\u001a\u00020'H\u0000¢\u0006\u0003\b\u0083\u0001J(\u0010\u0084\u0001\u001a\u00020I2\u0007\u0010\u0085\u0001\u001a\u00020k2\b\u0010\u0086\u0001\u001a\u00030\u0087\u0001H\u0002ø\u0001\u0000¢\u0006\u0006\b\u0088\u0001\u0010\u0089\u0001J\u000f\u0010\u008a\u0001\u001a\u00020gH\u0000¢\u0006\u0003\b\u008b\u0001J\u0012\u0010\u008c\u0001\u001a\u0005\u0018\u00010\u0081\u0001H\u0000¢\u0006\u0003\b\u008d\u0001J\u001f\u0010\u008e\u0001\u001a\u00020L2\u000b\b\u0002\u0010\u008f\u0001\u001a\u0004\u0018\u00010\u0012H\u0000ø\u0001\u0000¢\u0006\u0003\b\u0090\u0001J\u001a\u0010\u0091\u0001\u001a\u00020L2\t\b\u0002\u0010\u0092\u0001\u001a\u00020'H\u0000¢\u0006\u0003\b\u0093\u0001J\u000f\u0010\u0094\u0001\u001a\u00020LH\u0000¢\u0006\u0003\b\u0095\u0001J\n\u0010\u0096\u0001\u001a\u00030\u0097\u0001H\u0002J\"\u0010\u0098\u0001\u001a\u00020\u00122\b\u0010\u0099\u0001\u001a\u00030\u009a\u0001H\u0000ø\u0001\u0001ø\u0001\u0000¢\u0006\u0006\b\u009b\u0001\u0010\u009c\u0001J\u0019\u0010\u009d\u0001\u001a\u00030\u009e\u00012\u0007\u0010\u009f\u0001\u001a\u00020'H\u0000¢\u0006\u0003\b \u0001J!\u0010¡\u0001\u001a\u00020\u00122\u0007\u0010\u009f\u0001\u001a\u00020'H\u0000ø\u0001\u0001ø\u0001\u0000¢\u0006\u0006\b¢\u0001\u0010£\u0001J\u0018\u0010¤\u0001\u001a\u00020g2\u0007\u0010\u009f\u0001\u001a\u00020'H\u0000¢\u0006\u0003\b¥\u0001J\u000f\u0010¦\u0001\u001a\u00020LH\u0000¢\u0006\u0003\b§\u0001J\u000f\u0010¨\u0001\u001a\u00020'H\u0000¢\u0006\u0003\b©\u0001J\u0012\u0010ª\u0001\u001a\u0005\u0018\u00010\u0081\u0001H\u0000¢\u0006\u0003\b«\u0001J\u000f\u0010¬\u0001\u001a\u00020LH\u0000¢\u0006\u0003\b\u00ad\u0001J\u001c\u0010®\u0001\u001a\u00020L2\u0007\u0010\u008f\u0001\u001a\u00020\u0012ø\u0001\u0000¢\u0006\u0006\b¯\u0001\u0010°\u0001J\u001f\u0010±\u0001\u001a\u00020L2\b\u0010²\u0001\u001a\u00030\u0087\u0001H\u0000ø\u0001\u0000¢\u0006\u0006\b³\u0001\u0010°\u0001J\u0013\u0010´\u0001\u001a\u00020L2\b\u0010µ\u0001\u001a\u00030¶\u0001H\u0002J\u001f\u0010·\u0001\u001a\u00020L2\b\u0010²\u0001\u001a\u00030\u0087\u0001H\u0000ø\u0001\u0000¢\u0006\u0006\b¸\u0001\u0010°\u0001J\u0012\u0010¹\u0001\u001a\u0005\u0018\u00010\u0081\u0001H\u0000¢\u0006\u0003\bº\u0001J\u0012\u0010»\u0001\u001a\u00020L2\u0007\u0010¼\u0001\u001a\u00020'H\u0002JL\u0010½\u0001\u001a\u00030\u0087\u00012\u0006\u0010p\u001a\u00020I2\u0007\u0010¾\u0001\u001a\u00020\u00122\u0007\u0010¿\u0001\u001a\u00020'2\u0007\u0010\u009f\u0001\u001a\u00020'2\b\u0010À\u0001\u001a\u00030Á\u00012\u0007\u0010Â\u0001\u001a\u00020'H\u0002ø\u0001\u0000¢\u0006\u0006\bÃ\u0001\u0010Ä\u0001R\u001c\u0010\u0005\u001a\u0004\u0018\u00010\u0006X\u0080\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b\u0007\u0010\b\"\u0004\b\t\u0010\nR\u001c\u0010\u000b\u001a\u0004\u0018\u00010\fX\u0080\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b\r\u0010\u000e\"\u0004\b\u000f\u0010\u0010R5\u0010\u0013\u001a\u0004\u0018\u00010\u00122\b\u0010\u0011\u001a\u0004\u0018\u00010\u00128F@BX\u0086\u008e\u0002ø\u0001\u0000ø\u0001\u0001¢\u0006\u0012\n\u0004\b\u0018\u0010\u0019\u001a\u0004\b\u0014\u0010\u0015\"\u0004\b\u0016\u0010\u0017R\u0012\u0010\u001a\u001a\u0004\u0018\u00010\u001bX\u0082\u000e¢\u0006\u0004\n\u0002\u0010\u001cR\u0016\u0010\u001d\u001a\u00020\u0012X\u0082\u000eø\u0001\u0000ø\u0001\u0001¢\u0006\u0004\n\u0002\u0010\u001eR\u0016\u0010\u001f\u001a\u00020\u0012X\u0082\u000eø\u0001\u0000ø\u0001\u0001¢\u0006\u0004\n\u0002\u0010\u001eR/\u0010!\u001a\u0004\u0018\u00010 2\b\u0010\u0011\u001a\u0004\u0018\u00010 8F@BX\u0086\u008e\u0002¢\u0006\u0012\n\u0004\b&\u0010\u0019\u001a\u0004\b\"\u0010#\"\u0004\b$\u0010%R+\u0010(\u001a\u00020'2\u0006\u0010\u0011\u001a\u00020'8F@FX\u0086\u008e\u0002¢\u0006\u0012\n\u0004\b-\u0010\u0019\u001a\u0004\b)\u0010*\"\u0004\b+\u0010,R+\u0010.\u001a\u00020'2\u0006\u0010\u0011\u001a\u00020'8F@FX\u0086\u008e\u0002¢\u0006\u0012\n\u0004\b1\u0010\u0019\u001a\u0004\b/\u0010*\"\u0004\b0\u0010,R\u001c\u00102\u001a\u0004\u0018\u000103X\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b4\u00105\"\u0004\b6\u00107R\u001c\u00108\u001a\u0004\u0018\u000109X\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b:\u0010;\"\u0004\b<\u0010=R\u0014\u0010>\u001a\u00020?X\u0080\u0004¢\u0006\b\n\u0000\u001a\u0004\b@\u0010AR\u001a\u0010B\u001a\u00020CX\u0080\u000e¢\u0006\u000e\n\u0000\u001a\u0004\bD\u0010E\"\u0004\bF\u0010GR\u000e\u0010H\u001a\u00020IX\u0082\u000e¢\u0006\u0002\n\u0000R&\u0010J\u001a\u000e\u0012\u0004\u0012\u00020I\u0012\u0004\u0012\u00020L0KX\u0080\u000e¢\u0006\u000e\n\u0000\u001a\u0004\bM\u0010N\"\u0004\bO\u0010PR\u000e\u0010Q\u001a\u00020\u001bX\u0082\u000e¢\u0006\u0002\n\u0000R\u0010\u0010R\u001a\u0004\u0018\u00010SX\u0082\u000e¢\u0006\u0002\n\u0000R\"\u0010T\u001a\n\u0012\u0004\u0012\u00020L\u0018\u00010UX\u0080\u000e¢\u0006\u000e\n\u0000\u001a\u0004\bV\u0010W\"\u0004\bX\u0010YR\u001c\u0010Z\u001a\u0004\u0018\u00010[X\u0080\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b\\\u0010]\"\u0004\b^\u0010_R\u001c\u0010`\u001a\u0004\u0018\u00010aX\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\bb\u0010c\"\u0004\bd\u0010eR\u0014\u0010f\u001a\u00020gX\u0080\u0004¢\u0006\b\n\u0000\u001a\u0004\bh\u0010iR\u0016\u0010j\u001a\u0004\u0018\u00010k8@X\u0080\u0004¢\u0006\u0006\u001a\u0004\bl\u0010mR\u0013\u0010\u0002\u001a\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\bn\u0010oR+\u0010p\u001a\u00020I2\u0006\u0010\u0011\u001a\u00020I8@@@X\u0080\u008e\u0002¢\u0006\u0012\n\u0004\bu\u0010\u0019\u001a\u0004\bq\u0010r\"\u0004\bs\u0010tR\u001a\u0010v\u001a\u00020wX\u0080\u000e¢\u0006\u000e\n\u0000\u001a\u0004\bx\u0010y\"\u0004\bz\u0010{\u0082\u0002\u000b\n\u0005\b¡\u001e0\u0001\n\u0002\b!¨\u0006Å\u0001"}, d2 = {"Landroidx/compose/foundation/text/selection/TextFieldSelectionManager;", "", "undoManager", "Landroidx/compose/foundation/text/UndoManager;", "(Landroidx/compose/foundation/text/UndoManager;)V", "clipboard", "Landroidx/compose/ui/platform/Clipboard;", "getClipboard$foundation_release", "()Landroidx/compose/ui/platform/Clipboard;", "setClipboard$foundation_release", "(Landroidx/compose/ui/platform/Clipboard;)V", "coroutineScope", "Lkotlinx/coroutines/CoroutineScope;", "getCoroutineScope$foundation_release", "()Lkotlinx/coroutines/CoroutineScope;", "setCoroutineScope$foundation_release", "(Lkotlinx/coroutines/CoroutineScope;)V", "<set-?>", "Landroidx/compose/ui/geometry/Offset;", "currentDragPosition", "getCurrentDragPosition-_m7T9-E", "()Landroidx/compose/ui/geometry/Offset;", "setCurrentDragPosition-_kEHs6E", "(Landroidx/compose/ui/geometry/Offset;)V", "currentDragPosition$delegate", "Landroidx/compose/runtime/MutableState;", "dragBeginOffsetInText", "", "Ljava/lang/Integer;", "dragBeginPosition", "J", "dragTotalDistance", "Landroidx/compose/foundation/text/Handle;", "draggingHandle", "getDraggingHandle", "()Landroidx/compose/foundation/text/Handle;", "setDraggingHandle", "(Landroidx/compose/foundation/text/Handle;)V", "draggingHandle$delegate", "", "editable", "getEditable", "()Z", "setEditable", "(Z)V", "editable$delegate", "enabled", "getEnabled", "setEnabled", "enabled$delegate", "focusRequester", "Landroidx/compose/ui/focus/FocusRequester;", "getFocusRequester", "()Landroidx/compose/ui/focus/FocusRequester;", "setFocusRequester", "(Landroidx/compose/ui/focus/FocusRequester;)V", "hapticFeedBack", "Landroidx/compose/ui/hapticfeedback/HapticFeedback;", "getHapticFeedBack", "()Landroidx/compose/ui/hapticfeedback/HapticFeedback;", "setHapticFeedBack", "(Landroidx/compose/ui/hapticfeedback/HapticFeedback;)V", "mouseSelectionObserver", "Landroidx/compose/foundation/text/selection/MouseSelectionObserver;", "getMouseSelectionObserver$foundation_release", "()Landroidx/compose/foundation/text/selection/MouseSelectionObserver;", "offsetMapping", "Landroidx/compose/ui/text/input/OffsetMapping;", "getOffsetMapping$foundation_release", "()Landroidx/compose/ui/text/input/OffsetMapping;", "setOffsetMapping$foundation_release", "(Landroidx/compose/ui/text/input/OffsetMapping;)V", "oldValue", "Landroidx/compose/ui/text/input/TextFieldValue;", "onValueChange", "Lkotlin/Function1;", "", "getOnValueChange$foundation_release", "()Lkotlin/jvm/functions/Function1;", "setOnValueChange$foundation_release", "(Lkotlin/jvm/functions/Function1;)V", "previousRawDragOffset", "previousSelectionLayout", "Landroidx/compose/foundation/text/selection/SelectionLayout;", "requestAutofillAction", "Lkotlin/Function0;", "getRequestAutofillAction$foundation_release", "()Lkotlin/jvm/functions/Function0;", "setRequestAutofillAction$foundation_release", "(Lkotlin/jvm/functions/Function0;)V", "state", "Landroidx/compose/foundation/text/LegacyTextFieldState;", "getState$foundation_release", "()Landroidx/compose/foundation/text/LegacyTextFieldState;", "setState$foundation_release", "(Landroidx/compose/foundation/text/LegacyTextFieldState;)V", "textToolbar", "Landroidx/compose/ui/platform/TextToolbar;", "getTextToolbar", "()Landroidx/compose/ui/platform/TextToolbar;", "setTextToolbar", "(Landroidx/compose/ui/platform/TextToolbar;)V", "touchSelectionObserver", "Landroidx/compose/foundation/text/TextDragObserver;", "getTouchSelectionObserver$foundation_release", "()Landroidx/compose/foundation/text/TextDragObserver;", "transformedText", "Landroidx/compose/ui/text/AnnotatedString;", "getTransformedText$foundation_release", "()Landroidx/compose/ui/text/AnnotatedString;", "getUndoManager", "()Landroidx/compose/foundation/text/UndoManager;", "value", "getValue$foundation_release", "()Landroidx/compose/ui/text/input/TextFieldValue;", "setValue$foundation_release", "(Landroidx/compose/ui/text/input/TextFieldValue;)V", "value$delegate", "visualTransformation", "Landroidx/compose/ui/text/input/VisualTransformation;", "getVisualTransformation$foundation_release", "()Landroidx/compose/ui/text/input/VisualTransformation;", "setVisualTransformation$foundation_release", "(Landroidx/compose/ui/text/input/VisualTransformation;)V", "autofill", "autofill$foundation_release", "clearPreviewHighlight", "clearPreviewHighlight$foundation_release", "copy", "Lkotlinx/coroutines/Job;", "cancelSelection", "copy$foundation_release", "createTextFieldValue", "annotatedString", "selection", "Landroidx/compose/ui/text/TextRange;", "createTextFieldValue-FDrldGo", "(Landroidx/compose/ui/text/AnnotatedString;J)Landroidx/compose/ui/text/input/TextFieldValue;", "cursorDragObserver", "cursorDragObserver$foundation_release", "cut", "cut$foundation_release", "deselect", "position", "deselect-_kEHs6E$foundation_release", "enterSelectionMode", "showFloatingToolbar", "enterSelectionMode$foundation_release", "exitSelectionMode", "exitSelectionMode$foundation_release", "getContentRect", "Landroidx/compose/ui/geometry/Rect;", "getCursorPosition", "density", "Landroidx/compose/ui/unit/Density;", "getCursorPosition-tuRUvjQ$foundation_release", "(Landroidx/compose/ui/unit/Density;)J", "getHandleLineHeight", "", "isStartHandle", "getHandleLineHeight$foundation_release", "getHandlePosition", "getHandlePosition-tuRUvjQ$foundation_release", "(Z)J", "handleDragObserver", "handleDragObserver$foundation_release", "hideSelectionToolbar", "hideSelectionToolbar$foundation_release", "isTextChanged", "isTextChanged$foundation_release", "paste", "paste$foundation_release", "selectAll", "selectAll$foundation_release", "selectWordAtPositionIfNotAlreadySelected", "selectWordAtPositionIfNotAlreadySelected-k-4lQ0M", "(J)V", "setDeletionPreviewHighlight", "range", "setDeletionPreviewHighlight-5zc-tL8$foundation_release", "setHandleState", "handleState", "Landroidx/compose/foundation/text/HandleState;", "setSelectionPreviewHighlight", "setSelectionPreviewHighlight-5zc-tL8$foundation_release", "showSelectionToolbar", "showSelectionToolbar$foundation_release", "updateFloatingToolbar", "show", "updateSelection", "currentPosition", "isStartOfSelection", "adjustment", "Landroidx/compose/foundation/text/selection/SelectionAdjustment;", "isTouchBasedSelection", "updateSelection-8UEBfa8", "(Landroidx/compose/ui/text/input/TextFieldValue;JZZLandroidx/compose/foundation/text/selection/SelectionAdjustment;Z)J", "foundation_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes.dex */
public final class TextFieldSelectionManager {
    public static final int $stable = 8;
    private Clipboard clipboard;
    private CoroutineScope coroutineScope;
    private final MutableState currentDragPosition$delegate;
    private Integer dragBeginOffsetInText;
    private long dragBeginPosition;
    private long dragTotalDistance;
    private final MutableState draggingHandle$delegate;
    private final MutableState editable$delegate;
    private final MutableState enabled$delegate;
    private FocusRequester focusRequester;
    private HapticFeedback hapticFeedBack;
    private final MouseSelectionObserver mouseSelectionObserver;
    private OffsetMapping offsetMapping;
    private TextFieldValue oldValue;
    private Function1<? super TextFieldValue, Unit> onValueChange;
    private int previousRawDragOffset;
    private SelectionLayout previousSelectionLayout;
    private Function0<Unit> requestAutofillAction;
    private LegacyTextFieldState state;
    private TextToolbar textToolbar;
    private final TextDragObserver touchSelectionObserver;
    private final UndoManager undoManager;
    private final MutableState value$delegate;
    private VisualTransformation visualTransformation;

    public TextFieldSelectionManager() {
        this(null, 1, null);
    }

    public TextFieldSelectionManager(UndoManager undoManager) {
        MutableState mutableStateOf$default;
        MutableState mutableStateOf$default2;
        MutableState mutableStateOf$default3;
        MutableState mutableStateOf$default4;
        MutableState mutableStateOf$default5;
        this.undoManager = undoManager;
        this.offsetMapping = ValidatingOffsetMappingKt.getValidatingEmptyOffsetMappingIdentity();
        this.onValueChange = new Function1<TextFieldValue, Unit>() { // from class: androidx.compose.foundation.text.selection.TextFieldSelectionManager$onValueChange$1
            @Override // kotlin.jvm.functions.Function1
            public /* bridge */ /* synthetic */ Unit invoke(TextFieldValue textFieldValue) {
                invoke2(textFieldValue);
                return Unit.INSTANCE;
            }

            /* renamed from: invoke  reason: avoid collision after fix types in other method */
            public final void invoke2(TextFieldValue it) {
            }
        };
        mutableStateOf$default = SnapshotStateKt__SnapshotStateKt.mutableStateOf$default(new TextFieldValue((String) null, 0L, (TextRange) null, 7, (DefaultConstructorMarker) null), null, 2, null);
        this.value$delegate = mutableStateOf$default;
        this.visualTransformation = VisualTransformation.Companion.getNone();
        mutableStateOf$default2 = SnapshotStateKt__SnapshotStateKt.mutableStateOf$default(true, null, 2, null);
        this.editable$delegate = mutableStateOf$default2;
        mutableStateOf$default3 = SnapshotStateKt__SnapshotStateKt.mutableStateOf$default(true, null, 2, null);
        this.enabled$delegate = mutableStateOf$default3;
        this.dragBeginPosition = Offset.Companion.m4064getZeroF1C5BW0();
        this.dragTotalDistance = Offset.Companion.m4064getZeroF1C5BW0();
        mutableStateOf$default4 = SnapshotStateKt__SnapshotStateKt.mutableStateOf$default(null, null, 2, null);
        this.draggingHandle$delegate = mutableStateOf$default4;
        mutableStateOf$default5 = SnapshotStateKt__SnapshotStateKt.mutableStateOf$default(null, null, 2, null);
        this.currentDragPosition$delegate = mutableStateOf$default5;
        this.previousRawDragOffset = -1;
        this.oldValue = new TextFieldValue((String) null, 0L, (TextRange) null, 7, (DefaultConstructorMarker) null);
        this.touchSelectionObserver = new TextDragObserver() { // from class: androidx.compose.foundation.text.selection.TextFieldSelectionManager$touchSelectionObserver$1
            @Override // androidx.compose.foundation.text.TextDragObserver
            /* renamed from: onDown-k-4lQ0M */
            public void mo1399onDownk4lQ0M(long point) {
            }

            @Override // androidx.compose.foundation.text.TextDragObserver
            public void onUp() {
            }

            @Override // androidx.compose.foundation.text.TextDragObserver
            /* renamed from: onStart-k-4lQ0M */
            public void mo1401onStartk4lQ0M(long startPoint) {
                long adjustedStartSelection;
                long j;
                TextLayoutResultProxy layoutResult;
                TextFieldValue newValue;
                TextLayoutResultProxy layoutResult2;
                if (TextFieldSelectionManager.this.getEnabled() && TextFieldSelectionManager.this.getDraggingHandle() == null) {
                    TextFieldSelectionManager.this.setDraggingHandle(Handle.SelectionEnd);
                    TextFieldSelectionManager.this.previousRawDragOffset = -1;
                    TextFieldSelectionManager.this.hideSelectionToolbar$foundation_release();
                    LegacyTextFieldState state$foundation_release = TextFieldSelectionManager.this.getState$foundation_release();
                    boolean z = (state$foundation_release == null || (layoutResult2 = state$foundation_release.getLayoutResult()) == null || !layoutResult2.m1434isPositionOnTextk4lQ0M(startPoint)) ? false : true;
                    TextFieldSelectionManager textFieldSelectionManager = TextFieldSelectionManager.this;
                    if (!z) {
                        LegacyTextFieldState state$foundation_release2 = textFieldSelectionManager.getState$foundation_release();
                        if (state$foundation_release2 != null && (layoutResult = state$foundation_release2.getLayoutResult()) != null) {
                            TextFieldSelectionManager textFieldSelectionManager2 = TextFieldSelectionManager.this;
                            int transformedOffset = TextLayoutResultProxy.m1432getOffsetForPosition3MmeM6k$default(layoutResult, startPoint, false, 2, null);
                            int offset = textFieldSelectionManager2.getOffsetMapping$foundation_release().transformedToOriginal(transformedOffset);
                            newValue = textFieldSelectionManager2.m1766createTextFieldValueFDrldGo(textFieldSelectionManager2.getValue$foundation_release().getAnnotatedString(), TextRangeKt.TextRange(offset, offset));
                            textFieldSelectionManager2.enterSelectionMode$foundation_release(false);
                            HapticFeedback hapticFeedBack = textFieldSelectionManager2.getHapticFeedBack();
                            if (hapticFeedBack != null) {
                                hapticFeedBack.mo5011performHapticFeedbackCdsT49E(HapticFeedbackType.Companion.m5027getTextHandleMove5zf0vsI());
                            }
                            textFieldSelectionManager2.getOnValueChange$foundation_release().invoke(newValue);
                        }
                    } else {
                        if (textFieldSelectionManager.getValue$foundation_release().getText().length() == 0) {
                            return;
                        }
                        TextFieldSelectionManager.this.enterSelectionMode$foundation_release(false);
                        adjustedStartSelection = TextFieldSelectionManager.this.m1769updateSelection8UEBfa8(TextFieldValue.m6582copy3r_uNRQ$default(TextFieldSelectionManager.this.getValue$foundation_release(), (AnnotatedString) null, TextRange.Companion.m6344getZerod9O1mEE(), (TextRange) null, 5, (Object) null), startPoint, true, false, SelectionAdjustment.Companion.getWord(), true);
                        TextFieldSelectionManager.this.dragBeginOffsetInText = Integer.valueOf(TextRange.m6339getStartimpl(adjustedStartSelection));
                    }
                    TextFieldSelectionManager.this.setHandleState(HandleState.None);
                    TextFieldSelectionManager.this.dragBeginPosition = startPoint;
                    TextFieldSelectionManager textFieldSelectionManager3 = TextFieldSelectionManager.this;
                    j = TextFieldSelectionManager.this.dragBeginPosition;
                    textFieldSelectionManager3.m1768setCurrentDragPosition_kEHs6E(Offset.m4037boximpl(j));
                    TextFieldSelectionManager.this.dragTotalDistance = Offset.Companion.m4064getZeroF1C5BW0();
                }
            }

            @Override // androidx.compose.foundation.text.TextDragObserver
            /* renamed from: onDrag-k-4lQ0M */
            public void mo1400onDragk4lQ0M(long delta) {
                long j;
                TextLayoutResultProxy layoutResult;
                long j2;
                long j3;
                Integer num;
                TextLayoutResultProxy layoutResult2;
                Integer num2;
                long j4;
                int m1433getOffsetForPosition3MmeM6k;
                Integer num3;
                long m1769updateSelection8UEBfa8;
                long j5;
                SelectionAdjustment adjustment;
                if (TextFieldSelectionManager.this.getEnabled()) {
                    if (TextFieldSelectionManager.this.getValue$foundation_release().getText().length() == 0) {
                        return;
                    }
                    TextFieldSelectionManager textFieldSelectionManager = TextFieldSelectionManager.this;
                    j = textFieldSelectionManager.dragTotalDistance;
                    textFieldSelectionManager.dragTotalDistance = Offset.m4053plusMKHz9U(j, delta);
                    LegacyTextFieldState state$foundation_release = TextFieldSelectionManager.this.getState$foundation_release();
                    if (state$foundation_release != null && (layoutResult = state$foundation_release.getLayoutResult()) != null) {
                        TextFieldSelectionManager textFieldSelectionManager2 = TextFieldSelectionManager.this;
                        j2 = textFieldSelectionManager2.dragBeginPosition;
                        j3 = textFieldSelectionManager2.dragTotalDistance;
                        textFieldSelectionManager2.m1768setCurrentDragPosition_kEHs6E(Offset.m4037boximpl(Offset.m4053plusMKHz9U(j2, j3)));
                        num = textFieldSelectionManager2.dragBeginOffsetInText;
                        if (num != null) {
                            layoutResult2 = layoutResult;
                        } else {
                            Offset m1771getCurrentDragPosition_m7T9E = textFieldSelectionManager2.m1771getCurrentDragPosition_m7T9E();
                            Intrinsics.checkNotNull(m1771getCurrentDragPosition_m7T9E);
                            if (layoutResult.m1434isPositionOnTextk4lQ0M(m1771getCurrentDragPosition_m7T9E.m4058unboximpl())) {
                                layoutResult2 = layoutResult;
                            } else {
                                OffsetMapping offsetMapping$foundation_release = textFieldSelectionManager2.getOffsetMapping$foundation_release();
                                j5 = textFieldSelectionManager2.dragBeginPosition;
                                int startOffset = offsetMapping$foundation_release.transformedToOriginal(TextLayoutResultProxy.m1432getOffsetForPosition3MmeM6k$default(layoutResult, j5, false, 2, null));
                                OffsetMapping offsetMapping$foundation_release2 = textFieldSelectionManager2.getOffsetMapping$foundation_release();
                                Offset m1771getCurrentDragPosition_m7T9E2 = textFieldSelectionManager2.m1771getCurrentDragPosition_m7T9E();
                                Intrinsics.checkNotNull(m1771getCurrentDragPosition_m7T9E2);
                                int endOffset = offsetMapping$foundation_release2.transformedToOriginal(TextLayoutResultProxy.m1432getOffsetForPosition3MmeM6k$default(layoutResult, m1771getCurrentDragPosition_m7T9E2.m4058unboximpl(), false, 2, null));
                                if (startOffset == endOffset) {
                                    adjustment = SelectionAdjustment.Companion.getNone();
                                } else {
                                    adjustment = SelectionAdjustment.Companion.getWord();
                                }
                                TextFieldValue value$foundation_release = textFieldSelectionManager2.getValue$foundation_release();
                                Offset m1771getCurrentDragPosition_m7T9E3 = textFieldSelectionManager2.m1771getCurrentDragPosition_m7T9E();
                                Intrinsics.checkNotNull(m1771getCurrentDragPosition_m7T9E3);
                                m1769updateSelection8UEBfa8 = textFieldSelectionManager2.m1769updateSelection8UEBfa8(value$foundation_release, m1771getCurrentDragPosition_m7T9E3.m4058unboximpl(), false, false, adjustment, true);
                                TextRange.m6327boximpl(m1769updateSelection8UEBfa8);
                            }
                        }
                        num2 = textFieldSelectionManager2.dragBeginOffsetInText;
                        if (num2 != null) {
                            m1433getOffsetForPosition3MmeM6k = num2.intValue();
                        } else {
                            j4 = textFieldSelectionManager2.dragBeginPosition;
                            m1433getOffsetForPosition3MmeM6k = layoutResult2.m1433getOffsetForPosition3MmeM6k(j4, false);
                        }
                        int startOffset2 = m1433getOffsetForPosition3MmeM6k;
                        Offset m1771getCurrentDragPosition_m7T9E4 = textFieldSelectionManager2.m1771getCurrentDragPosition_m7T9E();
                        Intrinsics.checkNotNull(m1771getCurrentDragPosition_m7T9E4);
                        int endOffset2 = layoutResult2.m1433getOffsetForPosition3MmeM6k(m1771getCurrentDragPosition_m7T9E4.m4058unboximpl(), false);
                        num3 = textFieldSelectionManager2.dragBeginOffsetInText;
                        if (num3 == null && startOffset2 == endOffset2) {
                            return;
                        }
                        TextFieldValue value$foundation_release2 = textFieldSelectionManager2.getValue$foundation_release();
                        Offset m1771getCurrentDragPosition_m7T9E5 = textFieldSelectionManager2.m1771getCurrentDragPosition_m7T9E();
                        Intrinsics.checkNotNull(m1771getCurrentDragPosition_m7T9E5);
                        m1769updateSelection8UEBfa8 = textFieldSelectionManager2.m1769updateSelection8UEBfa8(value$foundation_release2, m1771getCurrentDragPosition_m7T9E5.m4058unboximpl(), false, false, SelectionAdjustment.Companion.getWord(), true);
                        TextRange.m6327boximpl(m1769updateSelection8UEBfa8);
                    }
                    TextFieldSelectionManager.this.updateFloatingToolbar(false);
                }
            }

            @Override // androidx.compose.foundation.text.TextDragObserver
            public void onStop() {
                onEnd();
            }

            @Override // androidx.compose.foundation.text.TextDragObserver
            public void onCancel() {
                onEnd();
            }

            private final void onEnd() {
                TextFieldSelectionManager.this.setDraggingHandle(null);
                TextFieldSelectionManager.this.m1768setCurrentDragPosition_kEHs6E(null);
                boolean z = true;
                TextFieldSelectionManager.this.updateFloatingToolbar(true);
                TextFieldSelectionManager.this.dragBeginOffsetInText = null;
                boolean collapsed = TextRange.m6333getCollapsedimpl(TextFieldSelectionManager.this.getValue$foundation_release().m6587getSelectiond9O1mEE());
                TextFieldSelectionManager.this.setHandleState(collapsed ? HandleState.Cursor : HandleState.Selection);
                LegacyTextFieldState state$foundation_release = TextFieldSelectionManager.this.getState$foundation_release();
                if (state$foundation_release != null) {
                    state$foundation_release.setShowSelectionHandleStart(!collapsed && TextFieldSelectionManagerKt.isSelectionHandleInVisibleBound(TextFieldSelectionManager.this, true));
                }
                LegacyTextFieldState state$foundation_release2 = TextFieldSelectionManager.this.getState$foundation_release();
                if (state$foundation_release2 != null) {
                    state$foundation_release2.setShowSelectionHandleEnd(!collapsed && TextFieldSelectionManagerKt.isSelectionHandleInVisibleBound(TextFieldSelectionManager.this, false));
                }
                LegacyTextFieldState state$foundation_release3 = TextFieldSelectionManager.this.getState$foundation_release();
                if (state$foundation_release3 != null) {
                    if (!collapsed || !TextFieldSelectionManagerKt.isSelectionHandleInVisibleBound(TextFieldSelectionManager.this, true)) {
                        z = false;
                    }
                    state$foundation_release3.setShowCursorHandle(z);
                }
            }
        };
        this.mouseSelectionObserver = new MouseSelectionObserver() { // from class: androidx.compose.foundation.text.selection.TextFieldSelectionManager$mouseSelectionObserver$1
            @Override // androidx.compose.foundation.text.selection.MouseSelectionObserver
            /* renamed from: onExtend-k-4lQ0M */
            public boolean mo1637onExtendk4lQ0M(long downPosition) {
                LegacyTextFieldState state$foundation_release = TextFieldSelectionManager.this.getState$foundation_release();
                if (state$foundation_release == null || state$foundation_release.getLayoutResult() == null || !TextFieldSelectionManager.this.getEnabled()) {
                    return false;
                }
                TextFieldSelectionManager.this.previousRawDragOffset = -1;
                updateMouseSelection(TextFieldSelectionManager.this.getValue$foundation_release(), downPosition, false, SelectionAdjustment.Companion.getNone());
                return true;
            }

            @Override // androidx.compose.foundation.text.selection.MouseSelectionObserver
            /* renamed from: onExtendDrag-k-4lQ0M */
            public boolean mo1638onExtendDragk4lQ0M(long dragPosition) {
                LegacyTextFieldState state$foundation_release;
                if (TextFieldSelectionManager.this.getEnabled()) {
                    if (!(TextFieldSelectionManager.this.getValue$foundation_release().getText().length() == 0) && (state$foundation_release = TextFieldSelectionManager.this.getState$foundation_release()) != null && state$foundation_release.getLayoutResult() != null) {
                        updateMouseSelection(TextFieldSelectionManager.this.getValue$foundation_release(), dragPosition, false, SelectionAdjustment.Companion.getNone());
                        return true;
                    }
                    return false;
                }
                return false;
            }

            @Override // androidx.compose.foundation.text.selection.MouseSelectionObserver
            /* renamed from: onStart-3MmeM6k */
            public boolean mo1639onStart3MmeM6k(long downPosition, SelectionAdjustment adjustment) {
                LegacyTextFieldState state$foundation_release;
                long j;
                if (TextFieldSelectionManager.this.getEnabled()) {
                    if (!(TextFieldSelectionManager.this.getValue$foundation_release().getText().length() == 0) && (state$foundation_release = TextFieldSelectionManager.this.getState$foundation_release()) != null && state$foundation_release.getLayoutResult() != null) {
                        FocusRequester focusRequester = TextFieldSelectionManager.this.getFocusRequester();
                        if (focusRequester != null) {
                            FocusRequester.m3959requestFocus3ESFkO8$default(focusRequester, 0, 1, null);
                        }
                        TextFieldSelectionManager.this.dragBeginPosition = downPosition;
                        TextFieldSelectionManager.this.previousRawDragOffset = -1;
                        TextFieldSelectionManager.enterSelectionMode$foundation_release$default(TextFieldSelectionManager.this, false, 1, null);
                        TextFieldValue value$foundation_release = TextFieldSelectionManager.this.getValue$foundation_release();
                        j = TextFieldSelectionManager.this.dragBeginPosition;
                        updateMouseSelection(value$foundation_release, j, true, adjustment);
                        return true;
                    }
                    return false;
                }
                return false;
            }

            @Override // androidx.compose.foundation.text.selection.MouseSelectionObserver
            /* renamed from: onDrag-3MmeM6k */
            public boolean mo1636onDrag3MmeM6k(long dragPosition, SelectionAdjustment adjustment) {
                LegacyTextFieldState state$foundation_release;
                if (TextFieldSelectionManager.this.getEnabled()) {
                    if (!(TextFieldSelectionManager.this.getValue$foundation_release().getText().length() == 0) && (state$foundation_release = TextFieldSelectionManager.this.getState$foundation_release()) != null && state$foundation_release.getLayoutResult() != null) {
                        updateMouseSelection(TextFieldSelectionManager.this.getValue$foundation_release(), dragPosition, false, adjustment);
                        return true;
                    }
                    return false;
                }
                return false;
            }

            public final void updateMouseSelection(TextFieldValue value, long currentPosition, boolean isStartOfSelection, SelectionAdjustment adjustment) {
                long newSelection;
                newSelection = TextFieldSelectionManager.this.m1769updateSelection8UEBfa8(value, currentPosition, isStartOfSelection, false, adjustment, false);
                TextFieldSelectionManager.this.setHandleState(TextRange.m6333getCollapsedimpl(newSelection) ? HandleState.Cursor : HandleState.Selection);
            }

            @Override // androidx.compose.foundation.text.selection.MouseSelectionObserver
            public void onDragDone() {
            }
        };
    }

    public /* synthetic */ TextFieldSelectionManager(UndoManager undoManager, int i, DefaultConstructorMarker defaultConstructorMarker) {
        this((i & 1) != 0 ? null : undoManager);
    }

    public final UndoManager getUndoManager() {
        return this.undoManager;
    }

    public final OffsetMapping getOffsetMapping$foundation_release() {
        return this.offsetMapping;
    }

    public final void setOffsetMapping$foundation_release(OffsetMapping offsetMapping) {
        this.offsetMapping = offsetMapping;
    }

    public final Function1<TextFieldValue, Unit> getOnValueChange$foundation_release() {
        return this.onValueChange;
    }

    public final void setOnValueChange$foundation_release(Function1<? super TextFieldValue, Unit> function1) {
        this.onValueChange = function1;
    }

    public final LegacyTextFieldState getState$foundation_release() {
        return this.state;
    }

    public final void setState$foundation_release(LegacyTextFieldState legacyTextFieldState) {
        this.state = legacyTextFieldState;
    }

    public final TextFieldValue getValue$foundation_release() {
        State $this$getValue$iv = this.value$delegate;
        return (TextFieldValue) $this$getValue$iv.getValue();
    }

    public final void setValue$foundation_release(TextFieldValue textFieldValue) {
        MutableState $this$setValue$iv = this.value$delegate;
        $this$setValue$iv.setValue(textFieldValue);
    }

    public final AnnotatedString getTransformedText$foundation_release() {
        TextDelegate textDelegate;
        LegacyTextFieldState legacyTextFieldState = this.state;
        if (legacyTextFieldState == null || (textDelegate = legacyTextFieldState.getTextDelegate()) == null) {
            return null;
        }
        return textDelegate.getText();
    }

    public final VisualTransformation getVisualTransformation$foundation_release() {
        return this.visualTransformation;
    }

    public final void setVisualTransformation$foundation_release(VisualTransformation visualTransformation) {
        this.visualTransformation = visualTransformation;
    }

    public final Function0<Unit> getRequestAutofillAction$foundation_release() {
        return this.requestAutofillAction;
    }

    public final void setRequestAutofillAction$foundation_release(Function0<Unit> function0) {
        this.requestAutofillAction = function0;
    }

    public final Clipboard getClipboard$foundation_release() {
        return this.clipboard;
    }

    public final void setClipboard$foundation_release(Clipboard clipboard) {
        this.clipboard = clipboard;
    }

    public final CoroutineScope getCoroutineScope$foundation_release() {
        return this.coroutineScope;
    }

    public final void setCoroutineScope$foundation_release(CoroutineScope coroutineScope) {
        this.coroutineScope = coroutineScope;
    }

    public final TextToolbar getTextToolbar() {
        return this.textToolbar;
    }

    public final void setTextToolbar(TextToolbar textToolbar) {
        this.textToolbar = textToolbar;
    }

    public final HapticFeedback getHapticFeedBack() {
        return this.hapticFeedBack;
    }

    public final void setHapticFeedBack(HapticFeedback hapticFeedback) {
        this.hapticFeedBack = hapticFeedback;
    }

    public final FocusRequester getFocusRequester() {
        return this.focusRequester;
    }

    public final void setFocusRequester(FocusRequester focusRequester) {
        this.focusRequester = focusRequester;
    }

    public final boolean getEditable() {
        State $this$getValue$iv = this.editable$delegate;
        return ((Boolean) $this$getValue$iv.getValue()).booleanValue();
    }

    public final void setEditable(boolean z) {
        MutableState $this$setValue$iv = this.editable$delegate;
        $this$setValue$iv.setValue(Boolean.valueOf(z));
    }

    public final boolean getEnabled() {
        State $this$getValue$iv = this.enabled$delegate;
        return ((Boolean) $this$getValue$iv.getValue()).booleanValue();
    }

    public final void setEnabled(boolean z) {
        MutableState $this$setValue$iv = this.enabled$delegate;
        $this$setValue$iv.setValue(Boolean.valueOf(z));
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

    /* JADX INFO: Access modifiers changed from: private */
    /* renamed from: setCurrentDragPosition-_kEHs6E  reason: not valid java name */
    public final void m1768setCurrentDragPosition_kEHs6E(Offset offset) {
        MutableState $this$setValue$iv = this.currentDragPosition$delegate;
        $this$setValue$iv.setValue(offset);
    }

    /* renamed from: getCurrentDragPosition-_m7T9-E  reason: not valid java name */
    public final Offset m1771getCurrentDragPosition_m7T9E() {
        State $this$getValue$iv = this.currentDragPosition$delegate;
        return (Offset) $this$getValue$iv.getValue();
    }

    public final TextDragObserver getTouchSelectionObserver$foundation_release() {
        return this.touchSelectionObserver;
    }

    public final MouseSelectionObserver getMouseSelectionObserver$foundation_release() {
        return this.mouseSelectionObserver;
    }

    public final TextDragObserver handleDragObserver$foundation_release(final boolean isStartHandle) {
        return new TextDragObserver() { // from class: androidx.compose.foundation.text.selection.TextFieldSelectionManager$handleDragObserver$1
            @Override // androidx.compose.foundation.text.TextDragObserver
            /* renamed from: onDown-k-4lQ0M */
            public void mo1399onDownk4lQ0M(long point) {
                TextLayoutResultProxy layoutResult;
                TextFieldSelectionManager.this.setDraggingHandle(isStartHandle ? Handle.SelectionStart : Handle.SelectionEnd);
                long handleCoordinates = SelectionHandlesKt.m1716getAdjustedCoordinatesk4lQ0M(TextFieldSelectionManager.this.m1773getHandlePositiontuRUvjQ$foundation_release(isStartHandle));
                LegacyTextFieldState state$foundation_release = TextFieldSelectionManager.this.getState$foundation_release();
                if (state$foundation_release == null || (layoutResult = state$foundation_release.getLayoutResult()) == null) {
                    return;
                }
                long translatedPosition = layoutResult.m1436translateInnerToDecorationCoordinatesMKHz9U$foundation_release(handleCoordinates);
                TextFieldSelectionManager.this.dragBeginPosition = translatedPosition;
                TextFieldSelectionManager.this.m1768setCurrentDragPosition_kEHs6E(Offset.m4037boximpl(translatedPosition));
                TextFieldSelectionManager.this.dragTotalDistance = Offset.Companion.m4064getZeroF1C5BW0();
                TextFieldSelectionManager.this.previousRawDragOffset = -1;
                LegacyTextFieldState state$foundation_release2 = TextFieldSelectionManager.this.getState$foundation_release();
                if (state$foundation_release2 != null) {
                    state$foundation_release2.setInTouchMode(true);
                }
                TextFieldSelectionManager.this.updateFloatingToolbar(false);
            }

            @Override // androidx.compose.foundation.text.TextDragObserver
            public void onUp() {
                TextFieldSelectionManager.this.setDraggingHandle(null);
                TextFieldSelectionManager.this.m1768setCurrentDragPosition_kEHs6E(null);
                TextFieldSelectionManager.this.updateFloatingToolbar(true);
            }

            @Override // androidx.compose.foundation.text.TextDragObserver
            /* renamed from: onStart-k-4lQ0M */
            public void mo1401onStartk4lQ0M(long startPoint) {
            }

            @Override // androidx.compose.foundation.text.TextDragObserver
            /* renamed from: onDrag-k-4lQ0M */
            public void mo1400onDragk4lQ0M(long delta) {
                long j;
                long j2;
                long j3;
                TextFieldSelectionManager textFieldSelectionManager = TextFieldSelectionManager.this;
                j = textFieldSelectionManager.dragTotalDistance;
                textFieldSelectionManager.dragTotalDistance = Offset.m4053plusMKHz9U(j, delta);
                TextFieldSelectionManager textFieldSelectionManager2 = TextFieldSelectionManager.this;
                j2 = TextFieldSelectionManager.this.dragBeginPosition;
                j3 = TextFieldSelectionManager.this.dragTotalDistance;
                textFieldSelectionManager2.m1768setCurrentDragPosition_kEHs6E(Offset.m4037boximpl(Offset.m4053plusMKHz9U(j2, j3)));
                TextFieldSelectionManager textFieldSelectionManager3 = TextFieldSelectionManager.this;
                TextFieldValue value$foundation_release = TextFieldSelectionManager.this.getValue$foundation_release();
                Offset m1771getCurrentDragPosition_m7T9E = TextFieldSelectionManager.this.m1771getCurrentDragPosition_m7T9E();
                Intrinsics.checkNotNull(m1771getCurrentDragPosition_m7T9E);
                textFieldSelectionManager3.m1769updateSelection8UEBfa8(value$foundation_release, m1771getCurrentDragPosition_m7T9E.m4058unboximpl(), false, isStartHandle, SelectionAdjustment.Companion.getCharacterWithWordAccelerate(), true);
                TextFieldSelectionManager.this.updateFloatingToolbar(false);
            }

            @Override // androidx.compose.foundation.text.TextDragObserver
            public void onStop() {
                TextFieldSelectionManager.this.setDraggingHandle(null);
                TextFieldSelectionManager.this.m1768setCurrentDragPosition_kEHs6E(null);
                TextFieldSelectionManager.this.updateFloatingToolbar(true);
            }

            @Override // androidx.compose.foundation.text.TextDragObserver
            public void onCancel() {
            }
        };
    }

    public final TextDragObserver cursorDragObserver$foundation_release() {
        return new TextDragObserver() { // from class: androidx.compose.foundation.text.selection.TextFieldSelectionManager$cursorDragObserver$1
            @Override // androidx.compose.foundation.text.TextDragObserver
            /* renamed from: onDown-k-4lQ0M */
            public void mo1399onDownk4lQ0M(long point) {
            }

            @Override // androidx.compose.foundation.text.TextDragObserver
            public void onUp() {
                TextFieldSelectionManager.this.setDraggingHandle(null);
                TextFieldSelectionManager.this.m1768setCurrentDragPosition_kEHs6E(null);
            }

            @Override // androidx.compose.foundation.text.TextDragObserver
            /* renamed from: onStart-k-4lQ0M */
            public void mo1401onStartk4lQ0M(long startPoint) {
                TextLayoutResultProxy layoutResult;
                long handleCoordinates = SelectionHandlesKt.m1716getAdjustedCoordinatesk4lQ0M(TextFieldSelectionManager.this.m1773getHandlePositiontuRUvjQ$foundation_release(true));
                LegacyTextFieldState state$foundation_release = TextFieldSelectionManager.this.getState$foundation_release();
                if (state$foundation_release == null || (layoutResult = state$foundation_release.getLayoutResult()) == null) {
                    return;
                }
                long translatedPosition = layoutResult.m1436translateInnerToDecorationCoordinatesMKHz9U$foundation_release(handleCoordinates);
                TextFieldSelectionManager.this.dragBeginPosition = translatedPosition;
                TextFieldSelectionManager.this.m1768setCurrentDragPosition_kEHs6E(Offset.m4037boximpl(translatedPosition));
                TextFieldSelectionManager.this.dragTotalDistance = Offset.Companion.m4064getZeroF1C5BW0();
                TextFieldSelectionManager.this.setDraggingHandle(Handle.Cursor);
                TextFieldSelectionManager.this.updateFloatingToolbar(false);
            }

            @Override // androidx.compose.foundation.text.TextDragObserver
            /* renamed from: onDrag-k-4lQ0M */
            public void mo1400onDragk4lQ0M(long delta) {
                long j;
                TextLayoutResultProxy layoutResult;
                long j2;
                long j3;
                TextFieldValue m1766createTextFieldValueFDrldGo;
                HapticFeedback hapticFeedBack;
                TextFieldSelectionManager textFieldSelectionManager = TextFieldSelectionManager.this;
                j = textFieldSelectionManager.dragTotalDistance;
                textFieldSelectionManager.dragTotalDistance = Offset.m4053plusMKHz9U(j, delta);
                LegacyTextFieldState state$foundation_release = TextFieldSelectionManager.this.getState$foundation_release();
                if (state$foundation_release != null && (layoutResult = state$foundation_release.getLayoutResult()) != null) {
                    TextFieldSelectionManager textFieldSelectionManager2 = TextFieldSelectionManager.this;
                    j2 = textFieldSelectionManager2.dragBeginPosition;
                    j3 = textFieldSelectionManager2.dragTotalDistance;
                    textFieldSelectionManager2.m1768setCurrentDragPosition_kEHs6E(Offset.m4037boximpl(Offset.m4053plusMKHz9U(j2, j3)));
                    OffsetMapping offsetMapping$foundation_release = textFieldSelectionManager2.getOffsetMapping$foundation_release();
                    Offset m1771getCurrentDragPosition_m7T9E = textFieldSelectionManager2.m1771getCurrentDragPosition_m7T9E();
                    Intrinsics.checkNotNull(m1771getCurrentDragPosition_m7T9E);
                    int offset = offsetMapping$foundation_release.transformedToOriginal(TextLayoutResultProxy.m1432getOffsetForPosition3MmeM6k$default(layoutResult, m1771getCurrentDragPosition_m7T9E.m4058unboximpl(), false, 2, null));
                    long newSelection = TextRangeKt.TextRange(offset, offset);
                    if (TextRange.m6332equalsimpl0(newSelection, textFieldSelectionManager2.getValue$foundation_release().m6587getSelectiond9O1mEE())) {
                        return;
                    }
                    LegacyTextFieldState state$foundation_release2 = textFieldSelectionManager2.getState$foundation_release();
                    boolean z = false;
                    if (state$foundation_release2 != null && !state$foundation_release2.isInTouchMode()) {
                        z = true;
                    }
                    if (!z && (hapticFeedBack = textFieldSelectionManager2.getHapticFeedBack()) != null) {
                        hapticFeedBack.mo5011performHapticFeedbackCdsT49E(HapticFeedbackType.Companion.m5027getTextHandleMove5zf0vsI());
                    }
                    Function1<TextFieldValue, Unit> onValueChange$foundation_release = textFieldSelectionManager2.getOnValueChange$foundation_release();
                    m1766createTextFieldValueFDrldGo = textFieldSelectionManager2.m1766createTextFieldValueFDrldGo(textFieldSelectionManager2.getValue$foundation_release().getAnnotatedString(), newSelection);
                    onValueChange$foundation_release.invoke(m1766createTextFieldValueFDrldGo);
                }
            }

            @Override // androidx.compose.foundation.text.TextDragObserver
            public void onStop() {
                TextFieldSelectionManager.this.setDraggingHandle(null);
                TextFieldSelectionManager.this.m1768setCurrentDragPosition_kEHs6E(null);
            }

            @Override // androidx.compose.foundation.text.TextDragObserver
            public void onCancel() {
            }
        };
    }

    public static /* synthetic */ void enterSelectionMode$foundation_release$default(TextFieldSelectionManager textFieldSelectionManager, boolean z, int i, Object obj) {
        if ((i & 1) != 0) {
            z = true;
        }
        textFieldSelectionManager.enterSelectionMode$foundation_release(z);
    }

    public final void enterSelectionMode$foundation_release(boolean showFloatingToolbar) {
        FocusRequester focusRequester;
        LegacyTextFieldState legacyTextFieldState = this.state;
        if (((legacyTextFieldState == null || legacyTextFieldState.getHasFocus()) ? false : true) && (focusRequester = this.focusRequester) != null) {
            FocusRequester.m3959requestFocus3ESFkO8$default(focusRequester, 0, 1, null);
        }
        this.oldValue = getValue$foundation_release();
        updateFloatingToolbar(showFloatingToolbar);
        setHandleState(HandleState.Selection);
    }

    public final void exitSelectionMode$foundation_release() {
        updateFloatingToolbar(false);
        setHandleState(HandleState.None);
    }

    /* renamed from: deselect-_kEHs6E$foundation_release$default  reason: not valid java name */
    public static /* synthetic */ void m1767deselect_kEHs6E$foundation_release$default(TextFieldSelectionManager textFieldSelectionManager, Offset offset, int i, Object obj) {
        if ((i & 1) != 0) {
            offset = null;
        }
        textFieldSelectionManager.m1770deselect_kEHs6E$foundation_release(offset);
    }

    /* renamed from: deselect-_kEHs6E$foundation_release  reason: not valid java name */
    public final void m1770deselect_kEHs6E$foundation_release(Offset position) {
        HandleState selectionMode;
        int newCursorOffset;
        if (!TextRange.m6333getCollapsedimpl(getValue$foundation_release().m6587getSelectiond9O1mEE())) {
            LegacyTextFieldState legacyTextFieldState = this.state;
            TextLayoutResultProxy layoutResult = legacyTextFieldState != null ? legacyTextFieldState.getLayoutResult() : null;
            if (position != null && layoutResult != null) {
                newCursorOffset = this.offsetMapping.transformedToOriginal(TextLayoutResultProxy.m1432getOffsetForPosition3MmeM6k$default(layoutResult, position.m4058unboximpl(), false, 2, null));
            } else {
                newCursorOffset = TextRange.m6336getMaximpl(getValue$foundation_release().m6587getSelectiond9O1mEE());
            }
            TextFieldValue newValue = TextFieldValue.m6582copy3r_uNRQ$default(getValue$foundation_release(), (AnnotatedString) null, TextRangeKt.TextRange(newCursorOffset), (TextRange) null, 5, (Object) null);
            this.onValueChange.invoke(newValue);
        }
        if (position != null) {
            if (getValue$foundation_release().getText().length() > 0) {
                selectionMode = HandleState.Cursor;
                setHandleState(selectionMode);
                updateFloatingToolbar(false);
            }
        }
        selectionMode = HandleState.None;
        setHandleState(selectionMode);
        updateFloatingToolbar(false);
    }

    /* renamed from: setSelectionPreviewHighlight-5zc-tL8$foundation_release  reason: not valid java name */
    public final void m1776setSelectionPreviewHighlight5zctL8$foundation_release(long range) {
        LegacyTextFieldState legacyTextFieldState = this.state;
        if (legacyTextFieldState != null) {
            legacyTextFieldState.m1343setSelectionPreviewHighlightRange5zctL8(range);
        }
        LegacyTextFieldState legacyTextFieldState2 = this.state;
        if (legacyTextFieldState2 != null) {
            legacyTextFieldState2.m1340setDeletionPreviewHighlightRange5zctL8(TextRange.Companion.m6344getZerod9O1mEE());
        }
        if (!TextRange.m6333getCollapsedimpl(range)) {
            exitSelectionMode$foundation_release();
        }
    }

    /* renamed from: setDeletionPreviewHighlight-5zc-tL8$foundation_release  reason: not valid java name */
    public final void m1775setDeletionPreviewHighlight5zctL8$foundation_release(long range) {
        LegacyTextFieldState legacyTextFieldState = this.state;
        if (legacyTextFieldState != null) {
            legacyTextFieldState.m1340setDeletionPreviewHighlightRange5zctL8(range);
        }
        LegacyTextFieldState legacyTextFieldState2 = this.state;
        if (legacyTextFieldState2 != null) {
            legacyTextFieldState2.m1343setSelectionPreviewHighlightRange5zctL8(TextRange.Companion.m6344getZerod9O1mEE());
        }
        if (!TextRange.m6333getCollapsedimpl(range)) {
            exitSelectionMode$foundation_release();
        }
    }

    public final void clearPreviewHighlight$foundation_release() {
        LegacyTextFieldState legacyTextFieldState = this.state;
        if (legacyTextFieldState != null) {
            legacyTextFieldState.m1340setDeletionPreviewHighlightRange5zctL8(TextRange.Companion.m6344getZerod9O1mEE());
        }
        LegacyTextFieldState legacyTextFieldState2 = this.state;
        if (legacyTextFieldState2 == null) {
            return;
        }
        legacyTextFieldState2.m1343setSelectionPreviewHighlightRange5zctL8(TextRange.Companion.m6344getZerod9O1mEE());
    }

    public static /* synthetic */ Job copy$foundation_release$default(TextFieldSelectionManager textFieldSelectionManager, boolean z, int i, Object obj) {
        if ((i & 1) != 0) {
            z = true;
        }
        return textFieldSelectionManager.copy$foundation_release(z);
    }

    public final Job copy$foundation_release(boolean cancelSelection) {
        Job launch$default;
        CoroutineScope coroutineScope = this.coroutineScope;
        if (coroutineScope != null) {
            launch$default = BuildersKt__Builders_commonKt.launch$default(coroutineScope, null, CoroutineStart.UNDISPATCHED, new TextFieldSelectionManager$copy$1(this, cancelSelection, null), 1, null);
            return launch$default;
        }
        return null;
    }

    public final Job paste$foundation_release() {
        Job launch$default;
        CoroutineScope coroutineScope = this.coroutineScope;
        if (coroutineScope != null) {
            launch$default = BuildersKt__Builders_commonKt.launch$default(coroutineScope, null, CoroutineStart.UNDISPATCHED, new TextFieldSelectionManager$paste$1(this, null), 1, null);
            return launch$default;
        }
        return null;
    }

    public final Job cut$foundation_release() {
        Job launch$default;
        CoroutineScope coroutineScope = this.coroutineScope;
        if (coroutineScope != null) {
            launch$default = BuildersKt__Builders_commonKt.launch$default(coroutineScope, null, CoroutineStart.UNDISPATCHED, new TextFieldSelectionManager$cut$1(this, null), 1, null);
            return launch$default;
        }
        return null;
    }

    public final void selectAll$foundation_release() {
        TextFieldValue newValue = m1766createTextFieldValueFDrldGo(getValue$foundation_release().getAnnotatedString(), TextRangeKt.TextRange(0, getValue$foundation_release().getText().length()));
        this.onValueChange.invoke(newValue);
        this.oldValue = TextFieldValue.m6582copy3r_uNRQ$default(this.oldValue, (AnnotatedString) null, newValue.m6587getSelectiond9O1mEE(), (TextRange) null, 5, (Object) null);
        enterSelectionMode$foundation_release(true);
    }

    public final void autofill$foundation_release() {
        Function0<Unit> function0 = this.requestAutofillAction;
        if (function0 != null) {
            function0.invoke();
        }
    }

    /* renamed from: getHandlePosition-tuRUvjQ$foundation_release  reason: not valid java name */
    public final long m1773getHandlePositiontuRUvjQ$foundation_release(boolean isStartHandle) {
        TextLayoutResultProxy layoutResult;
        TextLayoutResult textLayoutResult;
        LegacyTextFieldState legacyTextFieldState = this.state;
        if (legacyTextFieldState == null || (layoutResult = legacyTextFieldState.getLayoutResult()) == null || (textLayoutResult = layoutResult.getValue()) == null) {
            return Offset.Companion.m4063getUnspecifiedF1C5BW0();
        }
        AnnotatedString transformedText = getTransformedText$foundation_release();
        if (transformedText == null) {
            return Offset.Companion.m4063getUnspecifiedF1C5BW0();
        }
        String layoutInputText = textLayoutResult.getLayoutInput().getText().getText();
        if (Intrinsics.areEqual(transformedText.getText(), layoutInputText)) {
            long m6587getSelectiond9O1mEE = getValue$foundation_release().m6587getSelectiond9O1mEE();
            int offset = isStartHandle ? TextRange.m6339getStartimpl(m6587getSelectiond9O1mEE) : TextRange.m6334getEndimpl(m6587getSelectiond9O1mEE);
            return TextSelectionDelegateKt.getSelectionHandleCoordinates(textLayoutResult, this.offsetMapping.originalToTransformed(offset), isStartHandle, TextRange.m6338getReversedimpl(getValue$foundation_release().m6587getSelectiond9O1mEE()));
        }
        return Offset.Companion.m4063getUnspecifiedF1C5BW0();
    }

    public final float getHandleLineHeight$foundation_release(boolean isStartHandle) {
        TextLayoutResultProxy layoutResult;
        TextLayoutResult value;
        long m6587getSelectiond9O1mEE = getValue$foundation_release().m6587getSelectiond9O1mEE();
        int offset = isStartHandle ? TextRange.m6339getStartimpl(m6587getSelectiond9O1mEE) : TextRange.m6334getEndimpl(m6587getSelectiond9O1mEE);
        LegacyTextFieldState legacyTextFieldState = this.state;
        if (legacyTextFieldState == null || (layoutResult = legacyTextFieldState.getLayoutResult()) == null || (value = layoutResult.getValue()) == null) {
            return 0.0f;
        }
        return TextLayoutHelperKt.getLineHeight(value, offset);
    }

    /* renamed from: getCursorPosition-tuRUvjQ$foundation_release  reason: not valid java name */
    public final long m1772getCursorPositiontuRUvjQ$foundation_release(Density density) {
        int offset = this.offsetMapping.originalToTransformed(TextRange.m6339getStartimpl(getValue$foundation_release().m6587getSelectiond9O1mEE()));
        LegacyTextFieldState legacyTextFieldState = this.state;
        TextLayoutResultProxy layoutResult = legacyTextFieldState != null ? legacyTextFieldState.getLayoutResult() : null;
        Intrinsics.checkNotNull(layoutResult);
        TextLayoutResult layoutResult2 = layoutResult.getValue();
        Rect cursorRect = layoutResult2.getCursorRect(RangesKt.coerceIn(offset, 0, layoutResult2.getLayoutInput().getText().length()));
        float x = cursorRect.getLeft() + (density.mo644toPx0680j_4(TextFieldCursor_androidKt.getDefaultCursorThickness()) / 2.0f);
        float y$iv = cursorRect.getBottom();
        long v1$iv$iv = Float.floatToRawIntBits(x);
        long v2$iv$iv = Float.floatToRawIntBits(y$iv);
        return Offset.m4040constructorimpl((v1$iv$iv << 32) | (4294967295L & v2$iv$iv));
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final void updateFloatingToolbar(boolean show) {
        LegacyTextFieldState legacyTextFieldState = this.state;
        if (legacyTextFieldState != null) {
            legacyTextFieldState.setShowFloatingToolbar(show);
        }
        if (show) {
            showSelectionToolbar$foundation_release();
        } else {
            hideSelectionToolbar$foundation_release();
        }
    }

    public final Job showSelectionToolbar$foundation_release() {
        Job launch$default;
        CoroutineScope coroutineScope = this.coroutineScope;
        if (coroutineScope != null) {
            launch$default = BuildersKt__Builders_commonKt.launch$default(coroutineScope, null, CoroutineStart.UNDISPATCHED, new TextFieldSelectionManager$showSelectionToolbar$1(this, null), 1, null);
            return launch$default;
        }
        return null;
    }

    public final void hideSelectionToolbar$foundation_release() {
        TextToolbar textToolbar;
        TextToolbar textToolbar2 = this.textToolbar;
        if ((textToolbar2 != null ? textToolbar2.getStatus() : null) != TextToolbarStatus.Shown || (textToolbar = this.textToolbar) == null) {
            return;
        }
        textToolbar.hide();
    }

    /* renamed from: selectWordAtPositionIfNotAlreadySelected-k-4lQ0M  reason: not valid java name */
    public final void m1774selectWordAtPositionIfNotAlreadySelectedk4lQ0M(long position) {
        TextLayoutResultProxy layoutResult;
        LegacyTextFieldState legacyTextFieldState = this.state;
        if (legacyTextFieldState != null && (layoutResult = legacyTextFieldState.getLayoutResult()) != null) {
            boolean isClickedPositionInsideSelection = TextLayoutHelperKt.m1430isPositionInsideSelectionuaM50fQ(layoutResult.getValue(), layoutResult.m1435translateDecorationToInnerCoordinatesMKHz9U$foundation_release(position), TextRange.m6327boximpl(getValue$foundation_release().m6587getSelectiond9O1mEE()));
            if (!isClickedPositionInsideSelection) {
                m1769updateSelection8UEBfa8(getValue$foundation_release(), position, true, false, SelectionAdjustment.Companion.getWord(), false);
            }
        }
    }

    public final boolean isTextChanged$foundation_release() {
        return !Intrinsics.areEqual(this.oldValue.getText(), getValue$foundation_release().getText());
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* JADX WARN: Removed duplicated region for block: B:39:0x00f2  */
    /* JADX WARN: Removed duplicated region for block: B:51:0x0145  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final androidx.compose.ui.geometry.Rect getContentRect() {
        /*
            Method dump skipped, instructions count: 468
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.compose.foundation.text.selection.TextFieldSelectionManager.getContentRect():androidx.compose.ui.geometry.Rect");
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* JADX WARN: Code restructure failed: missing block: B:93:0x01a2, code lost:
        if (androidx.compose.foundation.text.selection.TextFieldSelectionManagerKt.isSelectionHandleInVisibleBound(r25, true) != false) goto L81;
     */
    /* JADX WARN: Removed duplicated region for block: B:50:0x011d  */
    /* JADX WARN: Removed duplicated region for block: B:62:0x0150  */
    /* JADX WARN: Removed duplicated region for block: B:66:0x015e  */
    /* JADX WARN: Removed duplicated region for block: B:70:0x0166  */
    /* JADX WARN: Removed duplicated region for block: B:80:0x017f  */
    /* JADX WARN: Removed duplicated region for block: B:90:0x0197  */
    /* renamed from: updateSelection-8UEBfa8  reason: not valid java name */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final long m1769updateSelection8UEBfa8(androidx.compose.ui.text.input.TextFieldValue r26, long r27, boolean r29, boolean r30, androidx.compose.foundation.text.selection.SelectionAdjustment r31, boolean r32) {
        /*
            Method dump skipped, instructions count: 437
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.compose.foundation.text.selection.TextFieldSelectionManager.m1769updateSelection8UEBfa8(androidx.compose.ui.text.input.TextFieldValue, long, boolean, boolean, androidx.compose.foundation.text.selection.SelectionAdjustment, boolean):long");
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final void setHandleState(HandleState handleState) {
        LegacyTextFieldState it = this.state;
        if (it != null) {
            if (it.getHandleState() == handleState) {
                it = null;
            }
            if (it != null) {
                it.setHandleState(handleState);
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* renamed from: createTextFieldValue-FDrldGo  reason: not valid java name */
    public final TextFieldValue m1766createTextFieldValueFDrldGo(AnnotatedString annotatedString, long selection) {
        return new TextFieldValue(annotatedString, selection, (TextRange) null, 4, (DefaultConstructorMarker) null);
    }
}
