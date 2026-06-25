package androidx.compose.foundation.text;

import androidx.autofill.HintConstants;
import androidx.compose.foundation.ScrollKt;
import androidx.compose.foundation.ScrollState;
import androidx.compose.foundation.interaction.InteractionSourceKt;
import androidx.compose.foundation.interaction.MutableInteractionSource;
import androidx.compose.foundation.text.input.InputTransformation;
import androidx.compose.foundation.text.input.KeyboardActionHandler;
import androidx.compose.foundation.text.input.OutputTransformation;
import androidx.compose.foundation.text.input.TextFieldDecorator;
import androidx.compose.foundation.text.input.TextFieldLineLimits;
import androidx.compose.foundation.text.input.TextFieldState;
import androidx.compose.foundation.text.input.internal.selection.TextFieldHandleState;
import androidx.compose.foundation.text.input.internal.selection.TextFieldSelectionState;
import androidx.compose.foundation.text.selection.AndroidSelectionHandles_androidKt;
import androidx.compose.foundation.text.selection.OffsetProvider;
import androidx.compose.runtime.Composer;
import androidx.compose.runtime.ComposerKt;
import androidx.compose.runtime.MutableState;
import androidx.compose.runtime.RecomposeScopeImplKt;
import androidx.compose.runtime.ScopeUpdateScope;
import androidx.compose.runtime.SnapshotStateKt;
import androidx.compose.runtime.State;
import androidx.compose.ui.Modifier;
import androidx.compose.ui.graphics.Brush;
import androidx.compose.ui.graphics.Color;
import androidx.compose.ui.graphics.SolidColor;
import androidx.compose.ui.input.pointer.PointerInputEventHandler;
import androidx.compose.ui.input.pointer.PointerInputScope;
import androidx.compose.ui.input.pointer.SuspendingPointerInputFilterKt;
import androidx.compose.ui.text.TextLayoutResult;
import androidx.compose.ui.text.TextStyle;
import androidx.compose.ui.text.input.TextFieldValue;
import androidx.compose.ui.text.input.VisualTransformation;
import androidx.compose.ui.text.style.ResolvedTextDirection;
import androidx.compose.ui.unit.Density;
import androidx.compose.ui.unit.Dp;
import androidx.compose.ui.unit.DpKt;
import androidx.profileinstaller.ProfileVerifier;
import com.itextpdf.kernel.xmp.options.PropertyOptions;
import com.itextpdf.layout.properties.Property;
import kotlin.Deprecated;
import kotlin.DeprecationLevel;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.IntrinsicsKt;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.functions.Function3;
/* compiled from: BasicTextField.kt */
@Metadata(d1 = {"\u0000Ê\u0001\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\b\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0010\u000e\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u0004\u001aÛ\u0001\u0010\u0005\u001a\u00020\u00062\u0006\u0010\u0007\u001a\u00020\b2\b\b\u0002\u0010\t\u001a\u00020\n2\b\b\u0002\u0010\u000b\u001a\u00020\f2\b\b\u0002\u0010\r\u001a\u00020\f2\n\b\u0002\u0010\u000e\u001a\u0004\u0018\u00010\u000f2\b\b\u0002\u0010\u0010\u001a\u00020\u00112\b\b\u0002\u0010\u0012\u001a\u00020\u00132\n\b\u0002\u0010\u0014\u001a\u0004\u0018\u00010\u00152\b\b\u0002\u0010\u0016\u001a\u00020\u001728\b\u0002\u0010\u0018\u001a2\u0012\u0004\u0012\u00020\u001a\u0012\u001b\u0012\u0019\u0012\u0006\u0012\u0004\u0018\u00010\u001c0\u001b¢\u0006\f\b\u001d\u0012\b\b\u001e\u0012\u0004\b\b(\u001f\u0012\u0004\u0012\u00020\u0006\u0018\u00010\u0019¢\u0006\u0002\b 2\n\b\u0002\u0010!\u001a\u0004\u0018\u00010\"2\b\b\u0002\u0010#\u001a\u00020$2\n\b\u0002\u0010%\u001a\u0004\u0018\u00010&2\n\b\u0002\u0010'\u001a\u0004\u0018\u00010\u00012\b\b\u0002\u0010(\u001a\u00020)H\u0007¢\u0006\u0002\u0010*\u001añ\u0001\u0010\u0005\u001a\u00020\u00062\u0006\u0010\u0007\u001a\u00020\b2\b\b\u0002\u0010\t\u001a\u00020\n2\b\b\u0002\u0010\u000b\u001a\u00020\f2\b\b\u0002\u0010\r\u001a\u00020\f2\n\b\u0002\u0010\u000e\u001a\u0004\u0018\u00010\u000f2\b\b\u0002\u0010\u0010\u001a\u00020\u00112\b\b\u0002\u0010\u0012\u001a\u00020\u00132\n\b\u0002\u0010\u0014\u001a\u0004\u0018\u00010\u00152\b\b\u0002\u0010\u0016\u001a\u00020\u001728\b\u0002\u0010\u0018\u001a2\u0012\u0004\u0012\u00020\u001a\u0012\u001b\u0012\u0019\u0012\u0006\u0012\u0004\u0018\u00010\u001c0\u001b¢\u0006\f\b\u001d\u0012\b\b\u001e\u0012\u0004\b\b(\u001f\u0012\u0004\u0012\u00020\u0006\u0018\u00010\u0019¢\u0006\u0002\b 2\n\b\u0002\u0010!\u001a\u0004\u0018\u00010\"2\b\b\u0002\u0010#\u001a\u00020$2\n\b\u0002\u0010+\u001a\u0004\u0018\u00010,2\n\b\u0002\u0010%\u001a\u0004\u0018\u00010&2\n\b\u0002\u0010'\u001a\u0004\u0018\u00010\u00012\b\b\u0002\u0010(\u001a\u00020)2\b\b\u0002\u0010-\u001a\u00020\fH\u0001¢\u0006\u0002\u0010.\u001aâ\u0001\u0010\u0005\u001a\u00020\u00062\u0006\u0010/\u001a\u0002002\u0012\u00101\u001a\u000e\u0012\u0004\u0012\u000200\u0012\u0004\u0012\u00020\u0006022\b\b\u0002\u0010\t\u001a\u00020\n2\b\b\u0002\u0010\u000b\u001a\u00020\f2\b\b\u0002\u0010\r\u001a\u00020\f2\b\b\u0002\u0010\u0010\u001a\u00020\u00112\b\b\u0002\u0010\u0012\u001a\u00020\u00132\b\b\u0002\u00103\u001a\u0002042\b\b\u0002\u00105\u001a\u00020\f2\b\b\u0002\u00106\u001a\u0002072\b\b\u0002\u00108\u001a\u0002092\u0014\b\u0002\u0010\u0018\u001a\u000e\u0012\u0004\u0012\u00020\u001c\u0012\u0004\u0012\u00020\u0006022\b\b\u0002\u0010!\u001a\u00020\"2\b\b\u0002\u0010#\u001a\u00020$23\b\u0002\u0010:\u001a-\u0012\u001e\u0012\u001c\u0012\u0004\u0012\u00020\u00060\u001b¢\u0006\u0002\b;¢\u0006\f\b\u001d\u0012\b\b\u001e\u0012\u0004\b\b(<\u0012\u0004\u0012\u00020\u000602¢\u0006\u0002\b;H\u0007¢\u0006\u0002\u0010=\u001aî\u0001\u0010\u0005\u001a\u00020\u00062\u0006\u0010/\u001a\u0002002\u0012\u00101\u001a\u000e\u0012\u0004\u0012\u000200\u0012\u0004\u0012\u00020\u0006022\b\b\u0002\u0010\t\u001a\u00020\n2\b\b\u0002\u0010\u000b\u001a\u00020\f2\b\b\u0002\u0010\r\u001a\u00020\f2\b\b\u0002\u0010\u0010\u001a\u00020\u00112\b\b\u0002\u0010\u0012\u001a\u00020\u00132\b\b\u0002\u00103\u001a\u0002042\b\b\u0002\u00105\u001a\u00020\f2\b\b\u0002\u00106\u001a\u0002072\b\b\u0002\u0010>\u001a\u0002072\b\b\u0002\u00108\u001a\u0002092\u0014\b\u0002\u0010\u0018\u001a\u000e\u0012\u0004\u0012\u00020\u001c\u0012\u0004\u0012\u00020\u0006022\n\b\u0002\u0010!\u001a\u0004\u0018\u00010\"2\b\b\u0002\u0010#\u001a\u00020$23\b\u0002\u0010:\u001a-\u0012\u001e\u0012\u001c\u0012\u0004\u0012\u00020\u00060\u001b¢\u0006\u0002\b;¢\u0006\f\b\u001d\u0012\b\b\u001e\u0012\u0004\b\b(<\u0012\u0004\u0012\u00020\u000602¢\u0006\u0002\b;H\u0007¢\u0006\u0002\u0010?\u001aâ\u0001\u0010\u0005\u001a\u00020\u00062\u0006\u0010/\u001a\u00020@2\u0012\u00101\u001a\u000e\u0012\u0004\u0012\u00020@\u0012\u0004\u0012\u00020\u0006022\b\b\u0002\u0010\t\u001a\u00020\n2\b\b\u0002\u0010\u000b\u001a\u00020\f2\b\b\u0002\u0010\r\u001a\u00020\f2\b\b\u0002\u0010\u0010\u001a\u00020\u00112\b\b\u0002\u0010\u0012\u001a\u00020\u00132\b\b\u0002\u00103\u001a\u0002042\b\b\u0002\u00105\u001a\u00020\f2\b\b\u0002\u00106\u001a\u0002072\b\b\u0002\u00108\u001a\u0002092\u0014\b\u0002\u0010\u0018\u001a\u000e\u0012\u0004\u0012\u00020\u001c\u0012\u0004\u0012\u00020\u0006022\b\b\u0002\u0010!\u001a\u00020\"2\b\b\u0002\u0010#\u001a\u00020$23\b\u0002\u0010:\u001a-\u0012\u001e\u0012\u001c\u0012\u0004\u0012\u00020\u00060\u001b¢\u0006\u0002\b;¢\u0006\f\b\u001d\u0012\b\b\u001e\u0012\u0004\b\b(<\u0012\u0004\u0012\u00020\u000602¢\u0006\u0002\b;H\u0007¢\u0006\u0002\u0010A\u001aî\u0001\u0010\u0005\u001a\u00020\u00062\u0006\u0010/\u001a\u00020@2\u0012\u00101\u001a\u000e\u0012\u0004\u0012\u00020@\u0012\u0004\u0012\u00020\u0006022\b\b\u0002\u0010\t\u001a\u00020\n2\b\b\u0002\u0010\u000b\u001a\u00020\f2\b\b\u0002\u0010\r\u001a\u00020\f2\b\b\u0002\u0010\u0010\u001a\u00020\u00112\b\b\u0002\u0010\u0012\u001a\u00020\u00132\b\b\u0002\u00103\u001a\u0002042\b\b\u0002\u00105\u001a\u00020\f2\b\b\u0002\u00106\u001a\u0002072\b\b\u0002\u0010>\u001a\u0002072\b\b\u0002\u00108\u001a\u0002092\u0014\b\u0002\u0010\u0018\u001a\u000e\u0012\u0004\u0012\u00020\u001c\u0012\u0004\u0012\u00020\u0006022\n\b\u0002\u0010!\u001a\u0004\u0018\u00010\"2\b\b\u0002\u0010#\u001a\u00020$23\b\u0002\u0010:\u001a-\u0012\u001e\u0012\u001c\u0012\u0004\u0012\u00020\u00060\u001b¢\u0006\u0002\b;¢\u0006\f\b\u001d\u0012\b\b\u001e\u0012\u0004\b\b(<\u0012\u0004\u0012\u00020\u000602¢\u0006\u0002\b;H\u0007¢\u0006\u0002\u0010B\u001a\u0015\u0010C\u001a\u00020\u00062\u0006\u0010D\u001a\u00020EH\u0001¢\u0006\u0002\u0010F\u001a\u0015\u0010G\u001a\u00020\u00062\u0006\u0010D\u001a\u00020EH\u0001¢\u0006\u0002\u0010F\"\u000e\u0010\u0000\u001a\u00020\u0001X\u0082\u0004¢\u0006\u0002\n\u0000\"\u0010\u0010\u0002\u001a\u00020\u0003X\u0082\u0004¢\u0006\u0004\n\u0002\u0010\u0004¨\u0006H²\u0006\n\u0010I\u001a\u00020JX\u008a\u0084\u0002²\u0006\n\u0010K\u001a\u00020JX\u008a\u0084\u0002²\u0006\n\u0010L\u001a\u00020JX\u008a\u0084\u0002²\u0006\n\u0010M\u001a\u000200X\u008a\u008e\u0002²\u0006\n\u0010N\u001a\u00020@X\u008a\u008e\u0002"}, d2 = {"DefaultTextFieldDecorator", "Landroidx/compose/foundation/text/input/TextFieldDecorator;", "MinTouchTargetSizeForHandles", "Landroidx/compose/ui/unit/DpSize;", "J", "BasicTextField", "", "state", "Landroidx/compose/foundation/text/input/TextFieldState;", "modifier", "Landroidx/compose/ui/Modifier;", "enabled", "", "readOnly", "inputTransformation", "Landroidx/compose/foundation/text/input/InputTransformation;", "textStyle", "Landroidx/compose/ui/text/TextStyle;", "keyboardOptions", "Landroidx/compose/foundation/text/KeyboardOptions;", "onKeyboardAction", "Landroidx/compose/foundation/text/input/KeyboardActionHandler;", "lineLimits", "Landroidx/compose/foundation/text/input/TextFieldLineLimits;", "onTextLayout", "Lkotlin/Function2;", "Landroidx/compose/ui/unit/Density;", "Lkotlin/Function0;", "Landroidx/compose/ui/text/TextLayoutResult;", "Lkotlin/ParameterName;", HintConstants.AUTOFILL_HINT_NAME, "getResult", "Lkotlin/ExtensionFunctionType;", "interactionSource", "Landroidx/compose/foundation/interaction/MutableInteractionSource;", "cursorBrush", "Landroidx/compose/ui/graphics/Brush;", "outputTransformation", "Landroidx/compose/foundation/text/input/OutputTransformation;", "decorator", "scrollState", "Landroidx/compose/foundation/ScrollState;", "(Landroidx/compose/foundation/text/input/TextFieldState;Landroidx/compose/ui/Modifier;ZZLandroidx/compose/foundation/text/input/InputTransformation;Landroidx/compose/ui/text/TextStyle;Landroidx/compose/foundation/text/KeyboardOptions;Landroidx/compose/foundation/text/input/KeyboardActionHandler;Landroidx/compose/foundation/text/input/TextFieldLineLimits;Lkotlin/jvm/functions/Function2;Landroidx/compose/foundation/interaction/MutableInteractionSource;Landroidx/compose/ui/graphics/Brush;Landroidx/compose/foundation/text/input/OutputTransformation;Landroidx/compose/foundation/text/input/TextFieldDecorator;Landroidx/compose/foundation/ScrollState;Landroidx/compose/runtime/Composer;III)V", "codepointTransformation", "Landroidx/compose/foundation/text/input/internal/CodepointTransformation;", "isPassword", "(Landroidx/compose/foundation/text/input/TextFieldState;Landroidx/compose/ui/Modifier;ZZLandroidx/compose/foundation/text/input/InputTransformation;Landroidx/compose/ui/text/TextStyle;Landroidx/compose/foundation/text/KeyboardOptions;Landroidx/compose/foundation/text/input/KeyboardActionHandler;Landroidx/compose/foundation/text/input/TextFieldLineLimits;Lkotlin/jvm/functions/Function2;Landroidx/compose/foundation/interaction/MutableInteractionSource;Landroidx/compose/ui/graphics/Brush;Landroidx/compose/foundation/text/input/internal/CodepointTransformation;Landroidx/compose/foundation/text/input/OutputTransformation;Landroidx/compose/foundation/text/input/TextFieldDecorator;Landroidx/compose/foundation/ScrollState;ZLandroidx/compose/runtime/Composer;III)V", "value", "Landroidx/compose/ui/text/input/TextFieldValue;", "onValueChange", "Lkotlin/Function1;", "keyboardActions", "Landroidx/compose/foundation/text/KeyboardActions;", "singleLine", "maxLines", "", "visualTransformation", "Landroidx/compose/ui/text/input/VisualTransformation;", "decorationBox", "Landroidx/compose/runtime/Composable;", "innerTextField", "(Landroidx/compose/ui/text/input/TextFieldValue;Lkotlin/jvm/functions/Function1;Landroidx/compose/ui/Modifier;ZZLandroidx/compose/ui/text/TextStyle;Landroidx/compose/foundation/text/KeyboardOptions;Landroidx/compose/foundation/text/KeyboardActions;ZILandroidx/compose/ui/text/input/VisualTransformation;Lkotlin/jvm/functions/Function1;Landroidx/compose/foundation/interaction/MutableInteractionSource;Landroidx/compose/ui/graphics/Brush;Lkotlin/jvm/functions/Function3;Landroidx/compose/runtime/Composer;III)V", "minLines", "(Landroidx/compose/ui/text/input/TextFieldValue;Lkotlin/jvm/functions/Function1;Landroidx/compose/ui/Modifier;ZZLandroidx/compose/ui/text/TextStyle;Landroidx/compose/foundation/text/KeyboardOptions;Landroidx/compose/foundation/text/KeyboardActions;ZIILandroidx/compose/ui/text/input/VisualTransformation;Lkotlin/jvm/functions/Function1;Landroidx/compose/foundation/interaction/MutableInteractionSource;Landroidx/compose/ui/graphics/Brush;Lkotlin/jvm/functions/Function3;Landroidx/compose/runtime/Composer;III)V", "", "(Ljava/lang/String;Lkotlin/jvm/functions/Function1;Landroidx/compose/ui/Modifier;ZZLandroidx/compose/ui/text/TextStyle;Landroidx/compose/foundation/text/KeyboardOptions;Landroidx/compose/foundation/text/KeyboardActions;ZILandroidx/compose/ui/text/input/VisualTransformation;Lkotlin/jvm/functions/Function1;Landroidx/compose/foundation/interaction/MutableInteractionSource;Landroidx/compose/ui/graphics/Brush;Lkotlin/jvm/functions/Function3;Landroidx/compose/runtime/Composer;III)V", "(Ljava/lang/String;Lkotlin/jvm/functions/Function1;Landroidx/compose/ui/Modifier;ZZLandroidx/compose/ui/text/TextStyle;Landroidx/compose/foundation/text/KeyboardOptions;Landroidx/compose/foundation/text/KeyboardActions;ZIILandroidx/compose/ui/text/input/VisualTransformation;Lkotlin/jvm/functions/Function1;Landroidx/compose/foundation/interaction/MutableInteractionSource;Landroidx/compose/ui/graphics/Brush;Lkotlin/jvm/functions/Function3;Landroidx/compose/runtime/Composer;III)V", "TextFieldCursorHandle", "selectionState", "Landroidx/compose/foundation/text/input/internal/selection/TextFieldSelectionState;", "(Landroidx/compose/foundation/text/input/internal/selection/TextFieldSelectionState;Landroidx/compose/runtime/Composer;I)V", "TextFieldSelectionHandles", "foundation_release", "cursorHandleState", "Landroidx/compose/foundation/text/input/internal/selection/TextFieldHandleState;", "startHandleState", "endHandleState", "textFieldValueState", "lastTextValue"}, k = 2, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes.dex */
public final class BasicTextFieldKt {
    private static final TextFieldDecorator DefaultTextFieldDecorator = new TextFieldDecorator() { // from class: androidx.compose.foundation.text.BasicTextFieldKt$DefaultTextFieldDecorator$1
        @Override // androidx.compose.foundation.text.input.TextFieldDecorator
        public final void Decoration(Function2<? super Composer, ? super Integer, Unit> function2, Composer $composer, int $changed) {
            $composer.startReplaceGroup(-1669748801);
            ComposerKt.sourceInformation($composer, "C(Decoration)574@28736L4:BasicTextField.kt#423gt5");
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventStart(-1669748801, $changed, -1, "androidx.compose.foundation.text.DefaultTextFieldDecorator.<no name provided>.Decoration (BasicTextField.kt:574)");
            }
            function2.invoke($composer, Integer.valueOf($changed & 14));
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventEnd();
            }
            $composer.endReplaceGroup();
        }
    };
    private static final long MinTouchTargetSizeForHandles = DpKt.m6895DpSizeYgX7TsA(Dp.m6873constructorimpl(40), Dp.m6873constructorimpl(40));

    public static final void BasicTextField(final TextFieldState state, Modifier modifier, boolean enabled, boolean readOnly, InputTransformation inputTransformation, TextStyle textStyle, KeyboardOptions keyboardOptions, KeyboardActionHandler onKeyboardAction, TextFieldLineLimits lineLimits, Function2<? super Density, ? super Function0<TextLayoutResult>, Unit> function2, MutableInteractionSource interactionSource, Brush cursorBrush, OutputTransformation outputTransformation, TextFieldDecorator decorator, ScrollState scrollState, Composer $composer, final int $changed, final int $changed1, final int i) {
        Modifier modifier2;
        boolean z;
        boolean z2;
        Object obj;
        Object textStyle2;
        Object keyboardOptions2;
        int i2;
        int i3;
        int i4;
        int i5;
        int i6;
        int i7;
        int i8;
        Composer $composer2;
        final KeyboardActionHandler onKeyboardAction2;
        final MutableInteractionSource interactionSource2;
        final ScrollState scrollState2;
        final boolean enabled2;
        final InputTransformation inputTransformation2;
        final TextStyle textStyle3;
        final Modifier modifier3;
        final TextFieldLineLimits lineLimits2;
        final Brush cursorBrush2;
        final OutputTransformation outputTransformation2;
        final TextFieldDecorator decorator2;
        final KeyboardOptions keyboardOptions3;
        final boolean readOnly2;
        final Function2 onTextLayout;
        boolean enabled3;
        boolean readOnly3;
        InputTransformation inputTransformation3;
        KeyboardActionHandler onKeyboardAction3;
        TextFieldLineLimits lineLimits3;
        Function2 onTextLayout2;
        MutableInteractionSource interactionSource3;
        SolidColor cursorBrush3;
        OutputTransformation outputTransformation3;
        TextFieldDecorator decorator3;
        ScrollState scrollState3;
        boolean readOnly4;
        int $dirty1;
        Function2 onTextLayout3;
        TextFieldDecorator decorator4;
        Brush cursorBrush4;
        boolean enabled4;
        KeyboardActionHandler onKeyboardAction4;
        TextStyle textStyle4;
        TextFieldLineLimits lineLimits4;
        KeyboardOptions keyboardOptions4;
        Composer $composer3 = $composer.startRestartGroup(469439921);
        ComposerKt.sourceInformation($composer3, "C(BasicTextField)P(13,7,2,11,3,14,5,8,6,9,4!1,10)195@11756L610:BasicTextField.kt#423gt5");
        int $dirty = $changed;
        int $dirty12 = $changed1;
        if ((i & 1) != 0) {
            $dirty |= 6;
        } else if (($changed & 6) == 0) {
            $dirty |= $composer3.changed(state) ? 4 : 2;
        }
        int i9 = i & 2;
        if (i9 != 0) {
            $dirty |= 48;
            modifier2 = modifier;
        } else if (($changed & 48) == 0) {
            modifier2 = modifier;
            $dirty |= $composer3.changed(modifier2) ? 32 : 16;
        } else {
            modifier2 = modifier;
        }
        int i10 = i & 4;
        if (i10 != 0) {
            $dirty |= 384;
            z = enabled;
        } else if (($changed & 384) == 0) {
            z = enabled;
            $dirty |= $composer3.changed(z) ? 256 : 128;
        } else {
            z = enabled;
        }
        int i11 = i & 8;
        if (i11 != 0) {
            $dirty |= 3072;
            z2 = readOnly;
        } else if (($changed & 3072) == 0) {
            z2 = readOnly;
            $dirty |= $composer3.changed(z2) ? 2048 : 1024;
        } else {
            z2 = readOnly;
        }
        int i12 = i & 16;
        int i13 = 8192;
        if (i12 != 0) {
            $dirty |= 24576;
            obj = inputTransformation;
        } else if (($changed & 24576) == 0) {
            obj = inputTransformation;
            $dirty |= $composer3.changed(obj) ? 16384 : 8192;
        } else {
            obj = inputTransformation;
        }
        int i14 = i & 32;
        if (i14 != 0) {
            $dirty |= ProfileVerifier.CompilationStatus.RESULT_CODE_ERROR_CANT_WRITE_PROFILE_VERIFICATION_RESULT_CACHE_FILE;
            textStyle2 = textStyle;
        } else if (($changed & ProfileVerifier.CompilationStatus.RESULT_CODE_ERROR_CANT_WRITE_PROFILE_VERIFICATION_RESULT_CACHE_FILE) == 0) {
            textStyle2 = textStyle;
            $dirty |= $composer3.changed(textStyle2) ? 131072 : 65536;
        } else {
            textStyle2 = textStyle;
        }
        int i15 = i & 64;
        if (i15 != 0) {
            $dirty |= 1572864;
            keyboardOptions2 = keyboardOptions;
        } else if (($changed & 1572864) == 0) {
            keyboardOptions2 = keyboardOptions;
            $dirty |= $composer3.changed(keyboardOptions2) ? 1048576 : 524288;
        } else {
            keyboardOptions2 = keyboardOptions;
        }
        int i16 = i & 128;
        if (i16 != 0) {
            $dirty |= 12582912;
            i2 = i16;
        } else if (($changed & 12582912) == 0) {
            i2 = i16;
            $dirty |= $composer3.changed(onKeyboardAction) ? 8388608 : 4194304;
        } else {
            i2 = i16;
        }
        int i17 = i & 256;
        if (i17 != 0) {
            $dirty |= 100663296;
            i3 = i17;
        } else if (($changed & 100663296) == 0) {
            i3 = i17;
            $dirty |= $composer3.changed(lineLimits) ? 67108864 : 33554432;
        } else {
            i3 = i17;
        }
        int i18 = i & 512;
        if (i18 != 0) {
            $dirty |= 805306368;
            i4 = i18;
        } else if (($changed & 805306368) == 0) {
            i4 = i18;
            $dirty |= $composer3.changedInstance(function2) ? PropertyOptions.DELETE_EXISTING : 268435456;
        } else {
            i4 = i18;
        }
        int i19 = i & 1024;
        if (i19 != 0) {
            $dirty12 |= 6;
            i5 = i19;
        } else if (($changed1 & 6) == 0) {
            i5 = i19;
            $dirty12 |= $composer3.changed(interactionSource) ? 4 : 2;
        } else {
            i5 = i19;
        }
        int i20 = i & 2048;
        if (i20 != 0) {
            $dirty12 |= 48;
            i6 = i20;
        } else if (($changed1 & 48) == 0) {
            i6 = i20;
            $dirty12 |= $composer3.changed(cursorBrush) ? 32 : 16;
        } else {
            i6 = i20;
        }
        int i21 = i & 4096;
        if (i21 != 0) {
            $dirty12 |= 384;
            i7 = i21;
        } else {
            i7 = i21;
            if (($changed1 & 384) == 0) {
                $dirty12 |= $composer3.changed(outputTransformation) ? 256 : 128;
            }
        }
        int i22 = i & 8192;
        if (i22 != 0) {
            $dirty12 |= 3072;
            i8 = i22;
        } else {
            i8 = i22;
            if (($changed1 & 3072) == 0) {
                $dirty12 |= ($changed1 & 4096) == 0 ? $composer3.changed(decorator) : $composer3.changedInstance(decorator) ? 2048 : 1024;
            }
        }
        if (($changed1 & 24576) == 0) {
            if ((i & 16384) == 0 && $composer3.changed(scrollState)) {
                i13 = 16384;
            }
            $dirty12 |= i13;
        }
        if ($composer3.shouldExecute((($dirty & 306783379) == 306783378 && ($dirty12 & 9363) == 9362) ? false : true, $dirty & 1)) {
            $composer3.startDefaults();
            ComposerKt.sourceInformation($composer3, "191@11610L21");
            if (($changed & 1) != 0 && !$composer3.getDefaultsInvalid()) {
                $composer3.skipToGroupEnd();
                if ((i & 16384) != 0) {
                    interactionSource3 = interactionSource;
                    cursorBrush4 = cursorBrush;
                    outputTransformation3 = outputTransformation;
                    decorator4 = decorator;
                    scrollState3 = scrollState;
                    $dirty1 = (-57345) & $dirty12;
                    keyboardOptions4 = keyboardOptions2;
                    enabled4 = z;
                    readOnly4 = z2;
                    inputTransformation3 = obj;
                    textStyle4 = textStyle2;
                    onKeyboardAction4 = onKeyboardAction;
                    lineLimits4 = lineLimits;
                    onTextLayout3 = function2;
                } else {
                    onTextLayout3 = function2;
                    interactionSource3 = interactionSource;
                    cursorBrush4 = cursorBrush;
                    outputTransformation3 = outputTransformation;
                    decorator4 = decorator;
                    scrollState3 = scrollState;
                    keyboardOptions4 = keyboardOptions2;
                    $dirty1 = $dirty12;
                    enabled4 = z;
                    readOnly4 = z2;
                    inputTransformation3 = obj;
                    textStyle4 = textStyle2;
                    onKeyboardAction4 = onKeyboardAction;
                    lineLimits4 = lineLimits;
                }
            } else {
                if (i9 != 0) {
                    modifier2 = Modifier.Companion;
                }
                if (i10 == 0) {
                    enabled3 = z;
                } else {
                    enabled3 = true;
                }
                if (i11 == 0) {
                    readOnly3 = z2;
                } else {
                    readOnly3 = false;
                }
                if (i12 == 0) {
                    inputTransformation3 = obj;
                } else {
                    inputTransformation3 = null;
                }
                if (i14 != 0) {
                    textStyle2 = TextStyle.Companion.getDefault();
                }
                if (i15 != 0) {
                    keyboardOptions2 = KeyboardOptions.Companion.getDefault();
                }
                if (i2 == 0) {
                    onKeyboardAction3 = onKeyboardAction;
                } else {
                    onKeyboardAction3 = null;
                }
                if (i3 == 0) {
                    lineLimits3 = lineLimits;
                } else {
                    lineLimits3 = TextFieldLineLimits.Companion.getDefault();
                }
                if (i4 == 0) {
                    onTextLayout2 = function2;
                } else {
                    onTextLayout2 = null;
                }
                if (i5 == 0) {
                    interactionSource3 = interactionSource;
                } else {
                    interactionSource3 = null;
                }
                if (i6 == 0) {
                    cursorBrush3 = cursorBrush;
                } else {
                    cursorBrush3 = BasicTextFieldDefaults.INSTANCE.getCursorBrush();
                }
                if (i7 == 0) {
                    outputTransformation3 = outputTransformation;
                } else {
                    outputTransformation3 = null;
                }
                if (i8 == 0) {
                    decorator3 = decorator;
                } else {
                    decorator3 = null;
                }
                if ((i & 16384) == 0) {
                    boolean enabled5 = enabled3;
                    scrollState3 = scrollState;
                    readOnly4 = readOnly3;
                    $dirty1 = $dirty12;
                    onTextLayout3 = onTextLayout2;
                    decorator4 = decorator3;
                    cursorBrush4 = cursorBrush3;
                    enabled4 = enabled5;
                    onKeyboardAction4 = onKeyboardAction3;
                    textStyle4 = textStyle2;
                    lineLimits4 = lineLimits3;
                    keyboardOptions4 = keyboardOptions2;
                } else {
                    $dirty1 = (-57345) & $dirty12;
                    enabled4 = enabled3;
                    scrollState3 = ScrollKt.rememberScrollState(0, $composer3, 0, 1);
                    readOnly4 = readOnly3;
                    onTextLayout3 = onTextLayout2;
                    decorator4 = decorator3;
                    cursorBrush4 = cursorBrush3;
                    onKeyboardAction4 = onKeyboardAction3;
                    textStyle4 = textStyle2;
                    lineLimits4 = lineLimits3;
                    keyboardOptions4 = keyboardOptions2;
                }
            }
            $composer3.endDefaults();
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventStart(469439921, $dirty, $dirty1, "androidx.compose.foundation.text.BasicTextField (BasicTextField.kt:194)");
            }
            $composer2 = $composer3;
            Modifier modifier4 = modifier2;
            Function2 onTextLayout4 = onTextLayout3;
            BasicTextField(state, modifier4, enabled4, readOnly4, inputTransformation3, textStyle4, keyboardOptions4, onKeyboardAction4, lineLimits4, onTextLayout4, interactionSource3, cursorBrush4, null, outputTransformation3, decorator4, scrollState3, false, $composer2, ($dirty & 14) | ($dirty & Property.BORDER_BOTTOM_RIGHT_RADIUS) | ($dirty & 896) | ($dirty & 7168) | (57344 & $dirty) | (458752 & $dirty) | (3670016 & $dirty) | (29360128 & $dirty) | (234881024 & $dirty) | (1879048192 & $dirty), ($dirty1 & 14) | 384 | ($dirty1 & Property.BORDER_BOTTOM_RIGHT_RADIUS) | (($dirty1 << 3) & 7168) | (($dirty1 << 3) & 57344) | (($dirty1 << 3) & 458752), 65536);
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventEnd();
            }
            modifier3 = modifier4;
            textStyle3 = textStyle4;
            onTextLayout = onTextLayout4;
            decorator2 = decorator4;
            enabled2 = enabled4;
            readOnly2 = readOnly4;
            inputTransformation2 = inputTransformation3;
            keyboardOptions3 = keyboardOptions4;
            onKeyboardAction2 = onKeyboardAction4;
            lineLimits2 = lineLimits4;
            interactionSource2 = interactionSource3;
            cursorBrush2 = cursorBrush4;
            outputTransformation2 = outputTransformation3;
            scrollState2 = scrollState3;
        } else {
            $composer2 = $composer3;
            $composer2.skipToGroupEnd();
            onKeyboardAction2 = onKeyboardAction;
            interactionSource2 = interactionSource;
            scrollState2 = scrollState;
            enabled2 = z;
            inputTransformation2 = obj;
            textStyle3 = textStyle2;
            modifier3 = modifier2;
            lineLimits2 = lineLimits;
            cursorBrush2 = cursorBrush;
            outputTransformation2 = outputTransformation;
            decorator2 = decorator;
            keyboardOptions3 = keyboardOptions2;
            readOnly2 = z2;
            onTextLayout = function2;
        }
        ScopeUpdateScope endRestartGroup = $composer2.endRestartGroup();
        if (endRestartGroup != null) {
            endRestartGroup.updateScope(new Function2<Composer, Integer, Unit>() { // from class: androidx.compose.foundation.text.BasicTextFieldKt$BasicTextField$1
                /* JADX INFO: Access modifiers changed from: package-private */
                /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                /* JADX WARN: Multi-variable type inference failed */
                {
                    super(2);
                }

                @Override // kotlin.jvm.functions.Function2
                public /* bridge */ /* synthetic */ Unit invoke(Composer composer, Integer num) {
                    invoke(composer, num.intValue());
                    return Unit.INSTANCE;
                }

                public final void invoke(Composer composer, int i23) {
                    BasicTextFieldKt.BasicTextField(TextFieldState.this, modifier3, enabled2, readOnly2, inputTransformation2, textStyle3, keyboardOptions3, onKeyboardAction2, lineLimits2, onTextLayout, interactionSource2, cursorBrush2, outputTransformation2, decorator2, scrollState2, composer, RecomposeScopeImplKt.updateChangedFlags($changed | 1), RecomposeScopeImplKt.updateChangedFlags($changed1), i);
                }
            });
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:301:0x0521, code lost:
        if (r14 == androidx.compose.runtime.Composer.Companion.getEmpty()) goto L105;
     */
    /* JADX WARN: Code restructure failed: missing block: B:329:0x065c, code lost:
        if (r15 != androidx.compose.runtime.Composer.Companion.getEmpty()) goto L122;
     */
    /* JADX WARN: Code restructure failed: missing block: B:361:0x0734, code lost:
        if (r12 == androidx.compose.runtime.Composer.Companion.getEmpty()) goto L143;
     */
    /* JADX WARN: Code restructure failed: missing block: B:377:0x07dd, code lost:
        if (r3 == androidx.compose.runtime.Composer.Companion.getEmpty()) goto L155;
     */
    /* JADX WARN: Removed duplicated region for block: B:360:0x072c  */
    /* JADX WARN: Removed duplicated region for block: B:364:0x0738  */
    /* JADX WARN: Removed duplicated region for block: B:376:0x07d5  */
    /* JADX WARN: Removed duplicated region for block: B:380:0x07e1  */
    /* JADX WARN: Removed duplicated region for block: B:390:0x08a4  */
    /* JADX WARN: Removed duplicated region for block: B:393:0x08b0  */
    /* JADX WARN: Removed duplicated region for block: B:394:0x08b6  */
    /* JADX WARN: Removed duplicated region for block: B:405:0x0992  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void BasicTextField(final androidx.compose.foundation.text.input.TextFieldState r56, androidx.compose.ui.Modifier r57, boolean r58, boolean r59, androidx.compose.foundation.text.input.InputTransformation r60, androidx.compose.ui.text.TextStyle r61, androidx.compose.foundation.text.KeyboardOptions r62, androidx.compose.foundation.text.input.KeyboardActionHandler r63, androidx.compose.foundation.text.input.TextFieldLineLimits r64, kotlin.jvm.functions.Function2<? super androidx.compose.ui.unit.Density, ? super kotlin.jvm.functions.Function0<androidx.compose.ui.text.TextLayoutResult>, kotlin.Unit> r65, androidx.compose.foundation.interaction.MutableInteractionSource r66, androidx.compose.ui.graphics.Brush r67, androidx.compose.foundation.text.input.internal.CodepointTransformation r68, androidx.compose.foundation.text.input.OutputTransformation r69, androidx.compose.foundation.text.input.TextFieldDecorator r70, androidx.compose.foundation.ScrollState r71, boolean r72, androidx.compose.runtime.Composer r73, final int r74, final int r75, final int r76) {
        /*
            Method dump skipped, instructions count: 2558
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.compose.foundation.text.BasicTextFieldKt.BasicTextField(androidx.compose.foundation.text.input.TextFieldState, androidx.compose.ui.Modifier, boolean, boolean, androidx.compose.foundation.text.input.InputTransformation, androidx.compose.ui.text.TextStyle, androidx.compose.foundation.text.KeyboardOptions, androidx.compose.foundation.text.input.KeyboardActionHandler, androidx.compose.foundation.text.input.TextFieldLineLimits, kotlin.jvm.functions.Function2, androidx.compose.foundation.interaction.MutableInteractionSource, androidx.compose.ui.graphics.Brush, androidx.compose.foundation.text.input.internal.CodepointTransformation, androidx.compose.foundation.text.input.OutputTransformation, androidx.compose.foundation.text.input.TextFieldDecorator, androidx.compose.foundation.ScrollState, boolean, androidx.compose.runtime.Composer, int, int, int):void");
    }

    public static final void TextFieldCursorHandle(final TextFieldSelectionState selectionState, Composer $composer, final int $changed) {
        Composer $composer2 = $composer.startRestartGroup(1991581797);
        ComposerKt.sourceInformation($composer2, "C(TextFieldCursorHandle)504@26102L128:BasicTextField.kt#423gt5");
        int $dirty = $changed;
        if (($changed & 6) == 0) {
            $dirty |= $composer2.changedInstance(selectionState) ? 4 : 2;
        }
        if ($composer2.shouldExecute(($dirty & 3) != 2, $dirty & 1)) {
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventStart(1991581797, $dirty, -1, "androidx.compose.foundation.text.TextFieldCursorHandle (BasicTextField.kt:501)");
            }
            ComposerKt.sourceInformationMarkerStart($composer2, -425706716, "CC(remember):BasicTextField.kt#9igjgp");
            boolean invalid$iv = $composer2.changed(selectionState);
            Object it$iv = $composer2.rememberedValue();
            if (invalid$iv || it$iv == Composer.Companion.getEmpty()) {
                Object value$iv = SnapshotStateKt.derivedStateOf(new Function0<TextFieldHandleState>() { // from class: androidx.compose.foundation.text.BasicTextFieldKt$TextFieldCursorHandle$cursorHandleState$2$1
                    /* JADX INFO: Access modifiers changed from: package-private */
                    {
                        super(0);
                    }

                    /* JADX WARN: Can't rename method to resolve collision */
                    @Override // kotlin.jvm.functions.Function0
                    public final TextFieldHandleState invoke() {
                        return TextFieldSelectionState.this.getCursorHandleState$foundation_release(false);
                    }
                });
                $composer2.updateRememberedValue(value$iv);
                it$iv = value$iv;
            }
            State cursorHandleState$delegate = (State) it$iv;
            ComposerKt.sourceInformationMarkerEnd($composer2);
            if (TextFieldCursorHandle$lambda$12(cursorHandleState$delegate).getVisible()) {
                $composer2.startReplaceGroup(-311835217);
                ComposerKt.sourceInformation($composer2, "509@26319L100,513@26498L87,508@26276L383");
                ComposerKt.sourceInformationMarkerStart($composer2, -425699800, "CC(remember):BasicTextField.kt#9igjgp");
                boolean invalid$iv2 = $composer2.changedInstance(selectionState);
                Object it$iv2 = $composer2.rememberedValue();
                if (invalid$iv2 || it$iv2 == Composer.Companion.getEmpty()) {
                    Object value$iv2 = (OffsetProvider) new OffsetProvider() { // from class: androidx.compose.foundation.text.BasicTextFieldKt$TextFieldCursorHandle$1$1
                        @Override // androidx.compose.foundation.text.selection.OffsetProvider
                        /* renamed from: provide-F1C5BW0  reason: not valid java name */
                        public final long mo1295provideF1C5BW0() {
                            return TextFieldSelectionState.this.getCursorHandleState$foundation_release(true).m1608getPositionF1C5BW0();
                        }
                    };
                    $composer2.updateRememberedValue(value$iv2);
                    it$iv2 = value$iv2;
                }
                OffsetProvider offsetProvider = (OffsetProvider) it$iv2;
                ComposerKt.sourceInformationMarkerEnd($composer2);
                Modifier.Companion companion = Modifier.Companion;
                ComposerKt.sourceInformationMarkerStart($composer2, -425694085, "CC(remember):BasicTextField.kt#9igjgp");
                boolean invalid$iv3 = $composer2.changedInstance(selectionState);
                Object it$iv3 = $composer2.rememberedValue();
                if (invalid$iv3 || it$iv3 == Composer.Companion.getEmpty()) {
                    Object value$iv3 = (PointerInputEventHandler) new PointerInputEventHandler() { // from class: androidx.compose.foundation.text.BasicTextFieldKt$TextFieldCursorHandle$2$1
                        @Override // androidx.compose.ui.input.pointer.PointerInputEventHandler
                        public final Object invoke(PointerInputScope $this$pointerInput, Continuation<? super Unit> continuation) {
                            TextFieldSelectionState $this$invoke_u24lambda_u240 = TextFieldSelectionState.this;
                            Object cursorHandleGestures = $this$invoke_u24lambda_u240.cursorHandleGestures($this$pointerInput, continuation);
                            return cursorHandleGestures == IntrinsicsKt.getCOROUTINE_SUSPENDED() ? cursorHandleGestures : Unit.INSTANCE;
                        }
                    };
                    $composer2.updateRememberedValue(value$iv3);
                    it$iv3 = value$iv3;
                }
                ComposerKt.sourceInformationMarkerEnd($composer2);
                AndroidCursorHandle_androidKt.m1289CursorHandleUSBMPiE(offsetProvider, SuspendingPointerInputFilterKt.pointerInput(companion, selectionState, (PointerInputEventHandler) it$iv3), MinTouchTargetSizeForHandles, $composer2, 384, 0);
                $composer2.endReplaceGroup();
            } else {
                $composer2.startReplaceGroup(-311451778);
                $composer2.endReplaceGroup();
            }
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventEnd();
            }
        } else {
            $composer2.skipToGroupEnd();
        }
        ScopeUpdateScope endRestartGroup = $composer2.endRestartGroup();
        if (endRestartGroup != null) {
            endRestartGroup.updateScope(new Function2<Composer, Integer, Unit>() { // from class: androidx.compose.foundation.text.BasicTextFieldKt$TextFieldCursorHandle$3
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
                    BasicTextFieldKt.TextFieldCursorHandle(TextFieldSelectionState.this, composer, RecomposeScopeImplKt.updateChangedFlags($changed | 1));
                }
            });
        }
    }

    private static final TextFieldHandleState TextFieldCursorHandle$lambda$12(State<TextFieldHandleState> state) {
        return state.getValue();
    }

    public static final void TextFieldSelectionHandles(final TextFieldSelectionState selectionState, Composer $composer, final int $changed) {
        State startHandleState$delegate;
        Composer $composer2 = $composer.startRestartGroup(2025287684);
        ComposerKt.sourceInformation($composer2, "C(TextFieldSelectionHandles)524@26857L149,549@27813L150:BasicTextField.kt#423gt5");
        int $dirty = $changed;
        if (($changed & 6) == 0) {
            $dirty |= $composer2.changedInstance(selectionState) ? 4 : 2;
        }
        int $dirty2 = $dirty;
        if ($composer2.shouldExecute(($dirty2 & 3) != 2, $dirty2 & 1)) {
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventStart(2025287684, $dirty2, -1, "androidx.compose.foundation.text.TextFieldSelectionHandles (BasicTextField.kt:522)");
            }
            ComposerKt.sourceInformationMarkerStart($composer2, -1983177382, "CC(remember):BasicTextField.kt#9igjgp");
            Object it$iv = $composer2.rememberedValue();
            if (it$iv == Composer.Companion.getEmpty()) {
                Object value$iv = SnapshotStateKt.derivedStateOf(new Function0<TextFieldHandleState>() { // from class: androidx.compose.foundation.text.BasicTextFieldKt$TextFieldSelectionHandles$startHandleState$2$1
                    /* JADX INFO: Access modifiers changed from: package-private */
                    {
                        super(0);
                    }

                    /* JADX WARN: Can't rename method to resolve collision */
                    @Override // kotlin.jvm.functions.Function0
                    public final TextFieldHandleState invoke() {
                        return TextFieldSelectionState.this.getSelectionHandleState$foundation_release(true, false);
                    }
                });
                $composer2.updateRememberedValue(value$iv);
                it$iv = value$iv;
            }
            State startHandleState$delegate2 = (State) it$iv;
            ComposerKt.sourceInformationMarkerEnd($composer2);
            if (TextFieldSelectionHandles$lambda$16(startHandleState$delegate2).getVisible()) {
                $composer2.startReplaceGroup(-1348757769);
                ComposerKt.sourceInformation($composer2, "531@27097L167,540@27491L94,530@27051L662");
                ComposerKt.sourceInformationMarkerStart($composer2, -1983169684, "CC(remember):BasicTextField.kt#9igjgp");
                boolean invalid$iv = $composer2.changedInstance(selectionState);
                Object it$iv2 = $composer2.rememberedValue();
                if (invalid$iv || it$iv2 == Composer.Companion.getEmpty()) {
                    Object value$iv2 = (OffsetProvider) new OffsetProvider() { // from class: androidx.compose.foundation.text.BasicTextFieldKt$TextFieldSelectionHandles$1$1
                        @Override // androidx.compose.foundation.text.selection.OffsetProvider
                        /* renamed from: provide-F1C5BW0 */
                        public final long mo1295provideF1C5BW0() {
                            return TextFieldSelectionState.this.getSelectionHandleState$foundation_release(true, true).m1608getPositionF1C5BW0();
                        }
                    };
                    $composer2.updateRememberedValue(value$iv2);
                    it$iv2 = value$iv2;
                }
                OffsetProvider offsetProvider = (OffsetProvider) it$iv2;
                ComposerKt.sourceInformationMarkerEnd($composer2);
                ResolvedTextDirection direction = TextFieldSelectionHandles$lambda$16(startHandleState$delegate2).getDirection();
                boolean handlesCrossed = TextFieldSelectionHandles$lambda$16(startHandleState$delegate2).getHandlesCrossed();
                Modifier.Companion companion = Modifier.Companion;
                ComposerKt.sourceInformationMarkerStart($composer2, -1983157149, "CC(remember):BasicTextField.kt#9igjgp");
                boolean invalid$iv2 = $composer2.changedInstance(selectionState);
                Object it$iv3 = $composer2.rememberedValue();
                if (invalid$iv2 || it$iv3 == Composer.Companion.getEmpty()) {
                    startHandleState$delegate = startHandleState$delegate2;
                    Object value$iv3 = (PointerInputEventHandler) new PointerInputEventHandler() { // from class: androidx.compose.foundation.text.BasicTextFieldKt$TextFieldSelectionHandles$2$1
                        @Override // androidx.compose.ui.input.pointer.PointerInputEventHandler
                        public final Object invoke(PointerInputScope $this$pointerInput, Continuation<? super Unit> continuation) {
                            TextFieldSelectionState $this$invoke_u24lambda_u240 = TextFieldSelectionState.this;
                            Object selectionHandleGestures = $this$invoke_u24lambda_u240.selectionHandleGestures($this$pointerInput, true, continuation);
                            return selectionHandleGestures == IntrinsicsKt.getCOROUTINE_SUSPENDED() ? selectionHandleGestures : Unit.INSTANCE;
                        }
                    };
                    $composer2.updateRememberedValue(value$iv3);
                    it$iv3 = value$iv3;
                } else {
                    startHandleState$delegate = startHandleState$delegate2;
                }
                ComposerKt.sourceInformationMarkerEnd($composer2);
                AndroidSelectionHandles_androidKt.m1697SelectionHandlewLIcFTc(offsetProvider, true, direction, handlesCrossed, MinTouchTargetSizeForHandles, TextFieldSelectionHandles$lambda$16(startHandleState$delegate).getLineHeight(), SuspendingPointerInputFilterKt.pointerInput(companion, selectionState, (PointerInputEventHandler) it$iv3), $composer2, 24624, 0);
                $composer2.endReplaceGroup();
            } else {
                $composer2.startReplaceGroup(-1348106211);
                $composer2.endReplaceGroup();
            }
            ComposerKt.sourceInformationMarkerStart($composer2, -1983146789, "CC(remember):BasicTextField.kt#9igjgp");
            Object it$iv4 = $composer2.rememberedValue();
            if (it$iv4 == Composer.Companion.getEmpty()) {
                Object value$iv4 = SnapshotStateKt.derivedStateOf(new Function0<TextFieldHandleState>() { // from class: androidx.compose.foundation.text.BasicTextFieldKt$TextFieldSelectionHandles$endHandleState$2$1
                    /* JADX INFO: Access modifiers changed from: package-private */
                    {
                        super(0);
                    }

                    /* JADX WARN: Can't rename method to resolve collision */
                    @Override // kotlin.jvm.functions.Function0
                    public final TextFieldHandleState invoke() {
                        return TextFieldSelectionState.this.getSelectionHandleState$foundation_release(false, false);
                    }
                });
                $composer2.updateRememberedValue(value$iv4);
                it$iv4 = value$iv4;
            }
            State endHandleState$delegate = (State) it$iv4;
            ComposerKt.sourceInformationMarkerEnd($composer2);
            if (TextFieldSelectionHandles$lambda$20(endHandleState$delegate).getVisible()) {
                $composer2.startReplaceGroup(-1347810502);
                ComposerKt.sourceInformation($composer2, "556@28052L168,565@28444L95,555@28006L659");
                ComposerKt.sourceInformationMarkerStart($composer2, -1983139123, "CC(remember):BasicTextField.kt#9igjgp");
                boolean invalid$iv3 = $composer2.changedInstance(selectionState);
                Object it$iv5 = $composer2.rememberedValue();
                if (invalid$iv3 || it$iv5 == Composer.Companion.getEmpty()) {
                    Object value$iv5 = (OffsetProvider) new OffsetProvider() { // from class: androidx.compose.foundation.text.BasicTextFieldKt$TextFieldSelectionHandles$3$1
                        @Override // androidx.compose.foundation.text.selection.OffsetProvider
                        /* renamed from: provide-F1C5BW0 */
                        public final long mo1295provideF1C5BW0() {
                            return TextFieldSelectionState.this.getSelectionHandleState$foundation_release(false, true).m1608getPositionF1C5BW0();
                        }
                    };
                    $composer2.updateRememberedValue(value$iv5);
                    it$iv5 = value$iv5;
                }
                OffsetProvider offsetProvider2 = (OffsetProvider) it$iv5;
                ComposerKt.sourceInformationMarkerEnd($composer2);
                ResolvedTextDirection direction2 = TextFieldSelectionHandles$lambda$20(endHandleState$delegate).getDirection();
                boolean handlesCrossed2 = TextFieldSelectionHandles$lambda$20(endHandleState$delegate).getHandlesCrossed();
                Modifier.Companion companion2 = Modifier.Companion;
                ComposerKt.sourceInformationMarkerStart($composer2, -1983126652, "CC(remember):BasicTextField.kt#9igjgp");
                boolean invalid$iv4 = $composer2.changedInstance(selectionState);
                Object it$iv6 = $composer2.rememberedValue();
                if (invalid$iv4 || it$iv6 == Composer.Companion.getEmpty()) {
                    Object value$iv6 = (PointerInputEventHandler) new PointerInputEventHandler() { // from class: androidx.compose.foundation.text.BasicTextFieldKt$TextFieldSelectionHandles$4$1
                        @Override // androidx.compose.ui.input.pointer.PointerInputEventHandler
                        public final Object invoke(PointerInputScope $this$pointerInput, Continuation<? super Unit> continuation) {
                            TextFieldSelectionState $this$invoke_u24lambda_u240 = TextFieldSelectionState.this;
                            Object selectionHandleGestures = $this$invoke_u24lambda_u240.selectionHandleGestures($this$pointerInput, false, continuation);
                            return selectionHandleGestures == IntrinsicsKt.getCOROUTINE_SUSPENDED() ? selectionHandleGestures : Unit.INSTANCE;
                        }
                    };
                    $composer2.updateRememberedValue(value$iv6);
                    it$iv6 = value$iv6;
                }
                ComposerKt.sourceInformationMarkerEnd($composer2);
                AndroidSelectionHandles_androidKt.m1697SelectionHandlewLIcFTc(offsetProvider2, false, direction2, handlesCrossed2, MinTouchTargetSizeForHandles, TextFieldSelectionHandles$lambda$20(endHandleState$delegate).getLineHeight(), SuspendingPointerInputFilterKt.pointerInput(companion2, selectionState, (PointerInputEventHandler) it$iv6), $composer2, 24624, 0);
                $composer2.endReplaceGroup();
            } else {
                $composer2.startReplaceGroup(-1347161827);
                $composer2.endReplaceGroup();
            }
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventEnd();
            }
        } else {
            $composer2.skipToGroupEnd();
        }
        ScopeUpdateScope endRestartGroup = $composer2.endRestartGroup();
        if (endRestartGroup != null) {
            endRestartGroup.updateScope(new Function2<Composer, Integer, Unit>() { // from class: androidx.compose.foundation.text.BasicTextFieldKt$TextFieldSelectionHandles$5
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
                    BasicTextFieldKt.TextFieldSelectionHandles(TextFieldSelectionState.this, composer, RecomposeScopeImplKt.updateChangedFlags($changed | 1));
                }
            });
        }
    }

    private static final TextFieldHandleState TextFieldSelectionHandles$lambda$16(State<TextFieldHandleState> state) {
        Object thisObj$iv = state.getValue();
        return (TextFieldHandleState) thisObj$iv;
    }

    private static final TextFieldHandleState TextFieldSelectionHandles$lambda$20(State<TextFieldHandleState> state) {
        Object thisObj$iv = state.getValue();
        return (TextFieldHandleState) thisObj$iv;
    }

    /* JADX WARN: Code restructure failed: missing block: B:277:0x048b, code lost:
        if (r0 == androidx.compose.runtime.Composer.Companion.getEmpty()) goto L100;
     */
    /* JADX WARN: Removed duplicated region for block: B:253:0x0417  */
    /* JADX WARN: Removed duplicated region for block: B:254:0x0419  */
    /* JADX WARN: Removed duplicated region for block: B:257:0x0425  */
    /* JADX WARN: Removed duplicated region for block: B:261:0x0433  */
    /* JADX WARN: Removed duplicated region for block: B:265:0x0455  */
    /* JADX WARN: Removed duplicated region for block: B:266:0x0458  */
    /* JADX WARN: Removed duplicated region for block: B:268:0x045c  */
    /* JADX WARN: Removed duplicated region for block: B:269:0x045e  */
    /* JADX WARN: Removed duplicated region for block: B:272:0x0473  */
    /* JADX WARN: Removed duplicated region for block: B:273:0x0475  */
    /* JADX WARN: Removed duplicated region for block: B:276:0x0483  */
    /* JADX WARN: Removed duplicated region for block: B:280:0x048f  */
    /* JADX WARN: Removed duplicated region for block: B:284:0x0500  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void BasicTextField(final java.lang.String r36, final kotlin.jvm.functions.Function1<? super java.lang.String, kotlin.Unit> r37, androidx.compose.ui.Modifier r38, boolean r39, boolean r40, androidx.compose.ui.text.TextStyle r41, androidx.compose.foundation.text.KeyboardOptions r42, androidx.compose.foundation.text.KeyboardActions r43, boolean r44, int r45, int r46, androidx.compose.ui.text.input.VisualTransformation r47, kotlin.jvm.functions.Function1<? super androidx.compose.ui.text.TextLayoutResult, kotlin.Unit> r48, androidx.compose.foundation.interaction.MutableInteractionSource r49, androidx.compose.ui.graphics.Brush r50, kotlin.jvm.functions.Function3<? super kotlin.jvm.functions.Function2<? super androidx.compose.runtime.Composer, ? super java.lang.Integer, kotlin.Unit>, ? super androidx.compose.runtime.Composer, ? super java.lang.Integer, kotlin.Unit> r51, androidx.compose.runtime.Composer r52, final int r53, final int r54, final int r55) {
        /*
            Method dump skipped, instructions count: 1369
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.compose.foundation.text.BasicTextFieldKt.BasicTextField(java.lang.String, kotlin.jvm.functions.Function1, androidx.compose.ui.Modifier, boolean, boolean, androidx.compose.ui.text.TextStyle, androidx.compose.foundation.text.KeyboardOptions, androidx.compose.foundation.text.KeyboardActions, boolean, int, int, androidx.compose.ui.text.input.VisualTransformation, kotlin.jvm.functions.Function1, androidx.compose.foundation.interaction.MutableInteractionSource, androidx.compose.ui.graphics.Brush, kotlin.jvm.functions.Function3, androidx.compose.runtime.Composer, int, int, int):void");
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final TextFieldValue BasicTextField$lambda$24(MutableState<TextFieldValue> mutableState) {
        MutableState<TextFieldValue> $this$getValue$iv = mutableState;
        return $this$getValue$iv.getValue();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final String BasicTextField$lambda$28(MutableState<String> mutableState) {
        MutableState<String> $this$getValue$iv = mutableState;
        return $this$getValue$iv.getValue();
    }

    /* JADX WARN: Code restructure failed: missing block: B:257:0x0399, code lost:
        if (r2 == androidx.compose.runtime.Composer.Companion.getEmpty()) goto L87;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void BasicTextField(final androidx.compose.ui.text.input.TextFieldValue r36, final kotlin.jvm.functions.Function1<? super androidx.compose.ui.text.input.TextFieldValue, kotlin.Unit> r37, androidx.compose.ui.Modifier r38, boolean r39, boolean r40, androidx.compose.ui.text.TextStyle r41, androidx.compose.foundation.text.KeyboardOptions r42, androidx.compose.foundation.text.KeyboardActions r43, boolean r44, int r45, int r46, androidx.compose.ui.text.input.VisualTransformation r47, kotlin.jvm.functions.Function1<? super androidx.compose.ui.text.TextLayoutResult, kotlin.Unit> r48, androidx.compose.foundation.interaction.MutableInteractionSource r49, androidx.compose.ui.graphics.Brush r50, kotlin.jvm.functions.Function3<? super kotlin.jvm.functions.Function2<? super androidx.compose.runtime.Composer, ? super java.lang.Integer, kotlin.Unit>, ? super androidx.compose.runtime.Composer, ? super java.lang.Integer, kotlin.Unit> r51, androidx.compose.runtime.Composer r52, final int r53, final int r54, final int r55) {
        /*
            Method dump skipped, instructions count: 1146
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.compose.foundation.text.BasicTextFieldKt.BasicTextField(androidx.compose.ui.text.input.TextFieldValue, kotlin.jvm.functions.Function1, androidx.compose.ui.Modifier, boolean, boolean, androidx.compose.ui.text.TextStyle, androidx.compose.foundation.text.KeyboardOptions, androidx.compose.foundation.text.KeyboardActions, boolean, int, int, androidx.compose.ui.text.input.VisualTransformation, kotlin.jvm.functions.Function1, androidx.compose.foundation.interaction.MutableInteractionSource, androidx.compose.ui.graphics.Brush, kotlin.jvm.functions.Function3, androidx.compose.runtime.Composer, int, int, int):void");
    }

    @Deprecated(level = DeprecationLevel.HIDDEN, message = "Maintained for binary compatibility")
    public static final /* synthetic */ void BasicTextField(final String value, final Function1 onValueChange, Modifier modifier, boolean enabled, boolean readOnly, TextStyle textStyle, KeyboardOptions keyboardOptions, KeyboardActions keyboardActions, boolean singleLine, int maxLines, VisualTransformation visualTransformation, Function1 onTextLayout, MutableInteractionSource interactionSource, Brush cursorBrush, Function3 decorationBox, Composer $composer, final int $changed, final int $changed1, final int i) {
        Object obj;
        boolean z;
        boolean z2;
        Object obj2;
        Object obj3;
        Object obj4;
        int i2;
        int i3;
        int i4;
        int i5;
        int i6;
        int i7;
        int i8;
        Composer $composer2;
        final KeyboardActions keyboardActions2;
        final Modifier modifier2;
        final int maxLines2;
        final MutableInteractionSource interactionSource2;
        final Function3 decorationBox2;
        final boolean enabled2;
        final boolean readOnly2;
        final TextStyle textStyle2;
        final KeyboardOptions keyboardOptions2;
        final boolean singleLine2;
        final VisualTransformation visualTransformation2;
        final Function1 onTextLayout2;
        final Brush cursorBrush2;
        Modifier modifier3;
        int i9;
        MutableInteractionSource interactionSource3;
        Composer $composer3 = $composer.startRestartGroup(-454732590);
        ComposerKt.sourceInformation($composer3, "C(BasicTextField)P(13,9,7,2,10,12,5,4,11,6,14,8,3)898@46906L39,903@47146L579:BasicTextField.kt#423gt5");
        int $dirty = $changed;
        int $dirty1 = $changed1;
        if ((i & 1) != 0) {
            $dirty |= 6;
        } else if (($changed & 6) == 0) {
            $dirty |= $composer3.changed(value) ? 4 : 2;
        }
        if ((i & 2) != 0) {
            $dirty |= 48;
        } else if (($changed & 48) == 0) {
            $dirty |= $composer3.changedInstance(onValueChange) ? 32 : 16;
        }
        int i10 = i & 4;
        if (i10 != 0) {
            $dirty |= 384;
            obj = modifier;
        } else if (($changed & 384) == 0) {
            obj = modifier;
            $dirty |= $composer3.changed(obj) ? 256 : 128;
        } else {
            obj = modifier;
        }
        int i11 = i & 8;
        if (i11 != 0) {
            $dirty |= 3072;
            z = enabled;
        } else if (($changed & 3072) == 0) {
            z = enabled;
            $dirty |= $composer3.changed(z) ? 2048 : 1024;
        } else {
            z = enabled;
        }
        int i12 = i & 16;
        if (i12 != 0) {
            $dirty |= 24576;
            z2 = readOnly;
        } else if (($changed & 24576) == 0) {
            z2 = readOnly;
            $dirty |= $composer3.changed(z2) ? 16384 : 8192;
        } else {
            z2 = readOnly;
        }
        int i13 = i & 32;
        if (i13 != 0) {
            $dirty |= ProfileVerifier.CompilationStatus.RESULT_CODE_ERROR_CANT_WRITE_PROFILE_VERIFICATION_RESULT_CACHE_FILE;
            obj2 = textStyle;
        } else if (($changed & ProfileVerifier.CompilationStatus.RESULT_CODE_ERROR_CANT_WRITE_PROFILE_VERIFICATION_RESULT_CACHE_FILE) == 0) {
            obj2 = textStyle;
            $dirty |= $composer3.changed(obj2) ? 131072 : 65536;
        } else {
            obj2 = textStyle;
        }
        int i14 = i & 64;
        if (i14 != 0) {
            $dirty |= 1572864;
            obj3 = keyboardOptions;
        } else if (($changed & 1572864) == 0) {
            obj3 = keyboardOptions;
            $dirty |= $composer3.changed(obj3) ? 1048576 : 524288;
        } else {
            obj3 = keyboardOptions;
        }
        int i15 = i & 128;
        if (i15 != 0) {
            $dirty |= 12582912;
            obj4 = keyboardActions;
        } else if (($changed & 12582912) == 0) {
            obj4 = keyboardActions;
            $dirty |= $composer3.changed(obj4) ? 8388608 : 4194304;
        } else {
            obj4 = keyboardActions;
        }
        int i16 = i & 256;
        if (i16 != 0) {
            $dirty |= 100663296;
            i2 = i16;
        } else if (($changed & 100663296) == 0) {
            i2 = i16;
            $dirty |= $composer3.changed(singleLine) ? 67108864 : 33554432;
        } else {
            i2 = i16;
        }
        int i17 = i & 512;
        if (i17 != 0) {
            $dirty |= 805306368;
            i3 = i17;
        } else if (($changed & 805306368) == 0) {
            i3 = i17;
            $dirty |= $composer3.changed(maxLines) ? PropertyOptions.DELETE_EXISTING : 268435456;
        } else {
            i3 = i17;
        }
        int i18 = i & 1024;
        if (i18 != 0) {
            $dirty1 |= 6;
            i4 = i18;
        } else if (($changed1 & 6) == 0) {
            i4 = i18;
            $dirty1 |= $composer3.changed(visualTransformation) ? 4 : 2;
        } else {
            i4 = i18;
        }
        int i19 = i & 2048;
        if (i19 != 0) {
            $dirty1 |= 48;
            i5 = i19;
        } else if (($changed1 & 48) == 0) {
            i5 = i19;
            $dirty1 |= $composer3.changedInstance(onTextLayout) ? 32 : 16;
        } else {
            i5 = i19;
        }
        int i20 = i & 4096;
        if (i20 != 0) {
            $dirty1 |= 384;
            i6 = i20;
        } else {
            i6 = i20;
            if (($changed1 & 384) == 0) {
                $dirty1 |= $composer3.changed(interactionSource) ? 256 : 128;
            }
        }
        int i21 = i & 8192;
        if (i21 != 0) {
            $dirty1 |= 3072;
            i7 = i21;
        } else {
            i7 = i21;
            if (($changed1 & 3072) == 0) {
                $dirty1 |= $composer3.changed(cursorBrush) ? 2048 : 1024;
            }
        }
        int i22 = i & 16384;
        if (i22 != 0) {
            $dirty1 |= 24576;
            i8 = i22;
        } else {
            i8 = i22;
            if (($changed1 & 24576) == 0) {
                $dirty1 |= $composer3.changedInstance(decorationBox) ? 16384 : 8192;
            }
        }
        if ($composer3.shouldExecute((($dirty & 306783379) == 306783378 && ($dirty1 & 9363) == 9362) ? false : true, $dirty & 1)) {
            Modifier modifier4 = i10 != 0 ? Modifier.Companion : obj;
            boolean enabled3 = i11 != 0 ? true : z;
            boolean readOnly3 = i12 != 0 ? false : z2;
            TextStyle textStyle3 = i13 != 0 ? TextStyle.Companion.getDefault() : obj2;
            KeyboardOptions keyboardOptions3 = i14 != 0 ? KeyboardOptions.Companion.getDefault() : obj3;
            KeyboardActions keyboardActions3 = i15 != 0 ? KeyboardActions.Companion.getDefault() : obj4;
            boolean singleLine3 = i2 != 0 ? false : singleLine;
            int maxLines3 = i3 != 0 ? Integer.MAX_VALUE : maxLines;
            VisualTransformation visualTransformation3 = i4 != 0 ? VisualTransformation.Companion.getNone() : visualTransformation;
            Function1 onTextLayout3 = i5 != 0 ? new Function1<TextLayoutResult, Unit>() { // from class: androidx.compose.foundation.text.BasicTextFieldKt$BasicTextField$13
                @Override // kotlin.jvm.functions.Function1
                public /* bridge */ /* synthetic */ Unit invoke(TextLayoutResult textLayoutResult) {
                    invoke2(textLayoutResult);
                    return Unit.INSTANCE;
                }

                /* renamed from: invoke  reason: avoid collision after fix types in other method */
                public final void invoke2(TextLayoutResult it) {
                }
            } : onTextLayout;
            if (i6 != 0) {
                ComposerKt.sourceInformationMarkerStart($composer3, -1242728467, "CC(remember):BasicTextField.kt#9igjgp");
                modifier3 = modifier4;
                Object it$iv = $composer3.rememberedValue();
                if (it$iv == Composer.Companion.getEmpty()) {
                    Object value$iv = InteractionSourceKt.MutableInteractionSource();
                    $composer3.updateRememberedValue(value$iv);
                    it$iv = value$iv;
                }
                ComposerKt.sourceInformationMarkerEnd($composer3);
                int i23 = i8;
                interactionSource3 = (MutableInteractionSource) it$iv;
                i9 = i23;
            } else {
                modifier3 = modifier4;
                i9 = i8;
                interactionSource3 = interactionSource;
            }
            Brush cursorBrush3 = i7 != 0 ? new SolidColor(Color.Companion.m4315getBlack0d7_KjU(), null) : cursorBrush;
            Function3 decorationBox3 = i9 != 0 ? ComposableSingletons$BasicTextFieldKt.INSTANCE.m1311getLambda3$foundation_release() : decorationBox;
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventStart(-454732590, $dirty, $dirty1, "androidx.compose.foundation.text.BasicTextField (BasicTextField.kt:902)");
            }
            $composer2 = $composer3;
            Modifier modifier5 = modifier3;
            BasicTextField(value, onValueChange, modifier5, enabled3, readOnly3, textStyle3, keyboardOptions3, keyboardActions3, singleLine3, maxLines3, 1, visualTransformation3, onTextLayout3, interactionSource3, cursorBrush3, decorationBox3, $composer2, ($dirty & 14) | ($dirty & Property.BORDER_BOTTOM_RIGHT_RADIUS) | ($dirty & 896) | ($dirty & 7168) | (57344 & $dirty) | (458752 & $dirty) | (3670016 & $dirty) | (29360128 & $dirty) | (234881024 & $dirty) | (1879048192 & $dirty), (($dirty1 << 3) & Property.BORDER_BOTTOM_RIGHT_RADIUS) | 6 | (($dirty1 << 3) & 896) | (($dirty1 << 3) & 7168) | (($dirty1 << 3) & 57344) | (458752 & ($dirty1 << 3)), 0);
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventEnd();
            }
            modifier2 = modifier5;
            enabled2 = enabled3;
            readOnly2 = readOnly3;
            textStyle2 = textStyle3;
            keyboardOptions2 = keyboardOptions3;
            keyboardActions2 = keyboardActions3;
            singleLine2 = singleLine3;
            maxLines2 = maxLines3;
            visualTransformation2 = visualTransformation3;
            onTextLayout2 = onTextLayout3;
            interactionSource2 = interactionSource3;
            cursorBrush2 = cursorBrush3;
            decorationBox2 = decorationBox3;
        } else {
            $composer2 = $composer3;
            $composer2.skipToGroupEnd();
            Object obj5 = obj;
            keyboardActions2 = obj4;
            modifier2 = obj5;
            maxLines2 = maxLines;
            interactionSource2 = interactionSource;
            decorationBox2 = decorationBox;
            enabled2 = z;
            readOnly2 = z2;
            textStyle2 = obj2;
            keyboardOptions2 = obj3;
            singleLine2 = singleLine;
            visualTransformation2 = visualTransformation;
            onTextLayout2 = onTextLayout;
            cursorBrush2 = cursorBrush;
        }
        ScopeUpdateScope endRestartGroup = $composer2.endRestartGroup();
        if (endRestartGroup != null) {
            endRestartGroup.updateScope(new Function2<Composer, Integer, Unit>() { // from class: androidx.compose.foundation.text.BasicTextFieldKt$BasicTextField$15
                /* JADX INFO: Access modifiers changed from: package-private */
                /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                /* JADX WARN: Multi-variable type inference failed */
                {
                    super(2);
                }

                @Override // kotlin.jvm.functions.Function2
                public /* bridge */ /* synthetic */ Unit invoke(Composer composer, Integer num) {
                    invoke(composer, num.intValue());
                    return Unit.INSTANCE;
                }

                public final void invoke(Composer composer, int i24) {
                    BasicTextFieldKt.BasicTextField(value, onValueChange, modifier2, enabled2, readOnly2, textStyle2, keyboardOptions2, keyboardActions2, singleLine2, maxLines2, visualTransformation2, onTextLayout2, interactionSource2, cursorBrush2, decorationBox2, composer, RecomposeScopeImplKt.updateChangedFlags($changed | 1), RecomposeScopeImplKt.updateChangedFlags($changed1), i);
                }
            });
        }
    }

    @Deprecated(level = DeprecationLevel.HIDDEN, message = "Maintained for binary compatibility")
    public static final /* synthetic */ void BasicTextField(final TextFieldValue value, final Function1 onValueChange, Modifier modifier, boolean enabled, boolean readOnly, TextStyle textStyle, KeyboardOptions keyboardOptions, KeyboardActions keyboardActions, boolean singleLine, int maxLines, VisualTransformation visualTransformation, Function1 onTextLayout, MutableInteractionSource interactionSource, Brush cursorBrush, Function3 decorationBox, Composer $composer, final int $changed, final int $changed1, final int i) {
        Object obj;
        boolean z;
        boolean z2;
        Object obj2;
        Object obj3;
        Object obj4;
        int i2;
        int i3;
        int i4;
        int i5;
        int i6;
        int i7;
        int i8;
        Composer $composer2;
        final KeyboardActions keyboardActions2;
        final Modifier modifier2;
        final int maxLines2;
        final MutableInteractionSource interactionSource2;
        final Function3 decorationBox2;
        final boolean enabled2;
        final boolean readOnly2;
        final TextStyle textStyle2;
        final KeyboardOptions keyboardOptions2;
        final boolean singleLine2;
        final VisualTransformation visualTransformation2;
        final Function1 onTextLayout2;
        final Brush cursorBrush2;
        Modifier modifier3;
        int i9;
        MutableInteractionSource interactionSource3;
        Composer $composer3 = $composer.startRestartGroup(-560482651);
        ComposerKt.sourceInformation($composer3, "C(BasicTextField)P(13,9,7,2,10,12,5,4,11,6,14,8,3)938@48431L39,943@48671L579:BasicTextField.kt#423gt5");
        int $dirty = $changed;
        int $dirty1 = $changed1;
        if ((i & 1) != 0) {
            $dirty |= 6;
        } else if (($changed & 6) == 0) {
            $dirty |= $composer3.changed(value) ? 4 : 2;
        }
        if ((i & 2) != 0) {
            $dirty |= 48;
        } else if (($changed & 48) == 0) {
            $dirty |= $composer3.changedInstance(onValueChange) ? 32 : 16;
        }
        int i10 = i & 4;
        if (i10 != 0) {
            $dirty |= 384;
            obj = modifier;
        } else if (($changed & 384) == 0) {
            obj = modifier;
            $dirty |= $composer3.changed(obj) ? 256 : 128;
        } else {
            obj = modifier;
        }
        int i11 = i & 8;
        if (i11 != 0) {
            $dirty |= 3072;
            z = enabled;
        } else if (($changed & 3072) == 0) {
            z = enabled;
            $dirty |= $composer3.changed(z) ? 2048 : 1024;
        } else {
            z = enabled;
        }
        int i12 = i & 16;
        if (i12 != 0) {
            $dirty |= 24576;
            z2 = readOnly;
        } else if (($changed & 24576) == 0) {
            z2 = readOnly;
            $dirty |= $composer3.changed(z2) ? 16384 : 8192;
        } else {
            z2 = readOnly;
        }
        int i13 = i & 32;
        if (i13 != 0) {
            $dirty |= ProfileVerifier.CompilationStatus.RESULT_CODE_ERROR_CANT_WRITE_PROFILE_VERIFICATION_RESULT_CACHE_FILE;
            obj2 = textStyle;
        } else if (($changed & ProfileVerifier.CompilationStatus.RESULT_CODE_ERROR_CANT_WRITE_PROFILE_VERIFICATION_RESULT_CACHE_FILE) == 0) {
            obj2 = textStyle;
            $dirty |= $composer3.changed(obj2) ? 131072 : 65536;
        } else {
            obj2 = textStyle;
        }
        int i14 = i & 64;
        if (i14 != 0) {
            $dirty |= 1572864;
            obj3 = keyboardOptions;
        } else if (($changed & 1572864) == 0) {
            obj3 = keyboardOptions;
            $dirty |= $composer3.changed(obj3) ? 1048576 : 524288;
        } else {
            obj3 = keyboardOptions;
        }
        int i15 = i & 128;
        if (i15 != 0) {
            $dirty |= 12582912;
            obj4 = keyboardActions;
        } else if (($changed & 12582912) == 0) {
            obj4 = keyboardActions;
            $dirty |= $composer3.changed(obj4) ? 8388608 : 4194304;
        } else {
            obj4 = keyboardActions;
        }
        int i16 = i & 256;
        if (i16 != 0) {
            $dirty |= 100663296;
            i2 = i16;
        } else if (($changed & 100663296) == 0) {
            i2 = i16;
            $dirty |= $composer3.changed(singleLine) ? 67108864 : 33554432;
        } else {
            i2 = i16;
        }
        int i17 = i & 512;
        if (i17 != 0) {
            $dirty |= 805306368;
            i3 = i17;
        } else if (($changed & 805306368) == 0) {
            i3 = i17;
            $dirty |= $composer3.changed(maxLines) ? PropertyOptions.DELETE_EXISTING : 268435456;
        } else {
            i3 = i17;
        }
        int i18 = i & 1024;
        if (i18 != 0) {
            $dirty1 |= 6;
            i4 = i18;
        } else if (($changed1 & 6) == 0) {
            i4 = i18;
            $dirty1 |= $composer3.changed(visualTransformation) ? 4 : 2;
        } else {
            i4 = i18;
        }
        int i19 = i & 2048;
        if (i19 != 0) {
            $dirty1 |= 48;
            i5 = i19;
        } else if (($changed1 & 48) == 0) {
            i5 = i19;
            $dirty1 |= $composer3.changedInstance(onTextLayout) ? 32 : 16;
        } else {
            i5 = i19;
        }
        int i20 = i & 4096;
        if (i20 != 0) {
            $dirty1 |= 384;
            i6 = i20;
        } else {
            i6 = i20;
            if (($changed1 & 384) == 0) {
                $dirty1 |= $composer3.changed(interactionSource) ? 256 : 128;
            }
        }
        int i21 = i & 8192;
        if (i21 != 0) {
            $dirty1 |= 3072;
            i7 = i21;
        } else {
            i7 = i21;
            if (($changed1 & 3072) == 0) {
                $dirty1 |= $composer3.changed(cursorBrush) ? 2048 : 1024;
            }
        }
        int i22 = i & 16384;
        if (i22 != 0) {
            $dirty1 |= 24576;
            i8 = i22;
        } else {
            i8 = i22;
            if (($changed1 & 24576) == 0) {
                $dirty1 |= $composer3.changedInstance(decorationBox) ? 16384 : 8192;
            }
        }
        if ($composer3.shouldExecute((($dirty & 306783379) == 306783378 && ($dirty1 & 9363) == 9362) ? false : true, $dirty & 1)) {
            Modifier modifier4 = i10 != 0 ? Modifier.Companion : obj;
            boolean enabled3 = i11 != 0 ? true : z;
            boolean readOnly3 = i12 != 0 ? false : z2;
            TextStyle textStyle3 = i13 != 0 ? TextStyle.Companion.getDefault() : obj2;
            KeyboardOptions keyboardOptions3 = i14 != 0 ? KeyboardOptions.Companion.getDefault() : obj3;
            KeyboardActions keyboardActions3 = i15 != 0 ? KeyboardActions.Companion.getDefault() : obj4;
            boolean singleLine3 = i2 != 0 ? false : singleLine;
            int maxLines3 = i3 != 0 ? Integer.MAX_VALUE : maxLines;
            VisualTransformation visualTransformation3 = i4 != 0 ? VisualTransformation.Companion.getNone() : visualTransformation;
            Function1 onTextLayout3 = i5 != 0 ? new Function1<TextLayoutResult, Unit>() { // from class: androidx.compose.foundation.text.BasicTextFieldKt$BasicTextField$16
                @Override // kotlin.jvm.functions.Function1
                public /* bridge */ /* synthetic */ Unit invoke(TextLayoutResult textLayoutResult) {
                    invoke2(textLayoutResult);
                    return Unit.INSTANCE;
                }

                /* renamed from: invoke  reason: avoid collision after fix types in other method */
                public final void invoke2(TextLayoutResult it) {
                }
            } : onTextLayout;
            if (i6 != 0) {
                ComposerKt.sourceInformationMarkerStart($composer3, -1242679667, "CC(remember):BasicTextField.kt#9igjgp");
                modifier3 = modifier4;
                Object it$iv = $composer3.rememberedValue();
                if (it$iv == Composer.Companion.getEmpty()) {
                    Object value$iv = InteractionSourceKt.MutableInteractionSource();
                    $composer3.updateRememberedValue(value$iv);
                    it$iv = value$iv;
                }
                ComposerKt.sourceInformationMarkerEnd($composer3);
                int i23 = i8;
                interactionSource3 = (MutableInteractionSource) it$iv;
                i9 = i23;
            } else {
                modifier3 = modifier4;
                i9 = i8;
                interactionSource3 = interactionSource;
            }
            Brush cursorBrush3 = i7 != 0 ? new SolidColor(Color.Companion.m4315getBlack0d7_KjU(), null) : cursorBrush;
            Function3 decorationBox3 = i9 != 0 ? ComposableSingletons$BasicTextFieldKt.INSTANCE.m1312getLambda4$foundation_release() : decorationBox;
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventStart(-560482651, $dirty, $dirty1, "androidx.compose.foundation.text.BasicTextField (BasicTextField.kt:942)");
            }
            $composer2 = $composer3;
            Modifier modifier5 = modifier3;
            BasicTextField(value, onValueChange, modifier5, enabled3, readOnly3, textStyle3, keyboardOptions3, keyboardActions3, singleLine3, maxLines3, 1, visualTransformation3, onTextLayout3, interactionSource3, cursorBrush3, decorationBox3, $composer2, ($dirty & 14) | ($dirty & Property.BORDER_BOTTOM_RIGHT_RADIUS) | ($dirty & 896) | ($dirty & 7168) | (57344 & $dirty) | (458752 & $dirty) | (3670016 & $dirty) | (29360128 & $dirty) | (234881024 & $dirty) | (1879048192 & $dirty), (($dirty1 << 3) & Property.BORDER_BOTTOM_RIGHT_RADIUS) | 6 | (($dirty1 << 3) & 896) | (($dirty1 << 3) & 7168) | (($dirty1 << 3) & 57344) | (458752 & ($dirty1 << 3)), 0);
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventEnd();
            }
            modifier2 = modifier5;
            enabled2 = enabled3;
            readOnly2 = readOnly3;
            textStyle2 = textStyle3;
            keyboardOptions2 = keyboardOptions3;
            keyboardActions2 = keyboardActions3;
            singleLine2 = singleLine3;
            maxLines2 = maxLines3;
            visualTransformation2 = visualTransformation3;
            onTextLayout2 = onTextLayout3;
            interactionSource2 = interactionSource3;
            cursorBrush2 = cursorBrush3;
            decorationBox2 = decorationBox3;
        } else {
            $composer2 = $composer3;
            $composer2.skipToGroupEnd();
            Object obj5 = obj;
            keyboardActions2 = obj4;
            modifier2 = obj5;
            maxLines2 = maxLines;
            interactionSource2 = interactionSource;
            decorationBox2 = decorationBox;
            enabled2 = z;
            readOnly2 = z2;
            textStyle2 = obj2;
            keyboardOptions2 = obj3;
            singleLine2 = singleLine;
            visualTransformation2 = visualTransformation;
            onTextLayout2 = onTextLayout;
            cursorBrush2 = cursorBrush;
        }
        ScopeUpdateScope endRestartGroup = $composer2.endRestartGroup();
        if (endRestartGroup != null) {
            endRestartGroup.updateScope(new Function2<Composer, Integer, Unit>() { // from class: androidx.compose.foundation.text.BasicTextFieldKt$BasicTextField$18
                /* JADX INFO: Access modifiers changed from: package-private */
                /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                /* JADX WARN: Multi-variable type inference failed */
                {
                    super(2);
                }

                @Override // kotlin.jvm.functions.Function2
                public /* bridge */ /* synthetic */ Unit invoke(Composer composer, Integer num) {
                    invoke(composer, num.intValue());
                    return Unit.INSTANCE;
                }

                public final void invoke(Composer composer, int i24) {
                    BasicTextFieldKt.BasicTextField(TextFieldValue.this, onValueChange, modifier2, enabled2, readOnly2, textStyle2, keyboardOptions2, keyboardActions2, singleLine2, maxLines2, visualTransformation2, onTextLayout2, interactionSource2, cursorBrush2, decorationBox2, composer, RecomposeScopeImplKt.updateChangedFlags($changed | 1), RecomposeScopeImplKt.updateChangedFlags($changed1), i);
                }
            });
        }
    }
}
