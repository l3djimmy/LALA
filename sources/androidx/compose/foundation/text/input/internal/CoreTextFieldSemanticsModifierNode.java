package androidx.compose.foundation.text.input.internal;

import androidx.compose.foundation.text.CoreTextFieldKt;
import androidx.compose.foundation.text.LegacyTextFieldState;
import androidx.compose.foundation.text.TextFieldDelegate;
import androidx.compose.foundation.text.TextLayoutResultProxy;
import androidx.compose.foundation.text.selection.TextFieldSelectionManager;
import androidx.compose.ui.autofill.ContentDataType;
import androidx.compose.ui.focus.FocusRequester;
import androidx.compose.ui.node.DelegatableNodeKt;
import androidx.compose.ui.node.DelegatingNode;
import androidx.compose.ui.node.SemanticsModifierNode;
import androidx.compose.ui.semantics.SemanticsPropertiesKt;
import androidx.compose.ui.semantics.SemanticsPropertyReceiver;
import androidx.compose.ui.text.AnnotatedString;
import androidx.compose.ui.text.TextLayoutResult;
import androidx.compose.ui.text.TextRange;
import androidx.compose.ui.text.TextRangeKt;
import androidx.compose.ui.text.input.CommitTextCommand;
import androidx.compose.ui.text.input.DeleteAllCommand;
import androidx.compose.ui.text.input.EditCommand;
import androidx.compose.ui.text.input.FinishComposingTextCommand;
import androidx.compose.ui.text.input.ImeAction;
import androidx.compose.ui.text.input.ImeOptions;
import androidx.compose.ui.text.input.OffsetMapping;
import androidx.compose.ui.text.input.TextFieldValue;
import androidx.compose.ui.text.input.TransformedText;
import java.util.List;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.collections.CollectionsKt;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function3;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import kotlin.text.StringsKt;
/* compiled from: CoreTextFieldSemanticsModifier.kt */
@Metadata(d1 = {"\u0000V\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b'\n\u0002\u0010\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\b\u0000\u0018\u00002\u00020\u00012\u00020\u0002BU\u0012\u0006\u0010\u0003\u001a\u00020\u0004\u0012\u0006\u0010\u0005\u001a\u00020\u0006\u0012\u0006\u0010\u0007\u001a\u00020\b\u0012\u0006\u0010\t\u001a\u00020\n\u0012\u0006\u0010\u000b\u001a\u00020\n\u0012\u0006\u0010\f\u001a\u00020\n\u0012\u0006\u0010\r\u001a\u00020\u000e\u0012\u0006\u0010\u000f\u001a\u00020\u0010\u0012\u0006\u0010\u0011\u001a\u00020\u0012\u0012\u0006\u0010\u0013\u001a\u00020\u0014¢\u0006\u0002\u0010\u0015J(\u0010;\u001a\u00020<2\u0006\u0010\u0007\u001a\u00020\b2\u0006\u0010=\u001a\u00020>2\u0006\u0010\t\u001a\u00020\n2\u0006\u0010\u000b\u001a\u00020\nH\u0002JV\u0010?\u001a\u00020<2\u0006\u0010\u0003\u001a\u00020\u00042\u0006\u0010\u0005\u001a\u00020\u00062\u0006\u0010\u0007\u001a\u00020\b2\u0006\u0010\t\u001a\u00020\n2\u0006\u0010\u000b\u001a\u00020\n2\u0006\u0010\f\u001a\u00020\n2\u0006\u0010\r\u001a\u00020\u000e2\u0006\u0010\u000f\u001a\u00020\u00102\u0006\u0010\u0011\u001a\u00020\u00122\u0006\u0010\u0013\u001a\u00020\u0014J\f\u0010@\u001a\u00020<*\u00020AH\u0016R\u001a\u0010\u000b\u001a\u00020\nX\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b\u0016\u0010\u0017\"\u0004\b\u0018\u0010\u0019R\u001a\u0010\u0013\u001a\u00020\u0014X\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b\u001a\u0010\u001b\"\u0004\b\u001c\u0010\u001dR\u001a\u0010\u0011\u001a\u00020\u0012X\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b\u001e\u0010\u001f\"\u0004\b \u0010!R\u001a\u0010\f\u001a\u00020\nX\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b\f\u0010\u0017\"\u0004\b\"\u0010\u0019R\u001a\u0010\u000f\u001a\u00020\u0010X\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b#\u0010$\"\u0004\b%\u0010&R\u001a\u0010\r\u001a\u00020\u000eX\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b'\u0010(\"\u0004\b)\u0010*R\u001a\u0010\t\u001a\u00020\nX\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b+\u0010\u0017\"\u0004\b,\u0010\u0019R\u0014\u0010-\u001a\u00020\n8VX\u0096\u0004¢\u0006\u0006\u001a\u0004\b.\u0010\u0017R\u001a\u0010\u0007\u001a\u00020\bX\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b/\u00100\"\u0004\b1\u00102R\u001a\u0010\u0003\u001a\u00020\u0004X\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b3\u00104\"\u0004\b5\u00106R\u001a\u0010\u0005\u001a\u00020\u0006X\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b7\u00108\"\u0004\b9\u0010:¨\u0006B"}, d2 = {"Landroidx/compose/foundation/text/input/internal/CoreTextFieldSemanticsModifierNode;", "Landroidx/compose/ui/node/DelegatingNode;", "Landroidx/compose/ui/node/SemanticsModifierNode;", "transformedText", "Landroidx/compose/ui/text/input/TransformedText;", "value", "Landroidx/compose/ui/text/input/TextFieldValue;", "state", "Landroidx/compose/foundation/text/LegacyTextFieldState;", "readOnly", "", "enabled", "isPassword", "offsetMapping", "Landroidx/compose/ui/text/input/OffsetMapping;", "manager", "Landroidx/compose/foundation/text/selection/TextFieldSelectionManager;", "imeOptions", "Landroidx/compose/ui/text/input/ImeOptions;", "focusRequester", "Landroidx/compose/ui/focus/FocusRequester;", "(Landroidx/compose/ui/text/input/TransformedText;Landroidx/compose/ui/text/input/TextFieldValue;Landroidx/compose/foundation/text/LegacyTextFieldState;ZZZLandroidx/compose/ui/text/input/OffsetMapping;Landroidx/compose/foundation/text/selection/TextFieldSelectionManager;Landroidx/compose/ui/text/input/ImeOptions;Landroidx/compose/ui/focus/FocusRequester;)V", "getEnabled", "()Z", "setEnabled", "(Z)V", "getFocusRequester", "()Landroidx/compose/ui/focus/FocusRequester;", "setFocusRequester", "(Landroidx/compose/ui/focus/FocusRequester;)V", "getImeOptions", "()Landroidx/compose/ui/text/input/ImeOptions;", "setImeOptions", "(Landroidx/compose/ui/text/input/ImeOptions;)V", "setPassword", "getManager", "()Landroidx/compose/foundation/text/selection/TextFieldSelectionManager;", "setManager", "(Landroidx/compose/foundation/text/selection/TextFieldSelectionManager;)V", "getOffsetMapping", "()Landroidx/compose/ui/text/input/OffsetMapping;", "setOffsetMapping", "(Landroidx/compose/ui/text/input/OffsetMapping;)V", "getReadOnly", "setReadOnly", "shouldMergeDescendantSemantics", "getShouldMergeDescendantSemantics", "getState", "()Landroidx/compose/foundation/text/LegacyTextFieldState;", "setState", "(Landroidx/compose/foundation/text/LegacyTextFieldState;)V", "getTransformedText", "()Landroidx/compose/ui/text/input/TransformedText;", "setTransformedText", "(Landroidx/compose/ui/text/input/TransformedText;)V", "getValue", "()Landroidx/compose/ui/text/input/TextFieldValue;", "setValue", "(Landroidx/compose/ui/text/input/TextFieldValue;)V", "handleTextUpdateFromSemantics", "", "text", "", "updateNodeSemantics", "applySemantics", "Landroidx/compose/ui/semantics/SemanticsPropertyReceiver;", "foundation_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes.dex */
public final class CoreTextFieldSemanticsModifierNode extends DelegatingNode implements SemanticsModifierNode {
    public static final int $stable = 8;
    private boolean enabled;
    private FocusRequester focusRequester;
    private ImeOptions imeOptions;
    private boolean isPassword;
    private TextFieldSelectionManager manager;
    private OffsetMapping offsetMapping;
    private boolean readOnly;
    private LegacyTextFieldState state;
    private TransformedText transformedText;
    private TextFieldValue value;

    public final TransformedText getTransformedText() {
        return this.transformedText;
    }

    public final void setTransformedText(TransformedText transformedText) {
        this.transformedText = transformedText;
    }

    public final TextFieldValue getValue() {
        return this.value;
    }

    public final void setValue(TextFieldValue textFieldValue) {
        this.value = textFieldValue;
    }

    public final LegacyTextFieldState getState() {
        return this.state;
    }

    public final void setState(LegacyTextFieldState legacyTextFieldState) {
        this.state = legacyTextFieldState;
    }

    public final boolean getReadOnly() {
        return this.readOnly;
    }

    public final void setReadOnly(boolean z) {
        this.readOnly = z;
    }

    public final boolean getEnabled() {
        return this.enabled;
    }

    public final void setEnabled(boolean z) {
        this.enabled = z;
    }

    public final boolean isPassword() {
        return this.isPassword;
    }

    public final void setPassword(boolean z) {
        this.isPassword = z;
    }

    public final OffsetMapping getOffsetMapping() {
        return this.offsetMapping;
    }

    public final void setOffsetMapping(OffsetMapping offsetMapping) {
        this.offsetMapping = offsetMapping;
    }

    public final TextFieldSelectionManager getManager() {
        return this.manager;
    }

    public final void setManager(TextFieldSelectionManager textFieldSelectionManager) {
        this.manager = textFieldSelectionManager;
    }

    public final ImeOptions getImeOptions() {
        return this.imeOptions;
    }

    public final void setImeOptions(ImeOptions imeOptions) {
        this.imeOptions = imeOptions;
    }

    public final FocusRequester getFocusRequester() {
        return this.focusRequester;
    }

    public final void setFocusRequester(FocusRequester focusRequester) {
        this.focusRequester = focusRequester;
    }

    public CoreTextFieldSemanticsModifierNode(TransformedText transformedText, TextFieldValue value, LegacyTextFieldState state, boolean readOnly, boolean enabled, boolean isPassword, OffsetMapping offsetMapping, TextFieldSelectionManager manager, ImeOptions imeOptions, FocusRequester focusRequester) {
        this.transformedText = transformedText;
        this.value = value;
        this.state = state;
        this.readOnly = readOnly;
        this.enabled = enabled;
        this.isPassword = isPassword;
        this.offsetMapping = offsetMapping;
        this.manager = manager;
        this.imeOptions = imeOptions;
        this.focusRequester = focusRequester;
        this.manager.setRequestAutofillAction$foundation_release(new Function0<Unit>() { // from class: androidx.compose.foundation.text.input.internal.CoreTextFieldSemanticsModifierNode.1
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
                DelegatableNodeKt.requestAutofill(CoreTextFieldSemanticsModifierNode.this);
            }
        });
    }

    @Override // androidx.compose.ui.node.SemanticsModifierNode
    public boolean getShouldMergeDescendantSemantics() {
        return true;
    }

    @Override // androidx.compose.ui.node.SemanticsModifierNode
    public void applySemantics(final SemanticsPropertyReceiver $this$applySemantics) {
        SemanticsPropertiesKt.setInputText($this$applySemantics, this.value.getAnnotatedString());
        SemanticsPropertiesKt.setEditableText($this$applySemantics, this.transformedText.getText());
        SemanticsPropertiesKt.m6123setTextSelectionRangeFDrldGo($this$applySemantics, this.value.m6587getSelectiond9O1mEE());
        SemanticsPropertiesKt.setContentDataType($this$applySemantics, ContentDataType.Companion.getText());
        SemanticsPropertiesKt.onAutofillText$default($this$applySemantics, null, new Function1<AnnotatedString, Boolean>() { // from class: androidx.compose.foundation.text.input.internal.CoreTextFieldSemanticsModifierNode$applySemantics$1
            /* JADX INFO: Access modifiers changed from: package-private */
            {
                super(1);
            }

            @Override // kotlin.jvm.functions.Function1
            public final Boolean invoke(AnnotatedString text) {
                CoreTextFieldSemanticsModifierNode.this.getState().setJustAutofilled(true);
                CoreTextFieldSemanticsModifierNode.this.getState().setAutofillHighlightOn(true);
                CoreTextFieldSemanticsModifierNode.this.handleTextUpdateFromSemantics(CoreTextFieldSemanticsModifierNode.this.getState(), text.getText(), CoreTextFieldSemanticsModifierNode.this.getReadOnly(), CoreTextFieldSemanticsModifierNode.this.getEnabled());
                return true;
            }
        }, 1, null);
        if (!this.enabled) {
            SemanticsPropertiesKt.disabled($this$applySemantics);
        }
        if (this.isPassword) {
            SemanticsPropertiesKt.password($this$applySemantics);
        }
        boolean editable = this.enabled && !this.readOnly;
        SemanticsPropertiesKt.setEditable($this$applySemantics, editable);
        SemanticsPropertiesKt.getTextLayoutResult$default($this$applySemantics, null, new Function1<List<TextLayoutResult>, Boolean>() { // from class: androidx.compose.foundation.text.input.internal.CoreTextFieldSemanticsModifierNode$applySemantics$2
            /* JADX INFO: Access modifiers changed from: package-private */
            {
                super(1);
            }

            @Override // kotlin.jvm.functions.Function1
            public final Boolean invoke(List<TextLayoutResult> list) {
                boolean z;
                if (CoreTextFieldSemanticsModifierNode.this.getState().getLayoutResult() != null) {
                    TextLayoutResultProxy layoutResult = CoreTextFieldSemanticsModifierNode.this.getState().getLayoutResult();
                    Intrinsics.checkNotNull(layoutResult);
                    list.add(layoutResult.getValue());
                    z = true;
                } else {
                    z = false;
                }
                return Boolean.valueOf(z);
            }
        }, 1, null);
        if (editable) {
            SemanticsPropertiesKt.setText$default($this$applySemantics, null, new Function1<AnnotatedString, Boolean>() { // from class: androidx.compose.foundation.text.input.internal.CoreTextFieldSemanticsModifierNode$applySemantics$3
                /* JADX INFO: Access modifiers changed from: package-private */
                {
                    super(1);
                }

                @Override // kotlin.jvm.functions.Function1
                public final Boolean invoke(AnnotatedString text) {
                    CoreTextFieldSemanticsModifierNode.this.handleTextUpdateFromSemantics(CoreTextFieldSemanticsModifierNode.this.getState(), text.getText(), CoreTextFieldSemanticsModifierNode.this.getReadOnly(), CoreTextFieldSemanticsModifierNode.this.getEnabled());
                    return true;
                }
            }, 1, null);
            SemanticsPropertiesKt.insertTextAtCursor$default($this$applySemantics, null, new Function1<AnnotatedString, Boolean>() { // from class: androidx.compose.foundation.text.input.internal.CoreTextFieldSemanticsModifierNode$applySemantics$4
                /* JADX INFO: Access modifiers changed from: package-private */
                /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                {
                    super(1);
                }

                @Override // kotlin.jvm.functions.Function1
                public final Boolean invoke(AnnotatedString text) {
                    Unit unit;
                    if (CoreTextFieldSemanticsModifierNode.this.getReadOnly() || !CoreTextFieldSemanticsModifierNode.this.getEnabled()) {
                        return false;
                    }
                    androidx.compose.ui.text.input.TextInputSession session = CoreTextFieldSemanticsModifierNode.this.getState().getInputSession();
                    if (session != null) {
                        CoreTextFieldSemanticsModifierNode coreTextFieldSemanticsModifierNode = CoreTextFieldSemanticsModifierNode.this;
                        TextFieldDelegate.Companion.onEditCommand$foundation_release(CollectionsKt.listOf((Object[]) new EditCommand[]{new FinishComposingTextCommand(), new CommitTextCommand(text, 1)}), coreTextFieldSemanticsModifierNode.getState().getProcessor(), coreTextFieldSemanticsModifierNode.getState().getOnValueChange(), session);
                        unit = Unit.INSTANCE;
                    } else {
                        unit = null;
                    }
                    if (unit == null) {
                        SemanticsPropertyReceiver semanticsPropertyReceiver = $this$applySemantics;
                        CoreTextFieldSemanticsModifierNode coreTextFieldSemanticsModifierNode2 = CoreTextFieldSemanticsModifierNode.this;
                        String newText = StringsKt.replaceRange((CharSequence) coreTextFieldSemanticsModifierNode2.getValue().getText(), TextRange.m6339getStartimpl(coreTextFieldSemanticsModifierNode2.getValue().m6587getSelectiond9O1mEE()), TextRange.m6334getEndimpl(coreTextFieldSemanticsModifierNode2.getValue().m6587getSelectiond9O1mEE()), (CharSequence) text).toString();
                        long newCursor = TextRangeKt.TextRange(TextRange.m6339getStartimpl(coreTextFieldSemanticsModifierNode2.getValue().m6587getSelectiond9O1mEE()) + text.length());
                        coreTextFieldSemanticsModifierNode2.getState().getOnValueChange().invoke(new TextFieldValue(newText, newCursor, (TextRange) null, 4, (DefaultConstructorMarker) null));
                    }
                    return true;
                }
            }, 1, null);
        }
        SemanticsPropertiesKt.setSelection$default($this$applySemantics, null, new Function3<Integer, Integer, Boolean, Boolean>() { // from class: androidx.compose.foundation.text.input.internal.CoreTextFieldSemanticsModifierNode$applySemantics$5
            /* JADX INFO: Access modifiers changed from: package-private */
            {
                super(3);
            }

            @Override // kotlin.jvm.functions.Function3
            public /* bridge */ /* synthetic */ Boolean invoke(Integer num, Integer num2, Boolean bool) {
                return invoke(num.intValue(), num2.intValue(), bool.booleanValue());
            }

            public final Boolean invoke(int selectionStart, int selectionEnd, boolean relativeToOriginalText) {
                int start;
                int end;
                if (relativeToOriginalText) {
                    start = selectionStart;
                } else {
                    start = CoreTextFieldSemanticsModifierNode.this.getOffsetMapping().transformedToOriginal(selectionStart);
                }
                if (relativeToOriginalText) {
                    end = selectionEnd;
                } else {
                    end = CoreTextFieldSemanticsModifierNode.this.getOffsetMapping().transformedToOriginal(selectionEnd);
                }
                boolean z = false;
                if (CoreTextFieldSemanticsModifierNode.this.getEnabled() && (start != TextRange.m6339getStartimpl(CoreTextFieldSemanticsModifierNode.this.getValue().m6587getSelectiond9O1mEE()) || end != TextRange.m6334getEndimpl(CoreTextFieldSemanticsModifierNode.this.getValue().m6587getSelectiond9O1mEE()))) {
                    if (Math.min(start, end) >= 0 && Math.max(start, end) <= CoreTextFieldSemanticsModifierNode.this.getValue().getAnnotatedString().length()) {
                        if (!relativeToOriginalText && start != end) {
                            TextFieldSelectionManager.enterSelectionMode$foundation_release$default(CoreTextFieldSemanticsModifierNode.this.getManager(), false, 1, null);
                        } else {
                            CoreTextFieldSemanticsModifierNode.this.getManager().exitSelectionMode$foundation_release();
                        }
                        CoreTextFieldSemanticsModifierNode.this.getState().getOnValueChange().invoke(new TextFieldValue(CoreTextFieldSemanticsModifierNode.this.getValue().getAnnotatedString(), TextRangeKt.TextRange(start, end), (TextRange) null, 4, (DefaultConstructorMarker) null));
                        z = true;
                    } else {
                        CoreTextFieldSemanticsModifierNode.this.getManager().exitSelectionMode$foundation_release();
                    }
                }
                return Boolean.valueOf(z);
            }
        }, 1, null);
        SemanticsPropertiesKt.m6119onImeAction9UiTYpY$default($this$applySemantics, this.imeOptions.m6534getImeActioneUduSuo(), null, new Function0<Boolean>() { // from class: androidx.compose.foundation.text.input.internal.CoreTextFieldSemanticsModifierNode$applySemantics$6
            /* JADX INFO: Access modifiers changed from: package-private */
            {
                super(0);
            }

            /* JADX WARN: Can't rename method to resolve collision */
            @Override // kotlin.jvm.functions.Function0
            public final Boolean invoke() {
                CoreTextFieldSemanticsModifierNode.this.getState().getOnImeActionPerformed().invoke(ImeAction.m6502boximpl(CoreTextFieldSemanticsModifierNode.this.getImeOptions().m6534getImeActioneUduSuo()));
                return true;
            }
        }, 2, null);
        SemanticsPropertiesKt.onClick$default($this$applySemantics, null, new Function0<Boolean>() { // from class: androidx.compose.foundation.text.input.internal.CoreTextFieldSemanticsModifierNode$applySemantics$7
            /* JADX INFO: Access modifiers changed from: package-private */
            {
                super(0);
            }

            /* JADX WARN: Can't rename method to resolve collision */
            @Override // kotlin.jvm.functions.Function0
            public final Boolean invoke() {
                CoreTextFieldKt.tapToFocus(CoreTextFieldSemanticsModifierNode.this.getState(), CoreTextFieldSemanticsModifierNode.this.getFocusRequester(), !CoreTextFieldSemanticsModifierNode.this.getReadOnly());
                return true;
            }
        }, 1, null);
        SemanticsPropertiesKt.onLongClick$default($this$applySemantics, null, new Function0<Boolean>() { // from class: androidx.compose.foundation.text.input.internal.CoreTextFieldSemanticsModifierNode$applySemantics$8
            /* JADX INFO: Access modifiers changed from: package-private */
            {
                super(0);
            }

            /* JADX WARN: Can't rename method to resolve collision */
            @Override // kotlin.jvm.functions.Function0
            public final Boolean invoke() {
                TextFieldSelectionManager.enterSelectionMode$foundation_release$default(CoreTextFieldSemanticsModifierNode.this.getManager(), false, 1, null);
                return true;
            }
        }, 1, null);
        if (!TextRange.m6333getCollapsedimpl(this.value.m6587getSelectiond9O1mEE()) && !this.isPassword) {
            SemanticsPropertiesKt.copyText$default($this$applySemantics, null, new Function0<Boolean>() { // from class: androidx.compose.foundation.text.input.internal.CoreTextFieldSemanticsModifierNode$applySemantics$9
                /* JADX INFO: Access modifiers changed from: package-private */
                {
                    super(0);
                }

                /* JADX WARN: Can't rename method to resolve collision */
                @Override // kotlin.jvm.functions.Function0
                public final Boolean invoke() {
                    TextFieldSelectionManager.copy$foundation_release$default(CoreTextFieldSemanticsModifierNode.this.getManager(), false, 1, null);
                    return true;
                }
            }, 1, null);
            if (this.enabled && !this.readOnly) {
                SemanticsPropertiesKt.cutText$default($this$applySemantics, null, new Function0<Boolean>() { // from class: androidx.compose.foundation.text.input.internal.CoreTextFieldSemanticsModifierNode$applySemantics$10
                    /* JADX INFO: Access modifiers changed from: package-private */
                    {
                        super(0);
                    }

                    /* JADX WARN: Can't rename method to resolve collision */
                    @Override // kotlin.jvm.functions.Function0
                    public final Boolean invoke() {
                        CoreTextFieldSemanticsModifierNode.this.getManager().cut$foundation_release();
                        return true;
                    }
                }, 1, null);
            }
        }
        if (this.enabled && !this.readOnly) {
            SemanticsPropertiesKt.pasteText$default($this$applySemantics, null, new Function0<Boolean>() { // from class: androidx.compose.foundation.text.input.internal.CoreTextFieldSemanticsModifierNode$applySemantics$11
                /* JADX INFO: Access modifiers changed from: package-private */
                {
                    super(0);
                }

                /* JADX WARN: Can't rename method to resolve collision */
                @Override // kotlin.jvm.functions.Function0
                public final Boolean invoke() {
                    CoreTextFieldSemanticsModifierNode.this.getManager().paste$foundation_release();
                    return true;
                }
            }, 1, null);
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:21:0x0058, code lost:
        if (androidx.compose.ui.text.TextRange.m6333getCollapsedimpl(r20.m6587getSelectiond9O1mEE()) != false) goto L18;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void updateNodeSemantics(androidx.compose.ui.text.input.TransformedText r19, androidx.compose.ui.text.input.TextFieldValue r20, androidx.compose.foundation.text.LegacyTextFieldState r21, boolean r22, boolean r23, boolean r24, androidx.compose.ui.text.input.OffsetMapping r25, androidx.compose.foundation.text.selection.TextFieldSelectionManager r26, androidx.compose.ui.text.input.ImeOptions r27, androidx.compose.ui.focus.FocusRequester r28) {
        /*
            r18 = this;
            r0 = r18
            r1 = r22
            r2 = r23
            r3 = r26
            r4 = r27
            boolean r5 = r0.enabled
            r6 = 1
            r7 = 0
            if (r5 == 0) goto L16
            boolean r5 = r0.readOnly
            if (r5 != 0) goto L16
            r5 = r6
            goto L17
        L16:
            r5 = r7
        L17:
            boolean r8 = r0.enabled
            boolean r9 = r0.isPassword
            androidx.compose.ui.text.input.ImeOptions r10 = r0.imeOptions
            androidx.compose.foundation.text.selection.TextFieldSelectionManager r11 = r0.manager
            if (r2 == 0) goto L24
            if (r1 != 0) goto L24
            goto L25
        L24:
            r6 = r7
        L25:
            r7 = r19
            r0.transformedText = r7
            r12 = r20
            r0.value = r12
            r13 = r21
            r0.state = r13
            r0.readOnly = r1
            r0.enabled = r2
            r14 = r25
            r0.offsetMapping = r14
            r0.manager = r3
            r0.imeOptions = r4
            r15 = r28
            r0.focusRequester = r15
            if (r2 != r8) goto L61
            if (r6 != r5) goto L5e
            boolean r16 = kotlin.jvm.internal.Intrinsics.areEqual(r4, r10)
            if (r16 == 0) goto L5b
            r1 = r24
            if (r1 != r9) goto L63
            long r16 = r12.m6587getSelectiond9O1mEE()
            boolean r16 = androidx.compose.ui.text.TextRange.m6333getCollapsedimpl(r16)
            if (r16 != 0) goto L6a
            goto L63
        L5b:
            r1 = r24
            goto L63
        L5e:
            r1 = r24
            goto L63
        L61:
            r1 = r24
        L63:
            r16 = r0
            androidx.compose.ui.node.SemanticsModifierNode r16 = (androidx.compose.ui.node.SemanticsModifierNode) r16
            androidx.compose.ui.node.SemanticsModifierNodeKt.invalidateSemantics(r16)
        L6a:
            boolean r16 = kotlin.jvm.internal.Intrinsics.areEqual(r3, r11)
            if (r16 != 0) goto L7a
            androidx.compose.foundation.text.input.internal.CoreTextFieldSemanticsModifierNode$updateNodeSemantics$1 r1 = new androidx.compose.foundation.text.input.internal.CoreTextFieldSemanticsModifierNode$updateNodeSemantics$1
            r1.<init>()
            kotlin.jvm.functions.Function0 r1 = (kotlin.jvm.functions.Function0) r1
            r3.setRequestAutofillAction$foundation_release(r1)
        L7a:
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.compose.foundation.text.input.internal.CoreTextFieldSemanticsModifierNode.updateNodeSemantics(androidx.compose.ui.text.input.TransformedText, androidx.compose.ui.text.input.TextFieldValue, androidx.compose.foundation.text.LegacyTextFieldState, boolean, boolean, boolean, androidx.compose.ui.text.input.OffsetMapping, androidx.compose.foundation.text.selection.TextFieldSelectionManager, androidx.compose.ui.text.input.ImeOptions, androidx.compose.ui.focus.FocusRequester):void");
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final void handleTextUpdateFromSemantics(LegacyTextFieldState state, String text, boolean readOnly, boolean enabled) {
        Unit unit;
        if (!readOnly && enabled) {
            androidx.compose.ui.text.input.TextInputSession session = state.getInputSession();
            if (session != null) {
                TextFieldDelegate.Companion.onEditCommand$foundation_release(CollectionsKt.listOf((Object[]) new EditCommand[]{new DeleteAllCommand(), new CommitTextCommand(text, 1)}), state.getProcessor(), state.getOnValueChange(), session);
                unit = Unit.INSTANCE;
            } else {
                unit = null;
            }
            if (unit == null) {
                state.getOnValueChange().invoke(new TextFieldValue(text, TextRangeKt.TextRange(text.length()), (TextRange) null, 4, (DefaultConstructorMarker) null));
            }
        }
    }
}
