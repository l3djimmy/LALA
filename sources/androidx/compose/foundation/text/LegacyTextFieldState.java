package androidx.compose.foundation.text;

import androidx.compose.runtime.MutableState;
import androidx.compose.runtime.RecomposeScope;
import androidx.compose.runtime.SnapshotStateKt__SnapshotStateKt;
import androidx.compose.runtime.State;
import androidx.compose.ui.focus.FocusManager;
import androidx.compose.ui.graphics.AndroidPaint_androidKt;
import androidx.compose.ui.graphics.Color;
import androidx.compose.ui.graphics.Paint;
import androidx.compose.ui.layout.LayoutCoordinates;
import androidx.compose.ui.platform.SoftwareKeyboardController;
import androidx.compose.ui.text.AnnotatedString;
import androidx.compose.ui.text.TextRange;
import androidx.compose.ui.text.TextStyle;
import androidx.compose.ui.text.font.FontFamily;
import androidx.compose.ui.text.input.EditProcessor;
import androidx.compose.ui.text.input.ImeAction;
import androidx.compose.ui.text.input.TextFieldValue;
import androidx.compose.ui.text.input.TextInputSession;
import androidx.compose.ui.unit.Density;
import androidx.compose.ui.unit.Dp;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.collections.CollectionsKt;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
/* compiled from: CoreTextField.kt */
@Metadata(d1 = {"\u0000º\u0001\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0007\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0018\u0002\n\u0002\b\u000b\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\r\n\u0002\u0018\u0002\n\u0002\b\b\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\b\u001c\n\u0002\u0018\u0002\n\u0002\b\b\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\b\u0000\u0018\u00002\u00020\u0001B\u001f\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\b\u0010\u0006\u001a\u0004\u0018\u00010\u0007¢\u0006\u0002\u0010\bJ\u0007\u0010\u0084\u0001\u001a\u00020\fJ{\u0010\u0085\u0001\u001a\u00020T2\u0006\u0010~\u001a\u00020\u007f2\u0007\u0010\u0086\u0001\u001a\u00020\u007f2\b\u0010\u0087\u0001\u001a\u00030\u0088\u00012\u0007\u0010\u0089\u0001\u001a\u00020\f2\b\u0010\u008a\u0001\u001a\u00030\u008b\u00012\b\u0010\u008c\u0001\u001a\u00030\u008d\u00012\u0012\u0010W\u001a\u000e\u0012\u0004\u0012\u00020X\u0012\u0004\u0012\u00020T0R2\b\u0010\u008e\u0001\u001a\u00030\u008f\u00012\b\u0010\u0090\u0001\u001a\u00030\u0091\u00012\u0006\u0010a\u001a\u00020bø\u0001\u0000¢\u0006\u0006\b\u0092\u0001\u0010\u0093\u0001R\u0010\u0010\t\u001a\u0004\u0018\u00010\nX\u0082\u000e¢\u0006\u0002\n\u0000R+\u0010\r\u001a\u00020\f2\u0006\u0010\u000b\u001a\u00020\f8F@FX\u0086\u008e\u0002¢\u0006\u0012\n\u0004\b\u0012\u0010\u0013\u001a\u0004\b\u000e\u0010\u000f\"\u0004\b\u0010\u0010\u0011R1\u0010\u0015\u001a\u00020\u00142\u0006\u0010\u000b\u001a\u00020\u00148F@FX\u0086\u008e\u0002ø\u0001\u0000ø\u0001\u0001¢\u0006\u0012\n\u0004\b\u001a\u0010\u0013\u001a\u0004\b\u0016\u0010\u0017\"\u0004\b\u0018\u0010\u0019R+\u0010\u001c\u001a\u00020\u001b2\u0006\u0010\u000b\u001a\u00020\u001b8F@FX\u0086\u008e\u0002¢\u0006\u0012\n\u0004\b!\u0010\u0013\u001a\u0004\b\u001d\u0010\u001e\"\u0004\b\u001f\u0010 R+\u0010\"\u001a\u00020\f2\u0006\u0010\u000b\u001a\u00020\f8F@FX\u0086\u008e\u0002¢\u0006\u0012\n\u0004\b%\u0010\u0013\u001a\u0004\b#\u0010\u000f\"\u0004\b$\u0010\u0011R\u0011\u0010&\u001a\u00020'¢\u0006\b\n\u0000\u001a\u0004\b(\u0010)R\u001c\u0010*\u001a\u0004\u0018\u00010+X\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b,\u0010-\"\u0004\b.\u0010/R+\u00100\u001a\u00020\f2\u0006\u0010\u000b\u001a\u00020\f8F@FX\u0086\u008e\u0002¢\u0006\u0012\n\u0004\b2\u0010\u0013\u001a\u0004\b0\u0010\u000f\"\u0004\b1\u0010\u0011R\u001e\u00103\u001a\u00020\f2\u0006\u0010\u000b\u001a\u00020\f@BX\u0086\u000e¢\u0006\b\n\u0000\u001a\u0004\b3\u0010\u000fR+\u00104\u001a\u00020\f2\u0006\u0010\u000b\u001a\u00020\f8F@FX\u0086\u008e\u0002¢\u0006\u0012\n\u0004\b7\u0010\u0013\u001a\u0004\b5\u0010\u000f\"\u0004\b6\u0010\u0011R\u000e\u00108\u001a\u000209X\u0082\u0004¢\u0006\u0002\n\u0000R\u0013\u0010\u0006\u001a\u0004\u0018\u00010\u0007¢\u0006\b\n\u0000\u001a\u0004\b:\u0010;R(\u0010=\u001a\u0004\u0018\u00010\n2\b\u0010<\u001a\u0004\u0018\u00010\n8F@FX\u0086\u000e¢\u0006\f\u001a\u0004\b>\u0010?\"\u0004\b@\u0010AR(\u0010C\u001a\u0004\u0018\u00010B2\b\u0010<\u001a\u0004\u0018\u00010B8F@FX\u0086\u000e¢\u0006\f\u001a\u0004\bD\u0010E\"\u0004\bF\u0010GR\u0016\u0010H\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010B0IX\u0082\u0004¢\u0006\u0002\n\u0000R1\u0010K\u001a\u00020J2\u0006\u0010\u000b\u001a\u00020J8F@FX\u0086\u008e\u0002ø\u0001\u0000ø\u0001\u0001¢\u0006\u0012\n\u0004\bP\u0010\u0013\u001a\u0004\bL\u0010M\"\u0004\bN\u0010OR\u001d\u0010Q\u001a\u000e\u0012\u0004\u0012\u00020S\u0012\u0004\u0012\u00020T0R¢\u0006\b\n\u0000\u001a\u0004\bU\u0010VR\u001d\u0010W\u001a\u000e\u0012\u0004\u0012\u00020X\u0012\u0004\u0012\u00020T0R¢\u0006\b\n\u0000\u001a\u0004\bY\u0010VR\u001a\u0010Z\u001a\u000e\u0012\u0004\u0012\u00020X\u0012\u0004\u0012\u00020T0RX\u0082\u000e¢\u0006\u0002\n\u0000R\u0011\u0010[\u001a\u00020\\¢\u0006\b\n\u0000\u001a\u0004\b]\u0010^R\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b_\u0010`R\"\u0010a\u001a\u00020bX\u0086\u000eø\u0001\u0000ø\u0001\u0001¢\u0006\u0010\n\u0002\u0010e\u001a\u0004\bc\u0010\u0017\"\u0004\bd\u0010\u0019R1\u0010f\u001a\u00020\u00142\u0006\u0010\u000b\u001a\u00020\u00148F@FX\u0086\u008e\u0002ø\u0001\u0000ø\u0001\u0001¢\u0006\u0012\n\u0004\bi\u0010\u0013\u001a\u0004\bg\u0010\u0017\"\u0004\bh\u0010\u0019R+\u0010j\u001a\u00020\f2\u0006\u0010\u000b\u001a\u00020\f8F@FX\u0086\u008e\u0002¢\u0006\u0012\n\u0004\bm\u0010\u0013\u001a\u0004\bk\u0010\u000f\"\u0004\bl\u0010\u0011R+\u0010n\u001a\u00020\f2\u0006\u0010\u000b\u001a\u00020\f8F@FX\u0086\u008e\u0002¢\u0006\u0012\n\u0004\bq\u0010\u0013\u001a\u0004\bo\u0010\u000f\"\u0004\bp\u0010\u0011R+\u0010r\u001a\u00020\f2\u0006\u0010\u000b\u001a\u00020\f8F@FX\u0086\u008e\u0002¢\u0006\u0012\n\u0004\bu\u0010\u0013\u001a\u0004\bs\u0010\u000f\"\u0004\bt\u0010\u0011R+\u0010v\u001a\u00020\f2\u0006\u0010\u000b\u001a\u00020\f8F@FX\u0086\u008e\u0002¢\u0006\u0012\n\u0004\by\u0010\u0013\u001a\u0004\bw\u0010\u000f\"\u0004\bx\u0010\u0011R\u001a\u0010\u0002\u001a\u00020\u0003X\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\bz\u0010{\"\u0004\b|\u0010}R \u0010~\u001a\u0004\u0018\u00010\u007fX\u0086\u000e¢\u0006\u0012\n\u0000\u001a\u0006\b\u0080\u0001\u0010\u0081\u0001\"\u0006\b\u0082\u0001\u0010\u0083\u0001\u0082\u0002\u000b\n\u0005\b¡\u001e0\u0001\n\u0002\b!¨\u0006\u0094\u0001"}, d2 = {"Landroidx/compose/foundation/text/LegacyTextFieldState;", "", "textDelegate", "Landroidx/compose/foundation/text/TextDelegate;", "recomposeScope", "Landroidx/compose/runtime/RecomposeScope;", "keyboardController", "Landroidx/compose/ui/platform/SoftwareKeyboardController;", "(Landroidx/compose/foundation/text/TextDelegate;Landroidx/compose/runtime/RecomposeScope;Landroidx/compose/ui/platform/SoftwareKeyboardController;)V", "_layoutCoordinates", "Landroidx/compose/ui/layout/LayoutCoordinates;", "<set-?>", "", "autofillHighlightOn", "getAutofillHighlightOn", "()Z", "setAutofillHighlightOn", "(Z)V", "autofillHighlightOn$delegate", "Landroidx/compose/runtime/MutableState;", "Landroidx/compose/ui/text/TextRange;", "deletionPreviewHighlightRange", "getDeletionPreviewHighlightRange-d9O1mEE", "()J", "setDeletionPreviewHighlightRange-5zc-tL8", "(J)V", "deletionPreviewHighlightRange$delegate", "Landroidx/compose/foundation/text/HandleState;", "handleState", "getHandleState", "()Landroidx/compose/foundation/text/HandleState;", "setHandleState", "(Landroidx/compose/foundation/text/HandleState;)V", "handleState$delegate", "hasFocus", "getHasFocus", "setHasFocus", "hasFocus$delegate", "highlightPaint", "Landroidx/compose/ui/graphics/Paint;", "getHighlightPaint", "()Landroidx/compose/ui/graphics/Paint;", "inputSession", "Landroidx/compose/ui/text/input/TextInputSession;", "getInputSession", "()Landroidx/compose/ui/text/input/TextInputSession;", "setInputSession", "(Landroidx/compose/ui/text/input/TextInputSession;)V", "isInTouchMode", "setInTouchMode", "isInTouchMode$delegate", "isLayoutResultStale", "justAutofilled", "getJustAutofilled", "setJustAutofilled", "justAutofilled$delegate", "keyboardActionRunner", "Landroidx/compose/foundation/text/KeyboardActionRunner;", "getKeyboardController", "()Landroidx/compose/ui/platform/SoftwareKeyboardController;", "value", "layoutCoordinates", "getLayoutCoordinates", "()Landroidx/compose/ui/layout/LayoutCoordinates;", "setLayoutCoordinates", "(Landroidx/compose/ui/layout/LayoutCoordinates;)V", "Landroidx/compose/foundation/text/TextLayoutResultProxy;", "layoutResult", "getLayoutResult", "()Landroidx/compose/foundation/text/TextLayoutResultProxy;", "setLayoutResult", "(Landroidx/compose/foundation/text/TextLayoutResultProxy;)V", "layoutResultState", "Landroidx/compose/runtime/MutableState;", "Landroidx/compose/ui/unit/Dp;", "minHeightForSingleLineField", "getMinHeightForSingleLineField-D9Ej5fM", "()F", "setMinHeightForSingleLineField-0680j_4", "(F)V", "minHeightForSingleLineField$delegate", "onImeActionPerformed", "Lkotlin/Function1;", "Landroidx/compose/ui/text/input/ImeAction;", "", "getOnImeActionPerformed", "()Lkotlin/jvm/functions/Function1;", "onValueChange", "Landroidx/compose/ui/text/input/TextFieldValue;", "getOnValueChange", "onValueChangeOriginal", "processor", "Landroidx/compose/ui/text/input/EditProcessor;", "getProcessor", "()Landroidx/compose/ui/text/input/EditProcessor;", "getRecomposeScope", "()Landroidx/compose/runtime/RecomposeScope;", "selectionBackgroundColor", "Landroidx/compose/ui/graphics/Color;", "getSelectionBackgroundColor-0d7_KjU", "setSelectionBackgroundColor-8_81llA", "J", "selectionPreviewHighlightRange", "getSelectionPreviewHighlightRange-d9O1mEE", "setSelectionPreviewHighlightRange-5zc-tL8", "selectionPreviewHighlightRange$delegate", "showCursorHandle", "getShowCursorHandle", "setShowCursorHandle", "showCursorHandle$delegate", "showFloatingToolbar", "getShowFloatingToolbar", "setShowFloatingToolbar", "showFloatingToolbar$delegate", "showSelectionHandleEnd", "getShowSelectionHandleEnd", "setShowSelectionHandleEnd", "showSelectionHandleEnd$delegate", "showSelectionHandleStart", "getShowSelectionHandleStart", "setShowSelectionHandleStart", "showSelectionHandleStart$delegate", "getTextDelegate", "()Landroidx/compose/foundation/text/TextDelegate;", "setTextDelegate", "(Landroidx/compose/foundation/text/TextDelegate;)V", "untransformedText", "Landroidx/compose/ui/text/AnnotatedString;", "getUntransformedText", "()Landroidx/compose/ui/text/AnnotatedString;", "setUntransformedText", "(Landroidx/compose/ui/text/AnnotatedString;)V", "hasHighlight", "update", "visualText", "textStyle", "Landroidx/compose/ui/text/TextStyle;", "softWrap", "density", "Landroidx/compose/ui/unit/Density;", "fontFamilyResolver", "Landroidx/compose/ui/text/font/FontFamily$Resolver;", "keyboardActions", "Landroidx/compose/foundation/text/KeyboardActions;", "focusManager", "Landroidx/compose/ui/focus/FocusManager;", "update-fnh65Uc", "(Landroidx/compose/ui/text/AnnotatedString;Landroidx/compose/ui/text/AnnotatedString;Landroidx/compose/ui/text/TextStyle;ZLandroidx/compose/ui/unit/Density;Landroidx/compose/ui/text/font/FontFamily$Resolver;Lkotlin/jvm/functions/Function1;Landroidx/compose/foundation/text/KeyboardActions;Landroidx/compose/ui/focus/FocusManager;J)V", "foundation_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes.dex */
public final class LegacyTextFieldState {
    public static final int $stable = 8;
    private LayoutCoordinates _layoutCoordinates;
    private final MutableState autofillHighlightOn$delegate;
    private final MutableState deletionPreviewHighlightRange$delegate;
    private final MutableState handleState$delegate;
    private final MutableState hasFocus$delegate;
    private final Paint highlightPaint;
    private TextInputSession inputSession;
    private final MutableState isInTouchMode$delegate;
    private boolean isLayoutResultStale;
    private final MutableState justAutofilled$delegate;
    private final KeyboardActionRunner keyboardActionRunner;
    private final SoftwareKeyboardController keyboardController;
    private final MutableState<TextLayoutResultProxy> layoutResultState;
    private final MutableState minHeightForSingleLineField$delegate;
    private final Function1<ImeAction, Unit> onImeActionPerformed;
    private final Function1<TextFieldValue, Unit> onValueChange;
    private Function1<? super TextFieldValue, Unit> onValueChangeOriginal;
    private final EditProcessor processor = new EditProcessor();
    private final RecomposeScope recomposeScope;
    private long selectionBackgroundColor;
    private final MutableState selectionPreviewHighlightRange$delegate;
    private final MutableState showCursorHandle$delegate;
    private final MutableState showFloatingToolbar$delegate;
    private final MutableState showSelectionHandleEnd$delegate;
    private final MutableState showSelectionHandleStart$delegate;
    private TextDelegate textDelegate;
    private AnnotatedString untransformedText;

    public LegacyTextFieldState(TextDelegate textDelegate, RecomposeScope recomposeScope, SoftwareKeyboardController keyboardController) {
        MutableState mutableStateOf$default;
        MutableState mutableStateOf$default2;
        MutableState<TextLayoutResultProxy> mutableStateOf$default3;
        MutableState mutableStateOf$default4;
        MutableState mutableStateOf$default5;
        MutableState mutableStateOf$default6;
        MutableState mutableStateOf$default7;
        MutableState mutableStateOf$default8;
        MutableState mutableStateOf$default9;
        MutableState mutableStateOf$default10;
        MutableState mutableStateOf$default11;
        MutableState mutableStateOf$default12;
        MutableState mutableStateOf$default13;
        this.textDelegate = textDelegate;
        this.recomposeScope = recomposeScope;
        this.keyboardController = keyboardController;
        mutableStateOf$default = SnapshotStateKt__SnapshotStateKt.mutableStateOf$default(false, null, 2, null);
        this.hasFocus$delegate = mutableStateOf$default;
        mutableStateOf$default2 = SnapshotStateKt__SnapshotStateKt.mutableStateOf$default(Dp.m6871boximpl(Dp.m6873constructorimpl(0)), null, 2, null);
        this.minHeightForSingleLineField$delegate = mutableStateOf$default2;
        mutableStateOf$default3 = SnapshotStateKt__SnapshotStateKt.mutableStateOf$default(null, null, 2, null);
        this.layoutResultState = mutableStateOf$default3;
        mutableStateOf$default4 = SnapshotStateKt__SnapshotStateKt.mutableStateOf$default(HandleState.None, null, 2, null);
        this.handleState$delegate = mutableStateOf$default4;
        mutableStateOf$default5 = SnapshotStateKt__SnapshotStateKt.mutableStateOf$default(false, null, 2, null);
        this.showFloatingToolbar$delegate = mutableStateOf$default5;
        mutableStateOf$default6 = SnapshotStateKt__SnapshotStateKt.mutableStateOf$default(false, null, 2, null);
        this.showSelectionHandleStart$delegate = mutableStateOf$default6;
        mutableStateOf$default7 = SnapshotStateKt__SnapshotStateKt.mutableStateOf$default(false, null, 2, null);
        this.showSelectionHandleEnd$delegate = mutableStateOf$default7;
        mutableStateOf$default8 = SnapshotStateKt__SnapshotStateKt.mutableStateOf$default(false, null, 2, null);
        this.showCursorHandle$delegate = mutableStateOf$default8;
        this.isLayoutResultStale = true;
        mutableStateOf$default9 = SnapshotStateKt__SnapshotStateKt.mutableStateOf$default(true, null, 2, null);
        this.isInTouchMode$delegate = mutableStateOf$default9;
        this.keyboardActionRunner = new KeyboardActionRunner(this.keyboardController);
        mutableStateOf$default10 = SnapshotStateKt__SnapshotStateKt.mutableStateOf$default(false, null, 2, null);
        this.autofillHighlightOn$delegate = mutableStateOf$default10;
        mutableStateOf$default11 = SnapshotStateKt__SnapshotStateKt.mutableStateOf$default(false, null, 2, null);
        this.justAutofilled$delegate = mutableStateOf$default11;
        this.onValueChangeOriginal = new Function1<TextFieldValue, Unit>() { // from class: androidx.compose.foundation.text.LegacyTextFieldState$onValueChangeOriginal$1
            @Override // kotlin.jvm.functions.Function1
            public /* bridge */ /* synthetic */ Unit invoke(TextFieldValue textFieldValue) {
                invoke2(textFieldValue);
                return Unit.INSTANCE;
            }

            /* renamed from: invoke  reason: avoid collision after fix types in other method */
            public final void invoke2(TextFieldValue it) {
            }
        };
        this.onValueChange = new Function1<TextFieldValue, Unit>() { // from class: androidx.compose.foundation.text.LegacyTextFieldState$onValueChange$1
            /* JADX INFO: Access modifiers changed from: package-private */
            {
                super(1);
            }

            @Override // kotlin.jvm.functions.Function1
            public /* bridge */ /* synthetic */ Unit invoke(TextFieldValue textFieldValue) {
                invoke2(textFieldValue);
                return Unit.INSTANCE;
            }

            /* renamed from: invoke  reason: avoid collision after fix types in other method */
            public final void invoke2(TextFieldValue it) {
                Function1 function1;
                String text = it.getText();
                AnnotatedString untransformedText = LegacyTextFieldState.this.getUntransformedText();
                if (!Intrinsics.areEqual(text, untransformedText != null ? untransformedText.getText() : null)) {
                    LegacyTextFieldState.this.setHandleState(HandleState.None);
                    boolean justAutofilled = LegacyTextFieldState.this.getJustAutofilled();
                    LegacyTextFieldState legacyTextFieldState = LegacyTextFieldState.this;
                    if (justAutofilled) {
                        legacyTextFieldState.setJustAutofilled(false);
                    } else {
                        legacyTextFieldState.setAutofillHighlightOn(false);
                    }
                }
                LegacyTextFieldState.this.m1343setSelectionPreviewHighlightRange5zctL8(TextRange.Companion.m6344getZerod9O1mEE());
                LegacyTextFieldState.this.m1340setDeletionPreviewHighlightRange5zctL8(TextRange.Companion.m6344getZerod9O1mEE());
                function1 = LegacyTextFieldState.this.onValueChangeOriginal;
                function1.invoke(it);
                LegacyTextFieldState.this.getRecomposeScope().invalidate();
            }
        };
        this.onImeActionPerformed = new Function1<ImeAction, Unit>() { // from class: androidx.compose.foundation.text.LegacyTextFieldState$onImeActionPerformed$1
            /* JADX INFO: Access modifiers changed from: package-private */
            {
                super(1);
            }

            @Override // kotlin.jvm.functions.Function1
            public /* bridge */ /* synthetic */ Unit invoke(ImeAction imeAction) {
                m1345invokeKlQnJC8(imeAction.m6508unboximpl());
                return Unit.INSTANCE;
            }

            /* renamed from: invoke-KlQnJC8  reason: not valid java name */
            public final void m1345invokeKlQnJC8(int imeAction) {
                KeyboardActionRunner keyboardActionRunner;
                keyboardActionRunner = LegacyTextFieldState.this.keyboardActionRunner;
                keyboardActionRunner.m1321runActionKlQnJC8(imeAction);
            }
        };
        this.highlightPaint = AndroidPaint_androidKt.Paint();
        this.selectionBackgroundColor = Color.Companion.m4325getUnspecified0d7_KjU();
        mutableStateOf$default12 = SnapshotStateKt__SnapshotStateKt.mutableStateOf$default(TextRange.m6327boximpl(TextRange.Companion.m6344getZerod9O1mEE()), null, 2, null);
        this.selectionPreviewHighlightRange$delegate = mutableStateOf$default12;
        mutableStateOf$default13 = SnapshotStateKt__SnapshotStateKt.mutableStateOf$default(TextRange.m6327boximpl(TextRange.Companion.m6344getZerod9O1mEE()), null, 2, null);
        this.deletionPreviewHighlightRange$delegate = mutableStateOf$default13;
    }

    public final TextDelegate getTextDelegate() {
        return this.textDelegate;
    }

    public final void setTextDelegate(TextDelegate textDelegate) {
        this.textDelegate = textDelegate;
    }

    public final RecomposeScope getRecomposeScope() {
        return this.recomposeScope;
    }

    public final SoftwareKeyboardController getKeyboardController() {
        return this.keyboardController;
    }

    public final EditProcessor getProcessor() {
        return this.processor;
    }

    public final TextInputSession getInputSession() {
        return this.inputSession;
    }

    public final void setInputSession(TextInputSession textInputSession) {
        this.inputSession = textInputSession;
    }

    public final boolean getHasFocus() {
        State $this$getValue$iv = this.hasFocus$delegate;
        return ((Boolean) $this$getValue$iv.getValue()).booleanValue();
    }

    public final void setHasFocus(boolean z) {
        MutableState $this$setValue$iv = this.hasFocus$delegate;
        $this$setValue$iv.setValue(Boolean.valueOf(z));
    }

    /* renamed from: getMinHeightForSingleLineField-D9Ej5fM  reason: not valid java name */
    public final float m1337getMinHeightForSingleLineFieldD9Ej5fM() {
        State $this$getValue$iv = this.minHeightForSingleLineField$delegate;
        return ((Dp) $this$getValue$iv.getValue()).m6887unboximpl();
    }

    /* renamed from: setMinHeightForSingleLineField-0680j_4  reason: not valid java name */
    public final void m1341setMinHeightForSingleLineField0680j_4(float f) {
        MutableState $this$setValue$iv = this.minHeightForSingleLineField$delegate;
        $this$setValue$iv.setValue(Dp.m6871boximpl(f));
    }

    public final LayoutCoordinates getLayoutCoordinates() {
        LayoutCoordinates it = this._layoutCoordinates;
        if (it == null || !it.isAttached()) {
            return null;
        }
        return it;
    }

    public final void setLayoutCoordinates(LayoutCoordinates value) {
        this._layoutCoordinates = value;
    }

    public final TextLayoutResultProxy getLayoutResult() {
        return this.layoutResultState.getValue();
    }

    public final void setLayoutResult(TextLayoutResultProxy value) {
        this.layoutResultState.setValue(value);
        this.isLayoutResultStale = false;
    }

    public final AnnotatedString getUntransformedText() {
        return this.untransformedText;
    }

    public final void setUntransformedText(AnnotatedString annotatedString) {
        this.untransformedText = annotatedString;
    }

    public final HandleState getHandleState() {
        State $this$getValue$iv = this.handleState$delegate;
        return (HandleState) $this$getValue$iv.getValue();
    }

    public final void setHandleState(HandleState handleState) {
        MutableState $this$setValue$iv = this.handleState$delegate;
        $this$setValue$iv.setValue(handleState);
    }

    public final boolean getShowFloatingToolbar() {
        State $this$getValue$iv = this.showFloatingToolbar$delegate;
        return ((Boolean) $this$getValue$iv.getValue()).booleanValue();
    }

    public final void setShowFloatingToolbar(boolean z) {
        MutableState $this$setValue$iv = this.showFloatingToolbar$delegate;
        $this$setValue$iv.setValue(Boolean.valueOf(z));
    }

    public final boolean getShowSelectionHandleStart() {
        State $this$getValue$iv = this.showSelectionHandleStart$delegate;
        return ((Boolean) $this$getValue$iv.getValue()).booleanValue();
    }

    public final void setShowSelectionHandleStart(boolean z) {
        MutableState $this$setValue$iv = this.showSelectionHandleStart$delegate;
        $this$setValue$iv.setValue(Boolean.valueOf(z));
    }

    public final boolean getShowSelectionHandleEnd() {
        State $this$getValue$iv = this.showSelectionHandleEnd$delegate;
        return ((Boolean) $this$getValue$iv.getValue()).booleanValue();
    }

    public final void setShowSelectionHandleEnd(boolean z) {
        MutableState $this$setValue$iv = this.showSelectionHandleEnd$delegate;
        $this$setValue$iv.setValue(Boolean.valueOf(z));
    }

    public final boolean getShowCursorHandle() {
        State $this$getValue$iv = this.showCursorHandle$delegate;
        return ((Boolean) $this$getValue$iv.getValue()).booleanValue();
    }

    public final void setShowCursorHandle(boolean z) {
        MutableState $this$setValue$iv = this.showCursorHandle$delegate;
        $this$setValue$iv.setValue(Boolean.valueOf(z));
    }

    public final boolean isLayoutResultStale() {
        return this.isLayoutResultStale;
    }

    public final boolean isInTouchMode() {
        State $this$getValue$iv = this.isInTouchMode$delegate;
        return ((Boolean) $this$getValue$iv.getValue()).booleanValue();
    }

    public final void setInTouchMode(boolean z) {
        MutableState $this$setValue$iv = this.isInTouchMode$delegate;
        $this$setValue$iv.setValue(Boolean.valueOf(z));
    }

    public final boolean getAutofillHighlightOn() {
        State $this$getValue$iv = this.autofillHighlightOn$delegate;
        return ((Boolean) $this$getValue$iv.getValue()).booleanValue();
    }

    public final void setAutofillHighlightOn(boolean z) {
        MutableState $this$setValue$iv = this.autofillHighlightOn$delegate;
        $this$setValue$iv.setValue(Boolean.valueOf(z));
    }

    public final boolean getJustAutofilled() {
        State $this$getValue$iv = this.justAutofilled$delegate;
        return ((Boolean) $this$getValue$iv.getValue()).booleanValue();
    }

    public final void setJustAutofilled(boolean z) {
        MutableState $this$setValue$iv = this.justAutofilled$delegate;
        $this$setValue$iv.setValue(Boolean.valueOf(z));
    }

    public final Function1<TextFieldValue, Unit> getOnValueChange() {
        return this.onValueChange;
    }

    public final Function1<ImeAction, Unit> getOnImeActionPerformed() {
        return this.onImeActionPerformed;
    }

    public final Paint getHighlightPaint() {
        return this.highlightPaint;
    }

    /* renamed from: getSelectionBackgroundColor-0d7_KjU  reason: not valid java name */
    public final long m1338getSelectionBackgroundColor0d7_KjU() {
        return this.selectionBackgroundColor;
    }

    /* renamed from: setSelectionBackgroundColor-8_81llA  reason: not valid java name */
    public final void m1342setSelectionBackgroundColor8_81llA(long j) {
        this.selectionBackgroundColor = j;
    }

    /* renamed from: getSelectionPreviewHighlightRange-d9O1mEE  reason: not valid java name */
    public final long m1339getSelectionPreviewHighlightRanged9O1mEE() {
        State $this$getValue$iv = this.selectionPreviewHighlightRange$delegate;
        return ((TextRange) $this$getValue$iv.getValue()).m6343unboximpl();
    }

    /* renamed from: setSelectionPreviewHighlightRange-5zc-tL8  reason: not valid java name */
    public final void m1343setSelectionPreviewHighlightRange5zctL8(long j) {
        MutableState $this$setValue$iv = this.selectionPreviewHighlightRange$delegate;
        $this$setValue$iv.setValue(TextRange.m6327boximpl(j));
    }

    /* renamed from: getDeletionPreviewHighlightRange-d9O1mEE  reason: not valid java name */
    public final long m1336getDeletionPreviewHighlightRanged9O1mEE() {
        State $this$getValue$iv = this.deletionPreviewHighlightRange$delegate;
        return ((TextRange) $this$getValue$iv.getValue()).m6343unboximpl();
    }

    /* renamed from: setDeletionPreviewHighlightRange-5zc-tL8  reason: not valid java name */
    public final void m1340setDeletionPreviewHighlightRange5zctL8(long j) {
        MutableState $this$setValue$iv = this.deletionPreviewHighlightRange$delegate;
        $this$setValue$iv.setValue(TextRange.m6327boximpl(j));
    }

    public final boolean hasHighlight() {
        return (TextRange.m6333getCollapsedimpl(m1339getSelectionPreviewHighlightRanged9O1mEE()) && TextRange.m6333getCollapsedimpl(m1336getDeletionPreviewHighlightRanged9O1mEE())) ? false : true;
    }

    /* renamed from: update-fnh65Uc  reason: not valid java name */
    public final void m1344updatefnh65Uc(AnnotatedString untransformedText, AnnotatedString visualText, TextStyle textStyle, boolean softWrap, Density density, FontFamily.Resolver fontFamilyResolver, Function1<? super TextFieldValue, Unit> function1, KeyboardActions keyboardActions, FocusManager focusManager, long selectionBackgroundColor) {
        this.onValueChangeOriginal = function1;
        this.selectionBackgroundColor = selectionBackgroundColor;
        KeyboardActionRunner $this$update_fnh65Uc_u24lambda_u241 = this.keyboardActionRunner;
        $this$update_fnh65Uc_u24lambda_u241.setKeyboardActions(keyboardActions);
        $this$update_fnh65Uc_u24lambda_u241.setFocusManager(focusManager);
        this.untransformedText = untransformedText;
        TextDelegate newTextDelegate = TextDelegateKt.m1398updateTextDelegaterm0N8CA$default(this.textDelegate, visualText, textStyle, density, fontFamilyResolver, softWrap, 0, 0, 0, CollectionsKt.emptyList(), 448, null);
        if (this.textDelegate != newTextDelegate) {
            this.isLayoutResultStale = true;
        }
        this.textDelegate = newTextDelegate;
    }
}
