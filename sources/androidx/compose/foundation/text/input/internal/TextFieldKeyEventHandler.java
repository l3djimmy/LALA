package androidx.compose.foundation.text.input.internal;

import android.view.KeyEvent;
import androidx.collection.MutableLongSet;
import androidx.compose.foundation.text.DeadKeyCombiner;
import androidx.compose.foundation.text.KeyCommand;
import androidx.compose.foundation.text.KeyEventHelpers_androidKt;
import androidx.compose.foundation.text.KeyMapping;
import androidx.compose.foundation.text.KeyMapping_androidKt;
import androidx.compose.foundation.text.StringHelpers_jvmKt;
import androidx.compose.foundation.text.TextFieldKeyInput_androidKt;
import androidx.compose.foundation.text.input.internal.selection.TextFieldPreparedSelection;
import androidx.compose.foundation.text.input.internal.selection.TextFieldPreparedSelectionState;
import androidx.compose.foundation.text.input.internal.selection.TextFieldSelectionState;
import androidx.compose.ui.focus.FocusManager;
import androidx.compose.ui.geometry.Rect;
import androidx.compose.ui.input.key.KeyEventType;
import androidx.compose.ui.input.key.KeyEvent_androidKt;
import androidx.compose.ui.layout.LayoutCoordinates;
import androidx.compose.ui.platform.SoftwareKeyboardController;
import androidx.compose.ui.text.TextLayoutResult;
import androidx.compose.ui.text.TextRange;
import androidx.core.app.NotificationCompat;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
/* compiled from: TextFieldKeyEventHandler.kt */
@Metadata(d1 = {"\u0000z\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0010\u0007\n\u0000\b \u0018\u00002\u00020\u0001B\u0005¢\u0006\u0002\u0010\u0002JX\u0010\u000b\u001a\u00020\f2\u0006\u0010\r\u001a\u00020\u000e2\u0006\u0010\u000f\u001a\u00020\u00102\u0006\u0010\u0011\u001a\u00020\u00122\u0006\u0010\u0013\u001a\u00020\u00142\u0006\u0010\u0015\u001a\u00020\u00162\u0006\u0010\u0017\u001a\u00020\f2\u0006\u0010\u0018\u001a\u00020\f2\f\u0010\u0019\u001a\b\u0012\u0004\u0012\u00020\u001b0\u001aH\u0016ø\u0001\u0000¢\u0006\u0004\b\u001c\u0010\u001dJ:\u0010\u001e\u001a\u00020\f2\u0006\u0010\r\u001a\u00020\u000e2\u0006\u0010\u000f\u001a\u00020\u00102\u0006\u0010\u0013\u001a\u00020\u00142\u0006\u0010\u001f\u001a\u00020 2\u0006\u0010!\u001a\u00020\"H\u0016ø\u0001\u0000¢\u0006\u0004\b#\u0010$J:\u0010%\u001a\u00020\u001b2\u0006\u0010&\u001a\u00020\u00102\u0006\u0010\u0011\u001a\u00020\u00122\u0006\u0010'\u001a\u00020\f2\u0017\u0010(\u001a\u0013\u0012\u0004\u0012\u00020*\u0012\u0004\u0012\u00020\u001b0)¢\u0006\u0002\b+H\u0082\bJP\u0010,\u001a\u00020\f2\u0006\u0010\r\u001a\u00020\u000e2\u0006\u0010\u000f\u001a\u00020\u00102\u0006\u0010\u0011\u001a\u00020\u00122\u0006\u0010\u0015\u001a\u00020\u00162\u0006\u0010\u0017\u001a\u00020\f2\u0006\u0010\u0018\u001a\u00020\f2\f\u0010\u0019\u001a\b\u0012\u0004\u0012\u00020\u001b0\u001aH\u0002ø\u0001\u0000¢\u0006\u0004\b-\u0010.J\f\u0010/\u001a\u000200*\u00020\u0012H\u0002R\u0010\u0010\u0003\u001a\u0004\u0018\u00010\u0004X\u0082\u000e¢\u0006\u0002\n\u0000R\u000e\u0010\u0005\u001a\u00020\u0006X\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\u0007\u001a\u00020\bX\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\t\u001a\u00020\nX\u0082\u0004¢\u0006\u0002\n\u0000\u0082\u0002\u0007\n\u0005\b¡\u001e0\u0001¨\u00061"}, d2 = {"Landroidx/compose/foundation/text/input/internal/TextFieldKeyEventHandler;", "", "()V", "currentlyConsumedDownKeys", "Landroidx/collection/MutableLongSet;", "deadKeyCombiner", "Landroidx/compose/foundation/text/DeadKeyCombiner;", "keyMapping", "Landroidx/compose/foundation/text/KeyMapping;", "preparedSelectionState", "Landroidx/compose/foundation/text/input/internal/selection/TextFieldPreparedSelectionState;", "onKeyEvent", "", NotificationCompat.CATEGORY_EVENT, "Landroidx/compose/ui/input/key/KeyEvent;", "textFieldState", "Landroidx/compose/foundation/text/input/internal/TransformedTextFieldState;", "textLayoutState", "Landroidx/compose/foundation/text/input/internal/TextLayoutState;", "textFieldSelectionState", "Landroidx/compose/foundation/text/input/internal/selection/TextFieldSelectionState;", "clipboardKeyCommandsHandler", "Landroidx/compose/foundation/text/input/internal/ClipboardKeyCommandsHandler;", "editable", "singleLine", "onSubmit", "Lkotlin/Function0;", "", "onKeyEvent-CJ9ybgU", "(Landroid/view/KeyEvent;Landroidx/compose/foundation/text/input/internal/TransformedTextFieldState;Landroidx/compose/foundation/text/input/internal/TextLayoutState;Landroidx/compose/foundation/text/input/internal/selection/TextFieldSelectionState;Lkotlin/jvm/functions/Function1;ZZLkotlin/jvm/functions/Function0;)Z", "onPreKeyEvent", "focusManager", "Landroidx/compose/ui/focus/FocusManager;", "keyboardController", "Landroidx/compose/ui/platform/SoftwareKeyboardController;", "onPreKeyEvent-MyFupTE", "(Landroid/view/KeyEvent;Landroidx/compose/foundation/text/input/internal/TransformedTextFieldState;Landroidx/compose/foundation/text/input/internal/selection/TextFieldSelectionState;Landroidx/compose/ui/focus/FocusManager;Landroidx/compose/ui/platform/SoftwareKeyboardController;)Z", "preparedSelectionContext", "state", "isFromSoftKeyboard", "block", "Lkotlin/Function1;", "Landroidx/compose/foundation/text/input/internal/selection/TextFieldPreparedSelection;", "Lkotlin/ExtensionFunctionType;", "processKeyDownEvent", "processKeyDownEvent-ZcWbMB8", "(Landroid/view/KeyEvent;Landroidx/compose/foundation/text/input/internal/TransformedTextFieldState;Landroidx/compose/foundation/text/input/internal/TextLayoutState;Lkotlin/jvm/functions/Function1;ZZLkotlin/jvm/functions/Function0;)Z", "getVisibleTextLayoutHeight", "", "foundation_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes.dex */
public abstract class TextFieldKeyEventHandler {
    public static final int $stable = 8;
    private MutableLongSet currentlyConsumedDownKeys;
    private final TextFieldPreparedSelectionState preparedSelectionState = new TextFieldPreparedSelectionState();
    private final DeadKeyCombiner deadKeyCombiner = new DeadKeyCombiner();
    private final KeyMapping keyMapping = KeyMapping_androidKt.getPlatformDefaultKeyMapping();

    /* compiled from: TextFieldKeyEventHandler.kt */
    @Metadata(k = 3, mv = {1, 9, 0}, xi = 48)
    /* loaded from: classes.dex */
    public /* synthetic */ class WhenMappings {
        public static final /* synthetic */ int[] $EnumSwitchMapping$0;

        static {
            int[] iArr = new int[KeyCommand.values().length];
            try {
                iArr[KeyCommand.COPY.ordinal()] = 1;
            } catch (NoSuchFieldError e) {
            }
            try {
                iArr[KeyCommand.PASTE.ordinal()] = 2;
            } catch (NoSuchFieldError e2) {
            }
            try {
                iArr[KeyCommand.CUT.ordinal()] = 3;
            } catch (NoSuchFieldError e3) {
            }
            try {
                iArr[KeyCommand.LEFT_CHAR.ordinal()] = 4;
            } catch (NoSuchFieldError e4) {
            }
            try {
                iArr[KeyCommand.RIGHT_CHAR.ordinal()] = 5;
            } catch (NoSuchFieldError e5) {
            }
            try {
                iArr[KeyCommand.LEFT_WORD.ordinal()] = 6;
            } catch (NoSuchFieldError e6) {
            }
            try {
                iArr[KeyCommand.RIGHT_WORD.ordinal()] = 7;
            } catch (NoSuchFieldError e7) {
            }
            try {
                iArr[KeyCommand.PREV_PARAGRAPH.ordinal()] = 8;
            } catch (NoSuchFieldError e8) {
            }
            try {
                iArr[KeyCommand.NEXT_PARAGRAPH.ordinal()] = 9;
            } catch (NoSuchFieldError e9) {
            }
            try {
                iArr[KeyCommand.UP.ordinal()] = 10;
            } catch (NoSuchFieldError e10) {
            }
            try {
                iArr[KeyCommand.DOWN.ordinal()] = 11;
            } catch (NoSuchFieldError e11) {
            }
            try {
                iArr[KeyCommand.PAGE_UP.ordinal()] = 12;
            } catch (NoSuchFieldError e12) {
            }
            try {
                iArr[KeyCommand.PAGE_DOWN.ordinal()] = 13;
            } catch (NoSuchFieldError e13) {
            }
            try {
                iArr[KeyCommand.LINE_START.ordinal()] = 14;
            } catch (NoSuchFieldError e14) {
            }
            try {
                iArr[KeyCommand.LINE_END.ordinal()] = 15;
            } catch (NoSuchFieldError e15) {
            }
            try {
                iArr[KeyCommand.LINE_LEFT.ordinal()] = 16;
            } catch (NoSuchFieldError e16) {
            }
            try {
                iArr[KeyCommand.LINE_RIGHT.ordinal()] = 17;
            } catch (NoSuchFieldError e17) {
            }
            try {
                iArr[KeyCommand.HOME.ordinal()] = 18;
            } catch (NoSuchFieldError e18) {
            }
            try {
                iArr[KeyCommand.END.ordinal()] = 19;
            } catch (NoSuchFieldError e19) {
            }
            try {
                iArr[KeyCommand.DELETE_PREV_CHAR.ordinal()] = 20;
            } catch (NoSuchFieldError e20) {
            }
            try {
                iArr[KeyCommand.DELETE_NEXT_CHAR.ordinal()] = 21;
            } catch (NoSuchFieldError e21) {
            }
            try {
                iArr[KeyCommand.DELETE_PREV_WORD.ordinal()] = 22;
            } catch (NoSuchFieldError e22) {
            }
            try {
                iArr[KeyCommand.DELETE_NEXT_WORD.ordinal()] = 23;
            } catch (NoSuchFieldError e23) {
            }
            try {
                iArr[KeyCommand.DELETE_FROM_LINE_START.ordinal()] = 24;
            } catch (NoSuchFieldError e24) {
            }
            try {
                iArr[KeyCommand.DELETE_TO_LINE_END.ordinal()] = 25;
            } catch (NoSuchFieldError e25) {
            }
            try {
                iArr[KeyCommand.NEW_LINE.ordinal()] = 26;
            } catch (NoSuchFieldError e26) {
            }
            try {
                iArr[KeyCommand.TAB.ordinal()] = 27;
            } catch (NoSuchFieldError e27) {
            }
            try {
                iArr[KeyCommand.SELECT_ALL.ordinal()] = 28;
            } catch (NoSuchFieldError e28) {
            }
            try {
                iArr[KeyCommand.SELECT_LEFT_CHAR.ordinal()] = 29;
            } catch (NoSuchFieldError e29) {
            }
            try {
                iArr[KeyCommand.SELECT_RIGHT_CHAR.ordinal()] = 30;
            } catch (NoSuchFieldError e30) {
            }
            try {
                iArr[KeyCommand.SELECT_LEFT_WORD.ordinal()] = 31;
            } catch (NoSuchFieldError e31) {
            }
            try {
                iArr[KeyCommand.SELECT_RIGHT_WORD.ordinal()] = 32;
            } catch (NoSuchFieldError e32) {
            }
            try {
                iArr[KeyCommand.SELECT_PREV_PARAGRAPH.ordinal()] = 33;
            } catch (NoSuchFieldError e33) {
            }
            try {
                iArr[KeyCommand.SELECT_NEXT_PARAGRAPH.ordinal()] = 34;
            } catch (NoSuchFieldError e34) {
            }
            try {
                iArr[KeyCommand.SELECT_LINE_START.ordinal()] = 35;
            } catch (NoSuchFieldError e35) {
            }
            try {
                iArr[KeyCommand.SELECT_LINE_END.ordinal()] = 36;
            } catch (NoSuchFieldError e36) {
            }
            try {
                iArr[KeyCommand.SELECT_LINE_LEFT.ordinal()] = 37;
            } catch (NoSuchFieldError e37) {
            }
            try {
                iArr[KeyCommand.SELECT_LINE_RIGHT.ordinal()] = 38;
            } catch (NoSuchFieldError e38) {
            }
            try {
                iArr[KeyCommand.SELECT_UP.ordinal()] = 39;
            } catch (NoSuchFieldError e39) {
            }
            try {
                iArr[KeyCommand.SELECT_DOWN.ordinal()] = 40;
            } catch (NoSuchFieldError e40) {
            }
            try {
                iArr[KeyCommand.SELECT_PAGE_UP.ordinal()] = 41;
            } catch (NoSuchFieldError e41) {
            }
            try {
                iArr[KeyCommand.SELECT_PAGE_DOWN.ordinal()] = 42;
            } catch (NoSuchFieldError e42) {
            }
            try {
                iArr[KeyCommand.SELECT_HOME.ordinal()] = 43;
            } catch (NoSuchFieldError e43) {
            }
            try {
                iArr[KeyCommand.SELECT_END.ordinal()] = 44;
            } catch (NoSuchFieldError e44) {
            }
            try {
                iArr[KeyCommand.DESELECT.ordinal()] = 45;
            } catch (NoSuchFieldError e45) {
            }
            try {
                iArr[KeyCommand.UNDO.ordinal()] = 46;
            } catch (NoSuchFieldError e46) {
            }
            try {
                iArr[KeyCommand.REDO.ordinal()] = 47;
            } catch (NoSuchFieldError e47) {
            }
            try {
                iArr[KeyCommand.CHARACTER_PALETTE.ordinal()] = 48;
            } catch (NoSuchFieldError e48) {
            }
            $EnumSwitchMapping$0 = iArr;
        }
    }

    /* renamed from: onPreKeyEvent-MyFupTE */
    public boolean mo1483onPreKeyEventMyFupTE(KeyEvent event, TransformedTextFieldState textFieldState, TextFieldSelectionState textFieldSelectionState, FocusManager focusManager, SoftwareKeyboardController keyboardController) {
        long selection = textFieldState.getVisualText().m1456getSelectiond9O1mEE();
        if (!TextRange.m6333getCollapsedimpl(selection) && KeyEventHelpers_androidKt.m1318cancelsTextSelectionZmokQxo(event)) {
            textFieldSelectionState.deselect();
            return true;
        }
        return false;
    }

    /* renamed from: onKeyEvent-CJ9ybgU */
    public boolean mo1482onKeyEventCJ9ybgU(KeyEvent event, TransformedTextFieldState textFieldState, TextLayoutState textLayoutState, TextFieldSelectionState textFieldSelectionState, Function1<? super KeyCommand, ? extends Unit> function1, boolean editable, boolean singleLine, Function0<Unit> function0) {
        long keyCode = KeyEvent_androidKt.m5368getKeyZmokQxo(event);
        if (KeyEventType.m5361equalsimpl0(KeyEvent_androidKt.m5369getTypeZmokQxo(event), KeyEventType.Companion.m5366getKeyUpCS__XNY())) {
            MutableLongSet mutableLongSet = this.currentlyConsumedDownKeys;
            if (mutableLongSet != null && mutableLongSet.contains(keyCode)) {
                MutableLongSet mutableLongSet2 = this.currentlyConsumedDownKeys;
                if (mutableLongSet2 != null) {
                    mutableLongSet2.remove(keyCode);
                }
                return true;
            }
            return false;
        } else if (!KeyEventType.m5361equalsimpl0(KeyEvent_androidKt.m5369getTypeZmokQxo(event), KeyEventType.Companion.m5367getUnknownCS__XNY()) || TextFieldKeyInput_androidKt.m1420isTypedEventZmokQxo(event)) {
            boolean consumed = m1554processKeyDownEventZcWbMB8(event, textFieldState, textLayoutState, function1, editable, singleLine, function0);
            if (consumed) {
                MutableLongSet it = this.currentlyConsumedDownKeys;
                if (it == null) {
                    it = new MutableLongSet(3);
                    this.currentlyConsumedDownKeys = it;
                }
                it.plusAssign(keyCode);
            }
            return consumed;
        } else {
            return false;
        }
    }

    /* renamed from: processKeyDownEvent-ZcWbMB8  reason: not valid java name */
    private final boolean m1554processKeyDownEventZcWbMB8(KeyEvent event, TransformedTextFieldState textFieldState, TextLayoutState textLayoutState, Function1<? super KeyCommand, ? extends Unit> function1, boolean editable, boolean singleLine, Function0<Unit> function0) {
        TransformedTextFieldState transformedTextFieldState;
        WedgeAffinity wedgeAffinity$iv;
        Integer codePoint;
        if (TextFieldKeyInput_androidKt.m1420isTypedEventZmokQxo(event) && (codePoint = this.deadKeyCombiner.m1317consumeZmokQxo(event)) != null) {
            String text = StringHelpers_jvmKt.appendCodePointX(new StringBuilder(2), codePoint.intValue()).toString();
            if (editable) {
                TransformedTextFieldState.replaceSelectedText$default(textFieldState, text, true, null, !TextFieldKeyEventHandler_androidKt.m1556isFromSoftKeyboardZmokQxo(event), 4, null);
                this.preparedSelectionState.resetCachedX();
                return true;
            }
            return false;
        }
        KeyCommand command = this.keyMapping.mo1319mapZmokQxo(event);
        if (command != null && (!command.getEditsText() || editable)) {
            boolean consumed = true;
            boolean isFromSoftKeyboard$iv = TextFieldKeyEventHandler_androidKt.m1556isFromSoftKeyboardZmokQxo(event);
            TextLayoutResult layoutResult$iv = textLayoutState.getLayoutResult();
            float visibleTextLayoutHeight$iv = getVisibleTextLayoutHeight(textLayoutState);
            TextFieldPreparedSelection $this$processKeyDownEvent_ZcWbMB8_u24lambda_u241 = new TextFieldPreparedSelection(textFieldState, layoutResult$iv, isFromSoftKeyboard$iv, visibleTextLayoutHeight$iv, this.preparedSelectionState);
            switch (WhenMappings.$EnumSwitchMapping$0[command.ordinal()]) {
                case 1:
                case 2:
                case 3:
                    transformedTextFieldState = textFieldState;
                    function1.invoke(command);
                    break;
                case 4:
                    transformedTextFieldState = textFieldState;
                    $this$processKeyDownEvent_ZcWbMB8_u24lambda_u241.collapseLeftOr(new Function1<TextFieldPreparedSelection, Unit>() { // from class: androidx.compose.foundation.text.input.internal.TextFieldKeyEventHandler$processKeyDownEvent$1$1
                        @Override // kotlin.jvm.functions.Function1
                        public /* bridge */ /* synthetic */ Unit invoke(TextFieldPreparedSelection textFieldPreparedSelection) {
                            invoke2(textFieldPreparedSelection);
                            return Unit.INSTANCE;
                        }

                        /* renamed from: invoke  reason: avoid collision after fix types in other method */
                        public final void invoke2(TextFieldPreparedSelection $this$collapseLeftOr) {
                            $this$collapseLeftOr.moveCursorLeftByChar();
                        }
                    });
                    break;
                case 5:
                    transformedTextFieldState = textFieldState;
                    $this$processKeyDownEvent_ZcWbMB8_u24lambda_u241.collapseRightOr(new Function1<TextFieldPreparedSelection, Unit>() { // from class: androidx.compose.foundation.text.input.internal.TextFieldKeyEventHandler$processKeyDownEvent$1$2
                        @Override // kotlin.jvm.functions.Function1
                        public /* bridge */ /* synthetic */ Unit invoke(TextFieldPreparedSelection textFieldPreparedSelection) {
                            invoke2(textFieldPreparedSelection);
                            return Unit.INSTANCE;
                        }

                        /* renamed from: invoke  reason: avoid collision after fix types in other method */
                        public final void invoke2(TextFieldPreparedSelection $this$collapseRightOr) {
                            $this$collapseRightOr.moveCursorRightByChar();
                        }
                    });
                    break;
                case 6:
                    transformedTextFieldState = textFieldState;
                    $this$processKeyDownEvent_ZcWbMB8_u24lambda_u241.moveCursorLeftByWord();
                    break;
                case 7:
                    transformedTextFieldState = textFieldState;
                    $this$processKeyDownEvent_ZcWbMB8_u24lambda_u241.moveCursorRightByWord();
                    break;
                case 8:
                    transformedTextFieldState = textFieldState;
                    $this$processKeyDownEvent_ZcWbMB8_u24lambda_u241.moveCursorPrevByParagraph();
                    break;
                case 9:
                    transformedTextFieldState = textFieldState;
                    $this$processKeyDownEvent_ZcWbMB8_u24lambda_u241.moveCursorNextByParagraph();
                    break;
                case 10:
                    transformedTextFieldState = textFieldState;
                    $this$processKeyDownEvent_ZcWbMB8_u24lambda_u241.moveCursorUpByLine();
                    break;
                case 11:
                    transformedTextFieldState = textFieldState;
                    $this$processKeyDownEvent_ZcWbMB8_u24lambda_u241.moveCursorDownByLine();
                    break;
                case 12:
                    transformedTextFieldState = textFieldState;
                    $this$processKeyDownEvent_ZcWbMB8_u24lambda_u241.moveCursorUpByPage();
                    break;
                case 13:
                    transformedTextFieldState = textFieldState;
                    $this$processKeyDownEvent_ZcWbMB8_u24lambda_u241.moveCursorDownByPage();
                    break;
                case 14:
                    transformedTextFieldState = textFieldState;
                    $this$processKeyDownEvent_ZcWbMB8_u24lambda_u241.moveCursorToLineStart();
                    break;
                case 15:
                    transformedTextFieldState = textFieldState;
                    $this$processKeyDownEvent_ZcWbMB8_u24lambda_u241.moveCursorToLineEnd();
                    break;
                case 16:
                    transformedTextFieldState = textFieldState;
                    $this$processKeyDownEvent_ZcWbMB8_u24lambda_u241.moveCursorToLineLeftSide();
                    break;
                case 17:
                    transformedTextFieldState = textFieldState;
                    $this$processKeyDownEvent_ZcWbMB8_u24lambda_u241.moveCursorToLineRightSide();
                    break;
                case 18:
                    transformedTextFieldState = textFieldState;
                    $this$processKeyDownEvent_ZcWbMB8_u24lambda_u241.moveCursorToHome();
                    break;
                case 19:
                    transformedTextFieldState = textFieldState;
                    $this$processKeyDownEvent_ZcWbMB8_u24lambda_u241.moveCursorToEnd();
                    break;
                case 20:
                    transformedTextFieldState = textFieldState;
                    $this$processKeyDownEvent_ZcWbMB8_u24lambda_u241.moveCursorPrevByChar().deleteMovement();
                    break;
                case 21:
                    transformedTextFieldState = textFieldState;
                    $this$processKeyDownEvent_ZcWbMB8_u24lambda_u241.moveCursorNextByChar().deleteMovement();
                    break;
                case 22:
                    transformedTextFieldState = textFieldState;
                    $this$processKeyDownEvent_ZcWbMB8_u24lambda_u241.moveCursorPrevByWord().deleteMovement();
                    break;
                case 23:
                    transformedTextFieldState = textFieldState;
                    $this$processKeyDownEvent_ZcWbMB8_u24lambda_u241.moveCursorNextByWord().deleteMovement();
                    break;
                case 24:
                    transformedTextFieldState = textFieldState;
                    $this$processKeyDownEvent_ZcWbMB8_u24lambda_u241.moveCursorToLineStart().deleteMovement();
                    break;
                case 25:
                    transformedTextFieldState = textFieldState;
                    $this$processKeyDownEvent_ZcWbMB8_u24lambda_u241.moveCursorToLineEnd().deleteMovement();
                    break;
                case 26:
                    if (!singleLine) {
                        transformedTextFieldState = textFieldState;
                        TransformedTextFieldState.replaceSelectedText$default(transformedTextFieldState, "\n", true, null, !TextFieldKeyEventHandler_androidKt.m1556isFromSoftKeyboardZmokQxo(event), 4, null);
                        break;
                    } else {
                        transformedTextFieldState = textFieldState;
                        function0.invoke();
                        break;
                    }
                case 27:
                    if (!singleLine) {
                        transformedTextFieldState = textFieldState;
                        TransformedTextFieldState.replaceSelectedText$default(transformedTextFieldState, "\t", true, null, !TextFieldKeyEventHandler_androidKt.m1556isFromSoftKeyboardZmokQxo(event), 4, null);
                        break;
                    } else {
                        consumed = false;
                        transformedTextFieldState = textFieldState;
                        break;
                    }
                case 28:
                    $this$processKeyDownEvent_ZcWbMB8_u24lambda_u241.selectAll();
                    transformedTextFieldState = textFieldState;
                    break;
                case 29:
                    $this$processKeyDownEvent_ZcWbMB8_u24lambda_u241.moveCursorLeftByChar().selectMovement();
                    transformedTextFieldState = textFieldState;
                    break;
                case 30:
                    $this$processKeyDownEvent_ZcWbMB8_u24lambda_u241.moveCursorRightByChar().selectMovement();
                    transformedTextFieldState = textFieldState;
                    break;
                case 31:
                    $this$processKeyDownEvent_ZcWbMB8_u24lambda_u241.moveCursorLeftByWord().selectMovement();
                    transformedTextFieldState = textFieldState;
                    break;
                case 32:
                    $this$processKeyDownEvent_ZcWbMB8_u24lambda_u241.moveCursorRightByWord().selectMovement();
                    transformedTextFieldState = textFieldState;
                    break;
                case 33:
                    $this$processKeyDownEvent_ZcWbMB8_u24lambda_u241.moveCursorPrevByParagraph().selectMovement();
                    transformedTextFieldState = textFieldState;
                    break;
                case 34:
                    $this$processKeyDownEvent_ZcWbMB8_u24lambda_u241.moveCursorNextByParagraph().selectMovement();
                    transformedTextFieldState = textFieldState;
                    break;
                case 35:
                    $this$processKeyDownEvent_ZcWbMB8_u24lambda_u241.moveCursorToLineStart().selectMovement();
                    transformedTextFieldState = textFieldState;
                    break;
                case 36:
                    $this$processKeyDownEvent_ZcWbMB8_u24lambda_u241.moveCursorToLineEnd().selectMovement();
                    transformedTextFieldState = textFieldState;
                    break;
                case 37:
                    $this$processKeyDownEvent_ZcWbMB8_u24lambda_u241.moveCursorToLineLeftSide().selectMovement();
                    transformedTextFieldState = textFieldState;
                    break;
                case 38:
                    $this$processKeyDownEvent_ZcWbMB8_u24lambda_u241.moveCursorToLineRightSide().selectMovement();
                    transformedTextFieldState = textFieldState;
                    break;
                case 39:
                    $this$processKeyDownEvent_ZcWbMB8_u24lambda_u241.moveCursorUpByLine().selectMovement();
                    transformedTextFieldState = textFieldState;
                    break;
                case 40:
                    $this$processKeyDownEvent_ZcWbMB8_u24lambda_u241.moveCursorDownByLine().selectMovement();
                    transformedTextFieldState = textFieldState;
                    break;
                case 41:
                    $this$processKeyDownEvent_ZcWbMB8_u24lambda_u241.moveCursorUpByPage().selectMovement();
                    transformedTextFieldState = textFieldState;
                    break;
                case 42:
                    $this$processKeyDownEvent_ZcWbMB8_u24lambda_u241.moveCursorDownByPage().selectMovement();
                    transformedTextFieldState = textFieldState;
                    break;
                case 43:
                    $this$processKeyDownEvent_ZcWbMB8_u24lambda_u241.moveCursorToHome().selectMovement();
                    transformedTextFieldState = textFieldState;
                    break;
                case 44:
                    $this$processKeyDownEvent_ZcWbMB8_u24lambda_u241.moveCursorToEnd().selectMovement();
                    transformedTextFieldState = textFieldState;
                    break;
                case 45:
                    $this$processKeyDownEvent_ZcWbMB8_u24lambda_u241.deselect();
                    transformedTextFieldState = textFieldState;
                    break;
                case 46:
                    textFieldState.undo();
                    transformedTextFieldState = textFieldState;
                    break;
                case 47:
                    textFieldState.redo();
                    transformedTextFieldState = textFieldState;
                    break;
                case 48:
                    KeyEventHelpers_androidKt.showCharacterPalette();
                    transformedTextFieldState = textFieldState;
                    break;
                default:
                    transformedTextFieldState = textFieldState;
                    break;
            }
            if (!TextRange.m6332equalsimpl0($this$processKeyDownEvent_ZcWbMB8_u24lambda_u241.m1618getSelectiond9O1mEE(), $this$processKeyDownEvent_ZcWbMB8_u24lambda_u241.getInitialValue().m1456getSelectiond9O1mEE())) {
                transformedTextFieldState.m1584selectCharsIn5zctL8($this$processKeyDownEvent_ZcWbMB8_u24lambda_u241.m1618getSelectiond9O1mEE());
            }
            if ($this$processKeyDownEvent_ZcWbMB8_u24lambda_u241.getWedgeAffinity() != null && (wedgeAffinity$iv = $this$processKeyDownEvent_ZcWbMB8_u24lambda_u241.getWedgeAffinity()) != null) {
                if (TextRange.m6333getCollapsedimpl(transformedTextFieldState.getUntransformedText().m1456getSelectiond9O1mEE())) {
                    transformedTextFieldState.setSelectionWedgeAffinity(new SelectionWedgeAffinity(wedgeAffinity$iv));
                } else {
                    transformedTextFieldState.setSelectionWedgeAffinity(SelectionWedgeAffinity.copy$default($this$processKeyDownEvent_ZcWbMB8_u24lambda_u241.getInitialWedgeAffinity(), null, wedgeAffinity$iv, 1, null));
                }
            }
            return consumed;
        }
        return false;
    }

    private final void preparedSelectionContext(TransformedTextFieldState state, TextLayoutState textLayoutState, boolean isFromSoftKeyboard, Function1<? super TextFieldPreparedSelection, Unit> function1) {
        WedgeAffinity wedgeAffinity;
        TextLayoutResult layoutResult = textLayoutState.getLayoutResult();
        float visibleTextLayoutHeight = getVisibleTextLayoutHeight(textLayoutState);
        TextFieldPreparedSelection preparedSelection = new TextFieldPreparedSelection(state, layoutResult, isFromSoftKeyboard, visibleTextLayoutHeight, this.preparedSelectionState);
        function1.invoke(preparedSelection);
        if (!TextRange.m6332equalsimpl0(preparedSelection.m1618getSelectiond9O1mEE(), preparedSelection.getInitialValue().m1456getSelectiond9O1mEE())) {
            state.m1584selectCharsIn5zctL8(preparedSelection.m1618getSelectiond9O1mEE());
        }
        if (preparedSelection.getWedgeAffinity() != null && (wedgeAffinity = preparedSelection.getWedgeAffinity()) != null) {
            if (TextRange.m6333getCollapsedimpl(state.getUntransformedText().m1456getSelectiond9O1mEE())) {
                state.setSelectionWedgeAffinity(new SelectionWedgeAffinity(wedgeAffinity));
            } else {
                state.setSelectionWedgeAffinity(SelectionWedgeAffinity.copy$default(preparedSelection.getInitialWedgeAffinity(), null, wedgeAffinity, 1, null));
            }
        }
    }

    private final float getVisibleTextLayoutHeight(TextLayoutState $this$getVisibleTextLayoutHeight) {
        LayoutCoordinates textLayoutCoordinates = $this$getVisibleTextLayoutHeight.getTextLayoutNodeCoordinates();
        if (textLayoutCoordinates != null) {
            Rect rect = null;
            if (!textLayoutCoordinates.isAttached()) {
                textLayoutCoordinates = null;
            }
            if (textLayoutCoordinates != null) {
                LayoutCoordinates it = $this$getVisibleTextLayoutHeight.getDecoratorNodeCoordinates();
                if (it != null) {
                    if (!it.isAttached()) {
                        it = null;
                    }
                    if (it != null) {
                        rect = LayoutCoordinates.localBoundingBoxOf$default(it, textLayoutCoordinates, false, 2, null);
                    }
                }
                if (rect != null) {
                    long value$iv$iv = rect.m4081getSizeNHjbRc();
                    int bits$iv$iv$iv = (int) (4294967295L & value$iv$iv);
                    return Float.intBitsToFloat(bits$iv$iv$iv);
                }
            }
        }
        return Float.NaN;
    }
}
