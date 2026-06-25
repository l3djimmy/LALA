package androidx.compose.foundation.text;

import androidx.autofill.HintConstants;
import androidx.compose.foundation.interaction.MutableInteractionSource;
import androidx.compose.foundation.text.input.InputTransformation;
import androidx.compose.foundation.text.input.InputTransformationKt;
import androidx.compose.foundation.text.input.KeyboardActionHandler;
import androidx.compose.foundation.text.input.TextFieldDecorator;
import androidx.compose.foundation.text.input.TextFieldState;
import androidx.compose.foundation.text.input.TextObfuscationMode;
import androidx.compose.runtime.Composer;
import androidx.compose.runtime.ComposerKt;
import androidx.compose.runtime.CompositionLocalKt;
import androidx.compose.runtime.ProvidedValue;
import androidx.compose.runtime.RecomposeScopeImplKt;
import androidx.compose.runtime.ScopeUpdateScope;
import androidx.compose.ui.Modifier;
import androidx.compose.ui.geometry.Rect;
import androidx.compose.ui.graphics.Brush;
import androidx.compose.ui.graphics.Color;
import androidx.compose.ui.graphics.SolidColor;
import androidx.compose.ui.platform.CompositionLocalsKt;
import androidx.compose.ui.platform.TextToolbar;
import androidx.compose.ui.platform.TextToolbarStatus;
import androidx.compose.ui.text.TextStyle;
import androidx.profileinstaller.ProfileVerifier;
import com.itextpdf.kernel.xmp.options.PropertyOptions;
import com.itextpdf.layout.properties.Property;
import kotlin.Deprecated;
import kotlin.DeprecationLevel;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function2;
/* compiled from: BasicSecureTextField.kt */
@Metadata(d1 = {"\u0000~\n\u0000\n\u0002\u0010\f\n\u0000\n\u0002\u0010\t\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\b\n\u0002\u0018\u0002\n\u0002\b\u0004\u001aÊ\u0001\u0010\u0004\u001a\u00020\u00052\u0006\u0010\u0006\u001a\u00020\u00072\b\b\u0002\u0010\b\u001a\u00020\t2\b\b\u0002\u0010\n\u001a\u00020\u000b2\n\b\u0002\u0010\f\u001a\u0004\u0018\u00010\r2\b\b\u0002\u0010\u000e\u001a\u00020\u000f2\b\b\u0002\u0010\u0010\u001a\u00020\u00112\n\b\u0002\u0010\u0012\u001a\u0004\u0018\u00010\u001328\b\u0002\u0010\u0014\u001a2\u0012\u0004\u0012\u00020\u0016\u0012\u001b\u0012\u0019\u0012\u0006\u0012\u0004\u0018\u00010\u00180\u0017¢\u0006\f\b\u0019\u0012\b\b\u001a\u0012\u0004\b\b(\u001b\u0012\u0004\u0012\u00020\u0005\u0018\u00010\u0015¢\u0006\u0002\b\u001c2\n\b\u0002\u0010\u001d\u001a\u0004\u0018\u00010\u001e2\b\b\u0002\u0010\u001f\u001a\u00020 2\n\b\u0002\u0010!\u001a\u0004\u0018\u00010\"2\b\b\u0002\u0010#\u001a\u00020$2\b\b\u0002\u0010%\u001a\u00020\u0001H\u0007ø\u0001\u0000¢\u0006\u0004\b&\u0010'\u001aÔ\u0001\u0010\u0004\u001a\u00020\u00052\u0006\u0010\u0006\u001a\u00020\u00072\b\b\u0002\u0010\b\u001a\u00020\t2\b\b\u0002\u0010\n\u001a\u00020\u000b2\b\b\u0002\u0010(\u001a\u00020\u000b2\n\b\u0002\u0010\f\u001a\u0004\u0018\u00010\r2\b\b\u0002\u0010\u000e\u001a\u00020\u000f2\b\b\u0002\u0010\u0010\u001a\u00020\u00112\n\b\u0002\u0010\u0012\u001a\u0004\u0018\u00010\u001328\b\u0002\u0010\u0014\u001a2\u0012\u0004\u0012\u00020\u0016\u0012\u001b\u0012\u0019\u0012\u0006\u0012\u0004\u0018\u00010\u00180\u0017¢\u0006\f\b\u0019\u0012\b\b\u001a\u0012\u0004\b\b(\u001b\u0012\u0004\u0012\u00020\u0005\u0018\u00010\u0015¢\u0006\u0002\b\u001c2\n\b\u0002\u0010\u001d\u001a\u0004\u0018\u00010\u001e2\b\b\u0002\u0010\u001f\u001a\u00020 2\n\b\u0002\u0010!\u001a\u0004\u0018\u00010\"2\b\b\u0002\u0010#\u001a\u00020$2\b\b\u0002\u0010%\u001a\u00020\u0001H\u0007ø\u0001\u0000¢\u0006\u0004\b)\u0010*\u001a \u0010+\u001a\u00020\u00052\u0011\u0010,\u001a\r\u0012\u0004\u0012\u00020\u00050\u0017¢\u0006\u0002\b-H\u0003¢\u0006\u0002\u0010.\u001a\u001a\u0010/\u001a\u0004\u0018\u00010\r*\u0004\u0018\u00010\r2\b\u00100\u001a\u0004\u0018\u00010\rH\u0002\"\u000e\u0010\u0000\u001a\u00020\u0001X\u0082T¢\u0006\u0002\n\u0000\"\u000e\u0010\u0002\u001a\u00020\u0003X\u0082T¢\u0006\u0002\n\u0000\u0082\u0002\u0007\n\u0005\b¡\u001e0\u0001¨\u00061"}, d2 = {"DefaultObfuscationCharacter", "", "LAST_TYPED_CHARACTER_REVEAL_DURATION_MILLIS", "", "BasicSecureTextField", "", "state", "Landroidx/compose/foundation/text/input/TextFieldState;", "modifier", "Landroidx/compose/ui/Modifier;", "enabled", "", "inputTransformation", "Landroidx/compose/foundation/text/input/InputTransformation;", "textStyle", "Landroidx/compose/ui/text/TextStyle;", "keyboardOptions", "Landroidx/compose/foundation/text/KeyboardOptions;", "onKeyboardAction", "Landroidx/compose/foundation/text/input/KeyboardActionHandler;", "onTextLayout", "Lkotlin/Function2;", "Landroidx/compose/ui/unit/Density;", "Lkotlin/Function0;", "Landroidx/compose/ui/text/TextLayoutResult;", "Lkotlin/ParameterName;", HintConstants.AUTOFILL_HINT_NAME, "getResult", "Lkotlin/ExtensionFunctionType;", "interactionSource", "Landroidx/compose/foundation/interaction/MutableInteractionSource;", "cursorBrush", "Landroidx/compose/ui/graphics/Brush;", "decorator", "Landroidx/compose/foundation/text/input/TextFieldDecorator;", "textObfuscationMode", "Landroidx/compose/foundation/text/input/TextObfuscationMode;", "textObfuscationCharacter", "BasicSecureTextField-Jb9bMDk", "(Landroidx/compose/foundation/text/input/TextFieldState;Landroidx/compose/ui/Modifier;ZLandroidx/compose/foundation/text/input/InputTransformation;Landroidx/compose/ui/text/TextStyle;Landroidx/compose/foundation/text/KeyboardOptions;Landroidx/compose/foundation/text/input/KeyboardActionHandler;Lkotlin/jvm/functions/Function2;Landroidx/compose/foundation/interaction/MutableInteractionSource;Landroidx/compose/ui/graphics/Brush;Landroidx/compose/foundation/text/input/TextFieldDecorator;ICLandroidx/compose/runtime/Composer;III)V", "readOnly", "BasicSecureTextField-egD4TGM", "(Landroidx/compose/foundation/text/input/TextFieldState;Landroidx/compose/ui/Modifier;ZZLandroidx/compose/foundation/text/input/InputTransformation;Landroidx/compose/ui/text/TextStyle;Landroidx/compose/foundation/text/KeyboardOptions;Landroidx/compose/foundation/text/input/KeyboardActionHandler;Lkotlin/jvm/functions/Function2;Landroidx/compose/foundation/interaction/MutableInteractionSource;Landroidx/compose/ui/graphics/Brush;Landroidx/compose/foundation/text/input/TextFieldDecorator;ICLandroidx/compose/runtime/Composer;III)V", "DisableCutCopy", "content", "Landroidx/compose/runtime/Composable;", "(Lkotlin/jvm/functions/Function2;Landroidx/compose/runtime/Composer;I)V", "then", "next", "foundation_release"}, k = 2, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes.dex */
public final class BasicSecureTextFieldKt {
    private static final char DefaultObfuscationCharacter = 8226;
    private static final long LAST_TYPED_CHARACTER_REVEAL_DURATION_MILLIS = 1500;

    /* JADX WARN: Removed duplicated region for block: B:230:0x037a  */
    /* JADX WARN: Removed duplicated region for block: B:231:0x037c  */
    /* JADX WARN: Removed duplicated region for block: B:240:0x039e  */
    /* JADX WARN: Removed duplicated region for block: B:241:0x03a3  */
    /* JADX WARN: Removed duplicated region for block: B:248:0x03db  */
    /* JADX WARN: Removed duplicated region for block: B:249:0x03e0  */
    /* JADX WARN: Removed duplicated region for block: B:252:0x040c  */
    /* renamed from: BasicSecureTextField-egD4TGM  reason: not valid java name */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void m1293BasicSecureTextFieldegD4TGM(final androidx.compose.foundation.text.input.TextFieldState r35, androidx.compose.ui.Modifier r36, boolean r37, boolean r38, androidx.compose.foundation.text.input.InputTransformation r39, androidx.compose.ui.text.TextStyle r40, androidx.compose.foundation.text.KeyboardOptions r41, androidx.compose.foundation.text.input.KeyboardActionHandler r42, kotlin.jvm.functions.Function2<? super androidx.compose.ui.unit.Density, ? super kotlin.jvm.functions.Function0<androidx.compose.ui.text.TextLayoutResult>, kotlin.Unit> r43, androidx.compose.foundation.interaction.MutableInteractionSource r44, androidx.compose.ui.graphics.Brush r45, androidx.compose.foundation.text.input.TextFieldDecorator r46, int r47, char r48, androidx.compose.runtime.Composer r49, final int r50, final int r51, final int r52) {
        /*
            Method dump skipped, instructions count: 1133
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.compose.foundation.text.BasicSecureTextFieldKt.m1293BasicSecureTextFieldegD4TGM(androidx.compose.foundation.text.input.TextFieldState, androidx.compose.ui.Modifier, boolean, boolean, androidx.compose.foundation.text.input.InputTransformation, androidx.compose.ui.text.TextStyle, androidx.compose.foundation.text.KeyboardOptions, androidx.compose.foundation.text.input.KeyboardActionHandler, kotlin.jvm.functions.Function2, androidx.compose.foundation.interaction.MutableInteractionSource, androidx.compose.ui.graphics.Brush, androidx.compose.foundation.text.input.TextFieldDecorator, int, char, androidx.compose.runtime.Composer, int, int, int):void");
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final InputTransformation then(InputTransformation $this$then, InputTransformation next) {
        return $this$then == null ? next : next == null ? $this$then : InputTransformationKt.then($this$then, next);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final void DisableCutCopy(final Function2<? super Composer, ? super Integer, Unit> function2, Composer $composer, final int $changed) {
        Composer $composer2 = $composer.startRestartGroup(-1085555050);
        ComposerKt.sourceInformation($composer2, "C(DisableCutCopy)306@14490L7,308@14536L875,329@15416L80:BasicSecureTextField.kt#423gt5");
        int $dirty = $changed;
        if (($changed & 6) == 0) {
            $dirty |= $composer2.changedInstance(function2) ? 4 : 2;
        }
        if (!$composer2.shouldExecute(($dirty & 3) != 2, $dirty & 1)) {
            $composer2.skipToGroupEnd();
        } else {
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventStart(-1085555050, $dirty, -1, "androidx.compose.foundation.text.DisableCutCopy (BasicSecureTextField.kt:305)");
            }
            ComposerKt.sourceInformationMarkerStart($composer2, 2023513938, "CC(<get-current>):CompositionLocal.kt#9igjgp");
            Object consume = $composer2.consume(CompositionLocalsKt.getLocalTextToolbar());
            ComposerKt.sourceInformationMarkerEnd($composer2);
            final TextToolbar currentToolbar = (TextToolbar) consume;
            ComposerKt.sourceInformationMarkerStart($composer2, -1202758015, "CC(remember):BasicSecureTextField.kt#9igjgp");
            boolean invalid$iv = $composer2.changed(currentToolbar);
            Object it$iv = $composer2.rememberedValue();
            if (invalid$iv || it$iv == Composer.Companion.getEmpty()) {
                Object value$iv = new TextToolbar() { // from class: androidx.compose.foundation.text.BasicSecureTextFieldKt$DisableCutCopy$copyDisabledToolbar$1$1
                    private final /* synthetic */ TextToolbar $$delegate_0;

                    @Override // androidx.compose.ui.platform.TextToolbar
                    public TextToolbarStatus getStatus() {
                        return this.$$delegate_0.getStatus();
                    }

                    @Override // androidx.compose.ui.platform.TextToolbar
                    public void hide() {
                        this.$$delegate_0.hide();
                    }

                    @Override // androidx.compose.ui.platform.TextToolbar
                    public void showMenu(Rect rect, Function0<Unit> function0, Function0<Unit> function02, Function0<Unit> function03, Function0<Unit> function04) {
                        this.$$delegate_0.showMenu(rect, function0, function02, function03, function04);
                    }

                    /* JADX INFO: Access modifiers changed from: package-private */
                    {
                        this.$$delegate_0 = TextToolbar.this;
                    }

                    @Override // androidx.compose.ui.platform.TextToolbar
                    public void showMenu(Rect rect, Function0<Unit> function0, Function0<Unit> function02, Function0<Unit> function03, Function0<Unit> function04, Function0<Unit> function05) {
                        TextToolbar.this.showMenu(rect, null, function02, null, function04, function05);
                    }
                };
                $composer2.updateRememberedValue(value$iv);
                it$iv = value$iv;
            }
            BasicSecureTextFieldKt$DisableCutCopy$copyDisabledToolbar$1$1 copyDisabledToolbar = (BasicSecureTextFieldKt$DisableCutCopy$copyDisabledToolbar$1$1) it$iv;
            ComposerKt.sourceInformationMarkerEnd($composer2);
            CompositionLocalKt.CompositionLocalProvider(CompositionLocalsKt.getLocalTextToolbar().provides(copyDisabledToolbar), function2, $composer2, ProvidedValue.$stable | (($dirty << 3) & Property.BORDER_BOTTOM_RIGHT_RADIUS));
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventEnd();
            }
        }
        ScopeUpdateScope endRestartGroup = $composer2.endRestartGroup();
        if (endRestartGroup != null) {
            endRestartGroup.updateScope(new Function2<Composer, Integer, Unit>() { // from class: androidx.compose.foundation.text.BasicSecureTextFieldKt$DisableCutCopy$1
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

                public final void invoke(Composer composer, int i) {
                    BasicSecureTextFieldKt.DisableCutCopy(function2, composer, RecomposeScopeImplKt.updateChangedFlags($changed | 1));
                }
            });
        }
    }

    @Deprecated(level = DeprecationLevel.HIDDEN, message = "Please use the overload that takes in readOnly parameter.")
    /* renamed from: BasicSecureTextField-Jb9bMDk  reason: not valid java name */
    public static final /* synthetic */ void m1292BasicSecureTextFieldJb9bMDk(final TextFieldState state, Modifier modifier, boolean enabled, InputTransformation inputTransformation, TextStyle textStyle, KeyboardOptions keyboardOptions, KeyboardActionHandler onKeyboardAction, Function2 onTextLayout, MutableInteractionSource interactionSource, Brush cursorBrush, TextFieldDecorator decorator, int textObfuscationMode, char textObfuscationCharacter, Composer $composer, final int $changed, final int $changed1, final int i) {
        Object obj;
        Object obj2;
        boolean z;
        Object obj3;
        Object obj4;
        Object obj5;
        int i2;
        int i3;
        int i4;
        int i5;
        int i6;
        Composer $composer2;
        final MutableInteractionSource interactionSource2;
        final char textObfuscationCharacter2;
        int $dirty;
        int $dirty1;
        final boolean enabled2;
        final InputTransformation inputTransformation2;
        final TextStyle textStyle2;
        final KeyboardOptions keyboardOptions2;
        final Modifier modifier2;
        final KeyboardActionHandler onKeyboardAction2;
        final Function2 onTextLayout2;
        final Brush cursorBrush2;
        final TextFieldDecorator decorator2;
        final int textObfuscationMode2;
        Modifier modifier3;
        int i7;
        boolean enabled3;
        int i8;
        InputTransformation inputTransformation3;
        int i9;
        TextStyle textStyle3;
        KeyboardOptions keyboardOptions3;
        KeyboardActionHandler onKeyboardAction3;
        Function2 onTextLayout3;
        MutableInteractionSource interactionSource3;
        int i10;
        Brush cursorBrush3;
        TextFieldDecorator decorator3;
        int textObfuscationMode3;
        char textObfuscationCharacter3;
        Composer $composer3 = $composer.startRestartGroup(1399310985);
        ComposerKt.sourceInformation($composer3, "C(BasicSecureTextField)P(9,6,2,3,12,5,7,8,4!2,11:c#foundation.text.input.TextObfuscationMode)355@16532L563:BasicSecureTextField.kt#423gt5");
        int $dirty2 = $changed;
        int $dirty12 = $changed1;
        if ((i & 1) != 0) {
            $dirty2 |= 6;
            obj = state;
        } else if (($changed & 6) == 0) {
            obj = state;
            $dirty2 |= $composer3.changed(obj) ? 4 : 2;
        } else {
            obj = state;
        }
        int i11 = i & 2;
        if (i11 != 0) {
            $dirty2 |= 48;
            obj2 = modifier;
        } else if (($changed & 48) == 0) {
            obj2 = modifier;
            $dirty2 |= $composer3.changed(obj2) ? 32 : 16;
        } else {
            obj2 = modifier;
        }
        int i12 = i & 4;
        if (i12 != 0) {
            $dirty2 |= 384;
            z = enabled;
        } else if (($changed & 384) == 0) {
            z = enabled;
            $dirty2 |= $composer3.changed(z) ? 256 : 128;
        } else {
            z = enabled;
        }
        int i13 = i & 8;
        if (i13 != 0) {
            $dirty2 |= 3072;
            obj3 = inputTransformation;
        } else if (($changed & 3072) == 0) {
            obj3 = inputTransformation;
            $dirty2 |= $composer3.changed(obj3) ? 2048 : 1024;
        } else {
            obj3 = inputTransformation;
        }
        int i14 = i & 16;
        if (i14 != 0) {
            $dirty2 |= 24576;
            obj4 = textStyle;
        } else if (($changed & 24576) == 0) {
            obj4 = textStyle;
            $dirty2 |= $composer3.changed(obj4) ? 16384 : 8192;
        } else {
            obj4 = textStyle;
        }
        int i15 = i & 32;
        if (i15 != 0) {
            $dirty2 |= ProfileVerifier.CompilationStatus.RESULT_CODE_ERROR_CANT_WRITE_PROFILE_VERIFICATION_RESULT_CACHE_FILE;
            obj5 = keyboardOptions;
        } else if (($changed & ProfileVerifier.CompilationStatus.RESULT_CODE_ERROR_CANT_WRITE_PROFILE_VERIFICATION_RESULT_CACHE_FILE) == 0) {
            obj5 = keyboardOptions;
            $dirty2 |= $composer3.changed(obj5) ? 131072 : 65536;
        } else {
            obj5 = keyboardOptions;
        }
        int i16 = i & 64;
        if (i16 != 0) {
            $dirty2 |= 1572864;
        } else if (($changed & 1572864) == 0) {
            $dirty2 |= $composer3.changed(onKeyboardAction) ? 1048576 : 524288;
        }
        int i17 = i & 128;
        if (i17 != 0) {
            $dirty2 |= 12582912;
            i2 = i17;
        } else if (($changed & 12582912) == 0) {
            i2 = i17;
            $dirty2 |= $composer3.changedInstance(onTextLayout) ? 8388608 : 4194304;
        } else {
            i2 = i17;
        }
        int i18 = i & 256;
        if (i18 != 0) {
            $dirty2 |= 100663296;
            i3 = i18;
        } else if (($changed & 100663296) == 0) {
            i3 = i18;
            $dirty2 |= $composer3.changed(interactionSource) ? 67108864 : 33554432;
        } else {
            i3 = i18;
        }
        int i19 = i & 512;
        if (i19 != 0) {
            $dirty2 |= 805306368;
            i4 = i19;
        } else if (($changed & 805306368) == 0) {
            i4 = i19;
            $dirty2 |= $composer3.changed(cursorBrush) ? PropertyOptions.DELETE_EXISTING : 268435456;
        } else {
            i4 = i19;
        }
        int i20 = i & 1024;
        if (i20 != 0) {
            $dirty12 |= 6;
        } else if (($changed1 & 6) == 0) {
            $dirty12 |= ($changed1 & 8) == 0 ? $composer3.changed(decorator) : $composer3.changedInstance(decorator) ? 4 : 2;
        }
        int i21 = i & 2048;
        if (i21 != 0) {
            $dirty12 |= 48;
            i5 = i21;
        } else if (($changed1 & 48) == 0) {
            i5 = i21;
            $dirty12 |= $composer3.changed(textObfuscationMode) ? 32 : 16;
        } else {
            i5 = i21;
        }
        int i22 = i & 4096;
        if (i22 != 0) {
            $dirty12 |= 384;
            i6 = i22;
        } else {
            i6 = i22;
            if (($changed1 & 384) == 0) {
                $dirty12 |= $composer3.changed(textObfuscationCharacter) ? 256 : 128;
            }
        }
        if ($composer3.shouldExecute((($dirty2 & 306783379) == 306783378 && ($dirty12 & 147) == 146) ? false : true, $dirty2 & 1)) {
            if (i11 != 0) {
                modifier3 = Modifier.Companion;
            } else {
                modifier3 = obj2;
            }
            if (i12 == 0) {
                i7 = i13;
                enabled3 = z;
            } else {
                enabled3 = true;
                i7 = i13;
            }
            if (i7 == 0) {
                i8 = i14;
                inputTransformation3 = obj3;
            } else {
                inputTransformation3 = null;
                i8 = i14;
            }
            if (i8 == 0) {
                i9 = i6;
                textStyle3 = obj4;
            } else {
                int i23 = i6;
                textStyle3 = TextStyle.Companion.getDefault();
                i9 = i23;
            }
            if (i15 == 0) {
                keyboardOptions3 = obj5;
            } else {
                keyboardOptions3 = KeyboardOptions.Companion.getSecureTextField$foundation_release();
            }
            if (i16 == 0) {
                onKeyboardAction3 = onKeyboardAction;
            } else {
                onKeyboardAction3 = null;
            }
            if (i2 == 0) {
                onTextLayout3 = onTextLayout;
            } else {
                onTextLayout3 = null;
            }
            if (i3 == 0) {
                interactionSource3 = interactionSource;
                i10 = 1399310985;
            } else {
                interactionSource3 = null;
                i10 = 1399310985;
            }
            if (i4 == 0) {
                cursorBrush3 = cursorBrush;
            } else {
                cursorBrush3 = new SolidColor(Color.Companion.m4315getBlack0d7_KjU(), null);
            }
            if (i20 == 0) {
                decorator3 = decorator;
            } else {
                decorator3 = null;
            }
            if (i5 == 0) {
                textObfuscationMode3 = textObfuscationMode;
            } else {
                textObfuscationMode3 = TextObfuscationMode.Companion.m1479getRevealLastTypedvTwcZD0();
            }
            if (i9 == 0) {
                textObfuscationCharacter3 = textObfuscationCharacter;
            } else {
                textObfuscationCharacter3 = 8226;
            }
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventStart(i10, $dirty2, $dirty12, "androidx.compose.foundation.text.BasicSecureTextField (BasicSecureTextField.kt:354)");
            }
            $composer2 = $composer3;
            m1293BasicSecureTextFieldegD4TGM(obj, modifier3, enabled3, false, inputTransformation3, textStyle3, keyboardOptions3, onKeyboardAction3, onTextLayout3, interactionSource3, cursorBrush3, decorator3, textObfuscationMode3, textObfuscationCharacter3, $composer2, ($dirty2 & 14) | 3072 | ($dirty2 & Property.BORDER_BOTTOM_RIGHT_RADIUS) | ($dirty2 & 896) | (($dirty2 << 3) & 57344) | (($dirty2 << 3) & 458752) | (($dirty2 << 3) & 3670016) | (($dirty2 << 3) & 29360128) | (($dirty2 << 3) & 234881024) | (($dirty2 << 3) & 1879048192), (($dirty2 >> 27) & 14) | (($dirty12 << 3) & Property.BORDER_BOTTOM_RIGHT_RADIUS) | (($dirty12 << 3) & 896) | (($dirty12 << 3) & 7168), 0);
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventEnd();
            }
            $dirty = $dirty2;
            $dirty1 = $dirty12;
            modifier2 = modifier3;
            enabled2 = enabled3;
            inputTransformation2 = inputTransformation3;
            textStyle2 = textStyle3;
            keyboardOptions2 = keyboardOptions3;
            onKeyboardAction2 = onKeyboardAction3;
            onTextLayout2 = onTextLayout3;
            interactionSource2 = interactionSource3;
            cursorBrush2 = cursorBrush3;
            decorator2 = decorator3;
            textObfuscationMode2 = textObfuscationMode3;
            textObfuscationCharacter2 = textObfuscationCharacter3;
        } else {
            $composer2 = $composer3;
            $composer2.skipToGroupEnd();
            interactionSource2 = interactionSource;
            textObfuscationCharacter2 = textObfuscationCharacter;
            $dirty = $dirty2;
            $dirty1 = $dirty12;
            enabled2 = z;
            inputTransformation2 = obj3;
            textStyle2 = obj4;
            keyboardOptions2 = obj5;
            modifier2 = obj2;
            onKeyboardAction2 = onKeyboardAction;
            onTextLayout2 = onTextLayout;
            cursorBrush2 = cursorBrush;
            decorator2 = decorator;
            textObfuscationMode2 = textObfuscationMode;
        }
        ScopeUpdateScope endRestartGroup = $composer2.endRestartGroup();
        if (endRestartGroup != null) {
            endRestartGroup.updateScope(new Function2<Composer, Integer, Unit>() { // from class: androidx.compose.foundation.text.BasicSecureTextFieldKt$BasicSecureTextField$5
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
                    BasicSecureTextFieldKt.m1292BasicSecureTextFieldJb9bMDk(TextFieldState.this, modifier2, enabled2, inputTransformation2, textStyle2, keyboardOptions2, onKeyboardAction2, onTextLayout2, interactionSource2, cursorBrush2, decorator2, textObfuscationMode2, textObfuscationCharacter2, composer, RecomposeScopeImplKt.updateChangedFlags($changed | 1), RecomposeScopeImplKt.updateChangedFlags($changed1), i);
                }
            });
        }
    }
}
