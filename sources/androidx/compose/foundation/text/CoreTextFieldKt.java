package androidx.compose.foundation.text;

import androidx.autofill.HintConstants;
import androidx.compose.foundation.relocation.BringIntoViewRequester;
import androidx.compose.foundation.text.selection.TextFieldSelectionManager;
import androidx.compose.foundation.text.selection.TextFieldSelectionManagerKt;
import androidx.compose.runtime.Composer;
import androidx.compose.runtime.ComposerKt;
import androidx.compose.runtime.RecomposeScopeImplKt;
import androidx.compose.runtime.ScopeUpdateScope;
import androidx.compose.runtime.State;
import androidx.compose.runtime.snapshots.Snapshot;
import androidx.compose.ui.Modifier;
import androidx.compose.ui.focus.FocusRequester;
import androidx.compose.ui.geometry.Rect;
import androidx.compose.ui.input.key.KeyEvent;
import androidx.compose.ui.input.key.KeyInputModifierKt;
import androidx.compose.ui.layout.LayoutCoordinates;
import androidx.compose.ui.platform.SoftwareKeyboardController;
import androidx.compose.ui.text.TextLayoutResult;
import androidx.compose.ui.text.TextRange;
import androidx.compose.ui.text.input.ImeOptions;
import androidx.compose.ui.text.input.OffsetMapping;
import androidx.compose.ui.text.input.TextFieldValue;
import androidx.compose.ui.text.input.TextInputService;
import androidx.compose.ui.text.input.TextInputSession;
import androidx.compose.ui.text.style.ResolvedTextDirection;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.IntrinsicsKt;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
/* compiled from: CoreTextField.kt */
@Metadata(d1 = {"\u0000¢\u0001\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\t\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0005\u001aú\u0001\u0010\u0000\u001a\u00020\u00012\u0006\u0010\u0002\u001a\u00020\u00032\u0012\u0010\u0004\u001a\u000e\u0012\u0004\u0012\u00020\u0003\u0012\u0004\u0012\u00020\u00010\u00052\b\b\u0002\u0010\u0006\u001a\u00020\u00072\b\b\u0002\u0010\b\u001a\u00020\t2\b\b\u0002\u0010\n\u001a\u00020\u000b2\u0014\b\u0002\u0010\f\u001a\u000e\u0012\u0004\u0012\u00020\r\u0012\u0004\u0012\u00020\u00010\u00052\n\b\u0002\u0010\u000e\u001a\u0004\u0018\u00010\u000f2\b\b\u0002\u0010\u0010\u001a\u00020\u00112\b\b\u0002\u0010\u0012\u001a\u00020\u00132\b\b\u0002\u0010\u0014\u001a\u00020\u00152\b\b\u0002\u0010\u0016\u001a\u00020\u00152\b\b\u0002\u0010\u0017\u001a\u00020\u00182\b\b\u0002\u0010\u0019\u001a\u00020\u001a2\b\b\u0002\u0010\u001b\u001a\u00020\u00132\b\b\u0002\u0010\u001c\u001a\u00020\u001323\b\u0002\u0010\u001d\u001a-\u0012\u001e\u0012\u001c\u0012\u0004\u0012\u00020\u00010\u001e¢\u0006\u0002\b\u001f¢\u0006\f\b \u0012\b\b!\u0012\u0004\b\b(\"\u0012\u0004\u0012\u00020\u00010\u0005¢\u0006\u0002\b\u001f2\n\b\u0002\u0010#\u001a\u0004\u0018\u00010$H\u0001¢\u0006\u0002\u0010%\u001a0\u0010&\u001a\u00020\u00012\u0006\u0010\u0006\u001a\u00020\u00072\u0006\u0010'\u001a\u00020(2\u0011\u0010)\u001a\r\u0012\u0004\u0012\u00020\u00010\u001e¢\u0006\u0002\b\u001fH\u0003¢\u0006\u0002\u0010*\u001a\u001d\u0010+\u001a\u00020\u00012\u0006\u0010'\u001a\u00020(2\u0006\u0010,\u001a\u00020\u0013H\u0003¢\u0006\u0002\u0010-\u001a\u0015\u0010.\u001a\u00020\u00012\u0006\u0010'\u001a\u00020(H\u0001¢\u0006\u0002\u0010/\u001a\u0010\u00100\u001a\u00020\u00012\u0006\u00101\u001a\u000202H\u0002\u001a \u00103\u001a\u00020\u00012\u0006\u00101\u001a\u0002022\u0006\u0010\u0002\u001a\u00020\u00032\u0006\u00104\u001a\u000205H\u0002\u001a0\u00106\u001a\u00020\u00012\u0006\u00107\u001a\u0002082\u0006\u00101\u001a\u0002022\u0006\u0010\u0002\u001a\u00020\u00032\u0006\u0010\u0017\u001a\u00020\u00182\u0006\u00104\u001a\u000205H\u0002\u001a \u00109\u001a\u00020\u00012\u0006\u00101\u001a\u0002022\u0006\u0010:\u001a\u00020;2\u0006\u0010<\u001a\u00020\u0013H\u0000\u001a2\u0010=\u001a\u00020\u0001*\u00020>2\u0006\u0010\u0002\u001a\u00020\u00032\u0006\u0010?\u001a\u00020@2\u0006\u0010A\u001a\u00020\r2\u0006\u00104\u001a\u000205H\u0080@¢\u0006\u0002\u0010B\u001a\u001c\u0010C\u001a\u00020\u0007*\u00020\u00072\u0006\u00101\u001a\u0002022\u0006\u0010'\u001a\u00020(H\u0002¨\u0006D²\u0006\n\u0010E\u001a\u00020\u0013X\u008a\u0084\u0002"}, d2 = {"CoreTextField", "", "value", "Landroidx/compose/ui/text/input/TextFieldValue;", "onValueChange", "Lkotlin/Function1;", "modifier", "Landroidx/compose/ui/Modifier;", "textStyle", "Landroidx/compose/ui/text/TextStyle;", "visualTransformation", "Landroidx/compose/ui/text/input/VisualTransformation;", "onTextLayout", "Landroidx/compose/ui/text/TextLayoutResult;", "interactionSource", "Landroidx/compose/foundation/interaction/MutableInteractionSource;", "cursorBrush", "Landroidx/compose/ui/graphics/Brush;", "softWrap", "", "maxLines", "", "minLines", "imeOptions", "Landroidx/compose/ui/text/input/ImeOptions;", "keyboardActions", "Landroidx/compose/foundation/text/KeyboardActions;", "enabled", "readOnly", "decorationBox", "Lkotlin/Function0;", "Landroidx/compose/runtime/Composable;", "Lkotlin/ParameterName;", HintConstants.AUTOFILL_HINT_NAME, "innerTextField", "textScrollerPosition", "Landroidx/compose/foundation/text/TextFieldScrollerPosition;", "(Landroidx/compose/ui/text/input/TextFieldValue;Lkotlin/jvm/functions/Function1;Landroidx/compose/ui/Modifier;Landroidx/compose/ui/text/TextStyle;Landroidx/compose/ui/text/input/VisualTransformation;Lkotlin/jvm/functions/Function1;Landroidx/compose/foundation/interaction/MutableInteractionSource;Landroidx/compose/ui/graphics/Brush;ZIILandroidx/compose/ui/text/input/ImeOptions;Landroidx/compose/foundation/text/KeyboardActions;ZZLkotlin/jvm/functions/Function3;Landroidx/compose/foundation/text/TextFieldScrollerPosition;Landroidx/compose/runtime/Composer;III)V", "CoreTextFieldRootBox", "manager", "Landroidx/compose/foundation/text/selection/TextFieldSelectionManager;", "content", "(Landroidx/compose/ui/Modifier;Landroidx/compose/foundation/text/selection/TextFieldSelectionManager;Lkotlin/jvm/functions/Function2;Landroidx/compose/runtime/Composer;I)V", "SelectionToolbarAndHandles", "show", "(Landroidx/compose/foundation/text/selection/TextFieldSelectionManager;ZLandroidx/compose/runtime/Composer;I)V", "TextFieldCursorHandle", "(Landroidx/compose/foundation/text/selection/TextFieldSelectionManager;Landroidx/compose/runtime/Composer;I)V", "endInputSession", "state", "Landroidx/compose/foundation/text/LegacyTextFieldState;", "notifyFocusedRect", "offsetMapping", "Landroidx/compose/ui/text/input/OffsetMapping;", "startInputSession", "textInputService", "Landroidx/compose/ui/text/input/TextInputService;", "tapToFocus", "focusRequester", "Landroidx/compose/ui/focus/FocusRequester;", "allowKeyboard", "bringSelectionEndIntoView", "Landroidx/compose/foundation/relocation/BringIntoViewRequester;", "textDelegate", "Landroidx/compose/foundation/text/TextDelegate;", "textLayoutResult", "(Landroidx/compose/foundation/relocation/BringIntoViewRequester;Landroidx/compose/ui/text/input/TextFieldValue;Landroidx/compose/foundation/text/TextDelegate;Landroidx/compose/ui/text/TextLayoutResult;Landroidx/compose/ui/text/input/OffsetMapping;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "previewKeyEventToDeselectOnBack", "foundation_release", "writeable"}, k = 2, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes.dex */
public final class CoreTextFieldKt {
    /* JADX WARN: Code restructure failed: missing block: B:399:0x0a1e, code lost:
        if (r5 == androidx.compose.runtime.Composer.Companion.getEmpty()) goto L175;
     */
    /* JADX WARN: Code restructure failed: missing block: B:427:0x0b0f, code lost:
        if (r9 == androidx.compose.runtime.Composer.Companion.getEmpty()) goto L194;
     */
    /* JADX WARN: Code restructure failed: missing block: B:480:0x0cb7, code lost:
        if (r5 == androidx.compose.runtime.Composer.Companion.getEmpty()) goto L231;
     */
    /* JADX WARN: Code restructure failed: missing block: B:506:0x0ddf, code lost:
        if (r6 == androidx.compose.runtime.Composer.Companion.getEmpty()) goto L249;
     */
    /* JADX WARN: Removed duplicated region for block: B:274:0x04ec  */
    /* JADX WARN: Removed duplicated region for block: B:275:0x04ef  */
    /* JADX WARN: Removed duplicated region for block: B:278:0x04f5  */
    /* JADX WARN: Removed duplicated region for block: B:287:0x056c  */
    /* JADX WARN: Removed duplicated region for block: B:290:0x0587  */
    /* JADX WARN: Removed duplicated region for block: B:296:0x05ab  */
    /* JADX WARN: Removed duplicated region for block: B:322:0x064b  */
    /* JADX WARN: Removed duplicated region for block: B:326:0x0663  */
    /* JADX WARN: Removed duplicated region for block: B:330:0x070e  */
    /* JADX WARN: Removed duplicated region for block: B:331:0x0725  */
    /* JADX WARN: Removed duplicated region for block: B:334:0x0776  */
    /* JADX WARN: Removed duplicated region for block: B:335:0x078b  */
    /* JADX WARN: Removed duplicated region for block: B:338:0x07b3  */
    /* JADX WARN: Removed duplicated region for block: B:342:0x07e1  */
    /* JADX WARN: Removed duplicated region for block: B:346:0x0880  */
    /* JADX WARN: Removed duplicated region for block: B:347:0x0882  */
    /* JADX WARN: Removed duplicated region for block: B:350:0x088c  */
    /* JADX WARN: Removed duplicated region for block: B:351:0x088e  */
    /* JADX WARN: Removed duplicated region for block: B:354:0x089a  */
    /* JADX WARN: Removed duplicated region for block: B:355:0x089c  */
    /* JADX WARN: Removed duplicated region for block: B:358:0x08a6  */
    /* JADX WARN: Removed duplicated region for block: B:362:0x08b2  */
    /* JADX WARN: Removed duplicated region for block: B:366:0x08be  */
    /* JADX WARN: Removed duplicated region for block: B:369:0x08e7  */
    /* JADX WARN: Removed duplicated region for block: B:373:0x0902  */
    /* JADX WARN: Removed duplicated region for block: B:377:0x0950 A[ADDED_TO_REGION] */
    /* JADX WARN: Removed duplicated region for block: B:382:0x098c  */
    /* JADX WARN: Removed duplicated region for block: B:390:0x09a8  */
    /* JADX WARN: Removed duplicated region for block: B:394:0x09bf  */
    /* JADX WARN: Removed duplicated region for block: B:398:0x0a16  */
    /* JADX WARN: Removed duplicated region for block: B:402:0x0a22  */
    /* JADX WARN: Removed duplicated region for block: B:406:0x0a4f  */
    /* JADX WARN: Removed duplicated region for block: B:407:0x0a51  */
    /* JADX WARN: Removed duplicated region for block: B:410:0x0a59  */
    /* JADX WARN: Removed duplicated region for block: B:411:0x0a5b  */
    /* JADX WARN: Removed duplicated region for block: B:414:0x0a73  */
    /* JADX WARN: Removed duplicated region for block: B:418:0x0a87  */
    /* JADX WARN: Removed duplicated region for block: B:422:0x0af2  */
    /* JADX WARN: Removed duplicated region for block: B:423:0x0af4  */
    /* JADX WARN: Removed duplicated region for block: B:426:0x0b07  */
    /* JADX WARN: Removed duplicated region for block: B:430:0x0b13  */
    /* JADX WARN: Removed duplicated region for block: B:434:0x0b45  */
    /* JADX WARN: Removed duplicated region for block: B:435:0x0b47  */
    /* JADX WARN: Removed duplicated region for block: B:438:0x0b61  */
    /* JADX WARN: Removed duplicated region for block: B:439:0x0b63  */
    /* JADX WARN: Removed duplicated region for block: B:442:0x0b78  */
    /* JADX WARN: Removed duplicated region for block: B:446:0x0b8d  */
    /* JADX WARN: Removed duplicated region for block: B:450:0x0bf2 A[ADDED_TO_REGION] */
    /* JADX WARN: Removed duplicated region for block: B:459:0x0c3e  */
    /* JADX WARN: Removed duplicated region for block: B:463:0x0c4c  */
    /* JADX WARN: Removed duplicated region for block: B:467:0x0c80  */
    /* JADX WARN: Removed duplicated region for block: B:468:0x0c83  */
    /* JADX WARN: Removed duplicated region for block: B:471:0x0c90  */
    /* JADX WARN: Removed duplicated region for block: B:479:0x0caf  */
    /* JADX WARN: Removed duplicated region for block: B:483:0x0cbb  */
    /* JADX WARN: Removed duplicated region for block: B:487:0x0cf1  */
    /* JADX WARN: Removed duplicated region for block: B:488:0x0cf4  */
    /* JADX WARN: Removed duplicated region for block: B:491:0x0d2c  */
    /* JADX WARN: Removed duplicated region for block: B:497:0x0d6f  */
    /* JADX WARN: Removed duplicated region for block: B:501:0x0d7d  */
    /* JADX WARN: Removed duplicated region for block: B:505:0x0dd7  */
    /* JADX WARN: Removed duplicated region for block: B:509:0x0de3  */
    /* JADX WARN: Removed duplicated region for block: B:513:0x0e42  */
    /* JADX WARN: Removed duplicated region for block: B:523:0x0e5b  */
    /* JADX WARN: Removed duplicated region for block: B:524:0x0e68  */
    /* JADX WARN: Removed duplicated region for block: B:527:0x0edf  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void CoreTextField(final androidx.compose.ui.text.input.TextFieldValue r61, final kotlin.jvm.functions.Function1<? super androidx.compose.ui.text.input.TextFieldValue, kotlin.Unit> r62, androidx.compose.ui.Modifier r63, androidx.compose.ui.text.TextStyle r64, androidx.compose.ui.text.input.VisualTransformation r65, kotlin.jvm.functions.Function1<? super androidx.compose.ui.text.TextLayoutResult, kotlin.Unit> r66, androidx.compose.foundation.interaction.MutableInteractionSource r67, androidx.compose.ui.graphics.Brush r68, boolean r69, int r70, int r71, androidx.compose.ui.text.input.ImeOptions r72, androidx.compose.foundation.text.KeyboardActions r73, boolean r74, boolean r75, kotlin.jvm.functions.Function3<? super kotlin.jvm.functions.Function2<? super androidx.compose.runtime.Composer, ? super java.lang.Integer, kotlin.Unit>, ? super androidx.compose.runtime.Composer, ? super java.lang.Integer, kotlin.Unit> r76, androidx.compose.foundation.text.TextFieldScrollerPosition r77, androidx.compose.runtime.Composer r78, final int r79, final int r80, final int r81) {
        /*
            Method dump skipped, instructions count: 3907
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.compose.foundation.text.CoreTextFieldKt.CoreTextField(androidx.compose.ui.text.input.TextFieldValue, kotlin.jvm.functions.Function1, androidx.compose.ui.Modifier, androidx.compose.ui.text.TextStyle, androidx.compose.ui.text.input.VisualTransformation, kotlin.jvm.functions.Function1, androidx.compose.foundation.interaction.MutableInteractionSource, androidx.compose.ui.graphics.Brush, boolean, int, int, androidx.compose.ui.text.input.ImeOptions, androidx.compose.foundation.text.KeyboardActions, boolean, boolean, kotlin.jvm.functions.Function3, androidx.compose.foundation.text.TextFieldScrollerPosition, androidx.compose.runtime.Composer, int, int, int):void");
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final boolean CoreTextField$lambda$11(State<Boolean> state) {
        Object thisObj$iv = state.getValue();
        return ((Boolean) thisObj$iv).booleanValue();
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* JADX WARN: Removed duplicated region for block: B:49:0x0191  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void CoreTextFieldRootBox(final androidx.compose.ui.Modifier r29, final androidx.compose.foundation.text.selection.TextFieldSelectionManager r30, final kotlin.jvm.functions.Function2<? super androidx.compose.runtime.Composer, ? super java.lang.Integer, kotlin.Unit> r31, androidx.compose.runtime.Composer r32, final int r33) {
        /*
            Method dump skipped, instructions count: 429
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.compose.foundation.text.CoreTextFieldKt.CoreTextFieldRootBox(androidx.compose.ui.Modifier, androidx.compose.foundation.text.selection.TextFieldSelectionManager, kotlin.jvm.functions.Function2, androidx.compose.runtime.Composer, int):void");
    }

    private static final Modifier previewKeyEventToDeselectOnBack(Modifier $this$previewKeyEventToDeselectOnBack, final LegacyTextFieldState state, final TextFieldSelectionManager manager) {
        return KeyInputModifierKt.onPreviewKeyEvent($this$previewKeyEventToDeselectOnBack, new Function1<KeyEvent, Boolean>() { // from class: androidx.compose.foundation.text.CoreTextFieldKt$previewKeyEventToDeselectOnBack$1
            /* JADX INFO: Access modifiers changed from: package-private */
            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            {
                super(1);
            }

            @Override // kotlin.jvm.functions.Function1
            public /* bridge */ /* synthetic */ Boolean invoke(KeyEvent keyEvent) {
                return m1316invokeZmokQxo(keyEvent.m5357unboximpl());
            }

            /* renamed from: invoke-ZmokQxo  reason: not valid java name */
            public final Boolean m1316invokeZmokQxo(android.view.KeyEvent keyEvent) {
                boolean z;
                if (LegacyTextFieldState.this.getHandleState() == HandleState.Selection && KeyEventHelpers_androidKt.m1318cancelsTextSelectionZmokQxo(keyEvent)) {
                    z = true;
                    TextFieldSelectionManager.m1767deselect_kEHs6E$foundation_release$default(manager, null, 1, null);
                } else {
                    z = false;
                }
                return Boolean.valueOf(z);
            }
        });
    }

    public static final void tapToFocus(LegacyTextFieldState state, FocusRequester focusRequester, boolean allowKeyboard) {
        SoftwareKeyboardController keyboardController;
        if (!state.getHasFocus()) {
            FocusRequester.m3959requestFocus3ESFkO8$default(focusRequester, 0, 1, null);
        } else if (!allowKeyboard || (keyboardController = state.getKeyboardController()) == null) {
        } else {
            keyboardController.show();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final void startInputSession(TextInputService textInputService, LegacyTextFieldState state, TextFieldValue value, ImeOptions imeOptions, OffsetMapping offsetMapping) {
        state.setInputSession(TextFieldDelegate.Companion.onFocus$foundation_release(textInputService, value, state.getProcessor(), imeOptions, state.getOnValueChange(), state.getOnImeActionPerformed()));
        notifyFocusedRect(state, value, offsetMapping);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final void endInputSession(LegacyTextFieldState state) {
        TextInputSession session = state.getInputSession();
        if (session != null) {
            TextFieldDelegate.Companion.onBlur$foundation_release(session, state.getProcessor(), state.getOnValueChange());
        }
        state.setInputSession(null);
    }

    public static final Object bringSelectionEndIntoView(BringIntoViewRequester $this$bringSelectionEndIntoView, TextFieldValue value, TextDelegate textDelegate, TextLayoutResult textLayoutResult, OffsetMapping offsetMapping, Continuation<? super Unit> continuation) {
        Rect selectionEndBounds;
        int selectionEndInTransformed = offsetMapping.originalToTransformed(TextRange.m6336getMaximpl(value.m6587getSelectiond9O1mEE()));
        if (selectionEndInTransformed < textLayoutResult.getLayoutInput().getText().length()) {
            selectionEndBounds = textLayoutResult.getBoundingBox(selectionEndInTransformed);
        } else if (selectionEndInTransformed != 0) {
            selectionEndBounds = textLayoutResult.getBoundingBox(selectionEndInTransformed - 1);
        } else {
            long defaultSize = TextFieldDelegateKt.computeSizeForDefaultText$default(textDelegate.getStyle(), textDelegate.getDensity(), textDelegate.getFontFamilyResolver(), null, 0, 24, null);
            selectionEndBounds = new Rect(0.0f, 0.0f, 1.0f, (int) (4294967295L & defaultSize));
        }
        Object bringIntoView = $this$bringSelectionEndIntoView.bringIntoView(selectionEndBounds, continuation);
        return bringIntoView == IntrinsicsKt.getCOROUTINE_SUSPENDED() ? bringIntoView : Unit.INSTANCE;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final void SelectionToolbarAndHandles(final TextFieldSelectionManager manager, final boolean show, Composer $composer, final int $changed) {
        TextLayoutResultProxy layoutResult;
        TextLayoutResult value;
        Composer $composer2 = $composer.startRestartGroup(626339208);
        ComposerKt.sourceInformation($composer2, "C(SelectionToolbarAndHandles):CoreTextField.kt#423gt5");
        int $dirty = $changed;
        if (($changed & 6) == 0) {
            $dirty |= $composer2.changedInstance(manager) ? 4 : 2;
        }
        if (($changed & 48) == 0) {
            $dirty |= $composer2.changed(show) ? 32 : 16;
        }
        boolean z = true;
        if ($composer2.shouldExecute(($dirty & 19) != 18, $dirty & 1)) {
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventStart(626339208, $dirty, -1, "androidx.compose.foundation.text.SelectionToolbarAndHandles (CoreTextField.kt:1018)");
            }
            if (show) {
                $composer2.startReplaceGroup(-1290924834);
                ComposerKt.sourceInformation($composer2, "");
                LegacyTextFieldState state$foundation_release = manager.getState$foundation_release();
                TextLayoutResult it = null;
                if (state$foundation_release != null && (layoutResult = state$foundation_release.getLayoutResult()) != null && (value = layoutResult.getValue()) != null) {
                    LegacyTextFieldState state$foundation_release2 = manager.getState$foundation_release();
                    if (!(state$foundation_release2 != null ? state$foundation_release2.isLayoutResultStale() : true)) {
                        it = value;
                    }
                }
                if (it == null) {
                    $composer2.startReplaceGroup(-1290601288);
                } else {
                    $composer2.startReplaceGroup(-1290601287);
                    ComposerKt.sourceInformation($composer2, "");
                    if (!TextRange.m6333getCollapsedimpl(manager.getValue$foundation_release().m6587getSelectiond9O1mEE())) {
                        $composer2.startReplaceGroup(-1685230508);
                        ComposerKt.sourceInformation($composer2, "");
                        int startOffset = manager.getOffsetMapping$foundation_release().originalToTransformed(TextRange.m6339getStartimpl(manager.getValue$foundation_release().m6587getSelectiond9O1mEE()));
                        int endOffset = manager.getOffsetMapping$foundation_release().originalToTransformed(TextRange.m6334getEndimpl(manager.getValue$foundation_release().m6587getSelectiond9O1mEE()));
                        ResolvedTextDirection startDirection = it.getBidiRunDirection(startOffset);
                        ResolvedTextDirection endDirection = it.getBidiRunDirection(Math.max(endOffset - 1, 0));
                        LegacyTextFieldState state$foundation_release3 = manager.getState$foundation_release();
                        if (state$foundation_release3 != null && state$foundation_release3.getShowSelectionHandleStart()) {
                            $composer2.startReplaceGroup(-1684812473);
                            ComposerKt.sourceInformation($composer2, "1034@46819L219");
                            TextFieldSelectionManagerKt.TextFieldSelectionHandle(true, startDirection, manager, $composer2, (($dirty << 6) & 896) | 6);
                            $composer2.endReplaceGroup();
                        } else {
                            $composer2.startReplaceGroup(-1684548198);
                            $composer2.endReplaceGroup();
                        }
                        LegacyTextFieldState state$foundation_release4 = manager.getState$foundation_release();
                        if (state$foundation_release4 == null || !state$foundation_release4.getShowSelectionHandleEnd()) {
                            z = false;
                        }
                        if (z) {
                            $composer2.startReplaceGroup(-1684464312);
                            ComposerKt.sourceInformation($composer2, "1041@47170L218");
                            TextFieldSelectionManagerKt.TextFieldSelectionHandle(false, endDirection, manager, $composer2, (($dirty << 6) & 896) | 6);
                            $composer2.endReplaceGroup();
                        } else {
                            $composer2.startReplaceGroup(-1684200998);
                            $composer2.endReplaceGroup();
                        }
                        $composer2.endReplaceGroup();
                    } else {
                        $composer2.startReplaceGroup(-1684179174);
                        $composer2.endReplaceGroup();
                    }
                    LegacyTextFieldState textFieldState = manager.getState$foundation_release();
                    if (textFieldState != null) {
                        if (manager.isTextChanged$foundation_release()) {
                            textFieldState.setShowFloatingToolbar(false);
                        }
                        if (textFieldState.getHasFocus()) {
                            if (textFieldState.getShowFloatingToolbar()) {
                                manager.showSelectionToolbar$foundation_release();
                            } else {
                                manager.hideSelectionToolbar$foundation_release();
                            }
                        }
                        Unit unit = Unit.INSTANCE;
                    }
                }
                $composer2.endReplaceGroup();
                $composer2.endReplaceGroup();
            } else {
                $composer2.startReplaceGroup(651160447);
                $composer2.endReplaceGroup();
                manager.hideSelectionToolbar$foundation_release();
            }
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventEnd();
            }
        } else {
            $composer2.skipToGroupEnd();
        }
        ScopeUpdateScope endRestartGroup = $composer2.endRestartGroup();
        if (endRestartGroup != null) {
            endRestartGroup.updateScope(new Function2<Composer, Integer, Unit>() { // from class: androidx.compose.foundation.text.CoreTextFieldKt$SelectionToolbarAndHandles$2
                /* JADX INFO: Access modifiers changed from: package-private */
                /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                {
                    super(2);
                }

                @Override // kotlin.jvm.functions.Function2
                public /* bridge */ /* synthetic */ Unit invoke(Composer composer, Integer num) {
                    invoke(composer, num.intValue());
                    return Unit.INSTANCE;
                }

                public final void invoke(Composer composer, int i) {
                    CoreTextFieldKt.SelectionToolbarAndHandles(TextFieldSelectionManager.this, show, composer, RecomposeScopeImplKt.updateChangedFlags($changed | 1));
                }
            });
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:35:0x006a  */
    /* JADX WARN: Removed duplicated region for block: B:67:0x0185  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void TextFieldCursorHandle(final androidx.compose.foundation.text.selection.TextFieldSelectionManager r17, androidx.compose.runtime.Composer r18, final int r19) {
        /*
            Method dump skipped, instructions count: 413
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.compose.foundation.text.CoreTextFieldKt.TextFieldCursorHandle(androidx.compose.foundation.text.selection.TextFieldSelectionManager, androidx.compose.runtime.Composer, int):void");
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final void notifyFocusedRect(LegacyTextFieldState state, TextFieldValue value, OffsetMapping offsetMapping) {
        TextInputSession inputSession;
        LayoutCoordinates layoutCoordinates;
        Snapshot.Companion this_$iv = Snapshot.Companion;
        Snapshot previousSnapshot$iv = this_$iv.getCurrentThreadSnapshot();
        Function1 observer$iv = previousSnapshot$iv != null ? previousSnapshot$iv.getReadObserver() : null;
        Snapshot newSnapshot$iv = this_$iv.makeCurrentNonObservable(previousSnapshot$iv);
        try {
            TextLayoutResultProxy layoutResult = state.getLayoutResult();
            if (layoutResult != null && (inputSession = state.getInputSession()) != null && (layoutCoordinates = state.getLayoutCoordinates()) != null) {
                TextFieldDelegate.Companion.notifyFocusedRect$foundation_release(value, state.getTextDelegate(), layoutResult.getValue(), layoutCoordinates, inputSession, state.getHasFocus(), offsetMapping);
                Unit unit = Unit.INSTANCE;
            }
        } finally {
            this_$iv.restoreNonObservable(previousSnapshot$iv, newSnapshot$iv, observer$iv);
        }
    }
}
